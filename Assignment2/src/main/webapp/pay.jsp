<%@include file="functions/database.jsp" %>
<%
String mode = request.getParameter("mode");

if(mode==null){
	%>
	<jsp:include page="views/header.jsp" />
	<jsp:include page="views/pay.jsp" />
	<jsp:include page="views/footer.jsp" />
	<%
}
%>
