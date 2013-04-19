$(function(){
	var popup
/*	$('.b-popup').each(function(){
		$(this).addClass('hidden');
	});*/
	$('.sample-item, .review-image, .video-quality').click(function(){
		popup = $(this).data('slider');
		$('.'+popup).removeClass('hidden');
			return false;
	});
	$('.b-popup .close').click(function(){
			$('body').removeClass('show-popup');
			$('.'+popup).addClass('hidden');
			return false;
	});
});