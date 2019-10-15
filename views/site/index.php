<?php
use yii\helpers\Html;

$this->title = 'Polo - Transmisiones autómaticas';
?>

<div id= 'main'>
    <table>
        <tr>
            <td><?= Html::a(Html::img('@web/img/ventas.png', ['alt' => 'Ventas', 'id' => 'ventas']), ['/ven-ventas']) ?></td>
            <td><?= Html::a(Html::img('@web/img/almacen.png', ['alt' => 'Vales de almacén', 'id' => 'almacen']), ['/ven-almacen']) ?></td>
            <td><?= Html::a(Html::img('@web/img/recibo.png', ['alt' => 'Recibos', 'id' => 'recibo']), ['/ven-recibo']) ?></td>
        </tr>
        <tr class= 'labels'>
            <td><?= Html::a(Html::label('Ventas', 'ventas'), ['/ven-ventas']) ?></td>
            <td><?= Html::a(Html::label('Vales de almacén', 'almacen'), ['/ven-almacen'])  ?></td>
            <td><?= Html::a(Html::label('Recibos', 'recibo'), ['/ven-recibo'])  ?></td>
        </tr>
    </table>
</div>


<?php
    $this->registerCssFile("@web/css/dashboard.css"); 
?>

