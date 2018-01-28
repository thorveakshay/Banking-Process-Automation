<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
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
<title>Personal Party Ticket Details</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="../jsp/layout/Header.jsp" />


<!-- Start Header -->
<!-- Start Main Content -->

<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Quick Links</h3>
<ul class="leftbox borderedlist">
<li id="lft"><a href="<%=request.getContextPath() %>/jsp/backoffice.jsp" title="Home">Home</a></li>
				
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/AssignedTickets.jsp" title="Assigned Tickets">Assigned Tickets</a></li>
				 
			

</ul>

<hr />
</div>

<!-- main content area -->
<div class="maincontent">
<form name="f1" action="/NexusBankingGroup/NewServlet">
<input type="hidden" name="action" value="acc_tkt_hidden" />
<table id="gradient-style" align="center" style="margin-left: 300px; font-size:2pt;" width="400px" >
<tr>
	<td><b>TicketId</b></td>
     	<td>:90156</td>
</tr>
<tr>
	<td><b>Topic:</b></td>
	<td>:UpdateAccountPartyDetails</td>
</tr>
	<tr>
		<td><b>Personal Party ID</b></td>
		<td>:<input type="text" name="acc_idno" readonly="readonly"
			value="10103" /></td>
	</tr>
	<tr>
		<td><b>Relationship</b></td>
		<td><input type="text" name="txtrname" value="Trustee"
			readonly="readonly" /></td>
	</tr>
	<tr>
		<td><b>Party First Name</b></td>
		<td><input type="text" name="txtfname" value="George"
			readonly="readonly" /></td>
	</tr>
	<tr>
		<td><b>Party SurName</b></td>
		<td><input type="text" name="txtsname" value="Fernandis"
			readonly="readonly" /></td>
	</tr>
	<tr>
		<td><b>Description</b></td>
		<td><textarea rows="4" cols="50" readonly="readonly"
			name="ticketdesc">Update Relationship to CEO </textarea></td>
	</tr>

</table>
<div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica, sans-serif; margin-left: 350px;">
<input type="submit" value="Proceed" /></div>
</form>

</div>


<!-- Start Footer --> <jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
