$('#w0').one('submit', function (e) 
{
    var imageData = $("#wPaint").wPaint("image");
    var imageData1 = $("#wPaint1").wPaint("image");
    var imageData2 = $("#wPaint2").wPaint("image");

    $('#image').val(imageData);
    $('#firma1').val(imageData1);
    $('#firma2').val(imageData2);

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