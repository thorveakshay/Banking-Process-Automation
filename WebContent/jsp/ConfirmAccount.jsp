<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.training.model.*" %>  
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css"/>
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />
<title>Confirm Account</title>
</head>

<body>

<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
	<jsp:include page="layout/accountMenu.jsp"/>

<div  id="midtitle" >
	<h2 style="font-size:20px;padding-top:10px;" align="center">Confirmation</h2>
	</div>	
	
<% Account acc = new Account();
acc = (Account)request.getAttribute("account");%>

<form name="f1" action="/NexusBankingGroup/AccountCreationServlet"  method="post">

<input type="hidden" name="action" value="confirmAccount"></input>

<p align="left" >Following are the details of your product selection</label></p>
<br/>
<div id="accountdiv">
<table id="result">
<tr>
<td>Account Id</td>
<td><%=acc.getId() %></td>
</tr>
<tr>
<td>Account Number</td>
<td><%=acc.getAccNumber() %></td>
</tr>
<tr>
<td>Account Type</td>
<td><%=acc.getProductIntension()%></td>
</tr>
<tr>
<td>Product Name</td>
<td><%=acc.getProductName() %></td>
</tr>

<tr>
<td>Account Status</td>
<td><%=acc.getStatus()%></td>
</tr>

<tr>
<td style="border:0px; padding-top:10px;"></td>
<td style="border:0px; padding-top:10px;"><input type="submit" value="Proceed" id="button"></input>
</td>
</tr>

</table>
</div>
<div>

</div>
</form>

</div>

<jsp:include page="layout/Footer.jsp"></jsp:include> 
</body>
</html>