<?php
namespace webvimark\modules\UserManagement\models\forms;

use webvimark\helpers\LittleBigHelper;
use webvimark\modules\UserManagement\models\User;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\base\Model;
use Yii;

/***************************************************************
* SERVICIO WEB: Agregado para validar el Acceso mediante el WS. 
***************************************************************/
use app\web\ws\APICl;
use yii\db\Expression;
use app\models\Roles;
/**************************************************************/


class LoginForm extends Model
{
	public $username;
	public $password;
	public $rememberMe = false;

	private $_user = false;

	private $_validadoEmail = false;

	/**
	 * @inheritdoc
	 */
	public function rules()
	{
		return [
			[['username', 'password'], 'required'],
			['rememberMe', 'boolean'],
			['password', 'validatePassword'],

			['username', 'validateIP'],
		];
	}

	public function attributeLabels()
	{
		return [
			'username'   => 'Usuario',
			'password'   => UserManagementModule::t('front', 'Password'),
			'rememberMe' => UserManagementModule::t('front', 'Remember me'),
		];
	}

	/**
	 * Validates the password.
	 * This method serves as the inline validation for password.
	 */
	public function validatePassword()
	{
		if ( !Yii::$app->getModule('user-management')->checkAttempts() )
		{
			$this->addError('password', UserManagementModule::t('front', 'Too many attempts'));

			return false;
		}

		if ( !$this->hasErrors() )
		{
			$user = $this->getUser();
			if ( !$user || (!$_validadoEmail && !$user->validatePassword($this->password, $this->username)) )
			{
				$_validadoEmail = false;
				$this->addError('password', UserManagementModule::t('front', 'Incorrect username or password.'));
			}
		}
	}

	/**
	 * Check if user is binded to IP and compare it with his actual IP
	 */
	public function validateIP()
	{
		$user = $this->getUser();

		if ( $user AND $user->bind_to_ip )
		{
			$ips = explode(',', $user->bind_to_ip);

			$ips = array_map('trim', $ips);

			if ( !in_array(LittleBigHelper::getRealIp(), $ips) )
			{
				$this->addError('password', UserManagementModule::t('front', "You could not login from this IP"));
			}
		}
	}

	/**
	 * Logs in a user using the provided username and password.
	 * @return boolean whether the user is logged in successfully
	 */
	public function login()
	{   
		if ( $this->validate() )
		{
			return Yii::$app->user->login($this->getUser(), $this->rememberMe ? Yii::$app->user->cookieLifetime : 0);
		}
	}

	/**
	 * Finds user by [[username]]
	 * @return User|null
	 */
	public function getUser()
	{
		if ( $this->_user === false )
		{
			$u = new \Yii::$app->user->identityClass;
			if ( strpos($this->username,'@') !== false ) {
				$u = User::find()->where(['email'=>$this->username])->all();
				if(count($u) == 1){
					$this->_user = $u[0];
					if($this->_user->validatePassword($this->password, $this->_user->username)) {
						$_validadoEmail = true;
						Yii::$app->user->login($this->_user, $this->rememberMe ? Yii::$app->user->cookieLifetime : 0);
					}
				} elseif (count($u) > 1){
					$this->addError('username', 'El correo electrónico pertenece a varios usuarios. Ingrese número de control o RFC');
				} else {
					$this->addError('username', 'El correo electrónico no está registrado. Ingrese número de control o RFC');
				}
			} else {
				$this->_user = ($u instanceof User ? $u->findByUsername($this->username) : User::findByUsername($this->username));
			}
		}

		return $this->_user;
	}
}