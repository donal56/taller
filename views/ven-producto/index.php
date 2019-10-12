<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenProductoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Ven Productos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-producto-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Regresar','/ven-ventas/index', ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Agregar Productos', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'pro_id',
            'pro_unidad',
            'pro_nombre',
            'pro_precio',
            'pro_fkventas',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
