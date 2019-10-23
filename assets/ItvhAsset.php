<?php

namespace app\assets;

use yii\web\AssetBundle;

class ItvhAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'plantillas/itvh/css/style.css',
        'plantillas/itvh/css/responsive.css',
        'plantillas/itvh/css/itvh.css',
        'plantillas/itvh/css/itvh_responsive.css',
        'plantillas/itvh/css/unleash.css',
        'plantillas/itvh/css/flexslider.css',
        'plantillas/itvh/css/jquery.onebyone.css',
        'plantillas/itvh/css/nivoslider.css',
        'plantillas/itvh/css/prettyPhoto.css',
        'plantillas/plugins/alertify/css/alertify.css',
        'plantillas/plugins/imp-gallery/css/blueimp-gallery.min.css',
    ];
    public $js = [
      'js/jquery-ui.min.js',
      'plantillas/itvh/js/jquery-animate-css-rotate-scale.js',
      'plantillas/itvh/js/jquery-css-transform.js',
      'plantillas/itvh/js/jquery.blackandwhite.min.js',
      'plantillas/itvh/js/jquery.bxSlider.min.js',
      'plantillas/itvh/js/jquery.faq.js',
      'plantillas/itvh/js/jquery.flexslider-min.js',
      'plantillas/itvh/js/jquery.nivo.slider.js',
      'plantillas/itvh/js/jquery.onebyone.min.js',
      'plantillas/itvh/js/jquery.prettyPhoto.js',
      'plantillas/itvh/js/jquery.simpleFAQ-0.7.min.js',
      'plantillas/itvh/js/jquery.touchwipe.min.js',
      'plantillas/itvh/js/jquery.unleash.min.js',
      'plantillas/itvh/js/js_func.js',
      'plantillas/itvh/js/itvh.js',
      'plantillas/plugins/alertify/alertify.js',
      'plantillas/plugins/bootbox.min.js',
      'plantillas/plugins/imp-gallery/js/blueimp-gallery.min.js',
      'js/funciones.js'
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
