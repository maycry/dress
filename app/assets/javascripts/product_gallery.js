jQuery(document).ready(function($) {
	var bimgW=0, bimgH=0;
	var mainImg, xi, yi;
	
	var imgH = 0;
	var zoom = $(".zoom");
	var isZoom = false;
	var isLoading = true;

	$(".photo img").load(function(){
		isLoading = false;
		$(".photo").removeClass('loading');
	});
	$(".thumbs img").first().load(function(){
		mainImg = $(".photo img")
		$(".zoom").css("background-image", "url(" + mainImg.attr("src") + ")")
		bimgW = mainImg.data("width");
		bimgH = mainImg.data("height");
		xi = mainImg.offset().left;
		yi = mainImg.offset().top;
		imgW = 430;
		imgH = Math.round(imgW*(bimgH/bimgW));
	});
	function getX(xs){
		d = (bimgW-imgW)/imgW;
		x = (-xs+xi)*d;
		if (x > 0) {x = 0};
		if (x < -bimgW+imgW) {x = -bimgW+imgW};
		return x;
	}
	function getY(ys){
		d = (bimgH-imgH)/imgH;
		y = (-ys+yi)*d;
		if (y > 0) {y = 0};
		if (y < -bimgH+imgH) {y = -bimgH+imgH};
		return y;
	}
	$(document).mousemove(
	  function(e){
	    var el = $(e.target);
	   
		if(isZoom) {
			zoom.css("background-position-x", getX(e.pageX));
			zoom.css("background-position-y", getY(e.pageY));
		}
		if(isZoom && !el.is(zoom)) { 
			zoom.hide();
			isZoom = false;
			return;
		}
		if(!$(e.target).is(mainImg)) return;

		isZoom = true; 
		zoom.show();
	});
	$(".thumb img").click(
		function(){
			originalSize = $(this).data("original");
			mainImg.attr("src", originalSize); 
			$(".zoom").css("background-image", "url("+originalSize+")");
			bimgW = $(this).data("width");
			bimgH = $(this).data("height");
			imgW = 430;
			imgH = Math.round(imgW*(bimgH/bimgW));
			isLoading = true;
			$('.thumb').removeClass('active');
			$(this).parent().addClass('active');
			setTimeout(function(){
				if (isLoading){
					$(".photo").addClass('loading');
				}
			}, 100);
	});
});