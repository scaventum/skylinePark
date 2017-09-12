<script>
$(document).ready(function() {
	$(".popUp").hide();
	
	$("#btnDisplay").click(function(e) {
		$("#popUpDisplay").fadeIn();
	});
	
	$(".popUpDisplayClose").click(function(e){
		$(".popUp").fadeOut();
	});
	
	$("#btnRefund").click(function(e) {
		$("#popUpRefund").fadeIn();
	});
	
	$(".popUpRefundClose").click(function(e){
		$(".popUp").fadeOut();
	});
	
	$("#btnBalance").click(function(e) {
		$("#popUpBalance").fadeIn();
	});
	
	$(".popUpBalanceClose").click(function(e){
		$(".popUp").fadeOut();
	});
});
</script>

<div id="content">
	<a href="pay.jsp"><div class="menu">Pay</div></a>
	<a href="#" id="btnDisplay"><div class="menu">Display</div></a>
	<a href="#" id="btnRefund"><div class="menu">Refund</div></a>
	<a href="#" id="btnBalance"><div class="menu">Balance</div></a>
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

<div id="popUpRefund" class="popUp">
	<div class="popUpClose popUpRefundClose">X</div>
	<form method="post" action="indexAction">
		<div class="vMargin" style="height:60px;"></div>
		<input class="input100" name="txtTicketNO" placeholder="Ticket Number" required>
		<div class="vMargin" style="height:10px;"></div>
		<input class="subForm" name="btnRefund" value="Refund" type="submit">
		<div class="vMargin" style="height:10px;"></div>
		<u class="popUpRefundClose"><a href="#">Close</a></u>
    </form>
</div>

<div id="popUpBalance" class="popUp">
	<div class="popUpClose popUpBalanceClose">X</div>
	<form method="post" action="indexAction">
		<div class="vMargin" style="height:60px;"></div>
		<input class="input100" name="txtCarPlateNO" placeholder="Car Plate Number" required>
		<div class="vMargin" style="height:10px;"></div>
		<input class="subForm" name="btnBalance" value="Refund" type="submit">
		<div class="vMargin" style="height:10px;"></div>
		<u class="popUpBalanceClose"><a href="#">Close</a></u>
    </form>
</div>