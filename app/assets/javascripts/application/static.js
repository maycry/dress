jQuery(document).ready(function($) {
	$('.b-type-chooser a').click(function(){
		$('.b-type-chooser a').removeClass('chosen')
		$(this).addClass('chosen')
		return false
	})
});