<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenRecibo */

$this->title = 'Update Ven Recibo: ' . $model->rec_id;
$this->params['breadcrumbs'][] = ['label' => 'Ven Recibos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->rec_id, 'url' => ['view', 'id' => $model->rec_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ven-recibo-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelFol' => $modelFol,
    ]) ?>

</div>
