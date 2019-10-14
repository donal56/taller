<?php

namespace app\controllers;

use Yii;
use app\models\VenAlmacen;
use app\models\VenAlmacenSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

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
        $model = new VenAlmacen();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->alm_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
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

    public function actionReport($id) 
    {
        $model =  $this->findModel($id);

       /* $numformat= function($cant){
            return number_format($cant,2, '.', ',');
        };*/

        $pdf = Yii::$app->pdf;
        
        $mpdf = $pdf->api;
        $mpdf->autoPageBreak = false;
        //imagenes
        $mpdf->imageVars['facebook'] = file_get_contents('img/facebook.png');
        $mpdf->imageVars['polo'] = file_get_contents('img/logopolo.jpg');
        $mpdf->imageVars['whats'] = file_get_contents('img/logowhats.png');
        $mpdf->imageVars['pez'] = file_get_contents('plantillas/itvh/images/logos/pez.png');
        
        //ir al archivo pdf_header.php en la carpeta views/ven-ventas
        $pdf->cssFile = '@app/web/css/pdf2.css';
        $mpdf -> SetHTMLHeader($this->renderPartial('pdf', [ 'model' =>   $model, ]));

         return $pdf->render();
    }
}