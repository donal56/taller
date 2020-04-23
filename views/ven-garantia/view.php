<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\VenGarantia */

$this->title = $model->gar_id;
$this->params['breadcrumbs'][] = ['label' => 'Garantias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="ven-garantia-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Modificar', ['update', 'id' => $model->gar_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->gar_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
        <?= Html::a('Imprimir', ['report','id'=> $model->gar_id], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Regresar', ['index'], ['class' => 'btn btn-info']) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'gar_id',
            'gar_fecha1',
            'gar_fecha2',
            'gar_fecha3',
            'gar_observacion1',
            'gar_observacion2',
            'gar_observacion3',
        ],
    ]) ?>

</div>
