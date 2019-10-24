$.fn.wPaint.defaults = 
{
    path:            '/',
    theme:           'standard classic', // set theme
    autoScaleImage: true,               // auto scale images to size of canvas (fg and bg)
    autoCenterImage: true,               // auto center images (fg and bg, default is left/top corner)
    menuHandle:      false,               // setting to false will means menus cannot be dragged around
    menuOrientation: 'vertical',       // menu alignment (horizontal,vertical)
    menuOffsetLeft:  -30,                  // left offset of primary menu
    menuOffsetTop:   185,                  // top offset of primary menu
    bg: "/img/auto.jpg"	
};

$.fn.wPaint.menus.main = 
{
    img: 'img/wPaint/icons-menu-main.png',
    items: 
    {
        undo: 
        {
            icon: 'generic',
            title: 'Deshacer',
            index: 0,
            callback: function()
            { 
                this.undo(); 
            }
        },
        redo: 
        {
            icon: 'generic',
            title: 'Rehacer',
            index: 1,
            callback: function()
            { 
                this.redo();
            }
        },
        reset: 
        {
            icon: 'generic',
            title: 'Limpiar pantalla',
            index: 2,
            callback: function()
            { 
                this.clear();
            }
        }
    }
};

$.extend($.fn.wPaint.cursors, {
  pencil: 'url("img/wPaint/cursor-pencil.png") 0 11.99, default',
});

$.extend($.fn.wPaint.defaults, 
{
    mode:        'pencil',  // set mode
    lineWidth:   '2',       // starting line width
    fillStyle:   '#000000', // starting fill style
    strokeStyle: '#000000',  // start stroke style
    //disableMobileDefaults:false,
});

$('#wPaint').wPaint();
