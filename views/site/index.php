<?php
use webvimark\modules\UserManagement\components\GhostMenu;
use webvimark\modules\UserManagement\UserManagementModule;
use app\components\widgets\krnpanel\KrnPanel;
use yii\helpers\Url;


$this->registerCssFile("@web/css/dashboard.css"); 

$this->title = 'Polo - Transmisiones autómaticas';
?>

<div id= 'main'>
<?php 
    $botones = [];
//echo Yii::$app->user->identity->id;

if(Yii::$app->user->identity->hasRole('Admin')) {
  $botones = [
    ['texto' => 'Ventas', 'ruta' => ['/ven-ventas'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-empresa'],
    ['texto' => 'Vales de almacén', 'ruta' => ['/ven-almacen'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-folio'],
    ['texto' => 'Recibos', 'ruta' => ['/ven-recibo'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-seguimiento'],
    ['texto' => 'Ordenes de servicio', 'ruta' => ['/ven-orden/index'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-checador'],
    ['texto' => 'Cotizaciones', 'ruta' => ['/ven-cotizacion'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-factura'],
    ['texto' => 'Folios', 'ruta' => ['/ven-folio'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-adscripcion'],
    ['texto' => 'Reportes', 'ruta' => ['/site/reporte'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-estadisticas'],
    ['texto' => 'Garantias', 'ruta' => ['/ven-garantia'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-password'],
    ['texto' => 'Usuarios', 'ruta' => ['/user-management/user/index'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-usuario'],
  ];
} else if(Yii::$app->user->identity->hasRole('operador')) {
 $botones = [
    ['texto' => 'Ventas', 'ruta' => ['/ven-ventas'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-empresa'],
    ['texto' => 'Vales de almacén', 'ruta' => ['/ven-almacen'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-folio'],
    ['texto' => 'Recibos', 'ruta' => ['/ven-recibo'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-seguimiento'],
    ['texto' => 'Ordenes de servicio', 'ruta' => ['/ven-orden/index'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-checador'],
    ['texto' => 'Cotizaciones', 'ruta' => ['/ven-cotizacion'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-factura'],
    ['texto' => 'Folios', 'ruta' => ['/ven-folio'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-adscripcion'],
    ['texto' => 'Usuarios', 'ruta' => ['/user-management/user/index'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-usuario'],
  ];
}else if(Yii::$app->user->identity->hasRole('Mecanico')) {
 $botones = [
    ['texto' => 'Ordenes de servicio', 'ruta' => ['/ven-orden/index?usr='.Yii::$app->user->identity->id], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-checador']
  ];
}else if(Yii::$app->user->identity->hasRole('auxiliar')) {
  $botones = [
    ['texto' => 'Vales de almacén', 'ruta' => ['/ven-almacen'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-folio'],
    ['texto' => 'Ordenes de servicio', 'ruta' => ['/ven-orden/index'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-checador'],
    ['texto' => 'Ventas', 'ruta' => ['/ven-ventas'], 'clase' => 'boton_prototype_3 plantilla plantilla_hover btn-empresa'],
  ];
}

echo krnPanel::widget(['buttons'=>$botones]);

?>

</div>