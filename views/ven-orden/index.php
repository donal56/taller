<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use kartik\daterange\DateRangePicker;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenOrdenSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Ordenes de servicio';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-orden-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('<span class="glyphicon glyphicon-arrow-left"></span>      Atras', ['site/index'], ['class' => 'btn btn-info']) ?>
        <?= Html::a('Generar orden de servicio', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <br>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
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
                'format'=>'datetime',
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
                'contentOptions' => ['style' => 'width: 12em; font-size: 0.85em'],
            ],
            [
                'attribute'=>'ord_fechaEntrega',
                'label'=>'Fecha de Entrega',
                'format'=>'datetime',
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
                'contentOptions' => ['style' => 'width: 12em; font-size: 0.85em'],
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
                'template' => '{print}'
            ],
            [
                'class' => 'yii\grid\ActionColumn', 
                'visible' => Yii::$app->user->isSuperAdmin,
                'template' => '{view} {update} {delete}'
            ],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>


<?= $this->registerCssFile("/css/cur-form.css"); ?>
