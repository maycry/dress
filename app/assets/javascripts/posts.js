jQuery(document).ready(function($) {
	$('#post_image_attributes_image').fileupload({
		dataType: "script"
		})

	s = $("#post_body").val()
	if (s != undefined) {
		a = s.match(/[a-zA-Z0-9А-Я-Ёа-я-ё ._]*.(jpg|png)/g);
		a.map(function(item){
			id = $("form.formtastic").data("id")
			$("#thumbs").append("<img src='https://s3.amazonaws.com/makemydress.com.ua/blog/"+ id +"/"+ item +"'>")
		});
	};

});