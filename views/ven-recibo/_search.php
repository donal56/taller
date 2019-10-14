<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenReciboSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-recibo-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'rec_id') ?>

    <?= $form->field($model, 'rec_nomcliente') ?>

    <?= $form->field($model, 'rec_cantidad') ?>

    <?= $form->field($model, 'rec_concepto') ?>

    <?= $form->field($model, 'rec_nomresponsable') ?>

    <?php // echo $form->field($model, 'rec_fecha') ?>

    <?php // echo $form->field($model, 'rec_folio') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
