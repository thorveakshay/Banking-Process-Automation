<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	    <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("user")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>No Match is Found</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>

<jsp:include page="layout/Header.jsp"></jsp:include>

<div id="main" class="container">
<jsp:include page="layout/accountMenu.jsp"></jsp:include>


<form name="noMatchForm" action="/NexusBankingGroup/SearchCustomerController" method="post">
<input type="hidden" name="action" value="back"></input>
<% String message=(String) request.getAttribute("msg"); %>
<table align="cemter">
<div id="middiv" style="margin-left:230px;">
<%if(message!=null){ %>
<p id="message" style="font-size:15px" align="left"><%=message %></p>

<%} %>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Back" id="button"></input>
</div>
</table>
</form>
</div>
<jsp:include page="layout/Footer.jsp"></jsp:include>
</body>
</html>