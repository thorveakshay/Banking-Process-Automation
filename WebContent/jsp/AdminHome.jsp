<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="layout/Header.jsp"/>
<!-- Start Main Content -->
<div id="main" class="container">

<jsp:include page="layout/AdminMenu.jsp"/>
<div id="midtitle" style="float:center;margin-left: 260px;">
			<h2 style="font-size:20px;padding-top:10px; text-align:center;"><%String welcomePro=(String)session.getAttribute("welcomePro"); %>
			<%if(welcomePro!=null) %><%=welcomePro %><% else { %>Welcome to Nexus Banking Group<%} %></h2>
</div>
<br/>
<div style="font-size:15px;height:150px;margin-left:260px;">
<h4 align="justify"><%String proHome=(String)session.getAttribute("proHome"); %>
			<%if(proHome!=null) %><%=proHome %><% else { %>We strongly believe in serving customers to be its prime responsibility. Our management team create new products and update the current products as per the needs of our business customers and ongoing market trends. As a Product Administrator, you can add, delete, upload, update and view product/additional products.
			<%} %>
</h4>
</div>

<div id="center" style="height:400px;width:600px">

 	
 	<img
	src="<%=request.getContextPath()%>/images/money.jpg" width="600"
	height="306" />
	

	</div>


	</div>
<jsp:include page="layout/Footer.jsp" />
</body>
</html>