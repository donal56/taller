<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenOrden */

$this->title = 'Actualizar orden de servicio ' . $model->ord_folio;
$this->params['breadcrumbs'][] = ['label' => 'Ven Ordens', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ord_id, 'url' => ['view', 'id' => $model->ord_id]];
$this->params['breadcrumbs'][] = 'Update';

?>
<div class="ven-orden-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelFol' => $modelFol
    ]) ?>

</div>
