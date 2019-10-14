<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenRecibo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-recibo-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'rec_nomcliente')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'rec_cantidad')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'rec_concepto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'rec_nomresponsable')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'rec_fecha')->textInput() ?>

    <?= $form->field($model, 'rec_folio')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
