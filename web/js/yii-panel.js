$('#w0').on('submit', function (e) 
{
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

$(function() {
    var minPriceInRupees = 0;
    var maxPriceInRupees = 500;
    var currentMinValue = 33;
    var currentMaxValue = 333;
    
    $( "#slider-range" ).slider({
        range: true,
        min: minPriceInRupees,
        max: maxPriceInRupees,
        values: [ currentMinValue, currentMaxValue ],
        slide: function( event, ui ) {
            $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
            currentMinValue = ui.values[ 0 ];
            currentMaxValue = ui.values[ 1 ];
        },
        stop: function( event, ui ) {
            currentMinValue = ui.values[ 0 ];
            currentMaxValue = ui.values[ 1 ];
            alert('currentMinValue and currentMaxValue updated !!!');
            alert('currentMinValue = '+currentMinValue+' currentMaxValue = '+currentMaxValue);
        }
    });

    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
" - $" + $( "#slider-range" ).slider( "values", 1 ) );
});


// https://github.com/donal56/taller/blob/51e0de169024aea165c410712a053eb251388a05/web/IMG-20191008-WA0004.jpg
// http://danielstern.ca/range.css/#/
//http://jsfiddle.net/phpdeveloperrahul/5Kvk5/