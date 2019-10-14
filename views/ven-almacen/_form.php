<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\VenAlmacen */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-almacen-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'alm_folio', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    <?php
        echo $form->field($model, 'alm_fecha' , ['options' => ['class' => 'form-group col-sm-3']]) -> widget(DatePicker::classname(), 
        [
            'language' => 'es',
            'removeButton' => false,
            'pluginOptions' => [
                'todayHighlight' => true,
                'autoclose' => true, 
                'format' => 'yyyy-mm-dd']
        ]); 
    ?>  

    <?= $form->field($model, 'alm_noPedido', ['options' => ['class' => 'form-group col-sm-3']])->textInput() ?>

    <?= $form->field($model, 'alm_vehiculo', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alm_modelo', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alm_mecanico', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alm_placa', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alm_color', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alm_trabajo', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'alm_garantia', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
