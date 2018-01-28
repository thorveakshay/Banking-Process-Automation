<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.Ticket"%><html xmlns="http://www.w3.org/1999/xhtml">
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

<%
ArrayList<Ticket> ticketArray=new ArrayList<Ticket>();
if(request.getAttribute("ticketArray")!=null)
{
ticketArray=(ArrayList<Ticket>)request.getAttribute("ticketArray");
}
%>

 <script type="text/javascript">
 function validateStatus()
 {
 if(document.getElementsByName("ticketStatus")[0].value=="")
	{
	
		document.getElementById('selectSt').style.visibility="visible";
		  document.getElementById('selectSt').innerHTML="&nbsp;Please select Ticket Status.";
	
		document.getElementsByName("ticketStatus")[0].focus();
	return false;
	}
	return true;
}
 </script>

<title>Select Ticket Type</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>

<body  >
<jsp:include page="../jsp/layout/Header.jsp" />
	<!-- Start Header -->
<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist"> 
			 
			  
				
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Generate Ticket">Create Helpdesk Ticket</a></li>
			
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="View Tickets">View Tickets</a></li>

				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>

				
			</ul>
			
			<hr />
		</div>
	
<form action="/NexusBankingGroup/NewDisplayTicketServlet?pageNumber=1">
<div id="gradient-style">

<center><font color=black size="5pt">View Tickets</font></center>
<br></br>

<table id="gradient-style" align="center"  width="500px" style="margin-bottom=20;">

<tr>
<td width="35%"><font size="2pt"><b>Ticket Status<font color="red"><sup>*</sup></font></b></font></td>


 
<td><select name="ticketStatus" id="ticketStatus" title="Please select a Ticket Status.">
<option value="">Please Select</option>
<option value="ASSIGNED">Assigned</option>

<option value="UNASSIGNED">Unassigned</option>
<option value="RESOLVED">Resolved</option>
</select>
<label style="visibility:hidden; color:red; font-size:12px;" id="selectSt"></label>
</td>
</tr>


 </table>
 <br>
 
 <table align="center" style="margin-left=200px;">
 <input type="submit"  style="background-color:black;  color:white" onclick="return validateStatus()" value="Submit"></input>

</table>
</form>
 </div>
 </br>
 <br>
 </br>
 <br></br>
<!-- Start Main Content -->
 
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
