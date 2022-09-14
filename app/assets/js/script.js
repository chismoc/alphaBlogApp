$(document).ready(function(){

    $('#hammenu').click(function(){
        $(this).toggleClass('fa fa-times-circle');
        $('header').toggleClass('toggle');

    });

    $(window).on('scroll load',function(){
        $('#hammenu').removeClass('fa fa-times-circle');
        $('header').toggleClass('toggle');

        if($(window).scrollTop() > 0){
            $('.top').show();
        }else{
            $('.top').hide();
        }
    });

    //smooth scrolling
$('a[href*="#"]').on('click',function(e){

    e.preventDefault();

    $('html, body').animate({

        scrollTop : $($(this).attr('href')).offset().top,
    },
    500,
    'linear'
    );
});
 
});

