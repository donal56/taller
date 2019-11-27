<?php

use yii\helpers\Html;
use kartik\daterange\DateRangePicker;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\VenOrdenSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Ordenes de servicio';
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="ven-orden-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('<span class="glyphicon glyphicon-arrow-left"></span>      Atras', ['site/index'], ['class' => 'btn btn-info']) ?>
        <?= Html::a('Generar orden de servicio', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <br>
    
    <?= GridView::widget
    ([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'pjax' => true,
        'formatter' => [
            'class' => 'yii\i18n\Formatter',
            'timeZone' => 'America/Mexico_City',
            'defaultTimeZone' => 'America/Mexico_City',
        ],
        'pjaxSettings' => [ 'refreshGrid'=>true, ],
        'columns' => 
        [
            ['class' => 'kartik\grid\SerialColumn'],
            [
                'attribute' => 'ord_folio',
                'value' => function($model)
                {
                    return str_replace('-','',$model->ord_folio);
                },
                'label' => 'Folio'
            ],
            'ord_nombre',
            'ord_modelo',
            'ord_marca',
            'ord_placa',
            [
                'attribute'=>'ord_fechaIngreso',
                'label'=>'Fecha de ingreso',
                'format' => 'datetime',
                'filter'=> '<div class="drp-container input-group-sm input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>'.
                    DateRangePicker::widget(
                    [
                        'name'  => 'VenOrdenSearch[intervaloIngreso]',
                        'useWithAddon'=>'true',
                        'pluginOptions'=>
                        [ 
                            'locale'=> [ 'separator'=>' a '],
                            'opens'=>'right'
                        ] 
                    ]) . '</div>',
                'contentOptions' => ['style' => 'width: 12em;'],
            ],
            [
                'class' => 'kartik\grid\EditableColumn',
                'attribute' => 'ord_fechaEntrega',
                'format' => 'datetime',
                'vAlign'=>'middle',
                'headerOptions'=>['class'=>'kv-sticky-column'],
                'contentOptions'=>['class'=>'kv-sticky-column', 'style' => 'width: 170px'],
                'filter'=> '<div class="drp-container input-group-sm input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>'.
                DateRangePicker::widget(
                [
                    'name'  => 'VenOrdenSearch[intervaloEntrega]',
                    'useWithAddon'=>'true',
                    'pluginOptions'=>
                    [ 
                        'locale'=> [ 'separator'=>' a '],
                        'opens'=>'right'
                    ] 
                ]) . '</div>',
                'editableOptions' => 
                [
                    'header' => 'fecha de entrega', 
                    'size' => 'md',
                    'placement' => 'left',
                    'inputType' => \kartik\editable\Editable::INPUT_DATETIME,
                    'formOptions' =>
                    [
                        'action' => '/ven-orden/reprogramar',
                    ],
                    'pluginOptions' => 
                    [
                        'todayHighlight' => true,
                        'todayBtn' => true,
                        'autoclose' => true, 
                    ],
                    'pluginEvents' =>
                    [
                        "editableSubmit"=>"function(event, val, form, jqXHR) 
                        {
                            //location.reload();
                            var fecha = new Date(val);

                            fecha = fecha.toLocaleDateString('es-MX',  { day: '2-digit', year: 'numeric', month: 'short', hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false});

                            $(event.target).find('button').html(fecha);
                        }",
                        "editableSuccess"=>"function(event, val, form, data) { console.log('Successful submission of value ' + val); }",
                    ]
                ],
            ],
            [
                'class' => 'app\components\ActionColumnPlus',
                'filter'=> Html::a('Limpiar', ['index'], ['class' => 'btn btn-sm btn-default']),
                'buttons' => 
                [
                    'print' => function ($url, $model, $key) 
                    {
                        return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['ven-orden/report', 'id' => $model->ord_id],['data-pjax'=>"0",'target' => '_blank']);
                    },
                ],
                'template' => '{print}',
                'contentOptions' => ['style' => 'text-align: center'],
                'filterOptions' => ['style' => 'text-align: center']
            ],
            [
                'class' => 'yii\grid\ActionColumn', 
                'visible' => Yii::$app->user->isSuperAdmin,
                'template' => '{view} {update} {delete}',
                'contentOptions' => ['style' => 'text-align: center']
            ],
        ],
    ]); ?>
</div>|


<?= $this->registerCssFile("/css/cur-form.css"); ?>
