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
  { $i=0;?>
      <div class="container-fluid">
        <div class="row-fluid">
    <?php foreach($this->buttons as $key => $grupos): ?> 
            <?php foreach($grupos as $button): ?>
              <center>
                <div class="col-md-2 col-sm-3 col-xs-6" style="height: 190px;">
                  <div style="border-radius: <?=in_array(ArrayHelper::getValue($button, 'estado', 0), [1,3]) ? 20 : 50?>%; height: 120px; width: 120px; background-color: <?=ArrayHelper::getValue($button, 'color', 'f00');?>">
                    <?= Html::a("<h4 style='padding-top: 110%; font-family: Verdana; font-size: 17px; text-transform: none;'>".ArrayHelper::getValue($button, 'texto', 'Botón')."</h4>", ArrayHelper::getValue($button, 'ruta', '#')[0],['class' => 'boton_prototype_'.(in_array(ArrayHelper::getValue($button, 'estado', 0), [1,3]) ? 1 : 3).' plantilla plantilla_hover', 'style' => "background: url(/img/dashboard/".ArrayHelper::getValue($button, 'clase', 'Botón').".png) no-repeat; background-position: 50% 50%; background-size: 100% 100%;"]) ?>
                    <?php if(in_array(ArrayHelper::getValue($button, 'estado', 0), [1,3])) { ?>
                      <div style="margin-left: -140px; margin-top: -110px; height: 120px; width: 3px; background-color: <?=ArrayHelper::getValue($button, 'color', 'f00')?>80"></div>
                      <div style="margin-left: -130px; margin-top: -120px; height: 120px; width: 3px; background-color: <?=ArrayHelper::getValue($button, 'color', 'f00')?>FF"></div>
                    <?php } else { ?>
                      <div style="margin-top: 6px; border-radius: 50%; height: 10px; width: 120px; background-color: <?=ArrayHelper::getValue($button, 'color', 'f00')?>80"></div>
                    <?php } ?>
                  </div>
                </div>
              </center>
            <?php endforeach; ?>  
    <?php endforeach; ?>
        </div>
      </div>
 <?php }

  /*
   * Registrar dependencias y assets
   */
  protected function registerAssets()
  {
    $view = $this->getView();
    KrnPanelAsset::register($view);
  }
}
