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
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'rec_id',
            'rec_folio',
            'rec_fecha',
            'rec_nomcliente',
            //'rec_cantidad',
            //'rec_concepto',
            'rec_nomresponsable',
      

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>

<?= $this->registerCssFile("/css/cur-form.css"); ?>