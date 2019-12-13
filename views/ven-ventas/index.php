<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use kartik\daterange\DateRangePicker;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenVentasSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Ventas';
$this->params['breadcrumbs'][] = $this->title;
if(Yii::$app->user->identity->hasRole('operador') || Yii::$app->user->identity->superadmin ||Yii::$app->user->identity->hasRole('auxiliar')) {
?>
<div class="ven-ventas-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>  
        <?= Html::a('<span class="glyphicon glyphicon-arrow-left"></span>      Atras', ['site/index'], ['class' => 'btn btn-info']) ?>
        <?= Html::a('Generar Ventas', ['create'], ['class' => 'btn btn-success']) ?>
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
      
    </p><br>
<?php Pjax::begin(); ?>    
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'ven_id',
            [
                'attribute' => 'ven_folio',
                'value'     => function ($model) {
                    return str_replace('-','',$model->ven_folio);
                }
            ],
            [
                'attribute'=>'ven_fecha',
                'label'=>'Fecha de elaboración',
                'format'=>'date',
                'filter'=> '<div class="drp-container input-group-sm input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>'.
                    DateRangePicker::widget(
                    [
                        'name'  => 'VenVentaSearch[intervalo]',
                        'useWithAddon'=>'true',
                        'pluginOptions'=>
                        [ 
                            'locale'=> [ 'separator'=>' a '],
                            'opens'=>'right'
                        ] 
                    ]) . '</div>',
                'contentOptions' => ['style' => 'width: 12em; font-size: 0.85em'],
            ],
            'ven_fullname',
            'ven_vehiculo',
            //'ven_domicilio',
            //'ven_ciudad',
            'ven_rfc',
            [
                'class' => 'app\components\ActionColumnPlus',
                'filter'=> Html::a('Limpiar', ['index'], ['class' => 'btn btn-sm btn-default']),
                'buttons' => 
                [
                    'print' => function ($url, $model, $key) 
                    {
                        return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['ven-ventas/report', 'id' => $model->ven_id],['data-pjax'=>"0",'target' => '_blank']);
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
                        return Html::a ('<span class="glyphicon glyphicon-ban-circle"></span>', ['ven-ventas/cancel', 'id' => $model->ven_id],[]);
                    },
                    'aprobe' => function ($url, $model, $key) 
                    {
                        return Html::a ('<span class="glyphicon glyphicon-ok-circle"></span>', ['ven-ventas/approve', 'id' => $model->ven_id],[]);
                    },
                ],
                'visibleButtons' =>
                [
                    'cancel' => function($model, $key, $index)
                    {
                        return $model->ven_status;
                    },
                    'aprobe' => function($model, $key, $index) 
                    {
                        return ! $model->ven_status;
                    },
                ]
            ],
        ],
    ]); 
    Pjax::end();
}else{  header ("Location: /ven-folio");  //cambiar ruta
}
    ?>
</div>
<?= $this->registerCssFile("/css/cur-form.css");   ?>