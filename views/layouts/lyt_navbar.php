<?php
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use webvimark\modules\UserManagement\UserManagementModule;
use app\models\CurCurso;
?>

<?php
$links = [
  ['label' => 'Depto. Infraestructura', 'url' => ['/ticket/index', 'ads' => 68]],
  ['label' => 'Depto. Mantenimiento', 'url' => ['/ticket/index', 'ads' => 70]],
  ['label' => 'Depto. Centro de Cómputo', 'url' => ['/ticket/index', 'ads' => 26]],
];
NavBar::begin([
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar navbar-default tecnm-navbar',
    ],
]);

$menuItems = [
    ['label' => '<span class="glyphicon glyphicon-home"></span>', 'url' => ['ven-ventas/index']],
];
if (Yii::$app->user->isGuest) {

//oculta reservar si el cupo esta lleno
  $menuItems[] = ['label' => 'Iniciar Sesión', 'url' => ['/user-management/auth/login']];

} else {
  
  //Agregar opciones de administrador
  //if(Yii::$app->user->identity->hasRole('Admin')):
    $menuItems[] = ['label' => 'Administrador', 'items'=>UserManagementModule::menuItems()];
  //endif;
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
