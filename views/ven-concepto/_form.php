<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenConcepto */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-concepto-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'con_cantidad')->textInput() ?>

    <?= $form->field($model, 'con_descripcion')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'con_precioUnitario')->textInput() ?>

    <?= $form->field($model, 'con_fkalm_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
