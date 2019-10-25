<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\components\Utilidades;

/* @var $this yii\web\View */
/* @var $model app\models\VenOrden */

$this->title = "Orden de servicio " . str_replace('-','',$model->ord_folio);
$this->params['breadcrumbs'][] = ['label' => 'Ven Ordens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>

<div class="ven-orden-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <br>

    <!-- <p>
        <?= Html::a('Actualizar', ['update', 'id' => $model->ord_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->ord_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '¿Estás seguro de eliminar este elemento?',
                'method' => 'post',
            ],
        ]) ?>
    </p> -->
    <?= Html::a('', ['index'], ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']) ?>
    <?= Html::a('Imprimir', ['report', 'id' => $model->ord_id], ['class' => 'btn btn-primary','target' => '_blank'])?>
    <br>

    
    <br>    

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
                'attribute' => 'ord_folio',
                'value'     => function ($model) 
                {
                    return str_replace('-','', $model->ord_folio);
                }
            ],
            'ord_nombre',
            'ord_direccion',
            'ord_codigoPostal',
            'ord_telefono',
            'ord_ife',
            'ord_modelo',
            'ord_marca',
            'ord_placa',
            [
                'attribute' => 'ord_fechaIngreso',
                'value' => function($model)
                {
                    return Yii::$app->formatter->asDateTime($model->ord_fechaIngreso, 'php:d/m/Y H:i:s');
                }
            ],
            [
                'attribute' => 'ord_fechaIngreso',
                'value' => function($model)
                {
                    return Yii::$app->formatter->asDateTime($model->ord_fechaEntrega, 'php:d/m/Y H:i:s');
                }
            ],
            'ord_noSerie',
            'ord_color',
            'ord_kilometraje',
            [
                'attribute' => 'ord_vehiculoExterior',
                'value'     => function ($model) 
                {
                    $list= json_decode($model->ord_vehiculoExterior, true);
                    $aux = array_map(function($val)
                    {
                        return $val == "on" ? "✓" : "✗" ;
                    }, array_values($list));
                    # $list = array_combine($aux, $list);

                    return Utilidades::array2table($list);
                },
                'format' => 'raw'
            ],
            'ord_vehiculoInterior:ntext',
            'ord_observaciones:ntext',
            [
                'attribute' => 'ord_fechaIngreso',
                'value' => function($model)
                {
                    $val = $model->ord_tanque;

                    if ($val == 0) 
                        return 'Tanque vacío';
                    else if ($val == 0.25) 
                        return 'Cuarto de tanque';
                    else if ($val == 0.5) 
                        return 'Medio tanque';
                    else if ($val == 0.75) 
                        return 'Tres cuartos de tanque';
                    else if ($val == 1) 
                        return 'Tanque lleno';
                    else
                        return ($val * 100) . '%';
                }
            ],
            'ord_accesoriosExterior:ntext',
            'ord_accesoriosInterior:ntext',
            'ord_problemas:ntext',
            'ord_diagnostico:ntext',
        ],
    ]) ?>

</div>
