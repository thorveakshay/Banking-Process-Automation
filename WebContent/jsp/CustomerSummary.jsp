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
<%@page import="com.training.model.BusinessCustomer"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Summary</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
<jsp:include page="layout/accountMenuHome.jsp"/>
<div  id="midtitle" >
<h2 style="font-size:20px;padding-top:10px;" align="center">Business Customer Summary</h2>
</div>	

<%BusinessCustomer bcust=(BusinessCustomer)request.getAttribute("bcust"); %>
<form name="summaryForm" action="/NexusBankingGroup/SearchCustomerController" method="post">
<input type="hidden" name="action" value="SummaryDetails"></input>
<p align="left"><label id="labels" > &nbsp;&nbsp;&nbsp;<%=bcust.getBusinessName() %>: Following are your business details </label></p>
<br></br>
<div id="accountdiv">
<table id="result">
<tr>
<td>Business ID</td>
<td><%=bcust.getId() %></td>
</tr>

<tr>
<td>Business Name</td>
<td><%=bcust.getBusinessName() %></td>
</tr>

<tr>
<td>Trading Name</td>
<td><%=bcust.getTradingName()%></td>
</tr>


<tr>
<td>Business Type</td>
<td><%=bcust.getBusinessType()%></td>
</tr>

<tr>
<td>Address</td>
<td><%=bcust.getAddress() %></td>
</tr>

<tr>
<td>Email</td>
<td><%=bcust.getEmail()%></td>
</tr>
<tr>
<td style="border:0px; padding-top:10px;"></td>
<td style="border:0px; padding-top:10px;"><input type="button" value="Back" id="button" onclick="window.location.href='/NexusBankingGroup/SearchCustomerController?action=backFromSummary'" />
<input type="submit" value="Submit" id="button"></input>
</td>
</tr>
</table>

</div>
</form>
</div>
<jsp:include page="layout/Footer.jsp"></jsp:include> 
</body>
</html>