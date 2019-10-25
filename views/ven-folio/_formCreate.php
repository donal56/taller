<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenFolio */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-folio-form">

  
    <?php $form = ActiveForm::begin(['options' => [ 'id' => 'create-folio-form' ] ] ); ?>

    <?= $form->field($model, 'fol_serie')->textInput(['maxlength' => true,  $model->isNewRecord ? '' : 'readonly'  => '']) ?>

    <?= $form->field($model, 'fol_descripcion')->textArea(['maxlength' => true]) ?>

    <?= $form->field($model, 'fol_folio')->textInput(['maxlength' => true])->hiddenInput()->label(false) ?>
    

 	<div class="form-group">
        <?= Html::SubmitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary', 'id' => 'createButton']) ?>
         <?= Html::a('Cancelar','/ven-folio/index', ['class' => 'btn btn-danger']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
