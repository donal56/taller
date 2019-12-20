<?php

namespace app\controllers;

use Yii;
use app\models\VenCotizacion;
use app\models\VenCotizacionSearch;
use app\models\VenFolio;
use app\models\VenDetalle;
use app\components\Utilidades;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use kartik\mpdf\Pdf;
use yii\helpers\Url;
use yii\filters\AccessControl;
use yii\web\ServerErrorHttpException;

/**
 * VenCotizacionController implements the CRUD actions for VenCotizacion model.
 */
class VenCotizacionController extends Controller
{
    /**
     * {@inheritdoc}
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
     * Lists all VenCotizacion models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new VenCotizacionSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single VenCotizacion model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new VenCotizacion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new VenCotizacion();
        $modelFol = new VenFolio();
        $modelDet = new VenDetalle();

        if (Yii::$app->request->post()) {

            #Se separan los componentes de un vale desde una misma respuesta POST
            $cotizacion = Yii::$app->request->post();
            $detalles = Utilidades::limpiarArreglos( array_pop($cotizacion)['temp'] );
            $folio = array_pop($cotizacion);

            $connection = Yii::$app->db;
            $transaction = $connection->beginTransaction();
            
            #Se consigue el folio actual
            $model->cot_folio = mb_strtoupper($this->increaseFolio($folio['fol_serie']));

            #Usuario que elaboro originalmente
            $model->cot_fkuser = Yii::$app->user->identity->id;

            if ($model->load($cotizacion) && $model->save()) {

                foreach($detalles as $detalle)
                {
                    #Si el vale se guarda por cada concepto se guardan sus datos
                    $detalle['det_fkcotizacion'] = $model->cot_id;
                    $datos['VenDetalle'] = $detalle;

                    if ($modelDet->load($datos) && $modelDet->save())
                    {
                        $modelDet = new VenDetalle();    
                    } 
                    else 
                    {
                        $transaction->rollback();
                        $model->isNewRecord = true;
                        return $this->render('create', 
                        [
                            'model' => $model,
                            'modelFol' => $modelFol,
                            'modelDet' => $modelDet,
                        ]);
                    }
                   
                }

                $transaction->commit();
                return $this->redirect(['view', 'id' => $model->cot_id]);

            }else{
 					$transaction->rollback();
                throw new ServerErrorHttpException('NO SE HAN PODIDO GUARDAR LOS CAMBIOS'); 
            
            }
  
        }

        return $this->render('create', [
            'model' => $model,
            'modelFol' => $modelFol,
            'modelDet' => $modelDet,
        ]);
    }

    /**
     * Updates an existing VenCotizacion model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $idList = []; //listado de los detalles actualizados y creados, sin eliminados
        
        $modelDet = new VenDetalle();
        $modelDet->temp = $this->findAllDetalles($id);

        $modelFol = $this->findFolio($model->getSerie()); 
        $modelFol->fol_folio = $model->getFolio();

        if (Yii::$app->request->post()) {
            
            
            $datos = Yii::$app->request->post();
            $detalles = Utilidades::limpiarArreglos( array_pop($datos)['temp'] );
            $folioAnterior = $model->cot_folio;
            $folio = array_pop($datos);


            //transacción
            $connection = \Yii::$app->db;
            $transaction = $connection->beginTransaction();


            if ( $model->cot_folio != $folio['fol_serie']."-".$folio['fol_folio']) 
            {
                $model->cot_folio = $this->increaseFolio($folio['fol_serie']);
            }

            if($model->load($datos) && $model->save())
            {

                 //update detalles
                foreach( $detalles as $detalle )
                {  

                    $detalle['det_fkcotizacion'] = $id;
                    $datos['VenDetalle'] = $detalle;
                    $modelDet =  $this->findDetalle($datos['VenDetalle']['det_id']);
                    if ($modelDet->load($datos) && $modelDet->save()) 
                    {
                        array_push($idList, $modelDet->det_id);
                
                    } 
                    else 
                    {
                        $idList = null;  
                        end($detalles);
                        break;
                    }

                }

                if(!empty($idList))
                {
                    $this->deleteNotListed($id, $idList);
                    $transaction->commit();
                    return $this->redirect(['view', 'id' => $id]);
                }
                else
                {
                    $model->det_folio = $folioAnterior;
                    $transaction->rollback();
                }
            }

        }

        return $this->render('update', [
            'model' => $model,
            'modelFol' => $modelFol,
            'modelDet' => $modelDet,
        ]);
    }

    /**
     * Deletes an existing VenCotizacion model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }
    public function actionReport($id, $pdfjs = false) 
    {
        if (!$pdfjs) {
            return $this->redirect(['/pdfjs', 'file' => Url::to(['report', 'id' => $id , 'pdfjs' => 'true']) ]);
        }

        $model =  $this->findModel($id);

        $pdf = new Pdf([
            'format' => Pdf::FORMAT_LETTER,
            'orientation' => Pdf::ORIENT_PORTRAIT, 
            'destination' => Pdf::DEST_BROWSER, 
            'marginTop' => '10',
            'marginHeader' => '10',
            'marginBottom' => '10',
            'marginFooter' => '10',
            'options' => ['title' => 'Cotización'],
        ]);
        
        $mpdf = $pdf->api;
        $mpdf->autoPageBreak = false;

        //imagenes
        $mpdf->imageVars['polo'   ] = file_get_contents('img/logopolo.jpg');
        $mpdf->imageVars['donpolo'] = file_get_contents('img/logoagua.jpg');
        $mpdf->imageVars['whats'  ] = file_get_contents('img/logowhats.png');
        $mpdf->imageVars['pez'    ] = file_get_contents('img/pez.png');
        
        $pdf->cssFile = '@app/web/css/pdf6.css';
        $pdf->content = $this->renderPartial('pdf_cotizacion',['model' =>  $model]); 
        
        return $pdf->render();
    }
    /**
     * Finds the VenCotizacion model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return VenCotizacion the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = VenCotizacion::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    protected function increaseFolio($serie)
    {
        if (($model = VenFolio::find()->where(['fol_serie' => $serie])->one()) !== null) 
        {
            $model->aumentarFolio();

            if( $model->save())
            {
                return $model->getFolio();
            }
           
            throw new NotFoundHttpException('No se pudo actualizar la serie');
        }  
        else 
        {
            throw new NotFoundHttpException('No se encontro la serie');
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

    protected function findAllDetalles($id)
    {
        if (($model = VenDetalle::find()->where(['det_fkcotizacion' => $id])->asArray()->all()) !== null) 
        {
            return $model;
        } 
        else 
        {
            throw new NotFoundHttpException('Los detalles requeridos no existen.');
        }
    }

    protected function findDetalle($id)
    {
        if(isset($id)){
            if (($model = VenDetalle::findOne($id)) !== null) {
                return $model;
            }
        }
        return new VenDetalle(); 
      
    }

    private function deleteNotListed($id,$idlist)
    {
        VenDetalle::deleteAll('det_id NOT IN ('.implode(", ",$idlist).') AND det_fkcotizacion = '.$id);

    }

    public function actionCancel($id)
    {
        $model = $this->findModel($id);

        if(\Yii::$app->user->isSuperAdmin)
        {
            $model->cot_status = 0;
            $model->update();

        }
        return $this->redirect(['index']);
    }	

    public function actionApprove($id)
    {
        $model = $this->findModel($id);

        if(\Yii::$app->user->isSuperAdmin)
        {
            $model->cot_status = 1;
            $model->update();

        }
        return $this->redirect(['index', 'c' => true]);
    }	
}
