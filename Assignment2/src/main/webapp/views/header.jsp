<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>sPark</title>
<link rel="stylesheet" href="style.css">
<script src="clock.js"></script>
<script src="jquery-1.9.1.js"></script>
<script src="jquery-ui.js"></script>
<script>
	function timeFunction(){
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth();
		var day = date.getDay();
		var dateNumber = date.getDate();
		var hour = date.getHours();
		var minute = date.getMinutes();
		var second = date.getSeconds();
		var milisecond = date.getMilliseconds();
			
		day=shortDay(day);
		month=shortMonth(month);
		dateNumber=_2d(dateNumber);
		hour=_2d(hour);
		minute=_2d(minute);
		second=_2d(second);
		var timestampTime = hour +":"+ minute +":"+ second;	
		$("#timestampTime").html(timestampTime);
		var timestampDay = day+", "+dateNumber+"/"+month+"/"+year;	
		$("#timestampDay").html(timestampDay);
		
   		var refresher=setTimeout("timeFunction()", 1000);
	}
	
	$(document).ready(function() {
		timeFunction();
	});
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<div id="title"><a href="index.jsp"><font color="#6666ff">sky</font><font color="#33AA33">Park</font></a></div>
			<div id="timestamp">
				<div id="timestampTime"></div>
				<div id="timestampDay"></div>
			</div>
			<div class="vMargin"></div>
		</div>