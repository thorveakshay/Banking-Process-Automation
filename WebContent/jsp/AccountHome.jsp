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
<title>Home</title>

<link href="<%=request.getContextPath() %>/css/commonLogin.css" rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="layout/Header.jsp"/>
<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="layout/accountMenu.jsp"/>

<!-- 	<div style="font-size:17px;" style="height:300px;margin-left:230px;">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
	
	<div id="midtitle">
			<h2 style="font-size:20px;padding-top:10px; text-align:center;">
	<%String welAccCr=(String)session.getAttribute("welAccCr"); %>
	<%if(welAccCr!=null) %><%=welAccCr %><%else { %>Welcome to Account Opening<%} %>
	</h2></div>
<br/>

<div style="font-size:15px;height:300px;margin-left:230px;">
<h4 align="justify">
	<%String accHomeCon1=(String)session.getAttribute("accHomeCon1"); %>
	<%if(accHomeCon1!=null) %><%=accHomeCon1 %><%else { %>
	We strongly believe in serving customers to be its prime responsibility. As an Account Opener, 
	you can open commercial accounts for <%} %></h4>
<ul style="list-style-type:disc;margin-left:20px;"><li>
<%String accHomeCon2=(String)session.getAttribute("accHomeCon2"); %>
	<%if(accHomeCon2!=null) %><%=accHomeCon2 %><%else { %>Existing business customers of our bank<%} %></li>
<li><%String accHomeCon3=(String)session.getAttribute("accHomeCon3"); %>
	<%if(accHomeCon3!=null) %><%=accHomeCon3 %><%else { %>
	Choose the requisite product intentions<%} %></li>
<li>
<%String accHomeCon4=(String)session.getAttribute("accHomeCon4"); %>
	<%if(accHomeCon4!=null) %><%=accHomeCon4 %><%else { %>Assign product/additional products as per customer requirements and 
	<%} %></li>
<li><%String accHomeCon5=(String)session.getAttribute("accHomeCon5"); %>
	<%if(accHomeCon5!=null) %><%=accHomeCon5 %><%else { %>
Assign every customer a dedicated Relationship Manager for further communication (queries, issues / maintenance).<%} %></li>
</ul>


<!--  <h2 align="center"><font size="5px"></font></h2>-->	
<br>
<img
	src="<%=request.getContextPath()%>/images/cust1.jpg" width="650"
	height="252" />
 </div>
</div>


<br></br><br></br><br></br>
<jsp:include page="layout/Footer.jsp"/>

</body>
</html>