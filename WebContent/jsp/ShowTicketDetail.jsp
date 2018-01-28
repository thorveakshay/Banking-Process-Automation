<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.training.model.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.text.*" %>
 

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
String designation=session.getAttribute("designation").toString();

if(!designation.equals("HELPDESK EMPLOYEE"))
{
	%>
<Script>
window.location="<%=request.getContextPath()%>/jsp/error.jsp";
</Script>
<% 
}
%>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Ticket Detail</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script>
/*
function call_servlet()
{
 if(action.equals("Cancel"))
		 {
	 
				window.location="/NexusBankingGroup/AccountPartyListServlet";
		 }


return true;
	 
} */
</script>
</head>
<script>
 function call_servlet()
{
	//alert(document.getElements("submit").value);
 
var str=""+document.getElementById("submit").value;

 
if(str=="Generate Ticket")
{
 
 
	if(x==true)
	window.location="/NexusBankingGroup/SearchBusinessCustomerServlet";
	else{
		 
		return false;
	}
}

alert("Helpdesk Ticket generated successfully");
	 
}
</script>

 

<body >


<jsp:include page="../jsp/layout/Header.jsp" />
 

	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
			  	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Create Helpdesk Ticket">Create Helpdesk Ticket</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="Tickets">View Tickets</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
				

				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->


	<%
		String businessId=(String)request.getAttribute("businessId");
		String businessName=(String)request.getAttribute("businessName");
		Long accId=(Long)request.getAttribute("accId");
		String accName=(String)request.getAttribute("accName");
		String relationship=(String)request.getAttribute("relationship");
		String branchName=(String)request.getAttribute("branchName");
		String tktdesc=(String)request.getAttribute("tktdesc");
		String tktstatus=(String)request.getAttribute("tktstatus");
		String tktid=(String)request.getAttribute("tktid");
		String title=(String)request.getAttribute("title");
		String priority =(String)request.getAttribute("priority");
	%>
	<%
	Date dNow = new Date();
	DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	String formattedDate = df.format(dNow);
	%>	
		
		
		
  <form name="f1" method="post" action="/NexusBankingGroup/CreateTicketServlet">
<center><font color=black size="5pt">Ticket Summary</font></center>
 <br/>
<table id="gradient-style" align="center" border"1" width="600px">
<tr>

<input type="hidden" name="action" value="Close1"></input>
</tr>


<tr>
	<td><font size="2pt"><b>Ticket Id</b></font></td>
	<td><font size="2pt"><%=tktid %></td>
</tr>

<tr>
	<td><font size="2pt"><b>Ticket Title</b></font></td>
	<td><font size="2pt"><%=title %></font></td>
</tr>


<tr>
	<td><font size="2pt"><b>Ticket Priority</b></font></td>
	<td><font size="2pt"><%=priority%></font></td>
</tr>

<tr>
	<td><font size="2pt"><b>Business Customer Id</b></font></td>
   	 <td><font size="2pt"><%=businessId %></font></td>
</tr>
<td><font size="2pt"><b>Business Name</b></font></td>
<td><font size="2pt"><%=businessName %></font>
</td>
</tr>

<tr>
<td><font size="2pt"><b>Branch</b></font></td>
<td><font size="2pt">
<%=branchName %></font>
</td>
</tr>
<tr>
	<td><font size="2pt"><b>Account Party</b></font></td>
     	<td><font size="2pt">
		<%=accName %></font>
	</td>
</tr>
<tr>
	<td width=200><font size="2pt"><b>Relationship with Business Customer</b></font></td>
	<td><font size="2pt"><%=relationship %></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Account Party Id</b></font></td>
	<td><font size="2pt"><%=accId %></font></td>
</tr>


<tr>
	<td><font size="2pt"><b>Description</b></font></td>
	<td><font size="2pt"><%=tktdesc %></td>
</tr>

<tr>
	<td><font size="2pt"><b>Status</b></font></td>
	<td><font size="2pt">Unassigned</td>
</tr>

<tr>
	<td><font size="2pt"><b>Generation Date(yyyy/mm/dd)</b></font></td>
	<td><font size="2pt">
	   <%=df.format(dNow)%></font></td>
</tr>
</table>
<table align="center">

<tr height="100">
<td colspan="7" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<hr><input id="submit" type="submit" style="background-color:black;  color:white"  value="Close" onclick="return call_servlet()"></td>
<td>

</table>
<br/>

</form>	
   	
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>