<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use kartik\daterange\DateRangePicker;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenReciboSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Recibos';
$this->params['breadcrumbs'][] = $this->title;
if(Yii::$app->user->identity->hasRole('operador') || Yii::$app->user->identity->superadmin) {
?>
<div class="ven-recibo-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('<span class="glyphicon glyphicon-arrow-left"></span>      Atras', ['site/index'], ['class' => 'btn btn-info']) ?>
        <?= Html::a('Generar Recibo', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <br>
    
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'rec_id',
            [
                'attribute' => 'rec_folio',
                'value'     => function ($model) {
                    return str_replace('-','',$model->rec_folio);
                }
            ],
            [
                'attribute'=>'rec_fecha',
                'label'=>'Fecha de elaboración  ',
                'format'=>'date',
                'filter'=> '<div class="drp-container input-group-sm input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>'.
                    DateRangePicker::widget(
                    [
                        'name'  => 'VenReciboSearch[intervalo]',
                        'useWithAddon'=>'true',
                        'pluginOptions'=>
                        [ 
                            'locale'=> [ 'separator'=>' a '],
                            'opens'=>'right'
                        ] 
                    ]) . '</div>',
                'contentOptions' => ['style' => 'width: 12em; font-size: 0.85em'],
            ],
            'rec_nomcliente',
            //'rec_cantidad',
            //'rec_concepto',
            'rec_nomresponsable',
      
            [
                'class' => 'app\components\ActionColumnPlus',
                'filter'=> Html::a('Limpiar', ['index'], ['class' => 'btn btn-sm btn-default']),
                'buttons' => 
                [
                    'print' => function ($url, $model, $key) 
                    {
                        return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['/ven-recibo/report', 'id' => $model->rec_id],['data-pjax'=>"0",'target' => '_blank']);

                    },
                ],
                'template' => '{print} '
        ],
        [
            'class' => 'yii\grid\ActionColumn', 
            'visible' => Yii::$app->user->isSuperAdmin,
            'template' => '{view} {update} {delete}'
        ],
        ],
    ]); ?>
<?php Pjax::end(); ?>
<?php }else{  header ("Location: /ven-folio");  //cambiar ruta
}?>
</div>

<?= $this->registerCssFile("/css/cur-form.css"); ?>