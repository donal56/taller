<?php
/**
 * @var $this yii\web\View
 * @var $model webvimark\modules\UserManagement\models\forms\LoginForm
 */

use webvimark\modules\UserManagement\components\GhostHtml;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;

$this->title = "Polo - Transmisiones Automáticas";
?>

<div id="login-wrapper">
	<center>
		<div class="well well-sm col-md-offset-4 col-md-4" align="center"><br><br>
			<?php $form = ActiveForm::begin([
				'id'      => 'login-form',
				'options'=>['autocomplete'=>'off', 'class' => 'well login-form'],
				'validateOnBlur'=>false,
				'fieldConfig' => [
					'template'=>"{input}\n{error}",
				],
			]) ?>

			<?= $form->field($model, 'username')
				->textInput(['placeholder'=>'Usuario', 'autocomplete'=>'off']) ?>

			<?= $form->field($model, 'password')
				->passwordInput(['placeholder'=>$model->getAttributeLabel('password'), 'autocomplete'=>'off']) ?>

			<?= Html::submitButton(
				UserManagementModule::t('front', 'Acceder'),
				['class' => 'btn btn-sm btn-success btn-block']
			) ?>

			<?php ActiveForm::end() ?>
	        <?php //echo Yii::$app->getRequest()->getUserIP()?>

	        <!--<h4>Si no recuerda su contraseña de clic en <a href="http://sws.itvillahermosa.edu.mx/user-management/auth/asignar-password"><font color=green><b>Olvidé mi Contraseña</b></font></a></h4><br>-->
		</div>

	</center>
</div>