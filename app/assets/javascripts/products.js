$(function(){
	var popup
/*	$('.b-popup').each(function(){
		$(this).addClass('hidden');
	});*/
	$('.sample-item,.review-image').click(function(){
		popup = $(this).data('slider');
		setTimeout(function(){
			$('.'+popup).removeClass('hidden');
			return false;
		}, 500);
	});
	$('.b-popup .close').click(function(){
			$('body').removeClass('show-popup');
			$('.'+popup).addClass('hidden');
			return false;
	});
});