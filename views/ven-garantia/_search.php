<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenGarantiaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-garantia-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'gar_id') ?>

    <?= $form->field($model, 'gar_fecha1') ?>

    <?= $form->field($model, 'gar_fecha2') ?>

    <?= $form->field($model, 'gar_fecha3') ?>

    <?= $form->field($model, 'gar_observacion1') ?>

    <?php // echo $form->field($model, 'gar_observacion2') ?>

    <?php // echo $form->field($model, 'gar_observacion3') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
