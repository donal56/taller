<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\VenAlmacen */

$this->title = 'Vale ' . $model->alm_folio;
?>
<div class="ven-almacen-view">
    <br>
    <h1><?= Html::encode($this->title) ?></h1><br>
    <?= Html::a('Regresar', ['index'], ['class' => 'btn btn-info']) ?><br>
    <br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'alm_folio',
            'alm_fecha',
            'alm_noPedido',
            'alm_vehiculo',
            'alm_modelo',
            'alm_mecanico',
            'alm_placa',
            'alm_color',
            'alm_trabajo',
            'alm_garantia',
        ],
    ]) ?>

</div>
