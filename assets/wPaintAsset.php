<?php

    namespace app\assets;

    use yii\web\AssetBundle;

    class wPaintAsset extends AssetBundle
    {
        public $basePath = '@webroot';
        public $baseUrl = '@web';
        public $css = [
            "css/wPaint/wPaint.min.css",
            "css/wPaint/wColorPicker.min.css",
        ];
        public $js = [
        	"js/wpaint/jquery-migrate-1.4.1.min.js",
            "js/wPaint/wColorPicker.min.js",
            "js/wPaint/wPaint.min.js",
            "js/wPaint/wPaint.menu.main.min.js"
        ];
        public $depends = [
        ];
    }
?>