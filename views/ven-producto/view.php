<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\VenProducto */

$this->title = $model->pro_id;
$this->params['breadcrumbs'][] = ['label' => 'Ven Productos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-producto-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Regresar','/ven-producto/index', ['class' =>'btn btn-primary']) ?>
        <?= Html::a('Update', ['update', 'id' => $model->pro_id], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->pro_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'pro_id',
            'pro_unidad',
            'pro_nombre',
            'pro_precio',
            'pro_fkventas',
        ],
    ]) ?>

</div>
