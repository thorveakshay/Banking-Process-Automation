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
<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.BusinessCustomer"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Result</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath() %>/js/SearchCustomerResultValidation.js"></script>

</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>

<div id="main" class="container">
<jsp:include page="layout/accountMenu.jsp"></jsp:include>

<div  id="midtitle" >
	<h2 style="font-size:20px;padding-top:10px;" align="center">Result of Search</h2>
	</div>

<div style="height: 464px" >

<form name="showDetails" action="/NexusBankingGroup/SearchCustomerController" onsubmit="return checkRadioButton();" method="post">
<input type="hidden" name="action" value="ShowDetails"></input>
<%ArrayList<BusinessCustomer>bcList=(ArrayList<BusinessCustomer>)request.getAttribute("businessCustomerList"); %>

<br></br>

<table id="result" style=margin-left:10px;>
<tr>
<th>Select</th>
<th>Business Name</th>
<th>Trading Name</th>
<th>Branch</th>
<th>Business Type</th>
<th>Email Address</th>
</tr>

<%for(BusinessCustomer bcust:bcList) { %>
<tr>
<td><input type="radio" name="select" value=<%=bcust.getId()%>></input></td>
<td><label><%= bcust.getBusinessName() %></label></td>
<td><%= bcust.getTradingName() %></td>
<td><%=bcust.getBranchName() %></td>
<td><%=bcust.getBusinessType() %></td>
<td><%= bcust.getEmail() %></td>
</tr>
<% } %>
</table>

<table id="middleButton">
<tr></tr>
<tr>
<td></td>
<td>&nbsp;&nbsp;<input type="button" value="Back" id="button" onclick="window.location.href='/NexusBankingGroup/SearchCustomerController?action=back'"/>
<input type="submit" value="Select" id="button" /></td></tr>
</table>


</form>
</div>
</div>

<jsp:include page="layout/Footer.jsp"></jsp:include>
</body>
</html>