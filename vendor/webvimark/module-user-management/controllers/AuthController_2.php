<?php

namespace webvimark\modules\UserManagement\controllers;

use webvimark\components\BaseController;
use webvimark\modules\UserManagement\components\UserAuthEvent;
use webvimark\modules\UserManagement\models\forms\ChangeOwnPasswordForm;
use webvimark\modules\UserManagement\models\forms\ConfirmEmailForm;
use webvimark\modules\UserManagement\models\forms\LoginForm;
use webvimark\modules\UserManagement\models\forms\PasswordRecoveryForm;
use webvimark\modules\UserManagement\models\User;
use webvimark\modules\UserManagement\UserManagementModule;
use Yii;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;
use yii\widgets\ActiveForm;
use webvimark\modules\UserManagement\models\rbacDB\Role;
use yii\web\UploadedFile;

class AuthController extends BaseController
{
	/**
	 * @var array
	 */
	public $freeAccessActions = ['login', 'logout', 'check-confirmation-token', 'asignar-password', 'changePassword', 'changeEmail'];
	/**
	 * @return array
	 */
	public function actions()
	{
		return [
			'captcha' => $this->module->captchaOptions,
		];
	}

	/**
	 * Login form
	 *
	 * @return string
	 */
	public function actionLogin()
	{
		if ( !Yii::$app->user->isGuest )
		{
			return $this->goHome();
		}

		$model = new LoginForm();

		if ( Yii::$app->request->isAjax AND $model->load(Yii::$app->request->post()) )
		{
			Yii::$app->response->format = Response::FORMAT_JSON;
			return ActiveForm::validate($model);
		}

		if ( $model->load(Yii::$app->request->post()) AND $model->login() )
		{
			return $this->goBack();
		}

		return $this->renderIsAjax('login', compact('model'));
	}

	/**
	 * Logout and redirect to home page
	 */
	public function actionLogout()
	{
		Yii::$app->user->logout();

		return $this->redirect(Yii::$app->homeUrl);
	}

	/**
	 * Change your own password
	 *
	 * @throws \yii\web\ForbiddenHttpException
	 * @return string|\yii\web\Response
	 */
	public function actionChangeOwnPassword()
	{
		if ( Yii::$app->user->isGuest )
		{
			return $this->goHome();
		}


		$user = User::getCurrentUser();

		if ( $user->status != User::STATUS_ACTIVE )
		{
			throw new ForbiddenHttpException();
		}

		if ( is_null($user->email) || $user->email == '' || $user->email_confirmed == 0)
		{
			return $this->redirect(['/user-management/auth/agregar-email', 'id' => $user->id]);
		}

		$model = new ChangeOwnPasswordForm(['user'=>$user]);

		if ( Yii::$app->request->isAjax AND $model->load(Yii::$app->request->post()) )
		{
			Yii::$app->response->format = Response::FORMAT_JSON;
			return ActiveForm::validate($model);
		}

		if ( $model->load(Yii::$app->request->post()) AND $model->changePassword() )
		{
			/*return $this->renderIsAjax('changeOwnPasswordSuccess');*/
			$user->cambio    = '1';
			return $this->render('confirmarCambio',['usuario' => $user, 'opcion' => '2']);
		}
		return $this->renderIsAjax('changeOwnPassword', compact('model'));
	}

	/**
	 * Registration logic
	 *
	 * @return string
	 */
	public function actionRegistration()
	{
		if ( !Yii::$app->user->isGuest )
		{
			return $this->goHome();
		}

		$model = new $this->module->registrationFormClass;


		if ( Yii::$app->request->isAjax AND $model->load(Yii::$app->request->post()) )
		{

			Yii::$app->response->format = Response::FORMAT_JSON;

			// Ajax validation breaks captcha. See https://github.com/yiisoft/yii2/issues/6115
			// Thanks to TomskDiver
			$validateAttributes = $model->attributes;
			unset($validateAttributes['captcha']);

			return ActiveForm::validate($model, $validateAttributes);
		}

		if ( $model->load(Yii::$app->request->post()) AND $model->validate() )
		{
			// Trigger event "before registration" and checks if it's valid
			if ( $this->triggerModuleEvent(UserAuthEvent::BEFORE_REGISTRATION, ['model'=>$model]) )
			{
				$user = $model->registerUser(false);

				// Trigger event "after registration" and checks if it's valid
				if ( $this->triggerModuleEvent(UserAuthEvent::AFTER_REGISTRATION, ['model'=>$model, 'user'=>$user]) )
				{
					if ( $user )
					{
						if ( Yii::$app->getModule('user-management')->useEmailAsLogin AND Yii::$app->getModule('user-management')->emailConfirmationRequired )
						{
							return $this->renderIsAjax('registrationWaitForEmailConfirmation', compact('user'));
						}
						else
						{
							$roles = (array)$this->module->rolesAfterRegistration;

							foreach ($roles as $role)
							{
								User::assignRole($user->id, $role);
							}

							Yii::$app->user->login($user);

							return $this->redirect(Yii::$app->user->returnUrl);
						}

					}
				}
			}

		}

		return $this->renderIsAjax('registration', compact('model'));
	}


	/**
	 * Receive token after registration, find user by it and confirm email
	 *
	 * @param string $token
	 *
	 * @throws \yii\web\NotFoundHttpException
	 * @return string|\yii\web\Response
	 */
	public function actionConfirmRegistrationEmail($token)
	{
		if ( Yii::$app->getModule('user-management')->useEmailAsLogin AND Yii::$app->getModule('user-management')->emailConfirmationRequired )
		{
			$model = new $this->module->registrationFormClass;

			$user = $model->checkConfirmationToken($token);

			if ( $user )
			{
				return $this->renderIsAjax('confirmEmailSuccess', compact('user'));
			}

			throw new NotFoundHttpException(UserManagementModule::t('front', 'Token not found. It may be expired'));
		}
	}


	/**
	 * Form to recover password
	 *
	 * @return string|\yii\web\Response
	 */
	public function actionPasswordRecovery()
	{
		if ( !Yii::$app->user->isGuest )
		{
			return $this->goHome();
		}

		$model = new PasswordRecoveryForm();

		if ( Yii::$app->request->isAjax AND $model->load(Yii::$app->request->post()) )
		{
			Yii::$app->response->format = Response::FORMAT_JSON;

			// Ajax validation breaks captcha. See https://github.com/yiisoft/yii2/issues/6115
			// Thanks to TomskDiver
			$validateAttributes = $model->attributes;
			unset($validateAttributes['captcha']);

			return ActiveForm::validate($model, $validateAttributes);
		}

		if ( $model->load(Yii::$app->request->post()) AND $model->validate() )
		{
			if ( $this->triggerModuleEvent(UserAuthEvent::BEFORE_PASSWORD_RECOVERY_REQUEST, ['model'=>$model]) )
			{
				if ( $model->sendEmail(false) )
				{
					if ( $this->triggerModuleEvent(UserAuthEvent::AFTER_PASSWORD_RECOVERY_REQUEST, ['model'=>$model]) )
					{
						return $this->renderIsAjax('passwordRecoverySuccess');
					}
				}
				else
				{
					Yii::$app->session->setFlash('error', UserManagementModule::t('front', "Unable to send message for email provided"));
				}
			}
		}

		return $this->renderIsAjax('passwordRecovery', compact('model'));
	}

	/**
	 * Receive token, find user by it and show form to change password
	 *
	 * @param string $token
	 *
	 * @throws \yii\web\NotFoundHttpException
	 * @return string|\yii\web\Response
	 */
	public function actionPasswordRecoveryReceive($token)
	{
		if ( !Yii::$app->user->isGuest )
		{
			return $this->goHome();
		}

		$user = User::findByConfirmationToken($token);

		if ( !$user )
		{
			throw new NotFoundHttpException(UserManagementModule::t('front', 'Token not found. It may be expired. Try reset password once more'));
		}

		$model = new ChangeOwnPasswordForm([
			'scenario'=>'restoreViaEmail',
			'user'=>$user,
		]);

		if ( $model->load(Yii::$app->request->post()) AND $model->validate() )
		{
			if ( $this->triggerModuleEvent(UserAuthEvent::BEFORE_PASSWORD_RECOVERY_COMPLETE, ['model'=>$model]) )
			{
				$model->changePassword(false);

				if ( $this->triggerModuleEvent(UserAuthEvent::AFTER_PASSWORD_RECOVERY_COMPLETE, ['model'=>$model]) )
				{
					return $this->renderIsAjax('changeOwnPasswordSuccess');
				}
			}
		}

		return $this->renderIsAjax('changeOwnPassword', compact('model'));
	}

	/**
	 * @return string|\yii\web\Response
	 */
	public function actionConfirmEmail()
	{
		if ( Yii::$app->user->isGuest )
		{
			return $this->goHome();
		}

		$user = User::getCurrentUser();

		if ( $user->email_confirmed == 1 )
		{
			return $this->renderIsAjax('confirmEmailSuccess', compact('user'));
		}

		$model = new ConfirmEmailForm([
			'email'=>$user->email,
			'user'=>$user,
		]);

		if ( Yii::$app->request->isAjax AND $model->load(Yii::$app->request->post()) )
		{
			Yii::$app->response->format = Response::FORMAT_JSON;
			return ActiveForm::validate($model);
		}

		if ( $model->load(Yii::$app->request->post()) AND $model->validate() )
		{
			if ( $this->triggerModuleEvent(UserAuthEvent::BEFORE_EMAIL_CONFIRMATION_REQUEST, ['model'=>$model]) )
			{
				if ( $model->sendEmail(false) )
				{
					if ( $this->triggerModuleEvent(UserAuthEvent::AFTER_EMAIL_CONFIRMATION_REQUEST, ['model'=>$model]) )
					{
						return $this->refresh();
					}
				}
				else
				{
					Yii::$app->session->setFlash('error', UserManagementModule::t('front', "Unable to send message for email provided"));
				}
			}
		}

		return $this->renderIsAjax('confirmEmail', compact('model'));
	}

	/**
	 * Receive token, find user by it and confirm email
	 *
	 * @param string $token
	 *
	 * @throws \yii\web\NotFoundHttpException
	 * @return string|\yii\web\Response
	 */
	public function actionConfirmEmailReceive($token)
	{
		$user = User::findByConfirmationToken($token);

		if ( !$user )
		{
			throw new NotFoundHttpException(UserManagementModule::t('front', 'Token not found. It may be expired'));
		}
		
		$user->email_confirmed = 1;
		$user->removeConfirmationToken();
		$user->save(false);

		return $this->renderIsAjax('confirmEmailSuccess', compact('user'));
	}

	/**
	 * Universal method for triggering events like "before registration", "after registration" and so on
	 *
	 * @param string $eventName
	 * @param array  $data
	 *
	 * @return bool
	 */
	protected function triggerModuleEvent($eventName, $data = [])
	{
		$event = new UserAuthEvent($data);

		$this->module->trigger($eventName, $event);

		return $event->isValid;
	}

	public function actionAsignarPassword()
	{
		if(isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER']!='http://sws.itvillahermosa.edu.mx/user-management/auth/asignar-password')$_SESSION['urlRemota']=$_SERVER['HTTP_REFERER'];

		$model           = new User();
		$model->scenario = 'asignarpassword';
		$post            = Yii::$app->request->post();

		if ($model->load($post) && $model->validate()) {
			$usuario   	  = User::findOne(['username' => $model->username]);
			if (isset($usuario)) {
				if ($usuario->email == $model->email) {
					$usuario->generateConfirmationToken();
					$usuario->update();
					$usuario->cambio    = $model->cambio;
					$usuario->urlremota = isset($_SESSION['urlRemota']) ? $_SESSION['urlRemota'] : '/';
					if ($this->sendConfirmationEmail($usuario, 'confirmarEmail')) {
						return $this->render('confirmarCambio',compact('usuario'));
					} else {
						return $this->redirect('asignarPassword');
					}
				
				} else {
					$model->addError('email', UserManagementModule::t('front', "El correo electrónico ingresado no coincide con el registrado anteriormente. Si no recuerda su correo electrónico, acuda a División de Estudios Profesionales para actualizar sus datos."));
				}
			} else {
					$model->addError('username', UserManagementModule::t('front', 'El usuario ingresado no existe o incorrecto.'));
			}
			return $this->render('asignarPassword', compact('model'));
		}
		return $this->render('asignarPassword', compact('model'));
	}

	protected function sendConfirmationEmail($usuario, $plantilla)
	{
		return Yii::$app->mailer->compose(Yii::$app->getModule('user-management')->mailerOptions[$plantilla], ['user' => $usuario])
			->setFrom(Yii::$app->getModule('user-management')->mailerOptions['from'])
			->setTo($usuario->email)
			->setSubject(Yii::$app->params["asunto".$plantilla.$usuario->cambio])
			->send();
	}

	public function actionCheckConfirmationToken($token,$c,$url='/')
	{
		$model    = User::findOne(['confirmation_token' => $token]);
		if(isset($model)) {
			$redirect = "";

	        if        ($c=='1') {
				$model->scenario = 'recuperarPassword';
				$redirect = 'changePassword';
			} else if ($c=='2') {
				$model->scenario = 'asignaremail';
				$redirect = 'changeEmail';
			} else              {
				$model->removeConfirmationToken();
				$model->email_confirmed = 1;
				$model->update();
				return $this->redirect('login');
			}
	      
			if ($model->load( Yii::$app->request->post()) && $model->validate()) {
				$model->removeConfirmationToken();
				$model->email_confirmed=1;
				$model->update();
				$model->cambio    = $c;
				$model->urlremota = $url;
				/*if ($this->sendConfirmationEmail($model, 'asignarPasswordEmail')){*/
					return $this->render('confirmarCambio',['usuario' => $model, 'opcion' => '2']);
				/*} else {
					return $this->redirect($redirect);
				}*/
			}
			return $this->render($redirect, compact('model'));
		}
		return $this->redirect('login');
	}

	public function actionAgregarEmail($id)
	{
		if(isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER']!='http://sws.itvillahermosa.edu.mx/user-management/auth/agregar-email?id='.$id)$_SESSION['urlRemota']=$_SERVER['HTTP_REFERER'];

		if($id != Yii::$app->user->identity->id && !Yii::$app->user->isSuperAdmin)
		{
			return $this->redirect(['/user-management/auth/agregar-email', 'id' => Yii::$app->user->identity->id]);
		}
		$model           = User::findOne(['id' => $id]);
		$model->scenario = 'asignaremail';
		if ($model->load(Yii::$app->request->post()) && $model->validate()) {
			$model->generateConfirmationToken();
			$model->email_confirmed = '0';
			$model->update();
			$model            = User::findOne(['id' => $id]);
			$model->cambio    = '3';
			$model->urlremota = $_SESSION['urlRemota'];
			if ( $this->sendConfirmationEmail($model, 'confirmarEmail')){
				return $this->render('confirmarCambio',['usuario' => $model]);
			} else {
				return $this->render('changeEmail', ['model' => $model]);
			}
		}
		return $this->render('changeEmail', ['model' => $model]);
	}

	public function actionUploadFotos()
    {
      	$model = new User();
        if ($model->load(Yii::$app->request->post())) {

            $imagenes= UploadedFile::getInstances($model, 'imagenes');
            if (!is_null($imagenes)) { 

				$ftp_server   ="172.16.24.50"; 
				$ftp_user_name="swuser"; 
				$ftp_user_pass="5Wu53r.8"; 
				
				// Establecer una conexión básica
				$conn_id = ftp_connect($ftp_server);

				// Iniciar sesión con nombre de usuario y contraseña
				$login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass);
				
				$subidas="";
				// Intenta cambiar el directorio de fotos.
				if (ftp_chdir($conn_id, "web/fotos")) {
					foreach ($imagenes as $foto) {
		        		$dir = substr($foto->baseName, 0, 2);
		        		// Verificando si existe el directorio
						if (!$this->ftp_directory_exists($conn_id, $dir) ) {
							// Como no existe, se crea el directorio
							ftp_mkdir($conn_id, $dir);
						}
						// Ubicándose en el directorio
						ftp_chdir($conn_id, $dir);
						

						// Cambiar tamaño
                        list($ancho, $alto) = getimagesize($foto->tempName);
                        // Obtener los nuevos tamaños
                        $nuevo_ancho        = 80;
                        $nuevo_alto         = 96;
                        if($ancho!=$nuevo_ancho && $alto!=$nuevo_alto) {
                            // Cargar
                            $thumb          = imagecreatetruecolor($nuevo_ancho, $nuevo_alto);
                            $origen         = imagecreatefromjpeg($foto->tempName);
                            // Cambiar el tamaño
                            imagecopyresized($thumb, $origen, 0, 0, 0, 0, $nuevo_ancho, $nuevo_alto, $ancho, $alto);
                            // Guardar la imagen con el nuevo tamaño
                            imagejpeg($thumb,$foto->tempName);
                        }

						// cargar un archivo
						if (ftp_put($conn_id, $foto->name, $foto->tempName, FTP_BINARY)) {
							$subidas.=$foto->name." => Se ha cargado correctamente.<br>";
						} else {
							$subidas.=$foto->name." => Error durante la carga de la foto.<br>";
						}

						// Liberar memoria
                        if($ancho!=$nuevo_ancho && $alto!=$nuevo_alto) {
                            imagedestroy($thumb);
                        }

						// Saliéndose al directorio anterior
						ftp_chdir($conn_id, '..');

			        }
				}
				// close the connection
				ftp_close($conn_id);
				
				return $this->render("uploadFotosView",compact('subidas'));
				//return "<script type='text/javascript'>alert('Lista de Fotos importadas.$subidas'); window.location.href='upload-fotos';</script>";
	        } else {
	            return "<script type='text/javascript'>alert('Hubo un error al cargar una foto, verifique lo que esta cargando.');   window.location.href='upload-fotos';</script>";
	        }
        }
        return $this->render('uploadFotos', ['model' => $model]);  
    }

    public function ftp_directory_exists($ftp, $dir) 
	{ 
	    // Get the current working directory 
	    $origin = ftp_pwd($ftp); 
	    
	    // Attempt to change directory, suppress errors 
	    if (@ftp_chdir($ftp, $dir)) 
	    { 
	        // If the directory exists, set back to origin 
	        ftp_chdir($ftp, $origin);    
	        return true; 
	    } 

	    // Directory does not exist 
	    return false; 
	} 
}