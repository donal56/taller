<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\VenAlmacen */

$this->title = 'Crear vale de almacen';
?>
<div class="ven-almacen-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
