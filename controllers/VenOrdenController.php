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
        
        #Solicitud POST
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
                $image = array_pop($datos);

                #Se llama a todas las opciones de vehiculo y accesorios disponibles
                $baseVE = array_fill_keys($model->vehiculoExterior, 'off');
                $baseVI = array_fill_keys($model->vehiculoInterior, 'off');
                $baseAE = array_fill_keys($model->accesoriosExterior, 'off');
                $baseAI = array_fill_keys($model->accesoriosInterior, 'off');
                
                #Se cambian los valores POST de name por los labels correctos
                $opciones = array_map(function($value)
                            {
                                return mb_ereg_replace( "_", " ", ucfirst($value));
                            }, array_keys($datos));

                #Se les asigna como encendidos
                $opciones = array_fill_keys($opciones, "on");
                
                $ve = array_merge($baseVE, array_intersect_key($opciones, $baseVE));
                $vi = array_merge($baseVI, array_intersect_key($opciones, $baseVE));
                $ae = array_merge($baseAE, array_intersect_key($opciones, $baseVE));
                $ai = array_merge($baseAI, array_intersect_key($opciones, $baseVE));
                
                if($model->save()) 
                {
                    return $this->redirect(['view', 'id' => $model->ord_id]);
                }
            }
        }
        else
        {
            return $this->render('create', [
                'model' => $model,
                'modelFol' => $modelFol
            ]);
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
