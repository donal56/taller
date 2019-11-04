<?php

namespace webvimark\modules\UserManagement\controllers;

use webvimark\components\AdminDefaultController;
use Yii;
use webvimark\modules\UserManagement\models\User;
use webvimark\modules\UserManagement\models\search\UserSearch;
use yii\web\NotFoundHttpException;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends AdminDefaultController
{
	/**
	 * @var User
	 */
	public $modelClass = 'webvimark\modules\UserManagement\models\User';

	/**
	 * @var UserSearch
	 */
	public $modelSearchClass = 'webvimark\modules\UserManagement\models\search\UserSearch';

	/**
	 * @return mixed|string|\yii\web\Response
	 */
	public function actionCreate()
	{
		$model = new User(['scenario'=>'newUser']);

		if ( $model->load(Yii::$app->request->post()) && $model->save() )
		{
			return $this->redirect(['view',	'id' => $model->id]);
		}

		return $this->renderIsAjax('create', compact('model'));
	}

	/**
	 * @param int $id User ID
	 *
	 * @throws \yii\web\NotFoundHttpException
	 * @return string
	 */
	/*public function actionChangePassword($id)
	{
		$model = User::findOne($id);

		if ( !$model )
		{
			throw new NotFoundHttpException('User not found');
		}

		$model->scenario = 'changePassword';

		if ( $model->load(Yii::$app->request->post()) && $model->save() )
		{
			return $this->redirect(['view',	'id' => $model->id]);
		}

		return $this->renderIsAjax('changePassword', compact('model'));
	}*/

	public function actionChangePassword($id)
	{
		$model = User::findOne($id);

		if ( !$model )
		{
			throw new NotFoundHttpException('User not found');
		}

		if($model->email == '' || $model->email_confirmed == '0'){
			$model->scenario = 'asignaremail';
			if ($model->load(Yii::$app->request->post()) && $model->validate()) {
				$model->generateConfirmationToken();
				$model->email_confirmed = '0';
				$model->update();
				$model         = User::findOne(['id' => $id]);
				$model->cambio = '3';
				if ( $this->sendConfirmationEmail($model, 'confirmarEmail')){
					return $this->redirect('index');
				} else {
					return $this->redirect(['/user-management/auth/agregar-email', 'id' => $id]);
				}
			} else {	
                return $this->redirect(['/user-management/auth/agregar-email', 'id' => $id]);
        	} 
        } else {
        	$model->scenario = 'recuperarPassword';
        	$model->password = $this->generarpassword();
        	$model->update(false);
        	$model->cambio = '1';
        	if ( $this->sendConfirmationEmail($model, 'asignarPasswordEmail')){
				return $this->redirect('index');
			} else {
				return $this->redirect(['/user-management/auth/agregar-email', 'id' => $id]);
			}
            return $this->redirect('index');
        }

        $model->scenario = 'changePassword';

		if ( $model->load(Yii::$app->request->post()) && $model->save() )
		{
			return $this->redirect(['view',	'id' => $model->id]);
		}
	}

	protected function sendConfirmationEmail($usuario, $plantilla)
	{
		return Yii::$app->mailer->compose(Yii::$app->getModule('user-management')->mailerOptions[$plantilla], ['user' => $usuario])
			->setFrom(Yii::$app->getModule('user-management')->mailerOptions['from'])
			->setTo($usuario->email)
			->setSubject(Yii::$app->params["asunto".$plantilla.$usuario->cambio])
			->send();
	}

	public function generarpassword()
	{
		$mayusculas = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$minusculas = 'abcdefghijklmnopqrstuvwxyz';
		$digitos    = '0123456789';
		$especiales = '!@#%^&*()_,./<>?;:[{\|=+';
		$bloques    = $this->random($mayusculas,1).$this->random($minusculas,4).$this->random($digitos,2).$this->random($especiales,1);
		$password   = str_shuffle($bloques);
		return $password;
	}

	public function random($c,$n) 
	{
		$randomString = '';
	    for ($i = 0; $i < $n; $i++) { 
	        $index = rand(0, strlen($c) - 1); 
	        $randomString .= $c[$index]; 
	    }   
	    return $randomString; 
	}

}
