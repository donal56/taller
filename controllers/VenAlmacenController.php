<?php

namespace app\controllers;

use Yii;
use app\models\VenAlmacen;
use app\models\VenConcepto;
use app\models\VenFolio;
use app\models\VenAlmacenSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\components\Utilidades;
use kartik\mpdf\Pdf;

/**
 * VenAlmacenController implements the CRUD actions for VenAlmacen model.
 */
class VenAlmacenController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all VenAlmacen models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new VenAlmacenSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single VenAlmacen model.
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
     * Creates a new VenAlmacen model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        #Se crean los modelos de los componentes de un vale
        $model = new VenAlmacen();
        $modelCon = new VenConcepto();
        $modelFol = new VenFolio();

        #Si se guarda un vale
        if(Yii::$app->request->post())
        {
            #Se separan los componentes de un vale desde una misma respuesta POST
            #Se limpian los registros vacios en conceptos
            $vale = Yii::$app->request->post();
            $conceptos = Utilidades::limpiarArreglos( array_pop($vale)['temp'] );
            $folio = array_pop($vale);

            $connection = Yii::$app->db;
            $transaction = $connection->beginTransaction();

            #Se consigue el folio actual
            $model->alm_folio = $this->increaseFolio($folio['fol_serie']);

            if($model->load($vale) && $model->save())
            {
                foreach($conceptos as $concepto)
                {
                    #Si el vale se guarda por cada concepto se guardan sus datos
                    $concepto['con_fkalm_id'] = $model->alm_id;
                    $datos['VenConcepto'] = $concepto;

                    if ($modelCon->load($datos) && $modelCon->save())
                    {
                        $modelCon = new VenConcepto();    
                    } 
                    else 
                    {
                        $transaction->rollback();
                        throw new ServerErrorHttpException('A OCCURIDO UN ERROR CON LOS PRODUCTOS');
                    }
                   
                }
                $transaction->commit();
                return $this->redirect(['view', 'id' => $model->alm_id]); 
            }
            else
            {
                throw new ServerErrorHttpException('NO SE HAN PODIDO GUARDAR LOS CAMBIOS'); 
            }
           
        }
        else
        {
            return $this->render('create', 
            [
                'model' => $model,
                'modelCon' => $modelCon,
                'modelFol' => $modelFol
            ]);
        }
    }

    /**
     * Updates an existing VenAlmacen model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */

    /**
     * Deletes an existing VenAlmacen model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    // public function actionDelete($id)
    // {
    //     $this->findModel($id)->delete();

    //     return $this->redirect(['index']);
    // }

    /**
     * Finds the VenAlmacen model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return VenAlmacen the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = VenAlmacen::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
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

    public function actionReport($id) 
    {
        $model =  $this->findModel($id);
        $modelCon = VenConcepto::findAll(['con_fkalm_id' => $id]);

        $pdf = new Pdf([
            'format' => Pdf::FORMAT_A4,
            'orientation' => Pdf::ORIENT_PORTRAIT, 
            'destination' => Pdf::DEST_BROWSER, 
            'marginTop' => '10',
            'marginHeader' => '10',
            'marginBottom' => '10',
            'marginFooter' => '10',
            'options' => ['title' => 'Vale de almacén'],
        ]);
        
        $mpdf = $pdf->api;
        $mpdf->autoPageBreak = false;

        //marca de agua
        $mpdf->SetWatermarkImage(
            'img/marca_agua2.png',
            .1,
            //tamaño x,y
            [250,400],
            //posicion x,y
            [0,0]
        );
        $mpdf->showWatermarkImage = true;

        //imagenes
        $mpdf->imageVars['facebook'] = file_get_contents('img/facebook.png');
        $mpdf->imageVars['polo'] = file_get_contents('img/logopolo.jpg');
        $mpdf->imageVars['whats'] = file_get_contents('img/logowhats.png');
        $mpdf->imageVars['pez'] = file_get_contents('plantillas/itvh/images/logos/pez.png');
        
        $pdf->cssFile = '@app/web/css/pdf2.css';
        $pdf->content = $this->renderPartial('pdf', [ 'model' =>   $model, 'modelCon' => $modelCon ]);
        $pdf->content .= '<hr>'. $pdf->content;

         return $pdf->render();
    }
}