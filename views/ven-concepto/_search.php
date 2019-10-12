<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenConceptoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-concepto-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'con_id') ?>

    <?= $form->field($model, 'con_cantidad') ?>

    <?= $form->field($model, 'con_descripcion') ?>

    <?= $form->field($model, 'con_precioUnitario') ?>

    <?= $form->field($model, 'con_fkalm_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
