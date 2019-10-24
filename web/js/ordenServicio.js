$('#w0').on('submit', function (e) 
{
    var imageData = $("#wPaint").wPaint("image");

    $('#image').val(imageData);
    console.log($('#image').val());

    validateForm('#w0');
    
    if($('#w0').find('.has-error').length != 0)
    {
        $('.collapse').collapse('show');
        
        e.preventDefault();
        e.stopImmediatePropagation();
        
        return false;
   }
}); 


function validateForm(form)
{
    var $form = $(form); 
    data = $form.data("yiiActiveForm");
    $.each(data.attributes, function() 
    {
        this.status = 3;
    });
    $form.yiiActiveForm("validate");
}