<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\widgets\Breadcrumbs;
use app\assets\ItvhAsset;
ItvhAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
  <head>
      <meta charset="<?= Yii::$app->charset ?>">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <?= Html::csrfMetaTags() ?>
      <title><?= Html::encode($this->title) ?></title>
      <?php $this->head() ?>
  </head>

  <body>
    <div class="wraper">
      <?php $this->beginBody() ?>

        <?php require_once('lyt_header.php'); ?>
        <?php require_once('lyt_navbar.php'); ?>

      <div class="content_block">
          

          <div class="wraper">
              <?= $content ?>
          </div>
      </div>
      <?php $this->endBody() ?>
    </div>
    <?php require_once('lyt_footer.php'); ?>
  </body>
</html>
<?php $this->endPage() ?>
