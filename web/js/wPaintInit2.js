initW();
$('#wPaint1').wPaint();

initW();
$('#wPaint2').wPaint();


function initW()
{
    $.fn.wPaint.defaults = 
{
    path:            '/',
    theme:           'standard classic', // set theme
    autoScaleImage: true,               // auto scale images to size of canvas (fg and bg)
    autoCenterImage: true,               // auto center images (fg and bg, default is left/top corner)
    menuHandle:      false,               // setting to false will means menus cannot be dragged around
    menuOrientation: 'vertical',       // menu alignment (horizontal,vertical)
    menuOffsetLeft:  10,                  // left offset of primary menu
    menuOffsetTop:   23,                  // top offset of primary menu
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
        },
        eraser: 
        {
            icon: 'activate',
            title: 'Borrador',
            index: 8,
            callback: function () { this.setMode('eraser'); }
        },  
        pencil: 
        {
            icon: 'activate',
            title: 'Lápiz',
            index: 6,
            callback: function () { this.setMode('pencil'); }
        },
    }
};

$.extend($.fn.wPaint.cursors, {
  pencil: 'url("img/wPaint/cursor-pencil.png") 0 11.99, default',
});

$.extend($.fn.wPaint.defaults, 
{
    mode:        'pencil',  // set mode
    lineWidth:   '3',       // starting line width
    fillStyle:   '#000000', // starting fill style
    strokeStyle: '#000000',  // start stroke style
    //disableMobileDefaults:false,
});
}