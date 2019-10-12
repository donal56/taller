<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenProducto */

$this->title = 'Update Ven Producto: ' . $model->pro_id;
$this->params['breadcrumbs'][] = ['label' => 'Ven Productos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->pro_id, 'url' => ['view', 'id' => $model->pro_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ven-producto-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
