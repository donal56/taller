<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\VenConcepto */

$this->title = 'Create Ven Concepto';
$this->params['breadcrumbs'][] = ['label' => 'Ven Conceptos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-concepto-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
