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
<title>Error Page</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">

<%if(request.getSession().getAttribute("designation").equals("ADMINISTRATOR")) { %>
	<jsp:include page="layout/Menu.jsp"/>
	<%} else if(request.getSession().getAttribute("designation").equals("COMMERCIAL ACCOUNT OPENER")) { %>
	<jsp:include page="layout/accountMenuHome.jsp"/>
	<%} %>

<div id="middiv" style="font-size:17px" style="height:350px;">

<%String message=(String)request.getAttribute("error");%>
<%if(message!=null){ %>
<center>
<p><font size = "3pt" color = "red">Error occurred ! </font></p>

<br/><b>
 <%=message%></b>
 </center>
<%} %>
</div>
</div>

<jsp:include page="layout/Footer.jsp"/>

</body>
</html>