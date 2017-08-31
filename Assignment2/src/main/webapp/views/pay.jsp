<script>
</script>

<div id="content">
	<form action="" method="post">
		<div class="label100">Car Plate Number</div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtCarPlateNO" maxlength=6  minlength=6 required>
		<div class="label100">Start Time</div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtStartTime" readonly required value="<%= new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date()) %>">
		<div class="vMargin" style="height:10px;"></div>
		<div class="label100">Duration (minutes)</div>
		<div class="vMargin" style="height:5px;"></div>
		<input type="button" name="btn15min" value="15" class="btnForm"/>
		<input type="button" name="btn30min" value="30" class="btnForm"/>
		<input type="button" name="btn45min" value="45" class="btnForm"/>
		<input type="button" name="btn60min" value="60" class="btnForm"/>
		<input type="button" name="btn75min" value="75" class="btnForm"/>
		<input type="button" name="btn90min" value="90" class="btnForm"/>
		<input type="button" name="btn105min" value="105" class="btnForm"/>
		<input type="button" name="btn120min" value="120" class="btnForm"/>
		<div class="vMargin" style="height:10px;"></div>
		<div class="label100">Finish Time</div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtFinishTime" placeholder="--:--:--" readonly required>
		<div class="vMargin" style="height:10px;"></div>
		<div class="label100">Fee</div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtFee" placeholder="$ 0.00" readonly required>
		<div class="vMargin" style="height:10px;"></div>
		<input type="submit" name="btnPay" value="Pay" class="subForm"/>
	</form>
</div>