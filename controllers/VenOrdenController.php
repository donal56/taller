<?php

namespace app\controllers;

use Yii;
use app\models\VenOrden;
use app\models\VenOrdenSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use kartik\mpdf\Pdf;
use app\models\VenFolio;
use app\components\Utilidades;

/**
 * VenOrdenController implements the CRUD actions for VenOrden model.
 */
class VenOrdenController extends Controller
{
    /**
     * {@inheritdoc}
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
     * Lists all VenOrden models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new VenOrdenSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single VenOrden model.
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
     * Creates a new VenOrden model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new VenOrden();
        $modelFol = new VenFolio();
        
        $transaction = \Yii::$app->db->beginTransaction();
        $datos = Yii::$app->request->post();

        if($datos)
        {
            //quitar load
            if ($model->load($datos)) 
            {
                #Se remueve el csrf
                array_shift($datos);
                
                #Se clasifican los datos para solo dejar las opciones de vehiculo y accesorios elegidas
                $orden = array_shift($datos);
                $folio = array_shift($datos);
                $image = base64_decode(array_pop($datos));

                #Se cambian los valores POST de name por los labels correctos
                $opciones = array_map(function($value)
                {
                    return mb_ereg_replace( "_", " ", ucfirst($value));
                }, array_keys($datos));
    
                #Se les asigna como encendidos
                $opciones = array_fill_keys($opciones, "on");

                #Se crean los JSON clasificados por su grupo
                $ve = Utilidades::transpose_array_json($model->vehiculoExterior, $opciones);
                $vi = Utilidades::transpose_array_json($model->vehiculoInterior, $opciones);
                $ae = Utilidades::transpose_array_json($model->accesoriosExterior, $opciones);
                $ai = Utilidades::transpose_array_json($model->accesoriosInterior, $opciones);

                die();

                $filename = Yii::getAlias("@webroot") . '/img/wPaint/files/'. $model->id . '.png';

                if (file_put_contents($filename, $image))
                    throw new \yii\base\Exception("No se pudo guardar la imagen.");

                $model->image = UploadedFile::getInstance($model, 'file');
                $model->image->saveAs( Yii::getAlias("@webroot") . '/img/wPaint/files/'. $model->id . '.' . $model->file->extension, false);
               
                if($model->save()) 
                    return $this->redirect(['view', 'id' => $model->ord_id]);
                else
                {
                    unlink($filename);
                    throw new \yii\base\Exception("No se pudo guardar la imagen.");
                }
            }
        }
        else
        {
            return $this->render('create', ['model' => $model, 'modelFol' => $modelFol]);
        }
    }

    /**
     * Updates an existing VenOrden model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->ord_id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing VenOrden model.
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

    /**
     * Finds the VenOrden model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return VenOrden the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = VenOrden::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
     public function actionReport() 
    {
        # $model =  $this->findModel($id);

        $pdf = new Pdf([
            'orientation' => Pdf::ORIENT_PORTRAIT, 
            'destination' => Pdf::DEST_BROWSER, 
            'marginTop' => '10',
            'marginHeader' => '10',
            'marginBottom' => '10',
            'marginFooter' => '10',
            'options' => ['title' => 'Orden de servicio'],
        ]);
        
        $mpdf = $pdf->api;
        $mpdf->autoPageBreak = false;

        //imagenes
        $mpdf->imageVars['donpolo' ] = file_get_contents('img/bluepolo.png');
        $mpdf->imageVars['logopolo'] = file_get_contents('img/logopolo_letra.png');
        $mpdf->imageVars['auto'    ] = file_get_contents('img/auto.jpg');
        $mpdf->imageVars['fondoTan'] = file_get_contents('img/fondoTanque.png');
        $mpdf->imageVars['linea'   ] = file_get_contents('img/linea.png');
        $mpdf->imageVars['facebook'] = file_get_contents('img/facebook.png');
        $mpdf->imageVars['whats'   ] = file_get_contents('img/bluewa.png');
        
        $pdf->cssFile = '@app/web/css/pdf5.css';
        /*$mpdf -> SetHTMLHeader($this->renderPartial('pdf_header',
            [ 'model' =>   $model, ]
        )); */
        $pdf->content = $this->renderPartial('body'); 

         return $pdf->render();
    }
}