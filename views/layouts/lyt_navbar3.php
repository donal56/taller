<?php
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use webvimark\modules\UserManagement\UserManagementModule;
use app\models\Adscripcion;

?>

<?php
NavBar::begin([
    //'brandLabel' => 'My Company',
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar navbar-default tecnm-navbar',
    ],
]);

$menuItems = [
   
];
if (Yii::$app->user->isGuest) {
$menuItems[] = ['label' => 'Iniciar Sesión', 'url' => ['/user-management/auth/login']];
} else {
if (Yii::$app->user->identity->hasRole('Jefe de departamento' )){
   $a = Adscripcion::findOne(Yii::$app->user->identity->fkAdscripcion);
   $home='/ticket/index?ads='.$a->id;
} else if(Yii::$app->user->identity->hasRole('Administrativo' )){
   $home='/ticket/general';
}else{$home ='/site/index';}
$menuItems = [
  ['label' => '<span class="glyphicon glyphicon-home"></span>', 'url' => [$home]],
 ];
 if(Yii::$app->user->identity->superadmin == 1 || Yii::$app->user->identity->hasRole('Administrativo')){
 $menuItems[] = ['label' => 'Infraestructura', 'url' => ['/ticket/index?ads=85']];
 $menuItems[] = ['label' => 'Mantenimiento', 'url' => ['/ticket/index?ads=87']];
 }
 if(Yii::$app->user->identity->hasRole('Depto') || Yii::$app->user->identity->hasRole('Tecnico')) {
     $menuItems[] = ['label'=>'Solicitud Telefónica', 'url'=>['/ticket/create-tel', 'ads' => \Yii::$app->user->identity->fkAdscripcion]];
   } 
if(Yii::$app->user->identity->superadmin == 1) {
     $menuItems[] = ['label' => 'Administrador', 'items'=>UserManagementModule::menuItems()];
   } 

 
$menuItems[] = [
    'label' => 'Mi cuenta',
    'items' =>[
    ['label'=>'Mis Solicitudes', 'url'=>['/site/index']],
    ['label'=>'Cambiar contraseña', 'url'=>['/user-management/auth/change-own-password']],
    ['label'=>'Cerrar Sesión (' . Yii::$app->user->identity->username . ')','url'=>['/user-management/auth/logout'],'linkOptions' => ['data-method' => 'post']],
    ]
];
//Administrativo
/*menuItems[] = [
'label' => 'Cerrar Sesión (' . Yii::$app->user->identity->username . ')',
'url' => ['/user-management/auth/logout'],
'linkOptions' => ['data-method' => 'post'],
];*/
}
echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-left'],
    'encodeLabels' => false,
    'items' => $menuItems,
]);
NavBar::end();
?>
