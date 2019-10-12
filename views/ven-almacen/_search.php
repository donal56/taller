<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenAlmacenSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-almacen-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'alm_id') ?>

    <?= $form->field($model, 'alm_folio') ?>

    <?= $form->field($model, 'alm_fecha') ?>

    <?= $form->field($model, 'alm_noPedido') ?>

    <?= $form->field($model, 'alm_vehiculo') ?>

    <?php // echo $form->field($model, 'alm_modelo') ?>

    <?php // echo $form->field($model, 'alm_mecanico') ?>

    <?php // echo $form->field($model, 'alm_placa') ?>

    <?php // echo $form->field($model, 'alm_color') ?>

    <?php // echo $form->field($model, 'alm_trabajo') ?>

    <?php // echo $form->field($model, 'alm_garantia') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
