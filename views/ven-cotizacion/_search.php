<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenCotizacionSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-cotizacion-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'cot_id') ?>

    <?= $form->field($model, 'cot_folio') ?>

    <?= $form->field($model, 'cot_fecha') ?>

    <?= $form->field($model, 'cot_nombre') ?>

    <?= $form->field($model, 'cot_nonuevoscontratos') ?>

    <?php // echo $form->field($model, 'cot_nocont') ?>

    <?php // echo $form->field($model, 'cot_telefono') ?>

    <?php // echo $form->field($model, 'cot_atencion') ?>

    <?php // echo $form->field($model, 'cot_modelo') ?>

    <?php // echo $form->field($model, 'cot_tipo') ?>

    <?php // echo $form->field($model, 'cot_marca') ?>

    <?php // echo $form->field($model, 'cot_placas') ?>

    <?php // echo $form->field($model, 'cot_color') ?>

    <?php // echo $form->field($model, 'cot_mecanico') ?>

    <?php // echo $form->field($model, 'cot_psalida') ?>

    <?php // echo $form->field($model, 'cot_fechasalida') ?>

    <?php // echo $form->field($model, 'cot_solocotizacion') ?>

    <?php // echo $form->field($model, 'cot_observaciones') ?>

    <?php // echo $form->field($model, 'cot_acepto') ?>

    <?php // echo $form->field($model, 'cot_elaboro') ?>

    <?php // echo $form->field($model, 'cot_fkuser') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
