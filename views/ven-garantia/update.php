<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenGarantia */

$this->title = 'Modificar Garantia: ' . $model->gar_id;
$this->params['breadcrumbs'][] = ['label' => 'Ven Garantias', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->gar_id, 'url' => ['view', 'id' => $model->gar_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ven-garantia-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
