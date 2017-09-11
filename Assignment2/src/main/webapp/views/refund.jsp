
<%
String StartTime = (String) request.getAttribute("StartTime");
String EndTime = (String) request.getAttribute("EndTime");
String TransTime = (String) request.getAttribute("TransTime");
%>

<script>
$(document).ready(function() {
	$(".popUp").hide();

	s_second=$("input[name='txtStartTime']").val().substring(6, 8);
	s_minute=$("input[name='txtStartTime']").val().substring(3, 5);
	s_hour=$("input[name='txtStartTime']").val().substring(0, 2);
	
	_f_second=$("input[name='txtFinishTime']").val().substring(6, 8);
	_f_minute=$("input[name='txtFinishTime']").val().substring(3, 5);
	_f_hour=$("input[name='txtFinishTime']").val().substring(0, 2);
	
	s_parking=parseInt(s_hour)*3600+parseInt(s_minute)*60+parseInt(s_second);
	_f_parking=parseInt(_f_hour)*3600+parseInt(_f_minute)*60+parseInt(_f_second);
	_duration = (_f_parking-s_parking)/60;
	
	 $(".btnMinute").each(function(){
		 if($(this).val()>=_duration){
			 $(this).attr("disabled",true);
		 }
	 });
	 
	
	$(".btnMinute").click(function(e){
		d_second=0;
		d_minute=$(this).val()%60;
		d_hour=Math.floor($(this).val()/60);
		s_second=$("input[name='txtStartTime']").val().substring(6, 8);
		s_minute=$("input[name='txtStartTime']").val().substring(3, 5);
		s_hour=$("input[name='txtStartTime']").val().substring(0, 2);
		
		f_second=parseInt(s_second)+d_second;
		if(f_second>=60){
			f_second=f_second-60;
			d_minute=d_minute+1;
		}
		f_minute=parseInt(s_minute)+d_minute;
		if(f_minute>=60){
			f_minute=f_minute-60;
			d_hour=d_hour+1;
		}
		f_hour=parseInt(s_hour)+d_hour;
		f_second = _2d(f_second); 
		f_minute = _2d(f_minute);
		f_hour = _2d(f_hour);
		$("input[name='txtActualFinishTime']").val(f_hour+":"+f_minute+":"+f_second);
		
		s_parking=parseInt(s_hour)*3600+parseInt(s_minute)*60+parseInt(s_second);
		f_parking=parseInt(f_hour)*3600+parseInt(f_minute)*60+parseInt(f_second);
		s_charging=32400; //09:00:00 -+ 3600 every hour
		f_charging=61200; //17:00:00 -+ 3600 every hour , 75600 at 9, 61200 at 5
		s_act=0;
		if(s_charging<s_parking){
			s_act=s_parking;
		}else{
			s_act=s_charging;
		}
		f_act=0;
		if(f_charging>f_parking){
			f_act=f_parking;
		}else{
			f_act=f_charging;
		}
		duration=Math.ceil((f_act-s_act)/900);
		if(duration<0){
			duration=0;
		}
		fee=(parseFloat($("input[name='txtFee']").val())-(duration*0.375)).toFixed(2);
		$("input[name='txtRefund']").val("$ "+fee);
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
table{
	width:300px;
	margin:0 auto;
}

@media screen and (max-width: 675px) {
table{
	width:100%;
}
}
</style>

<div id="content">

	<table id="tblDisplay">
		<tr>
			<th align="left"><font color="#6666ff">skyline</font><font color="#33AA33">Park</font></th>
			<td align="right"><b><%= request.getAttribute("TicketNO")%></b></td>
		</tr>
		<tr height="25px"><td></td></tr>
		<tr>
			<td align="left">Car Plate NO.</td>
			<td align="right"><%= request.getAttribute("CarPlateNO")%></td>
		</tr>
		<tr>
			<td align="left">From</td>
			<td align="right"><%= StartTime.substring(11,19)%></td>
		</tr>
		<tr>
			<td align="left">To</td>
			<td align="right"><%= EndTime.substring(11,19)%></td>
		</tr>
		<tr>
			<td align="left">Fee</td>
			<td align="right">$ <%= request.getAttribute("Fee")%></td>
		</tr>
		<tr height="25px"><td></td></tr>
		<tr>
			<td colspan=2 align="right"><%= request.getAttribute("TransTime")%></td>
		</tr>
	</table>
	
	<div class="vMargin" style="height:10px;"></div>
	
	<form action="refundAction" method="post">
	
		<input type="hidden" name="txtTicketNO" value="<%= request.getAttribute("TicketNO")%>" >
		<input type="hidden" name="txtCarPlateNO" value="<%= request.getAttribute("CarPlateNO")%>" >
		<input type="hidden" name="txtStartTime" readonly required value="<%= StartTime.substring(11,19)%>">
		<input type="hidden" name="txtFinishTime" readonly required value="<%= EndTime.substring(11,19)%>">
		<input type="hidden" name="txtFee" value="<%= request.getAttribute("Fee")%>" readonly required>
		<input type="hidden" name="txtDate" value="<%= TransTime.substring(0,10)%>" readonly required>
		
		<div class="label100">Actual Duration (minutes)</div>
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
		
		<div class="label100">Actual Finish Time</div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtActualFinishTime" placeholder="--:--:--" readonly required>
		<div class="vMargin" style="height:10px;"></div>
		
		<div class="label100">Refund <input type="button" name="btnInfo" value="?" class="btnForm"/></div>
		<div class="vMargin" style="height:5px;"></div>
		<input class="input100" name="txtRefund" placeholder="$ 0.00" readonly required>
		<div class="vMargin" style="height:10px;"></div>
		<input type="submit" name="btnRefund" value="Refund" class="subForm"/>
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