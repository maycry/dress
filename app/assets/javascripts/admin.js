jQuery(document).ready(function($) {
	$('#search').autocomplete({
		source: $('#search').data("s")
	});

	var description = $("#product_description")
	var style_select = $("#product_style_id_input select");
	var samplesList = [
		["со шлейфом", "1"],
		["открытым верхом", "1"],
		["закрытым верхом", "1"],
		["открытой спиной", "1"],
		["закрытой спиной", "1"],
		["прямым вырезом", "2"],
		["вырезом в форме сердечка", "2"],
		["фигурным вырезом", "2"],
		["вогнутым вырезом", "2"],
		["c бретельками", "2"],
		["широкими бретельками",  "2"],
		["без бретелек", "2"],
		["пышной юбкой", "3"],
		["с декорированным атласным поясом", "3"],
		["c вышивкой в области...", "3"],
		["с бантом в области...", "3"]
	]
	if (description.html() == "") {initDescriptionHelp()};

	function initDescriptionHelp(){
		baseChar();
		style_select.change(function(){
			baseChar();
		});
		renderSamples();
		$(".samples a").click(function(){
			description.append(", "+$(this).html());
			return false
		});
	}

	function baseChar(){
		id = style_select.val();
		description.html( "Платье " + style_select.children("option[value='"+id+"']").html().toLowerCase());
	}

	function renderSamples(){
		var samples = ""
		description.after("<div class='samples'><div class='samples-1'></div><div class='samples-2'></div><div class='samples-3'></div></div>");
		$.each(samplesList, function(index, value) {
		  $('.samples .samples-'+value[1]).append("<a href='#'>"+value[0]+"</a>")
		});
	}
	
});