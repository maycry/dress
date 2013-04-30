jQuery(document).ready(function($) {
	$('#post_image_attributes_image').fileupload({
		dataType: "script"
		})

	s = $("#post_body").val()
	if (s != undefined) {
		a = s.match(/[a-zA-Z0-9]*.(jpg|png)/g);
		a.map(function(item){
			$("#thumbs").append("<tr><td><img src='https://s3.amazonaws.com/makemydress.com.ua/blog/"+ item +"'></td></tr>")
		});
	};

});