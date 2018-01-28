<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="../jsp/layout/Header.jsp" />
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
String designation=session.getAttribute("designation").toString();

if(!designation.equals("BACKOFFICE EMPLOYEE"))
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
<title>Update Personal Party Ticket Details</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />

</head>
<%@page import="com.training.model.*"%>
<%Ticket tick = new Ticket();
PersonalParty pp = new PersonalParty();
NonPersonalCustomer npc = new NonPersonalCustomer();
 tick = (Ticket)request.getAttribute("ticket"); 
 pp=(PersonalParty)request.getAttribute("personalParty");%>
<body>
	<!-- Start Header -->
	
	 
<!-- Start Main Content -->



<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
			
				
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/AssignedTicket.jsp" title="Assigned Tickets">Assigned Tickets</a></li>
				 
				
			</ul>
			
			<hr />
		</div>
		
		<!-- main content area -->
<div class="maincontent" >
				 <form name="f1" action="/NexusBankingGroup/ChangeCustomerContactController">
<h3><font color="#8A3E08" size="5pt"><B> Ticket Summary </B></font></h3><br>

  <hr>
 
<input type="hidden" name="action" value="pp_contact_hidden_tkt"/>
<input type="hidden" name="ticketId" value="<%=tick.getId()%>"/>
<table  style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;" border="0" align="center" style="height: 100% width: 100%;" cellpadding="10">

<tr>
	<td><font size="2pt"><b>Ticket Id</b></font></td>
     	<td><font size="2pt"><%=tick.getId() %></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Title</b></font></td>
	<td><font size="2pt"><%=tick.getTitle() %></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Account Party Id</b></font></td>
	<td><font size="2pt"><%=pp.getPartyId()%></font></td>
</tr>
<tr>
<td><font size="2pt"><b>Business Name</b></font></td>
<td><font size="2pt"><%=npc.getBusinessName() %></font>
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
	<td> <font size="2pt"><%=pp.getTitle()+""+pp.getFirstName()+" "+pp.getSurName() %></font></td>
</tr>

 
<tr>
<td><font size="2pt"><b>Description</b></font></td>
<td><font size="2pt"><textarea rows="4" cols="50" readonly="readonly" name="ticketdesc"> <%=tick.getSummary() %> </textarea></font></td>	
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
<input type="submit" style="background-color:black;margin-top:20px;  color:white" value="Submit"/>


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
