<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenVentas */

$this->title = 'Actualizar Venta: ' . str_replace("-", "",  $model->ven_folio);
$this->params['breadcrumbs'][] = ['label' => 'Ven Ventas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ven_id, 'url' => ['view', 'id' => $model->ven_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="ven-ventas-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
       	'modelpro' => $modelpro,
       	'modelfol' => $modelfol,
    ]) ?>

</div>
