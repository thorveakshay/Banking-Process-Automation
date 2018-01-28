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
<% 
if(session.getAttribute("uid")==null)
{
 %>
<Script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</Script>
<% 
 
}
%>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Business Customer Details</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>
<script>





 function call_servlet()
{
	//alert(document.getElements("submit").value);
	
String str=""+document.getElementById("submit").value;
if(str.equals("Close"))
{
	window.location="/NexusBankingGroup/SearchBusinessCustomerServlet";
}

return true;
	 
}
</script>
 
 

<body >

  


<jsp:include page="../jsp/layout/Header.jsp" />
  
 <%
 BusinessCustomer bc=new BusinessCustomer();
bc=(BusinessCustomer)request.getAttribute("bcobj");
//logger.info("in show.jsp heyy acc id is "+acc.getId());

%>
	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn" style="width:240px">
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


<form  method="post"   action="/NexusBankingGroup/AmendorSwitchProductServlet"> 

<center><font size="5pt" color=black>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Business Customer Details</font></center>
<br/>
  <table id="gradient-style" align="center" style="margin-left: 300px" width="600px" >

<input type="hidden" name="action" value="CloseTicket"> 
</input> 
<tr>
	<td width="50%"><font size="2pt"><b>Business Name</b></font></td>
     	<td><font size="2pt"><%=bc.getBusinessName() %></font></td>
</tr>
 
<tr>
	<td><font size="2pt"><b>Business Id</b></font></td>
	<td><font size="2pt"><%=bc.getBusinessId()%></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Trading Name</b></font></td>
	<td><font size="2pt"><%= bc.getTradingName()%></font></td>
</tr>
<tr>
<td><font size="2pt"><b>Business Type</b></font></td>
<td><font size="2pt"><%=bc.getBusinessType() %></font>
</td>
</tr>

<tr>
<td><font size="2pt"><b>Branch Id</b></font></td>
<td><font size="2pt"><%=bc.getBranchId() %></font>
</td>

</tr>
<tr>
	<td width=200><font size="2pt"><b>Is Start Up Business</b></font></td>
	<td><font size="2pt"><%=bc.getIsStartupBusiness() %></font></td>
</tr>


<tr>
<td><font size="2pt"><b>Annual Turnover</b>&nbsp;&nbsp;(million pounds)</font></td>
<td><font size="2pt"><%=bc.getAnnualTurnover() %></font></td>	
</tr>
<tr>
<td><font size="2pt"><b>Capital Fund</b>&nbsp;&nbsp;(million pounds)</font></td>
<td><font size="2pt"><%=bc.getCapitalFund() %></font></td>	
</tr>

<tr>
<td><font size="2pt"><b>Status</b></font></td>
<td><font size="2pt"><%=bc.getStatus() %></font></td>	
</tr>

<tr>
<td><font size="2pt"><b>Number of Employees</b></font></td>
<td><font size="2pt"><%=bc.getNoOfEmployee() %></font></td>	
</tr>

<tr>
<td><font size="2pt"><b>Country of Registration</b></font></td>
<td><font size="2pt"><%=bc.getCountry() %></font></td>	
</tr>

<tr>
<td><font size="2pt"><b>Email Id</b></font></td>
<td><font size="2pt"><%=bc.getEmail() %></font></td>	
</tr>
</table>

<table  align="center" style="margin-left: 300px" width="400px">

<tr height="100"> 
<td colspan="2" style="padding-left:150px">
<input type="submit" style="background-color:black;  color:white" value="Close" onclick="call_Servlet()"></input>
</td>
</tr>

 
 
</table>
</form>
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
