<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenVentasSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-ventas-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php // echo $form->field($model, 'ven_id') ?>

    <?= $form->field($model, 'ven_folio') ?>

    <?= $form->field($model, 'ven_fecha') ?>

    <?php // echo $form->field($model, 'ven_nombre') ?>

    <?php // echo $form->field($model, 'ven_paterno') ?>

    <?php // echo $form->field($model, 'ven_materno') ?>

    <?php // echo $form->field($model, 'ven_fullname') ?>

    <?php // echo $form->field($model, 'ven_domicilio') ?>

    <?php // echo $form->field($model, 'ven_ciudad') ?>

    <?= $form->field($model, 'ven_rfc') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
