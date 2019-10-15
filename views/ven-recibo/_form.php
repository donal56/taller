<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenRecibo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-recibo-form">
    <?php $form = ActiveForm::begin(); ?>

    <div class="row">


        <?= $form->field($model, 'rec_fecha',['options' => ['class' => 'form-group col-sm-4']])->textInput(['value' => date('Y-m-d'),'readonly' =>'true']) ?>

        <?= $form->field($model, 'rec_folio',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>


        <?= $form->field($model, 'rec_nomcliente', ['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'rec_nomresponsable',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'rec_cantidad',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'rec_concepto',['options' => ['class' => 'form-group col-sm-8']])->textArea(['maxlength' => true]) ?>

    </div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Generar' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?= $this->registerCssFile("/css/cur-form.css"); ?>