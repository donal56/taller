<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\VenOrden */

$this->title = $model->ord_id;
$this->params['breadcrumbs'][] = ['label' => 'Ven Ordens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>

<div class="ven-orden-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Actualizar', ['update', 'id' => $model->ord_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->ord_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estás seguro de eliminar este elemento?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'ord_id',
            'ord_folio',
            'ord_nombre',
            'ord_direccion',
            'ord_codigoPostal',
            'ord_telefono',
            'ord_ife',
            'ord_modelo',
            'ord_marca',
            'ord_placa',
            'ord_fechaIngreso',
            'ord_fechaEntrega',
            'ord_noSerie',
            'ord_color',
            'ord_kilometraje',
            'ord_vehiculoExterior:ntext',
            'ord_vehiculoInterior:ntext',
            'ord_observaciones:ntext',
            'ord_tanque',
            'ord_accesoriosExterior:ntext',
            'ord_accesoriosInterior:ntext',
            'ord_problemas:ntext',
            'ord_diagnostico:ntext',
        ],
    ]) ?>

</div>
