<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;
use app\assets\KCFAsset;
KCFAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
  <head>
      <meta charset="<?= Yii::$app->charset ?>">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <?= Html::csrfMetaTags() ?>
      <?php $this->head() ?>
  </head>
  <body>
    <?php $this->beginBody() ?>
      <?= $content ?>
    <?php $this->endBody() ?>
  </body>
</html>
<?php $this->endPage() ?>