<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successfull Deletion</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
<div id="main" class="container">
<div id="leftcolumn">
			<h3 class="leftbox">Business Customer</h3>
			<ul class="leftbox borderedlist">
				<li><a href="<%=request.getContextPath() %>/jsp/CaptuteCoreBusinessDetails.jsp" title="Register">Register New Customer</a></li>
				<li><a href="<%=request.getContextPath() %>/jsp/SearchBusinessCustomer.jsp" title="Search">Search Business Customer</a></li>
					</ul>
			
			<hr />
	</div>
	
		<p style="font-size:18px ;float:center; padding-left:30px;">Business Customer Details has been successfully deleted</p>
		</div>
	
</body>
<jsp:include page="/Layout/Footer.jsp"/>

</html>