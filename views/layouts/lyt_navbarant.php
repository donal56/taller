<?php
use kartik\nav\NavX;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\NavBar;
use app\models\Adscripcion;



$navBarOptions = [
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar navbar-default tecnm-navbar',
    ]
];

/*Enlaces para usuarios*/
$userLinks = ['label' => 'Mi Cuenta', 'items' => [] ];

/*Enlaces base de la navbar*/
//if(Yii::$app->user->identity->hasRole('Jefe de departamento' )){
$baseLinks = [
    ['label' => '<span class="glyphicon glyphicon-home"></span>', 'url' => ['/site/index']],
];//} 

if (Yii::$app->user->isGuest) {
    /*Enlace para iniciar sesión*/
    $baseLinks[] = ['label' => 'Iniciar Sesión', 'url' => ['/user-management/auth/login']];
} else {
    /*Generar enlaces para administración por departamentos generales*/
    $depLinks = [];
    if(Yii::$app->user->identity->hasRole('Admin') || Yii::$app->user->identity->hasRole('Subdirector') || Yii::$app->user->identity->hasRole('administrar')) {
        $adsc = Adscripcion::findAll(['generalizado' => 1]);
        foreach($adsc as $a) {
            $depLinks[] = [
                'label' => $a->prefijo,
				'url' => ['/ticket/index', 'ads' => $a->id],
                /*'items' => [
                    ['label' => 'Admin. Tickets', 'url' => ['/ticket/index', 'ads' => $a->id]],
                    //['label' => 'Admin. Apoyo a Eventos', 'url' => ['/evento/index', 'ads' => $a->id]]
                ]*/
            ];
        }
		$depLinks[] = ['label'=>'Solicitud Telefónica', 'url'=>['/ticket/create-tel', 'ads' => \Yii::$app->user->identity->fkAdscripcion]];
    } else if(Yii::$app->user->identity->hasRole('Jefe')) {
        $a = Adscripcion::findOne(Yii::$app->user->identity->fkAdscripcion);
        /*$depLinks[] = [
            'label' => $a->prefijo,
            'items' => [
                ['label' => 'Admin. Tickets', 'url' => ['/ticket/index', 'ads' => $a->id]],
                //['label' => 'Admin. Apoyo a Eventos', 'url' => ['/evento/index', 'ads' => $a->id]]
            ]
        ];*/
        $baseLinks[] = [
            'label' => $a->prefijo,
            'url' => ['/ticket/index', 'ads' => $a->id],
        ];        
		//
    }

    $userLinks['items'] = $depLinks;
	if( Yii::$app->user->identity->hasRole('Administrativo')) {
		$userLinks['items'][] = ['label'=>'Solicitudes generales', 'url'=>['/ticket/general']];
	}	
    $userLinks['items'][] = ['label'=>'Técnicos', 'url'=>['/user-management/user/index']]; 
	 $userLinks['items'][] = ['label'=>'Cambiar contraseña', 'url'=>['/user-management/auth/change-own-password']];
    $userLinks['items'] []= ['label'=>'Solicitud Telefónica', 'url'=>['/ticket/create-tel', 'ads' => \Yii::$app->user->identity->fkAdscripcion]];
    $baseLinks[] = $userLinks;
    /*Opciones de administrador*/
    if(Yii::$app->user->identity->superadmin == 1) {
        $baseLinks[] = ['label' => 'Administrador', 'items'=>UserManagementModule::menuItems()];
    }   
    /*Enlace para cerrar sesión*/
    $baseLinks[] = [
        'label' => 'Cerrar Sesión (' . Yii::$app->user->identity->username . ')',
        'url' => ['/user-management/auth/logout'],
        'linkOptions' => ['data-method' => 'post'],
    ];    
}

NavBar::begin($navBarOptions);
echo NavX::widget([
    'options' => ['class' => 'navbar-nav'],
    'items' => $baseLinks,
    'activateParents' => true,
    'encodeLabels' => false
]);
NavBar::end();