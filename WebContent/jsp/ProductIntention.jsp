

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css"/>
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />

<script src="<%=request.getContextPath() %>/js/AccountCreation.js"></script>

<title>Account Creation</title>
</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
	<jsp:include page="layout/Menu.jsp"/>

<div  id="midtitle" >
	<h2 style="font-size:20px" align="center">Product Intension</h2>
	</div>	

<form name="f1" action="/NexusBankingGroup/AccountCreationServlet" onsubmit="return validate();" method="post">
<input type="hidden" name="action" value="AccountDetails"></input>

<%String bname=(String)request.getAttribute("bname"); %>
<label id="labels" name="businessName"><%=bname %>, please select the product intension</label>
<br></br>

<%String branch=(String)request.getAttribute("branch"); %>


<table style="font-size:17px;text-align:left;" cellpadding="5px" align="left">
<tr>

<td>Enter Branch Name  </td>
<td><input type="text" name="BranchName" readonly="readonly" value=<%=branch %>></input></td>
</tr>
<tr>
<td>Select Product Intention   </td>
<td><select id="id" name="ProductIntention" >
<option>Select Product Intention</option>
<option value="Current Account">Current Account</option>
<option value="Savings Account">Savings Account</option>
</select>
</td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" value="Add Account" id="button"></input>
</tr>
</table>
<br>
<br>
<br><br><br>
</form>


<%String msg=(String)request.getAttribute("msg");%>
<%if("result".equalsIgnoreCase(msg)){ %>
<form name="f2" action="/NexusBankingGroup/AccountCreationServlet" method="post">
<input type="hidden" name="action" value="SubmitDetails"></input>

<%ArrayList<Account> accList=(ArrayList<Account>)request.getAttribute("acc"); %>
<%int i=1; %>
<table id="result" align="center">
<tr>
<th>Serial No.</th>
<th></th>
<th></th>
</tr>
<%if(accList != null && !accList.isEmpty()){ for(Account account:accList){%>
<tr>
<td><input type="text" readonly="readonly" value=<%=i %> size=6></input> </td>
<td><%=account.getProductIntension()%></td>
<td><a href="/NexusBankingGroup/AccountCreationServlet?action=remove&&intension=<%=account.getProductIntension()%>&&number=<%=i %>">Remove</a></td>
<td><% i++; } }%></td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</table>

<p><input type="submit" value="Proceed" id="button"></input></p>

<%String alert=(String)request.getAttribute("alert"); %>
<%if(alert!=null) { %>
<p><font size=2 color="red"> <%=alert %> </font></p>
<% } %>

</form>
<%} %>
</div>

<jsp:include page="layout/Footer.jsp"></jsp:include> 
</body>
</html>