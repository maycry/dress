jQuery(document).ready(function($) {
	$('.b-type-chooser a').click(function(){
		$('.b-type-chooser a').removeClass('chosen');
		$('.products-list').removeClass('hidden');
		$('.products-list').eq($(this).data("type")).addClass('hidden');
		$(this).addClass('chosen');
		return false;
	})
});