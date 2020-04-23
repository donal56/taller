<?php

use yii\helpers\Html;
use kartik\daterange\DateRangePicker;
use kartik\grid\GridView;
use yii\helpers\StringHelper;

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
        'pjaxSettings' => [ 'refreshGrid'=>true ],
        'columns' => 
        [
            'ord_id',
            [
                'attribute' => 'ord_folio',
                'value' => function($model)
                {
                    return str_replace('-','',$model->ord_folio);
                },
                'label' => 'Folio'
            ],
            'ord_tipo',
            'ord_nombre',
            'ord_modelo',
            'ord_marca',
            'ord_placa',
            [
                'attribute'=>'ord_fechaIngreso',
                'label'=>'Fecha de ingreso',
                'format' => 'datetime',
                'filterType' => GridView::FILTER_DATE_RANGE,
                'filterWidgetOptions' => 
                [
                    'pluginOptions'=>
                    [ 
                        'locale'=> 
                        [ 
                            'separator' => ' a ',
                            'format'    => 'YYYY-MM-DD',
                        ],
                        'opens'=>'right',
                    ],
                    'hideInput' => true,
                ],
                'contentOptions' => ['style' => 'width: 12em;'],
            ],
            [
                'class' => 'kartik\grid\EditableColumn',
                'attribute' => 'ord_fechaEntrega',
                'format' => 'datetime',
                'headerOptions'=>['class'=>'kv-sticky-column'],
                'contentOptions'=>['class'=>'kv-sticky-column', 'style' => 'width: 170px'],
                'filterType' => GridView::FILTER_DATE_RANGE,
                'filterWidgetOptions' => 
                [
                    'pluginOptions'=>
                    [ 
                        'locale'=> 
                        [ 
                            'separator' => ' a ',
                            'format'    => 'YYYY-MM-DD',
                        ],
                        'opens'=>'right',
                    ],
                    'hideInput' => true,
                ],
                'editableOptions' => 
                [
                    'header' => 'fecha de entrega', 
                    'size' => 'md',
                    'placement' => 'left',
                    'inputType' => \kartik\editable\Editable::INPUT_DATETIME,
                    'formOptions' =>
                    [
                        'action' => 'reprogramar',
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
                    ]
                ],
            ],
            [
                'class' => 'kartik\grid\EditableColumn',
                'attribute' => 'ord_observaciones',
                'format' => 'text',
                'headerOptions'=>['class'=>'kv-sticky-column'],
                'contentOptions'=>['class'=>'kv-sticky-column'],
                'editableOptions' => 
                [
                    'header' => 'observaciones', 
                    'size' => 'lg',
                    'placement' => 'left',
                    'inputType' => \kartik\editable\Editable::INPUT_TEXTAREA,
                    'editableValueOptions' => ['style' => 'text-align: left'],
                    'formOptions' =>
                    [
                        'action' => 'obs',
                    ],
                    'pluginEvents' =>
                    [
                        "editableSubmit"=>"function(event, val, form, jqXHR) 
                        {
                             $(event.target).find('button').html(val);
                        }",
                    ]
                ],
                'value' => function ($model)
                {
                    return StringHelper::truncate($model->ord_observaciones, 25);
                }
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
                'template' => '{view} {update} {delete} {cancel} {aprobe}',
                'contentOptions' => ['style' => 'text-align: center'],
                'buttons' => 
                [
                    'cancel' => function ($url, $model, $key) 
                    {
                        return Html::a ('<span class="glyphicon glyphicon-ban-circle"></span>', ['ven-orden/cancel', 'id' => $model->ord_id],[]);
                    },
                    'aprobe' => function ($url, $model, $key) 
                    {
                        return Html::a ('<span class="glyphicon glyphicon-ok-circle"></span>', ['ven-orden/approve', 'id' => $model->ord_id],[]);
                    },
                ],
                'visibleButtons' =>
                [
                    'cancel' => function($model, $key, $index)
                    {
                        return $model->ord_status;
                    },
                    'aprobe' => function($model, $key, $index) 
                    {
                        return ! $model->ord_status;
                    },
                ]
            ],
        ],
        'responsiveWrap' => false,
    ]); ?>
</div>


<?= $this->registerCssFile("/css/cur-form.css"); ?>
