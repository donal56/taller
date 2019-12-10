<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenCotizacionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Cotizaciones';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-cotizacion-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Generar Cotizacion', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<br>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'cot_id',
            'cot_folio',
            'cot_fecha',
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
            'cot_fechasalida',
            //'cot_solocotizacion',
            //'cot_observaciones:ntext',
            //'cot_acepto',
            //'cot_elaboro',
            //'cot_fkuser',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
<?= $this->registerCssFile("/css/cur-form.css");   ?>