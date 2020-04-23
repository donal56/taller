<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\VenGarantiaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Garantias';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-garantia-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Nuevo', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <br>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'gar_id',
            'gar_fecha1',
            //'gar_fecha2',
            //'gar_fecha3',
            'gar_observacion1',
            //'gar_observacion2',
            //'gar_observacion3',

            [
                'class' => 'app\components\ActionColumnPlus',
                'buttons' => 
                [
                    'print' => function ($url, $model, $key) 
                    {
                        return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['report', 'id' => $model->gar_id],['data-pjax'=>"0",'target' => '_blank']);
                    },
                ],
                'template' => '{print}',
                'contentOptions' => ['style' => 'text-align: center'],
                'filterOptions' => ['style' => 'text-align: center']
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
