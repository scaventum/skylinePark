<script>
window.requestAnimationFrame = (function(){
	return  window.requestAnimationFrame       ||
	window.webkitRequestAnimationFrame ||
	window.mozRequestAnimationFrame    ||
	function( callback ){
	window.setTimeout(callback, 0);
	};
})();

var speed = 15000;
(function currencySlide(){
	var currencyPairWidth = $('.slideItem:first-child').outerWidth();
	$(".slideContainer").animate({marginLeft:-currencyPairWidth},speed, 'linear', function(){
		$(this).css({marginLeft:0}).find("li:last").after($(this).find("li:first"));
	});
	requestAnimationFrame(currencySlide);
})();
</script>

<div id="content">
	<div class="vMargin" style="height:50px;"></div>
	<div id="bigMessage"><%=request.getParameter("message") %></div>
</div>