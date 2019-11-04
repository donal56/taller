<?php
/**
 * @var $this yii\web\View
 * @var $user webvimark\modules\UserManagement\models\User
 */
use yii\helpers\Html;

$cambio = ($user->cambio == 1) ? 'Siga este enlace para confirmar el cambio de contraseña:' : 'Siga este enlace para confirmar el cambio de correo electrónico';

?>
<?php
$returnUrl = Yii::$app->user->returnUrl == Yii::$app->homeUrl ? null : rtrim(Yii::$app->homeUrl, '/') . Yii::$app->user->returnUrl;

$confirmLink = Yii::$app->urlManager->createAbsoluteUrl(['/user-management/auth/check-confirmation-token', 'token' => $user->confirmation_token, 'c' => $user->cambio, 'url' => $user->urlremota, 'returnUrl'=>$returnUrl, ]);
?>
<center>
<h2><b>Usuario <?= $user->username ?>:</b></h2>
<h3>Ha recibido este correo electrónico porque solicitó un cambio en sus datos de acceso.
<br/><br/>
<?= $cambio ?>
<br/><br/>
<?=Html::img(\yii\helpers\Url::home(true)."/img/flecha.png", ['width'=>'10%', 'class'=>'img-responsive img-thumbnail',]) ?>
<br/>
<?= Html::a('CONFIRMAR EL CAMBIO', $confirmLink) ?>
</h3>
</center>