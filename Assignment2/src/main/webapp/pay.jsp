<%@include file="functions/database.jsp" %>
<%
String mode = request.getParameter("mode");

if(mode==null){
	
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
    	int open = 32400;
    	int close = 61200;
    	int now = Integer.parseInt(new java.text.SimpleDateFormat("H").format(new java.util.Date()))*3600;
    	if(now>close || now<open){
    		payday=false;
    	}
    }
	
	if(payday){
		%><jsp:include page="views/pay.jsp" /><%
	}else{
		String message="Free for<br>2 Hours Parking.<br>Enjoy!";
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
