 
 <script>
$(document).ready(function() {
	

	$("input[name='txtCarPlateNO']").change(function(e){
		var CarPlateNO = $(this).val();
		$.get('balance', {
			Action : "getBalance",
			CarPlateNO : CarPlateNO
		}, function(result) {
			$("input[name='Balance']").val(result);
		});
	});
 
});
</script>
 
 
 
 <div id="content">
	<div class="label100"> Carplate number </div>
	<div class="vMargin" style="height:5px;"></div>
	<input class="input100" name="txtCarPlateNO" maxlength=6  minlength=6 required>
		<div class="vMargin" style="height:10px;"></div>
		<div class="label100"> Balance number </div>
	<div class="vMargin" style="height:5px;"></div>
	<input class="input100" name="Balance" maxlength=6  minlength=6 required>
		<div class="vMargin" style="height:10px;"></div>
		<a href="index.jsp"><input type="button" name="close" value="Close " class="btnForm btnMinute"/>
		</a>
</div>