<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page import="com.training.model.*"%>
<%@page import="java.util.ArrayList"%>
 
<head>


   <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("uid")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Account Details</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
</head>
<script>
 function call_servlet()
{
	//alert(document.getElements("submit").value);
	
String str=""+document.getElementById("submit").value;
if(str.equals("Close"))
{
	window.location="/NexusBankingGroup/ViewAccountDetailServlet";
}

return true;
	 
}
</script>
 
 

<body >

  


<jsp:include page="../jsp/layout/Header.jsp" />
  
 <% AccountView av=(AccountView) request.getAttribute("accountobj");
 BusinessCustomer bcust = (BusinessCustomer) request.getAttribute("bCust");%>
	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
				
				
			<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Generate Ticket">Create Helpdesk Ticket</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="Tickets">View Tickets</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
				


				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->


<form  method="post"   action="/NexusBankingGroup/ViewAccountDetailServlet"> 
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />

<center><font size="5pt" color=black>Account Details</font></center>
</br>
 <table id="gradient-style" align="center" border"1" width="600px">

<input type="hidden" name="action" value="CloseAccount"> 
</input> 

<tr>
	<td width="50%"><font size="2pt"><b>Account Id</b></font></td>
     	<td width="50%"><font size="2pt"><%=av.getAccountId() %></font></td>
</tr>
 
<tr>
	<td><font size="2pt"><b>Business Customer Id</b></font></td>
	<td><font size="2pt"><%=av.getBusinessCustomerId() %></font></td>
</tr>


<tr>
	<td><font size="2pt"><b>Business Customer Name</b></font></td>
	<td><font size="2pt"><%=bcust.getBusinessName() %></font></td>
</tr>

<tr>
	<td><font size="2pt"><b>Account Type</b></font></td>
	<td><font size="2pt"><%= av.getAccountType()%></font></td>
</tr>
<tr>
<td><font size="2pt"><b>Account Number</b></font></td>
<td><font size="2pt"><%=av.getAccountNumber() %></font>
</td>
</tr>
<tr>
<td><font size="2pt"><b>Branch Id</b></font></td>
<td><font size="2pt"><%=av.getBranchId()%></font></td>	
</tr>
<tr>
<td><font size="2pt"><b>Product Id</b></font></td>
<td><font size="2pt"><%=av.getProductId() %></font>
</td>

</tr>
<tr>
	<td width=200><font size="2pt"><b>Status</b></font></td>
	<td><font size="2pt"><%=av.getStatus() %></font></td>
</tr>


<tr>
<td><font size="2pt"><b>Account Opening Date(yyyy-mm-dd)</b></font></td>
<td><font size="2pt"><%=av.getAccountOpenDate()%></font></td>	
</tr>
<tr>
<td><font size="2pt"><b>Account Title</b></font></td>
<td><font size="2pt"><%=av.getAccountTitle()%></font></td>	
</tr>

</table>
<table align="center">


<tr height="100">
<td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" style="background-color:black;  color:white" value="Close" onclick="call_servlet()"></input>
</td>
</tr>

 
 
</table>
</form>
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
