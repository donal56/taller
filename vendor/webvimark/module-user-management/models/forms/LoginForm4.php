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
			'username'   => UserManagementModule::t('front', 'Username'),
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
			if ( !$user || !$user->validatePassword($this->password) )
			{
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
		else
		{   /***************************************************************
			* SERVICIO WEB: Agregado para validar el Acceso mediante el WS. 
			***************************************************************/
			$user=$this->username;
		    $pass=$this->password;
			//Verifica la credencial mediante WS
			if($user!=='superadmin' && $user !== null && $pass !== null )
			{   
		        $APICL = new APICL();
				$existe=$APICL->API('q1234d342saWa!',$user,$pass,'alumno');
				if($existe)
				{   $usuario=User::findOne(['username'=>$user]);
					if(!$usuario)
					{   $usuario=new User();
						$usuario->username       =$user;
						$usuario->status         ='1';
						$usuario->superadmin     ='0';
						$usuario->created_at     =new Expression('NOW()');
						$usuario->registration_ip=$_SERVER['REMOTE_ADDR'];
					}
					$usuario->setPassword($pass);
					$usuario->save(false);
					
					if(!Roles::findOne(['user_id'=>$usuario->id]))
					{   $rol=new Roles();
						$rol->item_name ='otro';
						$rol->user_id   =$usuario->id;
						$rol->created_at=new Expression('NOW()');
						$rol->save(false);
					}
					$this->_user=false;
					return Yii::$app->user->login($this->getUser(), $this->rememberMe ? Yii::$app->user->cookieLifetime : 0);
				}
			}
			/**************************************************************/
			
			return false;
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
			$this->_user = ($u instanceof User ? $u->findByUsername($this->username) : User::findByUsername($this->username));
		}

		return $this->_user;
	}
}