$(function(){
	var popup
	var scrollY
	
	$('.b-popup').addClass('hidden');
	$('.sample-item').click(function(){
		popup = $(this).data('slider');
		$('.'+popup).removeClass('hidden');
		$('body').addClass('show-popup');
		scrollY = $('body').scrollTop();
	});
	$('.b-popup .close').click(function(){
		$('body').removeClass('show-popup');
		$('.'+popup).addClass('hidden');
		$('body').scrollTop(scrollY);
	});
});