<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\VenOrden */
/* @var $form yii\widgets\ActiveForm */
?>
<br><br>
<div class="ven-orden-form">

    <?php $form = ActiveForm::begin();?>

    <div class="panel panel-primary">
        <div class="panel-heading" data-toggle="collapse" data-parent="#accordion_sce_1" href="#collapse1">
            <div class="pull-right">
                <button type="button" class="btn btn-default btn-xs" data-content="Minimizar/Maximizar"
                    data-toggle="popover" data-trigger="hover" data-html="true" data-placement="top">
                    <i class="glyphicon glyphicon-eye-open"></i> Min/Max
                </button>
            </div>
            <h4 class="panel-title" style="color: white">Datos generales</h4>
            </h4>
        </div>

        <div id="collapse1" class="panel-collapse collapse in">
            <div class="panel-body">
                <div class="row col-sm-12">
                    <?=$form->field($model, 'ord_folio', ['options' => ['class' => 'form-group col-sm-2']])->textInput()?>

                    <?=$form->field($model, 'ord_nombre', ['options' => ['class' => 'form-group col-sm-5']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_direccion', ['options' => ['class' => 'form-group col-sm-5']])->textInput(['maxlength' => true])?>

                </div>

                <div class="row col-sm-12">

                    <?=$form->field($model, 'ord_codigoPostal', ['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_telefono', ['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_ife', ['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_modelo', ['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_marca', ['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_placa', ['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true])?>

                </div>


                <div class="row col-sm-12">

                    <?=$form->field($model, 'ord_fechaIngreso', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_fechaEntrega', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_noSerie', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_color', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true])?>

                </div>

                <div class="row col-sm-12">

                    <?=$form->field($model, 'ord_kilometraje', ['options' => ['class' => 'form-group col-sm-3']])->textInput()?>

                </div>
            </div>
        </div>
    </div>


    <div class="panel panel-info">
        <div class="panel-heading" data-toggle="collapse" data-parent="#accordion_sce_1" href="#collapse2">
            <div class="pull-right">
                <button type="button" class="btn btn-default btn-xs" data-content="Minimizar/Maximizar"
                    data-toggle="popover" data-trigger="hover" data-html="true" data-placement="top">
                    <i class="glyphicon glyphicon-eye-open"></i> Min/Max
                </button>
            </div>
            <h4 class="panel-title">Inventario del vehículo</h4>
            </h4>
        </div>

        <div id="collapse2" class="panel-collapse collapse in">
            <div class="panel-body">
                <div class="row col-sm-12">

                    <?=$form->field($model, 'ord_vehiculoExterior', ['options' => ['class' => 'form-group col-sm-6']])->textarea(['rows' => 6])?>

                    <?=$form->field($model, 'ord_vehiculoInterior', ['options' => ['class' => 'form-group col-sm-6']])->textarea(['rows' => 6])?>

                </div>

                <div class="row col-sm-12">

                    <?=$form->field($model, 'ord_accesoriosExterior', ['options' => ['class' => 'form-group col-sm-5']])->textarea(['rows' => 6])?>

                    <?=$form->field($model, 'ord_accesoriosInterior', ['options' => ['class' => 'form-group col-sm-5']])->textarea(['rows' => 6])?>

                    <?=$form->field($model, 'ord_tanque', ['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true])?>

                </div>

                <div class="row col-sm-12">

                    <?=$form->field($model, 'ord_observaciones', ['options' => ['class' => 'form-group col-sm-12']])->textarea(['rows' => 2])?>

                </div>

                <div class="row col-sm-12">

                    <?=$form->field($model, 'ord_problemas', ['options' => ['class' => 'form-group col-sm-6']])->textarea(['rows' => 6])?>

                    <?=$form->field($model, 'ord_diagnostico', ['options' => ['class' => 'form-group col-sm-6']])->textarea(['rows' => 6])?>

                </div>
            </div>
        </div>
    </div>
</div>

<div class="form-group">
    <?=Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary'])?>
    <?=Html::a('Cancelar', '/ven-orden/index', ['class' => 'btn btn-danger'])?>
</div>

<?php ActiveForm::end();?>

</div>

<?= $this->registerJsFile("/js/yii-panel.js", ['depends' => 'yii\web\JqueryAsset']); ?>
