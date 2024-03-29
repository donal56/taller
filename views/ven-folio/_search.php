<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenFolioSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-folio-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'fol_id') ?>

    <?= $form->field($model, 'fol_serie') ?>

    <?= $form->field($model, 'fol_folio') ?>
    
    <?= $form->field($model, 'fol_descripcion')?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
