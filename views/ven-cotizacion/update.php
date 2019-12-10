<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenCotizacion */

$this->title = 'Actualizando Cotización: ' . $model->cot_id;
$this->params['breadcrumbs'][] = ['label' => 'Ven Cotizacions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cot_id, 'url' => ['view', 'id' => $model->cot_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ven-cotizacion-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelFol' => $modelFol
    ]) ?>

</div>
