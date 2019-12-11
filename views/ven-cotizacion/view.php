<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\VenCotizacion */

$this->title = 'Cotización ' . str_replace('-','',$model->cot_folio);

$this->params['breadcrumbs'][] = ['label' => 'Ven Cotizacions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="ven-cotizacion-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <?= Html::a('', ['index'], ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
    <?= Html::a('Imprimir', ['report', 'id' => $model->cot_id], ['class' => 'btn btn-primary','target' => '_blank'])?>
    <?php
    if (Yii::$app->user->isSuperAdmin)
    {

        echo Html::a('Actualizar', ['update', 'id' => $model->cot_id], ['class' => 'btn btn-primary']);
        echo Html::a('Eliminar', ['delete', 'id' => $model->cot_id], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => '¿Seguro que quieres eliminar esta cotización?',
            'method' => 'post',],]); 
    }
    ?>
 

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'cot_id',
            [
                'attribute' => 'cot_folio',
                'value'     => function ($model) {
                    return str_replace('-','',$model->cot_folio);
                }
            ],
            'cot_fecha',
            'cot_nombre',
            'cot_nonuevoscontratos',
            'cot_nocont',
            'cot_telefono',
            'cot_atencion',
            'cot_modelo',
            'cot_tipo',
            'cot_marca',
            'cot_placas',
            'cot_color',
            'cot_mecanico',
            'cot_psalida',
            'cot_fechasalida',
            'cot_solocotizacion',
            'cot_observaciones:ntext',
            'cot_acepto',
            'cot_elaboro',
            'cot_fkuser',
        ],
    ]) ?>

</div>
