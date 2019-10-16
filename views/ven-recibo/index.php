<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenReciboSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Recibos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-recibo-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Generar Recibo', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Gestionar Folios', ['ven-folio/index'], ['class' => 'btn btn-info']) ?>
    </p>
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
            'rec_fecha',
            'rec_nomcliente',
            //'rec_cantidad',
            //'rec_concepto',
            'rec_nomresponsable',
      
            ['class' => 'yii\grid\ActionColumn',
            'buttons' => [
                'print' => function ($url, $model, $key) {
                    return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['/ven-recibo/report', 'id' => $model->rec_id],['data-pjax'=>"0",'target' => '_blank']);

                },
            ],
            'template' => '{print} '//{view} {update} {delete} '
            ]
        ],
    ]); ?>
<?php Pjax::end(); ?></div>

<?= $this->registerCssFile("/css/cur-form.css"); ?>