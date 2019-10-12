<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\VenAlmacen */

$this->title = 'Crear vale de almacen';
?>
<div class="ven-almacen-create">

    <br>
    <h1><?= Html::encode($this->title) ?></h1>
    <br>

    <?= $this->render('_form', [
        'model' => $model,
        'modelCon' => $modelCon,
        'modelFol' => $modelFol,
    ]) ?>

</div>
