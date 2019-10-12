<?php

namespace app\controllers;

use Yii;
use app\models\VenFolio;
use app\models\VenFolioSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * VenFolioController implements the CRUD actions for VenFolio model.
 */
class VenFolioController extends Controller
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
            'access' =>  
            [ 
 
                'class' => \yii\filters\AccessControl::className(), 
                'only' => ['index','create','update','view','delete','Ajax_create'], 
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
        ];
    }

    /**
     * Lists all VenFolio models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new VenFolioSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single VenFolio model.
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
     * Creates a new VenFolio model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new VenFolio();
        $model->fol_folio = '0';
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->fol_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    public function actionAjax_create()
    {
        $model = new VenFolio();

        if (isset($_POST['_csrf'])) {

            $model->load(Yii::$app->request->post());
            $model->fol_folio = '0';

            if ($model->save())
            {

                #Se cambia el tipo de respuesta y se envia el nombre e ID
                \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                return ['serie' => $model->fol_serie];
            }
            else 
            {
                return $this->renderAjax('createAjax', ['model' => $model]);
            }
        }else{
            return $this->renderAjax('createAjax', ['model' => $model]);  
        }

    }

    /**
     * Updates an existing VenFolio model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->fol_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing VenFolio model.
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
     * Finds the VenFolio model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return VenFolio the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = VenFolio::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
