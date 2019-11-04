<?php

use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;
//use kartik\select2\Select2;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var webvimark\modules\UserManagement\models\forms\PasswordRecoveryForm $model
 */

$this->title = 'Asignar nueva contraseña/nuevo correo electrónico';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="password-recovery">

	<h2 class="text-center"><?= $this->title ?></h2><br>

	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div class="col-md-offset-1 col-md-4">
					<h3 style="text-align: center;"><b>NOTA:</b></h3><br>
					<h4><b>Rellena los campos de la siguiente forma:</b></h4><br>
				    <h4><ul><li><b>Usuario:</b>(Obligatorio)</li>
				    		<li style="list-style-type:disc;"><i>Número de control</i> si es estudiante.</li>
				    	    <li style="list-style-type:disc;"><i>RFC</i> si es docente o administrativo.</li><br>
				    	    <li><b>Correo electrónico:</b>(Obligatorio)</li>
				    	    <li style="list-style-type:disc;">Correo electrónico registrado.</li><br>
				    	    <li><b>Cambio solicitado selecciona:</b></li>
				    	    <li style="list-style-type:disc;">Asignar nueva contraseña.</li>
				    	    <li style="list-style-type:disc;">Asignar nuevo correo electrónico.</li><br>
				    	    <li>Al completar el formulario, se enviará la solicitud al correo electrónico registrado. En caso de no contar con un correo electrónico registrado, si es estudiante acuda a la División de Estudios Profesionales o si es docente o administrativo a Centro de Cómputo.</li><br>
				    </ul></h4>
				</div> <br>
				<div class="col-md-7">
					<?php $form = ActiveForm::begin([
						'id'=>'user',
						'layout'=>'horizontal',
						'validateOnBlur'=>false,
					]); ?>

					<?= $form->field($model, 'username')->textInput(['maxlength' => 50, 'autocomplete'=>'off', 'autofocus'=>true])->label('Usuario') ?>

					<?= $form->field($model, 'email',['errorOptions' => ['encode' => false]])->textInput(['maxlength' => 255]) ?>

				    <?= $form->field($model, 'cambio')->dropDownList(['1'=>'Asignar nueva contraseña','2'=>'Asignar nuevo correo electrónico']);?>

					<?= $form->field($model, 'captcha')->widget(Captcha::className(), [
						'template' => '<div class="row"><div class="col-sm-4">{image}</div><div class="col-sm-3">{input}</div></div>',
						'captchaAction'=>['/user-management/auth/captcha']
					]) ?>

					<div class="form-group" style="text-align: center;">
						<div class="col-sm-offset-1 col-sm-9">
							<?= Html::submitButton(
								'<span class="glyphicon glyphicon-ok"></span> ' . UserManagementModule::t('front', 'Recover'),
								['class' => 'btn btn-primary']
							) ?>
						</div>
					</div>
				</div>
				<?php ActiveForm::end(); ?>
			</div>
		</div>
	</div>
</div>