<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenFolio */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-folio-form">

  
    <?php $form = ActiveForm::begin(['options' => [ 'id' => 'create-folio-form' ] ] ); ?>

    <?= $form->field($model, 'fol_serie')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fol_descripcion')->textArea(['maxlength' => true]) ?>    

    <?= $form->field($model, 'fol_folio')->textInput(['maxlength' => true,'value' => '0'])->hiddenInput()->label(false) ?>

 	<div class="form-group">
        <?= Html::Button($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'id' => 'createButton']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
