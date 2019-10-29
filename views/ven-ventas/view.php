<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\VenVentas */

$this->title = 'Venta ' . str_replace('-','',$model->ven_folio);
$this->params['breadcrumbs'][] = ['label' => 'Ven Ventas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-ventas-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <p>
        <?= Html::a('', ['index'], ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
        <?= Html::a('Imprimir', ['report', 'id' => $model->ven_id], ['class' => 'btn btn-primary','target' => '_blank']) ?>
        <?/*= Html::a('Actualizar', ['update', 'id' => $model->ven_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->ven_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Seguro que quieres eliminarlo?',
                'method' => 'post',
            ],
        ])*/ ?>
    </p>
    <br>
    
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'ven_id',
            [
                'attribute' => 'ven_folio',
                'value'     => function ($model) {
                    return str_replace('-','',$model->ven_folio);
                }
            ],
            'ven_fecha:date',
            'ven_fullname',
            'ven_domicilio',
            'ven_ciudad',
            'ven_rfc',
        ],
    ]) ?>

</div>
