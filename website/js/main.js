jQuery(document).ready(function () {

    $('header #toggler a, header #menu a').click(function () {
        $('#menu').toggleClass('d-none');
    });

    new SmoothScroll('a[href*="#"]');

});
