<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\VenFolio */

$this->title = 'Crear Folio';
$this->params['breadcrumbs'][] = ['label' => 'Ven Folios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-folio-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
