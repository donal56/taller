<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenVentasSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Ventas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-ventas-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Generar Ventas', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Gestionar Folios', ['ven-folio/index'], ['class' => 'btn btn-info']) ?>
    </p><br>
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
            //'ven_fecha',
            'ven_fullname',
            //'ven_domicilio',
            //'ven_ciudad',
            'ven_rfc',
            ['class' => 'yii\grid\ActionColumn',
            'buttons' => [
                'print' => function ($url, $model, $key) {
                    return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['ven-ventas/report', 'id' => $model->ven_id],['data-pjax'=>"0",'target' => '_blank']);

                },
            ],
            'template' => '{print} '//{view} {update} {delete} '
            ]
        ],
    ]); ?>
</div>
<?= $this->registerCssFile("/css/cur-form.css");   ?>