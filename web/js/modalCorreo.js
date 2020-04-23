$(document).on('click', '#abrirModal', (function() 
{
    $.get(
        $(this).data('url'),
        function (data) 
        {
            $('.modal-body').html(data);
            $('#modal').modal();
        }
    );
}));