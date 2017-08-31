<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>sPark</title>
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<script src="clock.js"></script>
<script>
	function speedFunction(){
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth();
	var day = date.getDay();
	var dateNumber = date.getDate();
	var hour = date.getHours();
	var minute = date.getMinutes();
	var second = date.getSeconds();
	var milisecond = date.getMilliseconds();
		
	day=fullDay(day);
	month=shortMonth(month);
	dateNumber=_2d(dateNumber);
	hour=_2d(hour);
	minute=_2d(minute);
	second=_2d(second);
		
	var timestampDay = day;	
	document.getElementById("timestampDay").innerHTML = timestampDay;
	var timestampTime = dateNumber+"/"+month+"/"+year+" "+hour +":"+ minute +":"+ second;	
	document.getElementById("timestampTime").innerHTML = timestampTime;
		
   	var refresher=setTimeout("speedFunction()", 20);
}
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<div id="title">safe<font color="#4CAF50">Park</font></div>
			<div id="timestamp">
				<div id="timestampDay"></div>
				<div id="timestampTime"></div>
			</div>
		</div>