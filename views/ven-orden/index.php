<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
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
            'ord_folio',
            'ord_nombre',
            //'ord_codigoPostal',
            //'ord_telefono',
            //'ord_ife',
            'ord_modelo',
            'ord_marca',
            'ord_placa',
            'ord_fechaIngreso:datetime',
            'ord_fechaEntrega:datetime',
            //'ord_noSerie',
            //'ord_color',
            //'ord_kilometraje',
            //'ord_vehiculoExterior:ntext',
            //'ord_vehiculoInterior:ntext',
            //'ord_observaciones:ntext',
            //'ord_tanque',
            //'ord_accesoriosExterior:ntext',
            //'ord_accesoriosInterior:ntext',
            //'ord_problemas:ntext',
            //'ord_diagnostico:ntext',
            [
                'class' => 'yii\grid\ActionColumn',
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
