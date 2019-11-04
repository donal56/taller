<?php

use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;


$this->title = UserManagementModule::t('back', 'Changing password for user: ') . ' ' . $model->username;
#$this->params['breadcrumbs'][] = ['label' => UserManagementModule::t('back', 'Users'), 'url' => ['index']];
#$this->params['breadcrumbs'][] = ['label' => $model->username, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = UserManagementModule::t('back', 'Changing password');
?>
<div class="user-update">

	<h2 class="lte-hide-title"><?= $this->title ?></h2>

	<div class="panel panel-default">
		<div class="panel-body">

			<div class="user-form">

				<?php $form = ActiveForm::begin([
					'id'=>'user',
					'layout'=>'horizontal',
					'fieldConfig' => [
				        'errorOptions' => ['class' => 'help-block', 'encode' => false],
				        'horizontalCssClasses' => [
					        'label' => 'col-md-4',
					        'wrapper' => 'col-md-8',
				        ],
				    ],
				]); ?>

				<div class="col-md-offset-1 col-md-4">
						<h3 style="text-align: center;"><b>NOTA:</b></h3><br>
						<h4><b>La contraseña debe contener:</b></h4><br>
					    <h4><ul><li style="list-style-type:disc;">Una longitud entre 8 a 15 caracteres.</li>
					    	    <li style="list-style-type:disc;">Al menos una letra mayúscula.</li>
					    	    <li style="list-style-type:disc;">Al menos una letra minúscula.</li>
					    	    <li style="list-style-type:disc;">Al menos un carácter especial.</li>
					    	    <li style="list-style-type:disc;">Al menos un número.</li>
					    </ul></h4>
					</div> <br>

				<div class="col-md-6">
				<br><br><br>
				<?= $form->field($model, 'password')->passwordInput(['maxlength' => 255, 'autocomplete'=>'off'])->label('Nueva contraseña') ?>

				<?= $form->field($model, 'repeat_password')->passwordInput(['maxlength' => 255, 'autocomplete'=>'off'])->label('Repita nueva contraseña') ?>
				<div class="form-group" style="text-align: center;">
					<div class="col-sm-offset-3 col-sm-9">
							<?= Html::submitButton(
								'<span class="glyphicon glyphicon-ok"></span> ' . UserManagementModule::t('back', 'Save'),
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
