<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="../jsp/layout/Header.jsp" />
<html xmlns="http://www.w3.org/1999/xhtml">
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
if(session.getAttribute("uid")==null)
{
 %>
<Script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</Script>
<% 
 
}
%>


<script>


function home(){

	window.location="<%=request.getContextPath()%>/jsp/backoffice.jsp";

	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update_NPP_Contact_Details</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>
<%Ticket tick = new Ticket();
PersonalParty pp = new PersonalParty();
NonPersonalCustomer npc = new NonPersonalCustomer();
 tick = (Ticket)request.getAttribute("ticket"); 
 pp=(PersonalParty)request.getAttribute("personalParty");
 npc = (NonPersonalCustomer)request.getAttribute("nonPersonalParty");%>
<body>
	<!-- Start Header -->
	
	 
<!-- Start Main Content -->



<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
				
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/AssignedTickets.jsp" title="Assigned Ticket">Assigned Tickets</a></li>
				 
				
			</ul>
			
			<hr />
		</div>
		
		<!-- main content area -->
<div class="maincontent" >
				 <form name="f1" action="/NexusBankingGroup/ChangeCustomerContactController">
<h3><center><font color="black" size="5pt">Ticket Summary</font></center></h3><br>

  <hr>
 
<input type="hidden" name="action" value="update_contact_hidden"/>
<input type="hidden" name="idno" value="<%=tick.getNpId() %>"/>
<input type="hidden" name="ticketId" value="<%=tick.getId()%>"/>
<input type="hidden" name="ticketdesc" value="<%=tick.getSummary() %>"/>
<table id="gradient-style" align="center" style="margin-left: 300px">

<tr>
	<td width="40%"><font size="2pt"><b>Ticket Id</b></font></td>
     	<td><font size="2pt"><%=tick.getId() %></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Title</b></td>
	<td><font size="2pt"><%=tick.getTitle() %></font></td>
</tr>

<tr>
<td><font size="2pt"><b>Description</b></td>
 <td width="300" height="50"><font size="2pt"><%=tick.getSummary()%></font></td>	
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

</tr>
</table>

	<!--<div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:350px;">  
		 	<a href="/NexusBankingGroup/ChangeCustomerContactController" >Proceed</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="#" >Cancel</a>
		</div>
-->
<div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:350px;">
<input type="submit" style="background-color:black;margin-top:20px;  color:white" value="Proceed"/>

 <input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>



<!-- how to provide the suitable action for Cancel Button
<input type="submit" value="Cancel"/>		 -->
</div>
	</form>	
</div>	
</div>



 			<hr />
		</div>
	
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
