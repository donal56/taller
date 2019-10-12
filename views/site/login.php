<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

use webvimark\modules\UserManagement\components\GhostHtml;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="well well-sm" align="center">
    <P>SISTEMA DEL ITVH</P>
    
    <h3>INGRESO AL SISTEMA</h3>
   
</div>
<br>
<div id="login-wrapper">
	<center>
		<?php $form = ActiveForm::begin([
			'id'      => 'login-form',
			'options'=>['autocomplete'=>'off', 'class' => 'well login-form'],
			'validateOnBlur'=>false,
			'fieldConfig' => [
				'template'=>"{input}\n{error}",
			],
		]) ?>

		<?= $form->field($model, 'username')
			->textInput(['placeholder'=>$model->getAttributeLabel('username'), 'autocomplete'=>'off']) ?>

		<?= $form->field($model, 'password')
			->passwordInput(['placeholder'=>$model->getAttributeLabel('password'), 'autocomplete'=>'off']) ?>

		<?= Html::submitButton(
			UserManagementModule::t('front', 'Acceder'),
			['class' => 'btn btn-sm btn-success btn-block']
		) ?>

		<?php ActiveForm::end() ?>
                <?php //echo Yii::$app->getRequest()->getUserIP()?>
	</center>
</div>

