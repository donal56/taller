<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\VenVentas;

/* @var $this yii\web\View */
/* @var $model app\models\VenProducto */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-producto-form">


    <?php $form = ActiveForm::begin(); ?>


    <?= $form->field($model, 'pro_nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pro_unidad')->textInput() ?>

    <?= $form->field($model, 'pro_precio')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pro_fkventas')->dropDownList(ArrayHelper::map(VenVentas::find()->all(),
                                                                            'ven_id','ven_folio')) ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
