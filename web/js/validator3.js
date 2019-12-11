$('.multiple-input').on('afterInit', function() 
{
    if (!$('tr.multiple-input-list__item').length) {
        $('.multiple-input-list__btn.js-input-plus.btn.btn-success').trigger('click');  
    }
    validateDetalles();

}).on('beforeAddRow', function(e, row, currentIndex)
{
    $('.multiple-input-list__item input,.multiple-input-list__item textarea').blur();
    if($('#w0').find('.has-error').length!=0){
        return false;
    }
}).on('afterAddRow', function(e, row, currentIndex) 
{
    validateDetalles();
}).on('beforeDeleteRow', function(e, row, currentIndex)
{
    var conf;

    
    if ($(row).find('input').eq(0).val()== ""&&
        $(row).find('input').eq(1).val()== ""&&
        $(row).find('input').eq(2).val()== ""&&
        $(row).find('input').eq(3).val()== "")
    {
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

    $("[id^='vendetalle-temp']").on('blur.yii',function(){

    var detalle = $(this).attr('id');

        if($(this).val().length > 0 || detalle.includes('det_id') || detalle.includes('det_partida') ){
            if (detalle.includes('det_cantidad')){
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
            /*if (detalle.includes('det_partida')){
                $(this).val($(this).val().toUpperCase());
                if($(this).val().length > 20)
                {
                    $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), 
                    ["Concepto debería contener hasta 20 caracteres."]);
                    addError(detalle);
                }else{
                    $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), '');
                    removeError(detalle);
                }

            }*/
            if (detalle.includes('con_descripcion')){
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
            if (detalle.includes('det_unitario')){
                
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
        
        }else{
            $('#w0').yiiActiveForm('updateAttribute', $(this).attr('id'), 
            ["Campo Vacio, Rellene!"]);
            addError(detalle);
        }
    });
}

function removeError(detalle){
     $("#".detalle).removeClass('has-error');
}

function addError(detalle){
       $("#".detalle).addClass('has-error');
}


$('#w0').on('beforeSubmit', function (e) {
    validateForm('#w0');
    $('.multiple-input-list__item input,.multiple-input-list__item textarea').blur();
    if($('#w0').find('.has-error').length!=0){

        alert('Resuelve los errores en los campos');
        e.preventDefault();
        e.stopImmediatePropagation();
        
        return false;
   }
    $("button.btn-success").prop('disabled', true);
 
}); 



function validateForm(form){
    var $form = $(form);
    data = $form.data("yiiActiveForm");
    $.each(data.attributes, function() 
    {
        this.status = 3;
    });
    $form.yiiActiveForm("validate");

}