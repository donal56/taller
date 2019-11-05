<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\VenRecibo */

$this->title = 'Recibo '.str_replace('-','',$model->rec_folio);
$this->params['breadcrumbs'][] = ['label' => 'Ven Recibos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ven-recibo-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>
    <p>
        <?= Html::a('', ['index'], ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
        <?= Html::a('Imprimir', ['report', 'id' => $model->rec_id], ['class' => 'btn btn-primary','target' => '_blank']) ?>
    </p>
    <br>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
                'attribute' => 'rec_folio',
                'value'     => function ($model) {
                    return str_replace('-','',$model->rec_folio);
                }
            ],
            'rec_fecha:date',
            'rec_nomcliente',
            'rec_cantidad',
            'rec_concepto',
            'rec_nomresponsable',
           
        ],
    ]) ?>

</div>
