<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\VenCotizacion */

$this->title = 'Enviando Cotización No.'.$id;
$this->params['breadcrumbs'][] = ['label' => 'Ven Cotizacions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-cotizacion-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_formSend',['id'=>$id]) ?>

</div>
