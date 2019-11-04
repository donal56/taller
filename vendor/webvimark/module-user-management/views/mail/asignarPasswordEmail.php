<?php
/**
 * @var $this yii\web\View
 * @var $user webvimark\modules\UserManagement\models\User
 */
use webvimark\modules\UserManagement\models\rbacDB\Role;
use yii\helpers\Html;

$roles = \yii\helpers\ArrayHelper::Map(Role::getUserRoles($user->id),'name','description');
if (in_array('Alumno',$roles)){
    $alumno = \app\models\UserAlumno::findOne(['alu_matricula' => $user->username]);
	$datos['inicio'] = "Tu nueva contraseña es: <b>{$user->password}</b>";
	$datos['cambio'] = '<h4>Haz cambiado con éxito tu contraseña.';
	if($alumno->alu_estpro + $alumno->alu_seresc + $alumno->alu_desaca +
	   $alumno->alu_ceninf + $alumno->alu_recfin + $alumno->alu_extesc > 0){
		$datos['cambio'] .= ' Sin embargo no podrás acceder a los sistemas por los siguientes adeudos.</h4>';
    } else {
    	$datos['cambio'] .= '</h4>';
    }
    if($alumno->alu_estpro == 1)$datos['estpro'] = Yii::$app->params['estpro'];
    if($alumno->alu_estpro == 1)$datos['estesc'] = Yii::$app->params['estesc'];
    if($alumno->alu_desaca == 1)$datos['desaca'] = Yii::$app->params['desaca'];
    if($alumno->alu_ceninf == 1)$datos['ceninf'] = Yii::$app->params['ceninf'];
    if($alumno->alu_recfin == 1)$datos['recfin'] = Yii::$app->params['recfin'];
    if($alumno->alu_estpro == 1)$datos['extesc'] = Yii::$app->params['extesc'];
	$datos['aviso']='Por favor no respondas este correo, si tienes alguna duda acude a la División de Estudios Profesionales.';
} else if (in_array('Personal',$roles)){
    $personal = \app\models\UserPersonal::findOne(['per_rfc' => $user->username]);
	$datos['inicio'] = "Su nueva contraseña es: <b>{$user->password}</b>";
	$datos['cambio'] = 'Ha cambiado con éxito su contraseña.';
    if($personal->per_activo == 0) $datos['activo'] = 'Personal en estado inactivo en el ITVH.';
	$datos['aviso']='Por favor no responda este correo, si tiene alguna duda acuda al Departamento de Centro de Cómputo.';
} ?>
<br/><br/>
<?php if($user->cambio == '1'){ 
	    if(isset($datos)){  
		   foreach ($datos as $key => $value) { ?>
				<p><?=$value?></p>
		<?php } 
		   } 
	 } elseif($user->cambio == '2') { ?>
	<p>El cambio de correo electrónico ha sido un éxito.</p> 
	<p>El correo eléctronico es: <b><?=$user->email?></b> </p>
<?php } ?>
<br/><br/>