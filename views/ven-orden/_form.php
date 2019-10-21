<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenOrden */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-orden-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ord_folio')->textInput() ?>

    <?= $form->field($model, 'ord_nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_direccion')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_codigoPostal')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_telefono')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_ife')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_modelo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_marca')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_placa')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_fechaIngreso')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_fechaEntrega')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_noSerie')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_color')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_kilometraje')->textInput() ?>

    <?= $form->field($model, 'ord_vehiculoExterior')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'ord_vehiculoInterior')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'ord_observaciones')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'ord_tanque')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ord_accesoriosExterior')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'ord_accesoriosInterior')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'ord_problemas')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'ord_diagnostico')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
