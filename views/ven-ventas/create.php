<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\VenVentas */

$this->title = 'Generar venta';
$this->params['breadcrumbs'][] = ['label' => 'Ven Ventas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-ventas-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelpro' => $modelpro,
        'modelfol' => $modelfol,
    ]) ?>

</div>
