<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\VenFolio;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use app\assets\wPaintAsset;
use kartik\slider\Slider;
use kartik\datetime\DateTimePicker;
use app\components\Utilidades;

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

                    <?=$form->field($model, 'ord_nombre', ['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true])?>

                    <?=$form->field($model, 'ord_direccion', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['maxlength' => true])?>

                    <?= $form->field($modelFol, 'fol_serie', ['options' => ['class' => 'form-group col-sm-2']])->dropDownList(ArrayHelper::map(VenFolio::find()->all(),'fol_serie','fol_descripcion'),[ 'prompt' => '...' ]) ?>


                    <?= $form->field($modelFol, 'fol_folio',['options' => ['class' => 'form-group col-sm-2']])->textInput(['maxlength' => true,'readonly' => true]) ?>

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
                    <br>
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

                    <?=$form->field($model, 'ord_fechaIngreso', ['options' => ['class' => 'form-group col-sm-3']])->textInput(['readonly' => true, 'value' => Utilidades::getDate('Y-m-d H:i:s')]) ?>

                    <?=$form->field($model, 'ord_fechaEntrega', ['options' => ['class' => 'form-group col-sm-3']])->widget(DateTimePicker::classname(), 
                        [
                            'options' => ['value' => $model->isNewRecord ? Utilidades::getDate('Y-m-d H:i:s') :  $model->ord_fechaEntrega, 'style' => 'font-size: 0.9em'], 
                            'language' => 'es',
                            'removeButton' => false,
                            'pluginOptions' => [
                                'todayHighlight' => true,
                                'todayBtn' => true,
                                'autoclose' => true, 
                                'format' => 'yyyy-mm-dd hh:ii:ss']
                        ]); 
                    ?>

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
                <div class="row col-sm-12 pt-10" style="min-height: 650px">

                    <div class="col-sm-3">
                        <h4 class="title">Exteriores</h4>
                        <ul class="ks-cboxtags">
                            <?php 
                            $ve;
                            if(!$model->isNewRecord)
                                $ve = json_decode($model->ord_vehiculoExterior, true);
                            else
                                $ve = array_fill_keys($model->vehiculoExterior, null);   

                            foreach($ve as $key=>$value)
                            {
                                $el = mb_ereg_replace( "\s", "_", mb_strtolower($key));
                                $str = "<li><input type= 'checkbox' id= '" . $el . "' name= '" . $el ."' ";
                                
                                if(!$model->isNewRecord && $value)
                                    $str .= 'checked';
                                            
                                $str .= "> <label for='" . $el ."'>" . $key . "</label>";
                                echo $str;
                            }
                        ?>
                            <ul>
                    </div>

                    <div class="col-sm-6">
                        <div id="wPaint" style="width:400px; height:500px;"></div>
                    </div>

                    <div class="col-sm-3">
                        <h4 class="title">Interiores</h4>
                        <ul class="ks-cboxtags">
                            <?php 
                            $vi;
                            if(!$model->isNewRecord)
                                $vi = json_decode($model->ord_vehiculoInterior, true);
                            else
                                $vi = array_fill_keys($model->vehiculoInterior, null);   

                            foreach($vi as $key=>$value)
                            {
                                $el = mb_ereg_replace( "\s", "_", mb_strtolower($key));
                                $str = "<li><input type= 'checkbox' id= '" . $el . "' name= '" . $el ."' ";
                                
                                if(!$model->isNewRecord && $value)
                                    $str .= 'checked';
                                            
                                $str .= "> <label for='" . $el ."'>" . $key . "</label>";
                                echo $str;
                            }
                        ?>
                            <ul>
                    </div>

                </div>

                <div class="row col-sm-12 pt-10">

                    <div class="col-sm-5">
                        <h4 class="title">Exteriores</h4>
                        <ul class="ks-cboxtags">
                            <?php 
                                $ae;
                                if(!$model->isNewRecord)
                                    $ae = json_decode($model->ord_accesoriosExterior, true);
                                else
                                    $ae = array_fill_keys($model->accesoriosExterior, null);   

                                foreach($ae as $key=>$value)
                                {
                                    $el = mb_ereg_replace( "\s", "_", mb_strtolower($key));
                                    $str = "<li><input type= 'checkbox' id= '" . $el . "' name= '" . $el ."' ";
                                    
                                    if(!$model->isNewRecord && $value)
                                        $str .= 'checked';
                                                
                                    $str .= "> <label for='" . $el ."'>" . $key . "</label>";
                                    echo $str;
                                }
                            ?>
                            <ul>
                    </div>


                    <?= $form->field($model, 'ord_tanque', ['options' => ['class' => 'form-group col-sm-2']])->widget(Slider::classname(), [
                        'bsVersion' => '3.x',
                        'pluginConflict' => true,
                        'sliderColor' => Slider::TYPE_GREY,
                        'handleColor' => Slider::TYPE_DANGER,
                        'pluginOptions'=>
                        [
                            'min'=>0,
                            'max'=>1,
                            'step'=>0.05,
                            'tooltip'=>'always',
                            'orientation'=>'vertical',
                            'reversed' => true,
                            'formatter'=>new yii\web\JsExpression("function(val) { 
                                if (val == 0) 
                                    return 'Tanque vacío';
                                else if (val == 0.25) 
                                    return 'Cuarto de tanque';
                                else if (val == 0.5) 
                                    return 'Medio tanque';
                                else if (val == 0.75) 
                                    return 'Tres cuartos de tanque';
                                else if (val == 1) 
                                    return 'Tanque lleno';
                                else
                                    return parseInt(val * 100) + '%';
                            }"),
                        ]]);
                    ?> 

                    <div class="col-sm-5">
                        <h4 class="title">Interiores</h4>
                        <ul class="ks-cboxtags">
                            <?php 
                            $ai;
                            if(!$model->isNewRecord)
                                $ai = json_decode($model->ord_accesoriosInterior, true);
                            else
                                $ai = array_fill_keys($model->accesoriosInterior, null);   

                            foreach($ai as $key=>$value)
                            {
                                $el = mb_ereg_replace( "\s", "_", mb_strtolower($key));
                                $str = "<li><input type= 'checkbox' id= '" . $el . "' name= '" . $el ."' ";
                                
                                if(!$model->isNewRecord && $value == "on")
                                    $str .= 'checked';
                                            
                                $str .= "> <label for='" . $el ."'>" . $key . "</label>";
                                echo $str;
                            }
                        ?>
                            <ul>
                    </div>
                </div>

                <div class="row col-sm-12">

                    <?=$form->field($model, 'ord_observaciones', ['options' => ['class' => 'form-group col-sm-12']])->textarea(['rows' => 2])?>

                </div>

                <div class="row col-sm-12">

                    <?=$form->field($model, 'ord_problemas', ['options' => ['class' => 'form-group col-sm-6']])->textarea(['rows' => 6])?>

                    <?=$form->field($model, 'ord_diagnostico', ['options' => ['class' => 'form-group col-sm-6']])->textarea(['rows' => 6])?>

                </div>

                <?= Html::hiddenInput('image' , '', ['id' => 'image']); ?>
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

<?php 
    $folios =  ArrayHelper::index(VenFolio::find()->asArray()->all(),'fol_serie');
    if (!$model->isNewRecord) {
        $folios[$modelFol->fol_serie]['fol_folio'] = explode("-", $model->ord_folio)[1];
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

<?= $this->registerJs($js) ?>
<?= $this->registerJsFile("/js/modal.js", ['depends' => 'yii\web\JqueryAsset']); ?>
<?= $this->registerJsFile("/js/ordenServicio.js", ['depends' => 'yii\web\JqueryAsset']); ?>
<?= $this->registerJsFile("/js/wPaintInit.js", ['depends' => 'app\assets\wPaintAsset']); ?>
<?= $this->registerCssFile("/css/ordenServicio.css"); ?>