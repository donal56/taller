<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use kartik\daterange\DateRangePicker;
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
                        return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['report', 'id' => $model->cot_id],['data-pjax'=>"0",'target' => '_blank']);
                    },
                ],
                'template' => '{print} {view}',
                'contentOptions' => ['style' => 'text-align: center'],
                'filterOptions' => ['style' => 'text-align: center']
            ],
            [
                'class' => 'yii\grid\ActionColumn', 
                'visible' => Yii::$app->user->isSuperAdmin,
                'template' => '{update} {delete}',
                'contentOptions' => ['style' => 'text-align: center']
            ],
        ],
    ]); ?>
    <?php Pjax::end();
}?>
</div>
<?= $this->registerCssFile("/css/cur-form.css");   ?>