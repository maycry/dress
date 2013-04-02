jQuery(document).ready(function($) {
	$("#product_type_id_input").append("<a href='#'>Create new type</a>")
	$("#product_type_id_input a").click(function(){
		$("#product_type_attributes_name_input").toggleClass("hide")
	})

});