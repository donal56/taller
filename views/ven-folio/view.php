<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\VenFolio */

$this->title = $model->fol_serie;
$this->params['breadcrumbs'][] = ['label' => 'Ven Folios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-folio-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('','/ven-folio/index', ['class' => 'btn btn-primary glyphicon glyphicon-arrow-left']) ?>
    </p>
    <br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'fol_id',
            'fol_serie',
            'fol_folio',
            'fol_descripcion'
        ],
    ]) ?>

</div>
