<script>
$(document).ready(function() {
	$(".popUp").hide();
	
	$("#btnDisplay").click(function(e) {
		$("#popUpDisplay").fadeIn();
	});
	
	$(".popUpDisplayClose").click(function(e){
		$("#popUpDisplay").fadeOut();
	});
	
});
</script>

<div id="content">
	<a href="pay.jsp"><div class="menu">Pay</div></a>
	<a href="#" id="btnDisplay"><div class="menu">Display</div></a>
	<a href="refund.jsp"><div class="menu">Refund</div></a>
	<a href="balance.jsp"><div class="menu">Balance</div></a>
</div>

<div id="popUpDisplay" class="popUp">
	<div class="popUpClose popUpDisplayClose">X</div>
	<form method="post" action="indexAction">
		<div class="vMargin" style="height:60px;"></div>
		<input class="input100" name="txtTicketNO" placeholder="Ticket Number" required>
		<div class="vMargin" style="height:10px;"></div>
		<input class="subForm" name="btnDisplay" value="Display" type="submit">
		<div class="vMargin" style="height:10px;"></div>
		<u class="popUpDisplayClose"><a href="#">Close</a></u>
    </form>
    
</div>