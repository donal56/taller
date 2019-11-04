<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use webvimark\modules\UserManagement\models\User;
use yii\helpers\Url;
use kartik\file\FileInput;

$this->title = 'Subir fotos masivas';
/*$this->params['breadcrumbs'][] = ['label' => 'Subir fotos masivas', 'url' => ['upload-fotos']];*/
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="upload-fotos-form">

    <h1 align="center"><?= Html::encode($this->title) ?></h1>
    <br>

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'imagenes[]')->widget(FileInput::classname(), 
                [
                    'options'       => [
                        'accept'    => 'images/*',
                        'multiple'  => true,
                    ],
                    'pluginOptions' => [
                        'browseClass'       => 'btn btn-success',
                        'uploadClass'       => 'btn btn-info',
                        'removeClass'       => 'btn btn-danger',
                        'removeIcon'        => '<i class="glyphicon glyphicon-trash"></i>',
                        /*'initialPreview'    => [
                            Url::home(true).$model->imagen,
                        ],
                        'initialPreviewAsData'  => false,*/
                        'showPreview' => false,
                        'showCaption' => true,
                        'showRemove' => true,
                        'showUpload' => true,
                    ]
                ]);
            ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
