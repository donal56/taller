<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\VenFolio;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use app\components\Utilidades;

/* @var $this yii\web\View */
/* @var $model app\models\VenRecibo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="ven-recibo-form">
    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <?= $form->field($model, 'rec_fecha',['options' => ['class' => 'form-group col-sm-3']])->textInput(['value' => Utilidades::getDate('Y-m-d'),'readonly' =>true]) ?>

        <?= $form->field($modelFol, 'fol_serie', ['options' => ['class' => 'form-group col-sm-4']])->dropDownList(ArrayHelper::map(VenFolio::find()->all(),'fol_serie','fol_descripcion'),[ 'prompt' => 'Seleccione Uno' ]) ?>

        <?= $form->field($modelFol, 'fol_folio',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true,'readonly' => true]) ?>
       
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

            <?php } ?>


        <?= $form->field($model, 'rec_nomcliente', ['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'rec_nomresponsable',['options' => ['class' => 'form-group col-sm-6']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'rec_cantidad',['options' => ['class' => 'form-group col-sm-4']])->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'rec_concepto',['options' => ['class' => 'form-group col-sm-8']])->textArea(['maxlength' => true]) ?>

    </div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Generar' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php 
    $folios =  ArrayHelper::index(VenFolio::find()->asArray()->all(),'fol_serie');
    if (!$model->isNewRecord) {
        $folios[$modelFol->fol_serie]['fol_folio'] = explode("-", $model->rec_folio)[1];
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