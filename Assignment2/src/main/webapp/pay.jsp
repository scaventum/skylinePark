<%@include file="functions/database.jsp" %>
<%
String mode = request.getParameter("mode");

if(mode==null){
	String btnPay = request.getParameter("btnPay");
	if(btnPay!=null){
		String Formatting = new java.text.SimpleDateFormat("YMMdd").format(new java.util.Date());
		
		//System.exit(0);
		String Autonumbering = getValue("Select Right(TicketNO,6) From tr_ticket Where TicketNO Like '"+Formatting+"%' Order By TicketNO Desc Limit 0,1");
		//out.println(Autonumbering);
		if (Autonumbering.equals("")) {
			Autonumbering="000001";
		}else{
			Autonumbering=String.format("%06d", (Integer.parseInt(Autonumbering)+1));
		}
		Autonumbering=Formatting+Autonumbering;
		
		boolean transaction=false;
		
		String StartTime=new java.text.SimpleDateFormat("Y-MM-dd").format(new java.util.Date())+" "+request.getParameter("txtStartTime");
		String FinishTime=new java.text.SimpleDateFormat("Y-MM-dd").format(new java.util.Date())+" "+request.getParameter("txtFinishTime");
		transaction=true;
		if(transaction){
			String Query = "Insert Into tr_ticket Values ('"+Autonumbering+"','"+request.getParameter("txtCarPlateNO").toUpperCase()+"','"+StartTime+"','"+FinishTime+"','"+request.getParameter("txtFee").replace("$ ", "")+"',NOW())";
			executeQuery(Query);
			response.sendRedirect("display.jsp?TicketNO="+Autonumbering);
		}
	}
	
	%><jsp:include page="views/header.jsp" /><% 
		
	String[] unrestricted = {"Sun"};
	String[] freeday = {"Sat", "Sun"};
 	int i=0;
 	boolean payday=true;
    for(i=0;i<freeday.length;i++){
    	if(new java.text.SimpleDateFormat("E").format(new java.util.Date()).equals(freeday[i])){
    		payday=false;
    	}
    }
    if(payday){
    	int open = 25200; //09:00:00 -+ 3600 every hour
    	int close = 61200; //17:00:00 -+ 3600 every hour
    	int now = Integer.parseInt(new java.text.SimpleDateFormat("H").format(new java.util.Date()))*3600;
    	if(now>close || now<open){
    		payday=false;
    	}
    }
	
	if(payday){
		%><jsp:include page="views/pay.jsp" /><%
	}else{
		String message="Free for<br>2 Hours<br>Parking.<br>Enjoy!";
	  	for(i=0;i<unrestricted.length;i++){
	    	if(new java.text.SimpleDateFormat("E").format(new java.util.Date()).equals(unrestricted[i])){
	    		message="Free and<br>Unrestricted<br>Parking.<br>Enjoy!";
	    	}
	    }
		%>
		<jsp:include page="views/freePeriod.jsp" >
		    <jsp:param name="message" value="<%=message %>" />
		</jsp:include>
		<%
	}
	
	
	%><jsp:include page="views/footer.jsp" /><%
}
%>
