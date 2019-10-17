<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenFolio */

$this->title = 'Modificar serie ' . $model->fol_serie;
$this->params['breadcrumbs'][] = ['label' => 'Ven Folios', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->fol_id, 'url' => ['view', 'id' => $model->fol_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ven-folio-update">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
