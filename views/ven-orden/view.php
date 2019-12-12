<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\components\Utilidades;
use webvimark\modules\UserManagement\models\User;


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
    <p>
    <?php
    if (Yii::$app->user->isSuperAdmin)
       
    ?>
    </p>
    <?php 
    
    if (Yii::$app->user->isSuperAdmin) 
        echo Html::a('', ['index'], ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']);
    else
        echo Html::a('', ['index', 'usr' => Yii::$app->user->identity->id], ['class' => 'btn btn-success glyphicon glyphicon-arrow-left']); ?>

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
            'ord_tipo',
            'ord_modelo',
            'ord_marca',
            'ord_placa',
            [
                'attribute' => 'ord_fechaIngreso',
                'value' => function($model)
                {
                    return (new DateTime($model->ord_fechaIngreso))->format('d-m-Y h:i A');
                }
            ],
            [
                'attribute' => 'ord_fechaEntrega',
                'value' => function($model)
                {
                    return ($model->ord_fechaEntrega)? (new DateTime($model->ord_fechaEntrega))->format('d-m-Y h:i A'): null;
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
                    
                    foreach($list as $key => $element)
                    {
                        if ($element == "on")
                            $list[$key] = '✔';
                        else
                            $list[$key] = '✘';
                    }

                    return Utilidades::array2table($list);
                },
                'format' => 'raw'
            ],
            [
                'attribute' => 'ord_vehiculoInterior',
                'value'     => function ($model) 
                {
                    $list= json_decode($model->ord_vehiculoInterior, true);
                    
                    foreach($list as $key => $element)
                    {
                        if ($element == "on")
                            $list[$key] = '✔';
                        else
                            $list[$key] = '✘';
                    }

                    return Utilidades::array2table($list);
                },
                'format' => 'raw'
            ],
            'ord_observaciones:ntext',
            [
                'attribute' => 'ord_tanque',
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
            [
                'attribute' => 'ord_accesoriosExterior',
                'value'     => function ($model) 
                {
                    $list= json_decode($model->ord_accesoriosExterior, true);
                    
                    foreach($list as $key => $element)
                    {
                        if ($element == "on")
                            $list[$key] = '✔';
                        else
                            $list[$key] = '✘';
                    }

                    return Utilidades::array2table($list);
                },
                'format' => 'raw'
            ],
            [
                'attribute' => 'ord_accesoriosInterior',
                'value'     => function ($model) 
                {
                    $list= json_decode($model->ord_accesoriosInterior, true);
                    
                    foreach($list as $key => $element)
                    {
                        if ($element == "on")
                            $list[$key] = '✔';
                        else
                            $list[$key] = '✘';
                    }

                    return Utilidades::array2table($list);
                },
                'format' => 'raw'
            ],
            'ord_problemas:ntext',
            'ord_diagnostico:ntext',
            [
                'label' => 'Vehículo',
                'format' => 'raw',
                'visible' => file_exists("img/wPaint/files/" . $model->ord_id . ".png"),
                'value' => function ($model) 
                {
                    return Html::img('@web/img/wPaint/files/' . $model->ord_id . ".png", ['alt'=>'Vehículo', 'width'=>'350']);
                }
            ],
            [
                'label' => 'Firma del asesor',
                'format' => 'raw',
                'visible' => file_exists("img/firmas/" . $model->ord_id . "-1.png"),
                'value' => function ($model) 
                {
                    return Html::img('@web/img/firmas/' . $model->ord_id . "-1.png", ['alt'=>'Firma 1', 'width'=>'350', 'style' => 'margin: 20px']);
                }
            ],
            [
                'label' => 'Firma del cliente',
                'format' => 'raw',
                'visible' => file_exists("img/firmas/" . $model->ord_id . "-2.png"),
                'value' => function ($model) 
                {
                    return Html::img('@web/img/firmas/' . $model->ord_id . "-2.png", ['alt'=>'Firma 2', 'width'=>'350', 'style' => 'margin: 20px']);
                }
            ],
            [
                'attribute' => 'ord_user',
                'visible'   => Yii::$app->user->isSuperAdmin,
                'label'     => 'Generado por: ',
                'value'     => function($model)
                {
                    return (($user = User::findOne($model->ord_user))) ? $user->username : null;
                }
            ]
        ],
    ]) ?>

</div>
