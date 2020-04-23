<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenGarantia */

$this->title = 'Nueva Garantia';
$this->params['breadcrumbs'][] = ['label' => 'Nueva Garantia', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-garantia-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
