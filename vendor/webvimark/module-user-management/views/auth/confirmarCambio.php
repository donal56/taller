<?php
use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
$titulo   = 'Correo electrónico enviado';
$imagen   = 'email';
$mensaje1 = 'Se ha enviado un correo electrónico para confirmar los cambios solicitados.';
$mensaje2 = 'Por favor revisa la bandeja de entrada de tu correo electrónico.';
$mensaje3 = '';
$datos    = [];
$urlremota= isset($usuario) ? $usuario->urlremota : '/site/index';
if(isset($opcion)) {
	switch ($opcion) {
		case '1':
			$mensaje2 = 'Por favor informe al estudiante que debe revisar la bandeja de entrada de su correo electrónico para continuar con el proceso.';
		break;
		case '2':
			$titulo   = 'Cambios de datos de acceso';
			$mensaje1 = 'Los cambios solicitados se han realizado con éxito.';
			$mensaje2 = '';
			$mensaje3 = 'El cambio de contraseña ha sido un éxito.';
		    if ($usuario->cambio == '2') { 
				$mensaje3 = "El cambio de correo electrónico ha sido un éxito.";
		    } else {
		    	$imagen   = 'password';
		    }
			$roles = \yii\helpers\ArrayHelper::Map(\webvimark\modules\UserManagement\models\rbacDB\Role::getUserRoles($usuario->id),'name','description');
			if (in_array('Alumno',$roles)){
			    $alumno = \app\models\UserAlumno::findOne(['alu_matricula' => $usuario->username]);
				if($alumno->alu_estpro + $alumno->alu_seresc + $alumno->alu_desaca +
				   $alumno->alu_ceninf + $alumno->alu_recfin + $alumno->alu_extesc > 0){
					$mensaje3 .= '<br>Sin embargo no podrás acceder a los sistemas por los siguientes adeudos.';
			    }
			    if($alumno->alu_estpro == 1)$mensaje3 .= '<br>'.Yii::$app->params['estpro'];
			    if($alumno->alu_estpro == 1)$mensaje3 .= '<br>'.Yii::$app->params['estesc'];
			    if($alumno->alu_desaca == 1)$mensaje3 .= '<br>'.Yii::$app->params['desaca'];
			    if($alumno->alu_ceninf == 1)$mensaje3 .= '<br>'.Yii::$app->params['ceninf'];
			    if($alumno->alu_recfin == 1)$mensaje3 .= '<br>'.Yii::$app->params['recfin'];
			    if($alumno->alu_estpro == 1)$mensaje3 .= '<br>'.Yii::$app->params['extesc'];
				$mensaje3 .='<br>Si tienes alguna duda acude a la División de Estudios Profesionales.';
			} else if (in_array('Personal',$roles)){
			    $personal = \app\models\UserPersonal::findOne(['per_rfc' => $usuario->username]);
				if($personal->per_activo == 0) $mensaje3 .= 'Personal está en estatus inactivo en el ITVH.';
				$mensaje3 .= '<br>Si tiene alguna duda acuda al Departamento de Centro de Cómputo.';
			}
		break;
		case '3':
			$titulo   = 'Cambios de datos de acceso';
			$mensaje1 = 'Los cambios solicitados ya se han realizado anteriormente.';
			$mensaje2 = 'Ya no puede volver a usar esta confirmación de cambio.';
			$mensaje3 = 'Si desea cambiar sus datos de acceso, realice de nuevo una solicitud.';
		    $imagen   = 'password';
		break;
	}
}
?>

<div class="confirm-email">
	<div class="row">
		<div class="col-md-12">

			<div class="panel panel-default">
				<div class="panel-body">
					<center>
						<h2 class="lte-hide-title"><?=$titulo?></h2>
						<br><br>
						<?=Html::img(\yii\helpers\Url::home(true)."/img/$imagen.png", ['width'=>'25%', 'class'=>'img-responsive img-thumbnail',]) ?>
						<br><br>
						<h2><?=$mensaje1?><br><?=$mensaje2?></h2>
						<h2><?=$mensaje3?></h2>
						<br><br>
						<?= Html::a('Aceptar', $urlremota, ['class' => 'btn btn-primary']) ?>
					</center>
				</div>
			</div>
		</div>
	</div>
</div>
