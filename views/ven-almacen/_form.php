<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\VenFolio;
use kartik\date\DatePicker;
use unclead\multipleinput\MultipleInput;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use app\components\Utilidades;
/* @var $this yii\web\View */
/* @var $model app\models\VenAlmacen */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-almacen-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row col-sm-12">
        <?= $form->field($model, 'alm_fecha' , ['options' => ['class' => 'form-group col-sm-3']])->textInput(['readonly' => true, 'value' => $model->isNewRecord ? Utilidades::getDate('Y-m-d') : $model->alm_fecha ]) ?>  

        <?= $form->field($model, 'alm_noPedido', ['options' => ['class' => 'form-group col-sm-3']])->textInput() ?>

        <?= $form->field($modelFol, 'fol_serie', ['options' => ['class' => 'form-group col-sm-3']])->dropDownList(ArrayHelper::map(VenFolio::find()->all(),'fol_serie','fol_descripcion'),[ 'prompt' => 'Seleccione Uno' ]) ?>

        <?= $form->field($modelFol, 'fol_folio',['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true,'readonly' => true]) ?>

        <?php if(Yii::$app->user->isSuperAdmin) {?>

        <div class="form-group col-sm-1">
            <?= Html::Label('Nuevo', 'fol_serie', ['class' => 'control-label']) ?>
            <?= Html::a('', '',[
                                'id' => 'abrirModal',
                                'class' => 'form-control btn btn-success glyphicon glyphicon-plus ',
                                'style' => 'width:40px',
                                'data-toggle' => 'modal',
                                'data-target' => '#modal',
                                'data-url' => Url::to(['ven-folio/ajax_create']),
                                'data-pjax' => '0',
                            ]) 
            ?>
        </div>

        <?php 
            Modal::begin([
                'id'     =>'modal',
                'clientOptions' => ['backdrop' => 'static'],
                'header' => '<h4 class="modal-title">Rellene</h4>',
                'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">Cerrar</a>',]);
                echo "<div style='text-align:center'><img width= '40%' src='/img/loading.gif'></div>";
            Modal::end();
        ?>

            <?php } ?>
    </div>

    <div class="row col-sm-12">
        
        <?= $form->field($model, 'alm_vehiculo', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'alm_modelo', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'alm_placa', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'alm_mecanico', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'alm_color', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'alm_trabajo', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'alm_garantia', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true]) ?>
    </div>
                
    <div class="row col-sm-12">
        <?= $form->field($modelCon,'temp')->widget(MultipleInput::className(), 
            [
                'enableError' => true,
                'allowEmptyList'    => true,
                'addButtonPosition' => MultipleInput::POS_HEADER,
                'sortable'  => true, 
                'max' => 10,
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
                        'name' => 'con_id',
                        'options' => 
                        [
                            'style' => 'display: none',
                        ],
                        'enableError' => false,
                    ],
                    [
                        'name'  => 'con_cantidad',
                        'title' => 'Cantidad',
                        'enableError' => true,
                    ],
                    [
                        'name'  => 'con_descripcion',
                        'title' => 'Concepto',
                        'type' => 'textarea',
                        'enableError' => true,
                    ],

                    [
                        'name'  => 'con_precioUnitario',
                        'title' => 'Precio Unitario',
                        'enableError' => true,
                    ],
                ]
            ])->label("<h3>Productos</h3>");
        ?>
    </div>
    <br>
    <br>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('Cancelar','/ven-almacen/index', ['class' => 'btn btn-danger']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php 
    $folios =  ArrayHelper::index(VenFolio::find()->asArray()->all(),'fol_serie');
    if (!$model->isNewRecord) {
        $folios[$modelFol->fol_serie]['fol_folio'] = explode("-", $model->alm_folio)[1];
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
<?= $this->registerJsFile("/js/validator2.js",['depends' => 'yii\web\JqueryAsset']); ?>
