<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenOrdenSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-orden-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'ord_id') ?>

    <?= $form->field($model, 'ord_folio') ?>

    <?= $form->field($model, 'ord_nombre') ?>

    <?= $form->field($model, 'ord_direccion') ?>

    <?= $form->field($model, 'ord_codigoPostal') ?>

    <?php // echo $form->field($model, 'ord_telefono') ?>

    <?php // echo $form->field($model, 'ord_ife') ?>

    <?php // echo $form->field($model, 'ord_modelo') ?>

    <?php // echo $form->field($model, 'ord_marca') ?>

    <?php // echo $form->field($model, 'ord_placa') ?>

    <?php // echo $form->field($model, 'ord_fechaIngreso') ?>

    <?php // echo $form->field($model, 'ord_fechaEntrega') ?>

    <?php // echo $form->field($model, 'ord_noSerie') ?>

    <?php // echo $form->field($model, 'ord_color') ?>

    <?php // echo $form->field($model, 'ord_kilometraje') ?>

    <?php // echo $form->field($model, 'ord_vehiculoExterior') ?>

    <?php // echo $form->field($model, 'ord_vehiculoInterior') ?>

    <?php // echo $form->field($model, 'ord_observaciones') ?>

    <?php // echo $form->field($model, 'ord_tanque') ?>

    <?php // echo $form->field($model, 'ord_accesoriosExterior') ?>

    <?php // echo $form->field($model, 'ord_accesoriosInterior') ?>

    <?php // echo $form->field($model, 'ord_problemas') ?>

    <?php // echo $form->field($model, 'ord_diagnostico') ?>

    <div class="form-group">
        <?= Html::submitButton('Buscar', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reiniciar', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
