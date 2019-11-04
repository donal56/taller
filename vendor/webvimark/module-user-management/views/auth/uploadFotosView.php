<?php

use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;
use kartik\select2\Select2;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var webvimark\modules\UserManagement\models\forms\PasswordRecoveryForm $model
 */

$this->title = 'Lista de fotos subidas al SWS';
$this->params['breadcrumbs'][] = ['label' => 'Subir fotos masivas', 'url' => ['/user-management/auth/upload-fotos']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="upload-fotos-form">

	<h2 class="text-center"><?= $this->title ?></h2>
	<br>

    <div class="row">
        <div class="col-md-12">
            <?=$subidas?>
        </div>

    </div>
</div>
