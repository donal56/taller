<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use kartik\daterange\DateRangePicker;
use yii\helpers\Url;
use yii\bootstrap\Modal;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenCotizacionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cotizaciones';
$this->params['breadcrumbs'][] = $this->title;
if(Yii::$app->user->identity->hasRole('operador') || Yii::$app->user->identity->superadmin) {
?>
<div class="ven-cotizacion-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('<span class="glyphicon glyphicon-arrow-left"></span>      Atras', ['site/index'], ['class' => 'btn btn-info']) ?>
        <?= Html::a('Generar Cotización', ['create'], ['class' => 'btn btn-success']) ?>
        <?php 
            if(Yii::$app->user->isSuperAdmin)
            {
                if(isset($_GET['c']))
                {
                    echo  Html::a('Ver aprobadas', ['index'], ['class' => 'btn btn-warning pull-right']);
                }
                else
                {
                    echo  Html::a('Ver canceladas', ['index', 'c' => true], ['class' => 'btn btn-danger pull-right']);
                }
            }
        ?>

    </p>
<br>
    <?= GridView::widget([
        
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'cot_id',
            [
                'attribute' => 'cot_folio',
                'value'     => function ($model) {
                    return str_replace('-','',$model->cot_folio);
                }
            ],
            [
                'attribute'=>'cot_fecha',
                'format'=>'date',
                'filter'=> '<div class="drp-container input-group-sm input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>'.
                    DateRangePicker::widget(
                    [
                        'name'  => 'VenCotizacionSearch[intervaloFecha]',
                        'useWithAddon'=>'true',
                        'pluginOptions'=>
                        [ 
                            'locale'=> [ 'separator'=>' a '],
                            'opens'=>'right'
                        ] 
                    ]) . '</div>',
            ],
            'cot_nombre',
            //'cot_nonuevoscontratos',
            //'cot_nocont',
            'cot_telefono',
            //'cot_atencion',
            //'cot_modelo',
            //'cot_tipo',
            //'cot_marca',
            //'cot_placas',
            //'cot_color',
            //'cot_mecanico',
            //'cot_psalida',
            [
                'attribute'=>'cot_fechasalida',
                'format'=>'date',
                'filter'=> '<div class="drp-container input-group-sm input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>'.
                    DateRangePicker::widget(
                    [
                        'name'  => 'VenCotizacionSearch[intervaloFechaSalida]',
                        'useWithAddon'=>'true',
                        'pluginOptions'=>
                        [ 
                            'locale'=> [ 'separator'=>' a '],
                            'opens'=>'right'
                        ] 
                    ]) . '</div>',
            ],
            //'cot_solocotizacion',
            //'cot_observaciones:ntext',
            //'cot_acepto',
            //'cot_elaboro',
            //'cot_fkuser',
            [
                'class' => 'app\components\ActionColumnPlus',
                'filter'=> Html::a('Limpiar', ['index'], ['class' => 'btn btn-sm btn-default']),
                'buttons' => 
                [
                    'print' => function ($url, $model, $key) 
                    {
                        return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['report', 'id' => $model->cot_id,'parametro'=>0],['data-pjax'=>"0",'target' => '_blank']);
                    },
                    'send' => function ($url, $model, $key) 
                    {
                       return Html::a('', '',[
                        'id' => 'abrirModal',
                        'class' => 'glyphicon glyphicon-envelope',
                        'data-toggle' => 'modal',
                        'data-target' => '#modal',
                        'data-url' => Url::to(['ven-cotizacion/ajax_send','id'=>$model->cot_id]),
                        'data-pjax' => '0',
                        ]); 
                    },
                ],
                'template' => '{print} {view} {send}',
                'contentOptions' => ['style' => 'text-align: center'],
                'filterOptions' => ['style' => 'text-align: center']
            ],
            [
                'class' => 'yii\grid\ActionColumn', 
                'visible' => Yii::$app->user->isSuperAdmin,
                'template' => '{view} {update} {delete} {cancel} {aprobe}',
                'contentOptions' => ['style' => 'text-align: center'],
                'buttons' => 
                [
                    'cancel' => function ($url, $model, $key) 
                    {
                        return Html::a ('<span class="glyphicon glyphicon-ban-circle"></span>', ['ven-cotizacion/cancel', 'id' => $model->cot_id],[]);
                    },
                    'aprobe' => function ($url, $model, $key) 
                    {
                        return Html::a ('<span class="glyphicon glyphicon-ok-circle"></span>', ['ven-cotizacion/approve', 'id' => $model->cot_id],[]);
                    },
                ],
                'visibleButtons' =>
                [
                    'cancel' => function($model, $key, $index)
                    {
                        return $model->cot_status;
                    },
                    'aprobe' => function($model, $key, $index) 
                    {
                        return ! $model->cot_status;
                    },
                ]
            ],
        ],
    ]); ?>
    <?php Pjax::end();

Modal::begin([
    'id'     =>'modal',
    'header' => '<h4 class="modal-title">Rellene</h4>',
    'footer' => '<a href="#" class="btn btn-primary" data-dismiss="modal">Cerrar</a>',]);   
Modal::end();

}?>
</div>
<?= $this->registerCssFile("/css/cur-form.css");   ?>
<?= $this->registerJsFile("/js/modalCorreo.js", ['depends' => 'yii\web\JqueryAsset']); ?>