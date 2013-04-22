jQuery(document).ready(function($) {
	$('#search').autocomplete({
		source: $('#search').data("s")
	});

});