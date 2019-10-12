<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\VenFolio */

$this->title = $model->fol_id;
$this->params['breadcrumbs'][] = ['label' => 'Ven Folios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-folio-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('','/ven-folio/index', ['class' => 'btn btn-primary glyphicon glyphicon-arrow-left']) ?>
        <?= Html::a('Actualizar', ['update', 'id' => $model->fol_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->fol_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Seguro quieres eliminar este elemento?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'fol_id',
            'fol_serie',
            'fol_folio',
        ],
    ]) ?>

</div>
