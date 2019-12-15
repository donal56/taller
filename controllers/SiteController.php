<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\SwsDashboard;
use webvimark\modules\UserManagement\models\User;
use yii\helpers\Url;
use app\models\VenOrden;
use kartik\mpdf\Pdf;

class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {    
        //  return [
        //     'ghost-access' => [
        //         'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
        //     ],
        // ];
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => false,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function beforeAction($action)
    {
        if ($action->id == 'index') {
            $this->enableCsrfValidation = false;
        }
        return parent::beforeAction($action);
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        if(Yii::$app->user->isGuest) {
            return $this->redirect('user-management/auth/login');
        }else{
            return $this->render('index');
        }
      
    }

    public function actionReporte()
    {
        return $this->render('report-index');
    }


    public function actionReportOrden($pdfjs = false) 
    {
        if (!$pdfjs) {
            return $this->redirect(['/pdfjs', 'file' => Url::to(['report-orden','pdfjs' => 'true']) ]);
        }

        $users = User::find()
                ->where(['not in','id',[4,18]])
                ->all();

        $pdf = new Pdf([
            'orientation' => Pdf::ORIENT_PORTRAIT, 
            'destination' => Pdf::DEST_BROWSER, 
            'marginTop' => '5',
            'marginHeader' => '5',
            'marginBottom' => '5',
            // 'marginTop' => '10',
            // 'marginHeader' => '10',
            // 'marginBottom' => '10',
            'marginFooter' => '10',
            'options' => ['title' => 'Orden de servicio'],
        ]);
        
        $mpdf = $pdf->api;
        $mpdf->autoPageBreak = false;

        //imagenes
        $mpdf->imageVars['polo'] = file_get_contents('img/logopolo.jpg');
        $mpdf->imageVars['donpolo'] = file_get_contents('img/logoagua.jpg');
        $mpdf->imageVars['whats'] = file_get_contents('img/logowhats.png');
        $mpdf->imageVars['pez'] = file_get_contents('img/pez.png');

        $pdf->cssFile = '@app/web/css/pdf-report.css';
      
        $pdf->content = $this->renderPartial('report-orden',['users' => $users]); 

        return $pdf->render();

    }


    public function actionDash()
    {
        return $this->render('dashboardPrincipal');
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
		if (!Yii::$app->user->isGuest) {
           //return $this->goHome();
           return $this->redirect('site/login');
        }

        $model = new LoginForm();
		
		if ($model->load(Yii::$app->request->post()) && $model->login()) {
		    return $this->goBack();
        }
		
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    // public function actionContact()
    // {
    //     $model = new ContactForm();
    //     if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
    //         Yii::$app->session->setFlash('contactFormSubmitted');

    //         return $this->refresh();
    //     }
    //     return $this->render('contact', [
    //         'model' => $model,
    //     ]);
    // }

    /**
     * Displays about page.
     *
     * @return string
     */
 
    public function actionAcceso()
    {
        return $this->render('acceso');
    }
}
