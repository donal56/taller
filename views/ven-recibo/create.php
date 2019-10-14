<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\VenRecibo */

$this->title = 'Create Ven Recibo';
$this->params['breadcrumbs'][] = ['label' => 'Ven Recibos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-recibo-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
