<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\VenFolioSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Folios';
$this->params['breadcrumbs'][] = $this->title;
if(Yii::$app->user->identity->hasRole('operador') || Yii::$app->user->identity->superadmin) {
?>
<div class="ven-folio-index">

    <h1><?= Html::encode($this->title) ?></h1><br>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php /*= Html::a('','/ven-ventas/index', ['class' => 'btn btn-primary glyphicon glyphicon-arrow-left']) */?>
        <?= Html::a('<span class="glyphicon glyphicon-arrow-left"></span>      Atras', ['site/index'], ['class' => 'btn btn-info']) ?>
        <?= Html::a('Crear Folio', ['create'], ['class' => 'btn btn-success']) ?>
    </p><br>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'fol_id',
            'fol_serie',
            'fol_folio',
            'fol_descripcion:ntext',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view}'
        
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update}{delete}',
                'visible' =>Yii::$app->user->identity->superadmin
        
            ],
        ],
    ]); ?>
<?php Pjax::end(); ?>
<?php }else{  header ("Location: /ven-folio");  //cambiar ruta
}?>
</div>
