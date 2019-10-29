<?php
/**
 * @copyright Copyright (c) 2016 Keren-puc!
 */
namespace app\components\widgets\krnpanel;

use yii\web\AssetBundle;

class KrnPanelAsset extends AssetBundle
{
  public $css = [
    'css/krn_styles.css',
  ];
  public $js = [
  ];
  public $depends = [
    'yii\web\YiiAsset',
    'yii\web\JqueryAsset'
  ];

  public function init()
  {
    $this->sourcePath = __DIR__ . '/assets';
    parent::init();
  }
}
