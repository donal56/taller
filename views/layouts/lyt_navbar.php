<?php
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use webvimark\modules\UserManagement\UserManagementModule;
use app\models\CurCurso;

$menuItems = array();
?>

<?php

NavBar::begin([
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar navbar-default tecnm-navbar',
    ],
]);

if( !Yii::$app->user->isGuest)
    $menuItems[] = ['label' => '<span class="glyphicon glyphicon-home"></span>', 'url' => ['/site/']];
    $menuItems[] = ['label' => 'Usuario', 'items'=> [['label' => '<i class="fa fa-angle-double-right"></i> ' . 'Cambiar Contraseña', 'url' => ['/user-management/auth/change-own-password']]] ];

if(Yii::$app->user->isSuperAdmin)
{
    //Agregar opciones de administrador
    $menuItems[] = ['label' => 'Administrador', 'items'=>UserManagementModule::menuItems()];
    
}


if (Yii::$app->user->isGuest) {

  $menuItems[] = ['label' => 'Iniciar Sesión', 'url' => ['/user-management/auth/login']];

}
else 
{
    $menuItems[] = [
        'label' => 'Cerrar Sesión (' . Yii::$app->user->identity->username . ')',
        'url' => ['/user-management/auth/logout'],
        'linkOptions' => ['data-method' => 'post'],
    ];
}

echo Nav::widget([
    'options' => ['class' => 'navbar-nav navbar-left'],
    'encodeLabels' => false,
    'items' => $menuItems,
]);
NavBar::end();
?>
