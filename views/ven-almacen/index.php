<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenAlmacenSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Vales de almacen';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-almacen-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('Crear vale', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Gestionar Folios', ['ven-folio/index'], ['class' => 'btn btn-info']) ?>
    </p>
    <br>

<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'alm_folio',
            'alm_fecha',
            'alm_noPedido',
            'alm_mecanico',
            [
                'class' => 'yii\grid\ActionColumn',
                'buttons' => 
                [
                    'print' => function ($url, $model, $key) 
                    {
                        return Html::a ( '<span class="glyphicon glyphicon-print"></span>', ['ven-almacen/report', 'id' => $model->alm_id],['data-pjax'=>"0",'target' => '_blank']);
                    },
                ],
                'template' => '{print}'
            ],
            ['class' => 'yii\grid\ActionColumn', 
            'visible' => Yii::$app->user->isSuperAdmin,
            'template' => '{view} {update} {delete}'
            ],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>

<?= $this->registerCssFile("/css/cur-form.css");   ?>
