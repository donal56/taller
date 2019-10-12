/*Función de scroll de página*/
$(document).ready(function () {
    $(window).scroll(function () {
        $('.scrollup').attr('style', 'display:inline; right:20px;');
        if ($(this).scrollTop() > 100) {
            $('.scrollup').fadeIn();
        } else {
            $('.scrollup').fadeOut();
        }
    });
    $('.scrollup').click(function () {
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });
});
