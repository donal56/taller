$('.multiple-input').on('afterInit', function() 
{
    validateDetalles();

}).on('beforeAddRow', function(e, row, currentIndex)
{
    if($('#w0').find('.has-error').length!=0){
        return false;
    }
}).on('afterAddRow', function(e, row, currentIndex) 
{
    validateDetalles();
}).on('beforeDeleteRow', function(e, row, currentIndex)
{
    var conf;

    if ($(row).find('input').eq(1).val()== ""){
        conf = true;
    }
    else {
        conf =  confirm('¿Seguro que quieres eliminar esta fila?');
    }

    if(conf){
        $(row).find('input').each(
            function(index,det) {
              removeError($(det).attr('id'));
            }
        );
    }
    return conf;
});

//on change
function validateDetalles(){

    $("[id^='venproducto-temp']").on('blur.yii',function(){

    var detalle = $(this).attr('id');

        if (detalle.includes('pro_unidad')){
            if($(this).val().length > 9)
            {
                $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Cantidad debería contener hasta 9 numeros"]);
                addError(detalle);
            }else if (isNaN($(this).val())){
                $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Cantidad debería ser un numero sin simbolos"]);
                addError(detalle);
            }else{
                $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('pro_nombre')){
			$(this).val($(this).val().toUpperCase());
            if($(this).val().length > 255)
            {
                $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Concepto debería contener hasta 255 caracteres."]);
                addError(detalle);
            }else{
                $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
        if (detalle.includes('pro_precio')){
            
            if($(this).val().length > 8)
            {
                $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Precio debería contener hasta 8 numeros"]);
                addError(detalle);
            }else if (isNaN($(this).val())){
                $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                ["Precio debería ser un numero sin simbolos"]);
                addError(detalle);
            }else{
                $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                removeError(detalle);
            }

        }
       

    });
}

function removeError(detalle){
     $("#".detalle).removeClass('has-error');
}

function addError(detalle){
       $("#".detalle).addClass('has-error');
}


$('#w0').on('submit', function (e) {
   
    if($('#w0').find('.has-error').length!=0){

        alert('Resuelve los errores en los campos');
        e.preventDefault();
        e.stopImmediatePropagation();
        
        return false;
   }
 
}); 
