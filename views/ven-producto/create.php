<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\VenProducto */

$this->title = 'Create Ven Producto';
$this->params['breadcrumbs'][] = ['label' => 'Ven Productos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-producto-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
