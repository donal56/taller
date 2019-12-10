<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\components\Utilidades;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\VenCotizacion */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-cotizacion-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cot_folio', ['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_fecha', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['readonly' => true, 'value' => $model->isNewRecord ? Utilidades::getDate('Y-m-d') : $model->cot_fecha ]) ?>  

    <?= $form->field($model, 'cot_nocont', ['options' => ['class' => 'form-group col-sm-3']])->textInput() ?>


    <?= $form->field($model, 'cot_nombre', ['options' => ['class' => 'form-group col-sm-8']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_telefono', ['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_atencion',['options' => ['class' => 'form-group col-sm-12']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_modelo',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_tipo',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_solocotizacion',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_marca',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_placas',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_color',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_psalida', ['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_fechasalida', ['options' => ['class' => 'form-group col-sm-6']])-> widget(DatePicker::classname(), 
            [
                 'options' => ['value' => $model->isNewRecord ? date('Y-m-d') :  $model->cot_fechasalida ], 
                'language' => 'es',
                'removeButton' => false,
                'pluginOptions' => [
                    'todayHighlight' => true,
                    'todayBtn' => true,
                    'autoclose' => true, 
                    'format' => 'yyyy-mm-dd']
            ]); 
        ?>  

    <?= $form->field($model, 'cot_mecanico', ['options' => ['class' => 'form-group col-sm-8']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_nonuevoscontratos',['options' => ['class' => 'form-group col-sm-4']])->textInput() ?>

    <?= $form->field($model, 'cot_observaciones',['options' => ['class' => 'form-group col-sm-12']])->textarea(['rows' => 2]) ?>

    <?= $form->field($model, 'cot_acepto',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_elaboro',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?= $this->registerCssFile("/css/cur-form.css"); ?>