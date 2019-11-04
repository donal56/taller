<?php

use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;


$this->title = 'Cambio de correo electrónico registrado';
//$this->params['breadcrumbs'][] = ['label' => 'Usuarios', 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->username, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-update">

	<div class="col-md-12">
		<h2 class="text-center"><?= $this->title ?></h2>
	</div>
	<div class="panel panel-default">
		<div class="panel-body">

			<div class="user-form">
				<div class="row">
					<div class="col-md-offset-1 col-md-4">
						<h3 style="text-align: center;"><b>NOTA:</b></h3><br>
						<h4>Actualmente tiene registrado el correo electrónico:<br>
					        <?='<b><i><u>' . $model->email . '</u></i></b>'?><br><br>
					        <?php if(!$model->email_confirmed) { ?>
					    		<font color="red">Se ha enviado un mensaje a este nuevo correo electrónico que deberá ser contestado para terminar el proceso, de lo contrario no podrá continuar. En caso de error, puede volver a ingresar el nuevo correo electrónico para que se envíe otra vez el mensaje.</font><br>	
					    	<?php } else { ?>
					    		Se enviará un mensaje al nuevo correo electrónico que deberá ser contestado para terminar el proceso, de lo contrario no podrá continuar.<br>
					    	<?php } ?>
					    </h4>
					</div> 
					<div class="col-md-7">
						 <br><br><br>
						 <?php $form = ActiveForm::begin([
							'id'=>'user',
							'layout'=>'horizontal',
							'fieldConfig' => [
						        'errorOptions' => ['class' => 'help-block', 'encode' => false],
						    ],
						]); ?>

						<?= $form->field($model, 'email')->textInput(['maxlength' => 255, 'value' => ''])->label('Nuevo correo electrónico') ?>

						<?= $form->field($model, 'repeat_email')->textInput(['maxlength' => 255])->label('Repita nuevo correo electrónico') ?>

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
									<?= Html::submitButton(
										'<span class="glyphicon glyphicon-ok"></span> ' . UserManagementModule::t('back', 'Save'),
										['class' => 'btn btn-primary']
									) ?>
							</div>
						</div>

						<?php ActiveForm::end(); ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
