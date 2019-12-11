<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\components\Utilidades;
use kartik\date\DatePicker;
use yii\helpers\ArrayHelper;
use app\models\VenFolio;
use unclead\multipleinput\MultipleInput;

/* @var $this yii\web\View */
/* @var $model app\models\VenCotizacion */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-cotizacion-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cot_fecha', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['readonly' => true, 'value' => $model->isNewRecord ? Utilidades::getDate('Y-m-d') : $model->cot_fecha ]) ?>  

    <?= $form->field($model, 'cot_nocont', ['options' => ['class' => 'form-group col-sm-3']])->textInput() ?>
    
    <?= $form->field($modelFol, 'fol_serie', ['options' => ['class' => 'form-group col-sm-3']])->dropDownList(ArrayHelper::map(VenFolio::find()->all(),'fol_serie','fol_descripcion'),[ 'prompt' => 'Seleccione Uno' ]) ?>

    <?= $form->field($modelFol, 'fol_folio',['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true,'readonly' => true]) ?>



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

    <div class="col-sm-12">
        <?= $form->field($modelDet,'temp')->widget(MultipleInput::className(), 
            [
                'enableError' => true,
                'allowEmptyList'    => true,
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
                        'name' => 'det_id',
                        'options' => 
                        [
                            'style' => 'display: none',
                        ],
                        'enableError' => false,
                    ],
                    [
                        'name'  => 'det_cantidad',
                        'title' => 'Cantidad',
                        'enableError' => true,
                    ],
                    [
                        'name'  => 'det_partida',
                        'title' => 'Partida',
                        'enableError' => true,
                    ],
                    [
                        'name'  => 'det_descripcion',
                        'title' => 'Descripción',
                        'type' => 'textarea',
                        'enableError' => true,
                    ],

                    [
                        'name'  => 'det_unitario',
                        'title' => 'Precio Unitario',
                        'enableError' => true,
                    ],
                ]
            ])->label("<h3>Detalles</h3>");
        ?>
    </div>
    <br>
    <br>





    <?= $form->field($model, 'cot_observaciones',['options' => ['class' => 'form-group col-sm-12']])->textarea(['rows' => 2]) ?>

    <?= $form->field($model, 'cot_acepto',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cot_elaboro',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

    <div class="form-group col-sm-12">
        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php 
    $folios =  ArrayHelper::index(VenFolio::find()->asArray()->all(),'fol_serie');
    if (!$model->isNewRecord) {
        $folios[$modelFol->fol_serie]['fol_folio'] = explode("-", $model->cot_folio)[1];
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
<?= $this->registerJsFile("/js/validator3.js",['depends' => 'yii\web\JqueryAsset']); ?>