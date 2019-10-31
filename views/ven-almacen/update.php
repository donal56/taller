<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenAlmacen */

$this->title = 'Actualizar vale ' . str_replace("-", "", $model->alm_folio);
$this->params['breadcrumbs'][] = ['label' => 'Ven Almacens', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->alm_id, 'url' => ['view', 'id' => $model->alm_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ven-almacen-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelCon' => $modelCon,
        'modelFol' => $modelFol,
    ]) ?>

</div>
