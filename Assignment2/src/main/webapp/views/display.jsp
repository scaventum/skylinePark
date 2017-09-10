<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String StartTime = (String) request.getAttribute("StartTime");
String EndTime = (String) request.getAttribute("EndTime");
%>
<div id="content">
	<div class="vMargin" style="height:50px;"></div>


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

</div>