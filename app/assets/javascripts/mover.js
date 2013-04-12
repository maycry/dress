$(function(){
	var mover = $(".mover");
	var moverWrapper = $(".mover-wrapper");
	var maxWidth = 0;
	var width = mover.width();
	var x = 0;

	$(".item-wrapper").each(function(){
		maxWidth += $(this).width();
	});

  $(".mover").mousemove(function(e){
    d = (width - maxWidth)/width;
    x = (e.pageX)*d;
    if ((x > (width - maxWidth)) && (x<0)){
      moverWrapper.css("margin-left", x);
    }
  });
  $(window).resize(function(){
  	var mover = $(".mover");
  	var moverWrapper = $(".mover-wrapper");
  	width = mover.width();
  });
/*  $(".item-wrapper img").hover(function(){
  	$(this).addClass("zoom");
  }, function(){
  	$(this).removeClass("zoom");
  })*/
});