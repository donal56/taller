<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use unclead\multipleinput\MultipleInput;
use kartik\date\DatePicker;
use yii\helpers\ArrayHelper;
use app\models\VenFolio;
use yii\bootstrap\Modal;
use yii\helpers\Url;
use app\components\Utilidades;
/* @var $this yii\web\View */
/* @var $model app\models\VenVentas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-ventas-form">
    <?php $form = ActiveForm::begin(); ?>
    <br>
    <div class="row">

        <?= $form->field($model, 'ven_fecha',['options' => ['class' => 'form-group col-sm-3']])->textInput(['value' => Utilidades::getDate('Y-m-d'),'readonly' =>'true']) ?>

        <?= $form->field($modelfol, 'fol_serie', ['options' => ['class' => 'form-group col-sm-4']])->dropDownList(ArrayHelper::map(VenFolio::find()->all(),'fol_serie','fol_descripcion'),[ 'prompt' => 'Seleccione Uno' ]) ?>


        <?= $form->field($modelfol, 'fol_folio',['options' => ['class' => 'form-group col-sm-4', 'style' => 'width: calc(33.33333333% + 36px)']])->textInput(['maxlength' => true,'readonly' => true]) ?>

        <?= Html::Label('Nuevo', 'fol_serie', ['class' => 'control-label']) ?><br>
        <?= Html::a('', '',[
                        'id' => 'abrirModal',
                        'class' => 'btn btn-success glyphicon glyphicon-plus',
                        'data-toggle' => 'modal',
                        'data-target' => '#modal',
                        'data-url' => Url::to(['ven-folio/ajax_create']),
                        'data-pjax' => '0',
                    ]) ?>

        <?php 
        Modal::begin([
            'id'     =>'modal',
            'clientOptions' => ['backdrop' => 'static'],
            'header' => '<h4 class="modal-title">Rellene</h4>',
            'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">Cerrar</a>',]);
            echo "<div style='text-align:center'><img width= '40%' src='/img/loading.gif'></div>";
        Modal::end();
        ?>


    </div>
    <br>
    <div class="row">

        <?= $form->field($model, 'ven_nombre', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'ven_paterno', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'ven_materno', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'ven_rfc', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

    </div>

    <div class="row">
        <?= $form->field($model, 'ven_domicilio',['options' => ['class' => 'form-group col-sm-8']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'ven_ciudad',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'ven_vehiculo',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'ven_placa',['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'ven_modelo',['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'ven_color',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'ven_tecnico',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'ven_oi',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'ven_garantia',['options' => ['class' => 'form-group col-sm-12']])->textInput(['maxlength' => true]) ?>

    </div>


    <?= $form->field($modelpro,'temp')->widget(MultipleInput::className(), 
        [
        	'enableError' => true,
            'allowEmptyList' => true,
            'addButtonPosition' => MultipleInput::POS_HEADER,
            'sortable'  => true, 
            'addButtonOptions' => 
            [
                'class' => 'btn btn-success',
                'label' => '<i class="glyphicon glyphicon-plus"></i>' 
            ],
            'prepend'   => true,
            'sortable' => true,
            'columns' => 
            [
                [
                    'name'  => 'pro_unidad',
                    'title' => 'Cantidad',
                    'enableError' => true,
                ],
            	[
                    'name'  => 'pro_nombre',
                    'title' => 'Concepto',
                    'type' => 'textarea',
                    'enableError' => true,
                ],

                [
                    'name'  => 'pro_precio',
                    'title' => 'Precio Unitario',
                    'enableError' => true,
                ],
            ]
        ])->label("<h3>Productos</h3>");
        ?>
    <br>
    <br>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('Cancelar','/ven-ventas/index', ['class' => 'btn btn-danger']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php 
$folios =  ArrayHelper::index(VenFolio::find()->asArray()->all(),'fol_serie');
if (!$model->isNewRecord) {
    $folios[$modelfol->fol_serie]['fol_folio'] = explode("-", $model->ven_folio)[1];
}
$folios = json_encode($folios);
$js = <<<EOD
window.folios = {$folios};
$( document ).ready(function() {
    folioin = $('#venfolio-fol_folio');
    seriein = $('#venfolio-fol_serie');
    seriein.on('change', function(e){
        if (folios[$(this).val()] != null) {
            folioin.val(folios[$(this).val()].fol_folio);
        }else{
            folioin.val('0');
        }  
      
    });
    seriein.trigger('change');

});
EOD;

 ?>
<?= $this->registerCssFile("/css/cur-form.css"); ?>
<?= $this->registerJs($js) ?>
<?= $this->registerJsFile("/js/modal.js", ['depends' => 'yii\web\JqueryAsset']); ?>
<?= $this->registerJsFile("/js/validator.js",['depends' => 'yii\web\JqueryAsset']); ?>