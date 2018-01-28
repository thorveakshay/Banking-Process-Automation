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
<%@page import="com.training.model.*"%>
<%@page import ="com.training.constants.CaoConstants.*"%>

<%@page import="java.util.*"%>
<%@page import="com.training.services.*"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Summary</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
</head>
<body>
	<jsp:include page="layout/Header.jsp"/>
<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="layout/AdminMenu.jsp"/>
		<div>
		<%Product p=(Product)request.getAttribute("product");%>
		<%List<BusinessType> btList=p.getBusinessTypeList();%>
		<%List<AdditionalProduct> apList=p.getAdditionalProduct();%>
	
		<div id="midtitle">
			<h2 style="font-size:17px; text-align:center;">Product Details</h2>
		</div>
		
		<fieldset>
		<table align ="center" style="font-size:15px;text-align:left;" cellspacing="10px">
		<tr>
			<td>Product Id&nbsp;&nbsp;</td>
			<td><%=p.getProductId()%></td>
		
		</tr>
		<tr>
			<td>Product Name&nbsp;&nbsp;</td>
			<td><%=p.getProductName()%></td>
		
		</tr>
		<tr>
			<td>Product Description&nbsp;&nbsp;</td>
			<td><%if(p.getDescription().length()>0){out.println(p.getDescription());}else{out.println("-");}%></td>
		
		</tr>
		<tr>
			<td>Account Type&nbsp;&nbsp;</td>
			<td><%=p.getAccountType()%></td>
		
		</tr>
		<tr>
			<td>Valid From(yyyy-mm-dd)&nbsp;&nbsp;</td>
			<td><%=p.getValidFrom()%></td>
		
		</tr>
		<tr>
			<td>Status&nbsp;&nbsp;</td>
			<td><%=p.getStatus()%></td>
		
		</tr>
		<tr>
		
		<td><input type="button" id="button"  value="Back" onclick="window.location.href='/NexusBankingGroup/LoginServlet?action=home'"></input></td>
		
		</tr>
		</table>
		
		
		</fieldset>
		
		
		
		</div>
	</div>	
		
	
	<jsp:include page="layout/Footer.jsp"/>		
		
		
	</body>
</html>