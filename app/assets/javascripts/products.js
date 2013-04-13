$(function(){
	var popup
	var scrollY
	$('.b-popup').each(function(){
		$(this).addClass('hidden');
	});
	$('.sample-item,.review-image').click(function(){
		popup = $(this).data('slider');
		$('.'+popup).removeClass('hidden');
		$('body').addClass('show-popup');
		scrollY = $('body').scrollTop();
		return false;
	});
	$('.b-popup .close').click(function(){
		$('body').removeClass('show-popup');
		$('.'+popup).addClass('hidden');
		$('body').scrollTop(scrollY);
		return false;
	});
});