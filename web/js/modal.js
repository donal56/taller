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
        $(document).on('click', '#createButton', (function(event) 
        {
            //Se fuerza la validacion en caso de que el form este vacio
           validateForm("#create-folio-form");
         
            if ($('#create-folio-form').find('.has-error').length==0)
            {   
                $(this).off(event);
                $.post( '/ven-folio/ajax_create', $('#create-folio-form').serialize())
                .done( function(data)
                {

                    $('#venfolio-fol_serie').append(
                        $('<option></option>').val(data.serie).html(data.desc).attr('selected', true)
                    );
                    $('#modal').modal('hide'); 
                });
            }
        }));       
    });
}));

$('#modal').on("hide.bs.modal", function() {
    //limpiar modal
    $('.modal-body').html("<div style='text-align:center'><img width= '40%' src='/img/loading.gif'></div>");
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