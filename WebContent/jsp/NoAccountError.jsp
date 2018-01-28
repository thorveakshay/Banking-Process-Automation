 <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("username")==null){
     response.sendRedirect(request.getContextPath());
     return;
}
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Business Customer</title>
<head>
<link href="<%= request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
<div id="message">
<br>
<%String message=(String)request.getAttribute("msg"); %>
<font color="red"><%if(message!=null){ %>
<h3 style="font-size:20px;" align=center > <%=message %></h3></font>
<%} %>
<br/>
<center><a style="font-size:15px" href="<%= request.getContextPath() %>/jsp/CaptureCurrentPersonalAddressDetails.jsp">Proceed to enter address and contact details.</a></center>
</div>






<jsp:include page="/Layout/Footer.jsp"/>

</body>
</html>