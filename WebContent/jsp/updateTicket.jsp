<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.training.model.*"%>

<%@page import="java.util.ArrayList"%>

<%@page import="com.training.model.*"%>
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

<title>Ticket Details</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>

<%Ticket tick = new Ticket();
PersonalParty pp = new PersonalParty();
NonPersonalCustomer npc = new NonPersonalCustomer();
 tick = (Ticket)request.getAttribute("ticket"); 
 pp=(PersonalParty)request.getAttribute("personalParty");
 npc = (NonPersonalCustomer)request.getAttribute("nonPersonalParty"); 
 
  %>


<body >
 

<jsp:include page="../jsp/layout/Header.jsp" />
   
	<!-- Start Header -->
	<!-- Start Main Content -->
<script type="text/javascript">
function closeConfirmation()
{
 	if(confirm("Are you sure you want to close this ticket"))
 	{
 	 	 	alert("Ticket has been closed successfully");
 	}	
}
</script>		

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
		 



<form  name="assignEmployeeForm" method="post"   action="/NexusBankingGroup/CreateTicketServlet"> 
 
 <center><font color=black size="5pt">Ticket Summary</font></center>
 <br></br>
 <input type="hidden" name="action" value="Close"/>

<input type="hidden" name="tikid" value="<%=tick.getId() %>"/>
<input type="hidden" name="tikstatus" value="<%=tick.getStatus() %>"/>


<table id="gradient-style" align="center" border"1" width="600px">

<tr>
	<td><font size="2pt"></font><b>Ticket Id</b></font></td>
     	<td><font size="2pt"><%=tick.getId() %></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Title</b></font></td>
	<td><font size="2pt"><%=tick.getTitle() %></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Summary</b></font></td>
	<td><font size="2pt"><%=tick.getSummary() %></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Business Customer Id</b></font></td>
	<td><font size="2pt"><%=tick.getNpId() %></font></td>
</tr>
<tr>
<td><font size="2pt"><b>Business Name</b></font></td>
<td><font size="2pt"> <%=npc.getBusinessName() %></font>
</td>
</tr>

<tr>
<td><font size="2pt"><b>Branch</b></font></td>
<td><font size="2pt">
 <%=npc.getBankBranch() %></font>
</td>
</tr>

<tr>
	<td width=200><font size="2pt"><b>Account Party Name</b></font></td>
	<td><font size="2pt"><%=pp.getTitle()+""+pp.getFirstName()+" "+pp.getSurName() %></font></td>
</tr>

<tr>
<td width=200><font size="2pt"><b>Account Party Id</b></font></td>
	<td><font size="2pt"><%=pp.getPartyId() %></font></td>

</tr>

<tr>
	<td><font size="2pt"><b>Status</b></td>
	<td><font size="2pt"><%=tick.getStatus() %></font></font></td>
</tr>
 
 <tr>
	<td><font size="2pt"><b>Raised On Date(yyyy/mm/dd)</b></font></td>
	<td><font size="2pt"><%=tick.getRaisedOnDate()%></font></td>
</tr>


</table>

<br></br>
<table align="center">
 <tr align="center"><td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" style="background-color:black;  color:white" value="Close Ticket" onclick=" return closeConfirmation()"></input>
</table>	
</form>>	 
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
