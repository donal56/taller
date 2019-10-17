<?php

namespace app\controllers;

use Yii;
use app\models\VenRecibo;
use app\models\VenReciboSearch;
use app\models\VenFolio;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use kartik\mpdf\Pdf;

/**
 * VenReciboController implements the CRUD actions for VenRecibo model.
 */
class VenReciboController extends Controller
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
     * Lists all VenRecibo models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new VenReciboSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single VenRecibo model.
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
     * Creates a new VenRecibo model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new VenRecibo();
        $modelFol = new VenFolio();

        #Si se guarda un vale
        if(Yii::$app->request->post())
        {
            #Se separan los componentes de un vale desde una misma respuesta POST
            $recibo = Yii::$app->request->post();
            $folio = array_pop($recibo);

            $connection = Yii::$app->db;
            $transaction = $connection->beginTransaction();

            #Se consigue el folio actual
            $model->rec_folio = $this->increaseFolio($folio['fol_serie']);

            if($model->load($recibo) && $model->save())
            {
                $transaction->commit();
                return $this->redirect(['view', 'id' => $model->rec_id]); 
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
                'modelFol' => $modelFol
            ]);
        }

    }

    /**
     * Updates an existing VenRecibo model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->rec_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing VenRecibo model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
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
            'format' => Pdf::FORMAT_A4,
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

        //marca de agua
        $mpdf->SetWatermarkImage(
            'img/marca_agua.png',
            .15,
            //tamaño x,y
            [250,400],
            //posicion x,y
            [0,0]
        );
        $mpdf->showWatermarkImage = true;

        //imagenes
        $mpdf->imageVars['polo'] = file_get_contents('img/logopolo.jpg');
        
        $pdf->cssFile = '@app/web/css/pdf4.css';
        $pdf->content = $this->renderPartial('pdf_recibo',['recibo' =>  $model]); 
        $pdf->content .= '<hr>'.$pdf->content;
        $pdf->content .= 
        '<div class="underline" style="position:absolute;top:79.5mm;left:66mm; width: 122.5mm;"></div>
         <div class="underline" style="position:absolute;top:220.5mm;left:66mm; width: 122.5mm;"></div>
        ';
         return $pdf->render();


    }


    /**
     * Finds the VenRecibo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return VenRecibo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = VenRecibo::findOne($id)) !== null) {
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
}
