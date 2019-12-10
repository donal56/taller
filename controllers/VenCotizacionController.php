<?php

namespace app\controllers;

use Yii;
use app\models\VenCotizacion;
use app\models\VenCotizacionSearch;
use app\models\VenFolio;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use kartik\mpdf\Pdf;

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

        if (Yii::$app->request->post()) {

            #Se separan los componentes de un vale desde una misma respuesta POST
            $cotizacion = Yii::$app->request->post();
            $folio = array_pop($cotizacion);

            #Se consigue el folio actual
            $model->rec_folio = mb_strtoupper($this->increaseFolio($folio['fol_serie']));

            $connection = Yii::$app->db;
            $transaction = $connection->beginTransaction();

            if ($model->load($cotizacion) && $model->save()) {
                $transaction->commit();
                return $this->redirect(['view', 'id' => $model->cot_id]);

            }else{

                throw new ServerErrorHttpException('NO SE HAN PODIDO GUARDAR LOS CAMBIOS'); 
            
            }
  
        }

        return $this->render('create', [
            'model' => $model,
            'modelFol' => $modelFol
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
        $modelFol = $this->findFolio(explode("-", $model->cot_folio)[0]); 
        $modelFol->fol_folio = explode("-", $model->cot_folio)[1];

        if (Yii::$app->request->post()) {
            
            //transacción
            $connection = \Yii::$app->db;
            $transaction = $connection->beginTransaction();
            $datos = Yii::$app->request->post();

            $folio = array_pop($datos);

            if ( $model->cot_folio != $folio['fol_serie']."-".$folio['fol_folio']) 
            {
                $modelFol = $this->findFolio($folio['fol_serie']); 
                $modelFol->fol_folio = strval($modelFol->fol_folio + 1);

                $model->cot_folio = $modelFol->fol_serie."-". $modelFol->fol_folio;

                if (!$modelFol->save())
                {
                    $transaction->rollback();               
                    throw new ServerErrorHttpException('ERROR AL INCREMENTAR EL FOLIO.');
                }
            }

            if($model->load($datos) && $model->save())
            {
                $transaction->commit();
                return $this->redirect(['view', 'id' => $model->cot_id]);
            }
            else
            {
                $transaction->rollback();               
                throw new ServerErrorHttpException('ERROR AL GUARDAR LA COTIZACIÓN.');  
            }

        }

        return $this->render('update', [
            'model' => $model,
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
    public function actionReport($id) 
    {
        $model =  $this->findModel($id);

        $pdf = new Pdf([
            'format' => Pdf::FORMAT_LETTER,
            'orientation' => Pdf::ORIENT_PORTRAIT, 
            'destination' => Pdf::DEST_BROWSER, 
            'marginTop' => '10',
            'marginHeader' => '10',
            'marginBottom' => '10',
            'marginFooter' => '10',
            'options' => ['title' => 'Recibo'],
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

}
