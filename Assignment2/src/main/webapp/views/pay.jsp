<script>
$(document).ready(function() {
	$(".popUp").hide();

	$("input[name='txtCarPlateNO']").change(function(e){
		var CarPlateNO = $(this).val();
		$.get('payAction', {
			Action : "getBalance",
			CarPlateNO : CarPlateNO
		}, function(result) {
			$("input[name='txtBalance']").val(result);
		});
	});
	
	$(".btnMinute").click(function(e){
		
		var CarPlateNO = $(this).val();
		FinishTime="";
		
		
		$.get('commonFunction', {
			Action : "getFinishTime",
			StartTime : $("input[name='txtStartTime']").val(),
			Duration : $(this).val()
		}, function(result) {
			$("input[name='txtFinishTime']").val(result);
			FinishTime=result;
		});
		
		$.get('commonFunction', {
			Action : "getFee",
			StartTime : $("input[name='txtStartTime']").val(),
			Duration : $(this).val()
		}, function(result) {
			$("input[name='txtFee']").val("$ "+result);
		});
		
	});

	$("input[name='btnInfo']").click(function(e){
		$("#popUpInfo").fadeIn();
	});
	$(".popUpInfoClose").click(function(e){
		$("#popUpInfo").fadeOut();
	});
});
</script>

<style>
#Balance{
	color:#33AA33;
	font-weight: bold;
}
</style>

<div id="content">
	<form action="payAction" method="post">
		<div class="label100">Car Plate Number</div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtCarPlateNO" maxlength=6  minlength=6 required>
		<div class="vMargin" style="height:10px;"></div>
		
		<div class="label100">Start Time</div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtStartTime" readonly required value="<%= new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date()) %>">
		<div class="vMargin" style="height:10px;"></div>
		
		<div class="label100">Duration (minutes)</div>
		<div class="vMargin" style="height:5px;"></div>
		<input type="button" name="btn15min" value="15" class="btnForm btnMinute"/>
		<input type="button" name="btn30min" value="30" class="btnForm btnMinute"/>
		<input type="button" name="btn45min" value="45" class="btnForm btnMinute"/>
		<input type="button" name="btn60min" value="60" class="btnForm btnMinute"/>
		<input type="button" name="btn75min" value="75" class="btnForm btnMinute"/>
		<input type="button" name="btn90min" value="90" class="btnForm btnMinute"/>
		<input type="button" name="btn105min" value="105" class="btnForm btnMinute"/>
		<input type="button" name="btn120min" value="120" class="btnForm btnMinute"/>
		<div class="vMargin" style="height:10px;"></div>
		
		<div class="label100">Finish Time</div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtFinishTime" placeholder="--:--:--" readonly required>
		<div class="vMargin" style="height:10px;"></div>
		
		<div class="label100">Fee <input type="button" name="btnInfo" value="?" class="btnForm"/></div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtFee" placeholder="$ 0.00" readonly required>
		<div class="vMargin" style="height:10px;"></div>
		
		<div class="label100">Balance</div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtBalance" placeholder="$ 0.00" readonly>
		<div class="vMargin" style="height:10px;"></div>
		
		<input type="submit" name="btnPay" value="Pay" class="subForm"/>
	</form>
</div>

<div id="popUpInfo" class="popUp">
	<div class="popUpClose popUpInfoClose">X</div>
	<table cellspacing="10">
		<tr>
			<td colspan=2><font size="+1" color="#33AA33">Parking Fee Information</font></td>
		</tr>
		<tr>
			<td valign="top">-</td><td>$1.50 per hour from Monday to Friday between 09:00 and 17:00</td>
		</tr>
		<tr>
			<td valign="top">-</td><td>Deposit Balance will be deducted first if exists.</td>
		</tr>
		<tr>
			<td valign="top">-</td><td>Two hours maximum parking duration</td>
		</tr>
		<tr>
			<td valign="top">-</td><td>Saturday P120 (no charge)</td>
		</tr>
		<tr>
			<td valign="top">-</td><td>Sunday and public holidays are unrestricted</td>
		</tr>
		<tr>
			<td colspan=2 align="center"><u class="popUpInfoClose"><a href="#">Close</a></u></td>
		</tr>
    </table>
    
</div>