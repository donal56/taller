<?php

namespace app\controllers;

use Yii;
use app\models\VenVentas;
use app\models\VenVentasSearch;
use app\models\VenProducto;
use app\models\VenFolio;
use yii\web\Controller;
use yii\filters\AccessControl;
use yii\web\NotFoundHttpException;
use yii\web\ServerErrorHttpException;
use yii\filters\VerbFilter;
use kartik\mpdf\Pdf;
use kartik\mpdf\Config\ConfigVariables;
use kartik\mpdf\Config\FontVariables;



/**
 * VenVentasController implements the CRUD actions for VenVentas model.
 */
class VenVentasController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' =>  
            [ 
 
                'class' => AccessControl::className(),
                'only' =>  ['index', 'view', 'create','update','delete','report'],
                'rules' =>  
                [ 
                    // allow authenticated users
                    [ 
                        'allow' => true, 
                        'roles' => ['@'], 
                    ], 
                    // everything else is denied 
                ], 
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],

        ];
    }

    /**
     * Lists all VenVentas models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new VenVentasSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single VenVentas model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new VenVentas model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new VenVentas();
        $modelpro = new VenProducto();
        $modelfol = new VenFolio();

        if(isset($_POST['_csrf'])){


            $venta = Yii::$app->request->post();
            $producto = array_pop($venta)['temp'];
            $folio = array_pop($venta);

            $venta['_csrf'] = Yii::$app->request->post()['_csrf'];
            //transaction
            $connection = \Yii::$app->db>beginTransaction();

            $countPro = 0;

            $modelfol = $this->findFolio($folio['fol_serie']); 

            $modelfol->fol_folio = strval($modelfol->fol_folio+1);
            $model->ven_folio = $modelfol->fol_serie."-". $modelfol->fol_folio;

            if ($modelfol->save() && $model->load($venta) && $model->save()) {


                for ($i=0; $i < count($producto); $i++) { 

                    $datapro['_csrf'] = Yii::$app->request->post()['_csrf'];

                    $datapro['VenProducto'] = $producto[$i];
                    if (!is_array($datapro['VenProducto'])) {
                        $transaction->rollback();
                        $model->isNewRecord = true;
                        $this->view->params['empty'] = 'true';
                         return $this->render('create', [
                        'model' => $model,
                        'modelpro'  => $modelpro,
                        'modelfol' => $modelfol,
                        ]); 
                       
                    }
                    $datapro['VenProducto']['pro_fkventas']=$model->ven_id;
    
                    if ($datapro['VenProducto']['pro_nombre'] != "") { 

                        if ($modelpro->load($datapro) && $modelpro->save()) {
                            $modelpro = new VenProducto();    
                        } else {
                            $transaction->rollback();
                            throw new ServerErrorHttpException('A OCCURIDO UN ERROR CON LOS PRODUCTOS');
                        }
                        $countPro++;
                    }

                }
                    if ($countPro==0) {
                        $transaction->rollback();
                        $model->isNewRecord = true;
                        return $this->render('create', [
                        'model' => $model,
                        'modelpro'  => $modelpro,
                        'modelfol' => $modelfol,
                        ]); 

                    }else{
                        $transaction->commit();
                    }

                }else{
                        $transaction->rollback();
                         return $this->render('create', [
                        'model' => $model,
                        'modelpro'  => $modelpro,
                        'modelfol' => $modelfol,
                    ]);  
                }
                return $this->redirect(['view', 'id' => $model->ven_id]);
               // return $this->redirect(['index');

            } else {

                return $this->render('create', [
                    'model' => $model,
                    'modelpro' => $modelpro,
                    'modelfol' => $modelfol,

                ]);
            }

    }

    /**
     * Updates an existing VenVentas model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $idlist;

        $modelpro = new VenProducto();
        $modelpro['temp'] = $this->findAllProducto($model->ven_id);

        $modelfol = $this->findFolio(explode("-", $model->ven_folio)[0]); 
        $modelfol->fol_folio = explode("-", $model->ven_folio)[1];

        if(isset($_POST['_csrf']))
        {

            $venta = Yii::$app->request->post();
            $producto = array_pop($venta)['temp'];
            $folio = array_pop($venta);

            if ( $model->ven_folio != $folio['fol_serie']."-".$folio['fol_folio']) {
                 $modelfol = $this->findFolio($folio['fol_serie']); 
                 $modelfol->fol_folio = strval($modelfol->fol_folio+1);

                 $model->ven_folio = $modelfol->fol_serie."-". $modelfol->fol_folio;
                 if (!$modelfol->save()) {
                    throw new ServerErrorHttpException('ERROR AL INCREMENTAR EL FOLIO.');
                 }
            }
             
             //transaction
            $connection = \Yii::$app->db;
            $transaction = $connection->beginTransaction();


            if ($model->load($venta) && $model->save()) {
                 //update detalles
                for ($i=0; $i < sizeof($producto); $i++) 
                { 
                    $datapro['_csrf'] =  Yii::$app->request->post()['_csrf'];
                    $datapro['VenProducto'] = current($producto);
                    next($producto);
                    $datapro['VenProducto']['pro_fkventas']=$id;

                    if ($datapro['VenProducto']['pro_nombre'] != "") 
                    {    
                        if ($modelpro->load($datapro) && $modelpro->save()) 
                        {
                            $idlist[$i] = $modelpro->pro_id;
                            $modelpro = new VenProducto();    
                        } 
                        else 
                        {
                            throw new ServerErrorHttpException('A OCCURIDO UN ERROR.');
                        }
                    }
                }
                    if(!empty($idlist)){
                        $this->deleteNotListed($id,$idlist);
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $id]);
                    }else{
                        $transaction->rollback();
                        $this->view->params['empty'] = 'true';
                        return $this->render('update', [
                        'model' => $model,
                        'modelpro'  => $modelpro,
                        'modelfol' => $modelfol,
                        ]); 
                    }



                return $this->redirect(['view', 'id' => $model->ven_id]);


            } else {
                return $this->render('update', [
                    'model' => $model,
                    'modelpro' => $modelpro,
                    'modelfol' => $modelfol,
                ]);
            }


        }else{
            return $this->render('update', ['model' => $model, 
                                            'modelpro' => $modelpro,
                                            'modelfol' => $modelfol]);
        }  
    }

    /**
     * Deletes an existing VenVentas model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the VenVentas model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return VenVentas the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */

    public function actionReport($id) 
    {
        $model =  $this->findModel($id);

        $numformat= function($cant){
            return number_format($cant,2, '.', ',');
        };

        $pdf = Yii::$app->pdf;
        
        $mpdf = $pdf->api;
        $mpdf->autoPageBreak = false;
        //imagenes
        $mpdf->imageVars['facebook'] = file_get_contents('img/facebook.png');
        $mpdf->imageVars['polo'] = file_get_contents('img/logopolo.jpg');
        $mpdf->imageVars['whats'] = file_get_contents('img/logowhats.png');
        $mpdf->imageVars['pez'] = file_get_contents('plantillas/itvh/images/logos/pez.png');
        
        //marca de agua
        $mpdf->SetWatermarkImage(
            'img/logoagua.jpg',
            .2,
            //tamaño x,y
            [80,100],

            //posicion x,y
            [80,100]
        );
        $mpdf->showWatermarkImage = true;


        //ir al archivo pdf_header.php en la carpeta views/ven-ventas
        $mpdf -> SetHTMLHeader($this->renderPartial('pdf_header',
            [ 'model' =>   $model, ]
        )); 

        $pdf->cssFile = '@app/web/css/pdf.css';

        $pdf->content = $this->renderPartial('pdf_body',
            [ 'model' =>   $model,
              'numformat' =>  $numformat,]
        ); 

        $mpdf -> SetHTMLFooter($this->renderPartial('pdf_footer', [ 'model' =>   $model, 'numformat' => $numformat]));

         return $pdf->render();
    }

    protected function findAllProducto($id)
    {
        if (($model = VenProducto::find()->where(['pro_fkventas' => $id])->asArray()->all()) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    protected function findModel($id)
    {
        if (($model = VenVentas::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    protected function findFolio($id)
    {
        if (($model = VenFolio::find()->where(['fol_serie' => $id])->one()) !== null) {
            return $model;
        } else {
            return $model = new VenFolio();
        }
    }


    public function deleteNotListed($id,$idlist)
    {
        VenProducto::deleteAll('pro_id NOT IN ('.implode(", ",$idlist).') AND pro_fkventas= '.$id);

    }





    public function actionReport2() 
    {
       
        $pdf = new Pdf([
            'format' => Pdf::FORMAT_A4,
            'orientation' => Pdf::ORIENT_PORTRAIT, 
            'destination' => Pdf::DEST_BROWSER, 
            'marginTop' => '5',
            'marginHeader' => '10',
            'marginBottom' => '10',
            'marginFooter' => '10',
            'marginLeft' => '5',
            'marginRight' => '5',
            'options' => ['title' => 'PDF'],
        ]);
        
        
        $mpdf = $pdf->api;
        $mpdf->autoPageBreak = false;

        $mpdf->imageVars['sep'] = file_get_contents('img/sep.jpg');

        $pdf->cssFile = '@app/web/css/pdf_sat.css';

        $pdf->content = $this->renderPartial('pdf_sat'); 


         return $pdf->render();

    }



}
