<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;
/* @var $this yii\web\View */
/* @var $model app\models\VenGarantia */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-garantia-form">
    <?php $form = ActiveForm::begin(); ?>
    <div class="panel-body">  
        <?= $form->field($model, 'gar_fecha1', ['options' => ['class' => 'form-group col-sm-4']])-> widget(DatePicker::classname(), 
            [
                 'options' => ['value' => $model->isNewRecord ? date('Y-m-d') :  $model->gar_fecha1 ], 
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  
        <?= $form->field($model, 'gar_observacion1',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

         <?= $form->field($model, 'gar_fecha2', ['options' => ['class' => 'form-group col-sm-4']])-> widget(DatePicker::classname(), 
            [
                 'options' => ['value' => $model->isNewRecord ? date('Y-m-d') :  $model->gar_fecha2 ], 
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  
        <?= $form->field($model, 'gar_observacion2',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

         <?= $form->field($model, 'gar_fecha3', ['options' => ['class' => 'form-group col-sm-4']])-> widget(DatePicker::classname(), 
            [
                 'options' => ['value' => $model->isNewRecord ? date('Y-m-d') :  $model->gar_fecha1 ], 
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  
        <?= $form->field($model, 'gar_observacion3',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

         <?= $form->field($model, 'gar_acepto',['options' => ['class' => 'form-group col-sm-5']])->textInput(['maxlength' => true]) ?>
          <?= $form->field($model, 'gar_elaboro',['options' => ['class' => 'form-group col-sm-5']])->textInput(['maxlength' => true]) ?>
    </div>
    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
