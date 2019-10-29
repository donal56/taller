<?php
namespace app\components\widgets\krnpanel;

use yii\helpers\Html;
use yii\helpers\Json;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;

class KrnPanel extends \yii\base\Widget
{

  public $buttons = [];

  public function init()
  {
    parent::init();
  }

  public function run()
  {
    $this->registerAssets();
    $this->buildPanel();
  }

  /*
   * Construir panel de botones
   */
  protected function buildPanel()
  {
    $container = '';
    $container .= Html::beginTag('div', [ 'align' => 'center' ]);
    foreach($this->buttons as $button):
      $container .= Html::beginTag('div', [ 'class' => 'col-lg-2 col-md-2 col-sm-2', 'style' => 'margin-bottom: 45px;' ]);
      $container .= Html::a('', ArrayHelper::getValue($button, 'ruta', '#'),['class' => ArrayHelper::getValue($button, 'clase', '')]);
      $container .= Html::tag('br');
      $container .= Html::beginTag('h4');
      $container .= ArrayHelper::getValue($button, 'texto', 'Botón');
      $container .= Html::endTag('h4');
      $container .= Html::endTag('div');
    endforeach;
    $container .= Html::endTag('div');
    echo $container;
  }

  /*
   * Registrar dependencias y assets
   */
  protected function registerAssets()
  {
    $view = $this->getView();
    KrnPanelAsset::register($view);
  }
}
