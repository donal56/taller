<?php 
	use yii\widgets\ActiveForm;
	use yii\helpers\Html;
?>
<div class="enviar-form">
	<?php $form = ActiveForm::begin(); ?>
        <div class="form-group">
            <label>Correo</label>
            <input type='email' class='form-control' name="email"></input>
        </div>
        <div class="form-group">
            <label>Mensaje</label>
            <input type='text' class='form-control' name="mensaje"></input>
        </div>
		<!-- <input type="submit" class="btn btn-primary" value="Enviar"> -->
		<div class="form-group">
        	<?= Html::submitButton('Enviar', ['class' => 'btn btn-success']) ?>
    	</div>
	<?php ActiveForm::end(); ?>
</div>