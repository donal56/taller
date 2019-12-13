<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use kartik\daterange\DateRangePicker;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenAlmacenSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Vales de almacen';
$this->params['breadcrumbs'][] = $this->title;
if(Yii::$app->user->identity->hasRole('operador') || Yii::$app->user->identity->superadmin||Yii::$app->user->identity->hasRole('auxiliar')) {
?>
<div class="ven-almacen-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('<span class="glyphicon glyphicon-arrow-left"></span>      Atras', ['site/index'], ['class' => 'btn btn-info']) ?>
        <?= Html::a('Crear vale', ['create'], ['class' => 'btn btn-success']) ?>
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

<?php Pjax::begin(); ?>    

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'alm_folio',
                'value'     => function ($model) {
                    return str_replace('-','',$model->alm_folio);
                }
            ],
            [
                'attribute'=>'alm_fecha',
                'label'=>'Fecha de elaboración  ',
                'format'=>'date',
                'filter'=> '<div class="drp-container input-group-sm input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>'.
                    DateRangePicker::widget(
                    [
                        'name'  => 'VenAlmacenSearch[intervalo]',
                        'useWithAddon'=>'true',
                        'pluginOptions'=>
                        [ 
                            'locale'=> [ 'separator'=>' a '],
                            'opens'=>'right'
                        ] 
                    ]) . '</div>',
                'contentOptions' => ['style' => 'width: 12em; font-size: 0.85em'],
            ],
            'alm_noPedido',
            'alm_mecanico',
            'alm_vehiculo',
            [
                'class' => 'app\components\ActionColumnPlus',
                'filter'=> Html::a('Limpiar', ['index'], ['class' => 'btn btn-sm btn-default']),
                'buttons' => 
                [
                    'print' => function ($url, $model, $key) 
                    {
                        return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['ven-almacen/report', 'id' => $model->alm_id],['data-pjax'=>"0",'target' => '_blank']);
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
                        return Html::a ('<span class="glyphicon glyphicon-ban-circle"></span>', ['ven-almacen/cancel', 'id' => $model->alm_id],[]);
                    },
                    'aprobe' => function ($url, $model, $key) 
                    {
                        return Html::a ('<span class="glyphicon glyphicon-ok-circle"></span>', ['ven-almacen/approve', 'id' => $model->alm_id],[]);
                    },
                ],
                'visibleButtons' =>
                [
                    'cancel' => function($model, $key, $index)
                    {
                        return $model->alm_status;
                    },
                    'aprobe' => function($model, $key, $index) 
                    {
                        return ! $model->alm_status;
                    },
                ]
            ],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
    <?php }else{  header ("Location: /ven-folio");  //cambiar ruta
}?>
</div>

<?= $this->registerCssFile("/css/cur-form.css");   ?>
