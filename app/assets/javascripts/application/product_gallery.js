jQuery(document).ready(function($) {
	var bimg_w=0, bimg_h=0;
	var main_img, xi, yi;
	
	var img_h = 0;
	var zoom = $(".zoom");
	var zoomMode = false;
	// $(".zoom").css("height", img_h);
	// $(".zoom").css("background-image", "url("+main_img.attr("src")+")");

	$(".photo img").load(function(){
		main_img = $(this)
		/*mw = $(this).width();
		mh = $(this).height();
		$(".zoom").css({"width": mw, "height": mh});*/
		$(".zoom").css("background-image", "url(" + main_img.attr("src") + ")")
		bimg_w = main_img.data("width");
		bimg_h = main_img.data("height");
		xi = main_img.offset().left;
		yi = main_img.offset().top;
		img_w = 430;
		img_h = Math.round(img_w*(bimg_h/bimg_w));
		console.log(bimg_w);
	});

	function getX(xs){
		var d = (bimg_w-img_w)/img_w;
		return (-xs+xi)*d;
	}
	function getY(ys){
		var d = (bimg_h-img_h)/img_h;
		return (-ys+yi)*d;
	}

	$(document).mousemove(
	  function(e){
	    var el = $(e.target);
	   
		if(zoomMode) {
			zoom.css("background-position-x", getX(e.pageX));
			zoom.css("background-position-y", getY(e.pageY));
		}
		if(zoomMode && !el.is(".zoom")) { 
			zoom.hide();
			zoomMode = false;
			return;
		}
		if(!$(e.target).is(main_img)) return;

		zoomMode = true; 
		zoom.show();
	});

	$(".thumb img").click(
		function(){
			main_img.attr("src", $(this).data("original")); 
			$(".zoom").css("background-image", "url("+$(this).data("original")+")");
	});

});