<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenOrden */

$this->title = 'Generar orden de servicio';
$this->params['breadcrumbs'][] = ['label' => 'Ven Ordens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-orden-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
