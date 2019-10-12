$(document).on('click', '#abrirModal', (function() 
{
    $.get(
        $(this).data('url'),
        function (data) 
        {
            $('.modal-body').html(data);
            $('#modal').modal();
        }
    ).done( function(data)
    {
        $(document).one('click', '#createButton', (function() 
        {
            //Se fuerza la validacion en caso de que el form este vacio
           validateForm("#create-folio-form");
         
            if ($('#create-folio-form').find('.has-error').length==0)
            {   
                $.post( '/ven-folio/ajax_create', $('#create-folio-form').serialize())
                .done( function(data)
                {
                    $('#venfolio-fol_serie').append(
                        $('<option></option>').val(data.serie).html(data.serie).attr('selected', true)
                    );
                    $('#modal').modal('hide'); 
                    validateForm('#w0');
                });
            }
        }));       
    });
}));


function validateForm(form){
    var $form = $(form), 
    data = $form.data("yiiActiveForm");
    $.each(data.attributes, function() 
    {
        this.status = 3;
    });
    $form.yiiActiveForm("validate");

}