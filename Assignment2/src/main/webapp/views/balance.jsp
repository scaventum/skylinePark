 
 <script>
$(document).ready(function() {
	$("input[name='txtCarPlateNO']").change(function(e){
		var CarPlateNO = $(this).val();
		$.get('payAction', {
			Action : "getBalance",
			CarPlateNO : CarPlateNO
		}, function(result) {
			$("input[name='txtBalance']").val(result);
		});
	});
 
});
</script>
 
 <div id="content">
	<div class="label100">Car Plate NO.</div>
	<div class="vMargin" style="height:5px;"></div>
	<input class="input100" name="txtCarPlateNO" maxlength=6  minlength=6 required>
	<div class="vMargin" style="height:10px;"></div>
	<div class="label100">Balance Amount</div>
	<div class="vMargin" style="height:5px;"></div>
	<input class="input100" name="txtBalance" maxlength=6  minlength=6 readonly placeholder="$ 0.00">
	</a>
</div>