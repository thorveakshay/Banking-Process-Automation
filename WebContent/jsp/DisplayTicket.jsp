<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>
<%@page import="com.training.model.Ticket"%>

<%@page import="com.training.model.BusinessCustomer"%><html xmlns="http://www.w3.org/1999/xhtml">



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

<%
List<Ticket> ticketArray=new ArrayList<Ticket>();  
List<BusinessCustomer> bList = new ArrayList<BusinessCustomer>();
  ticketArray = (List<Ticket>) session.getAttribute("ticketArray");
 bList = (ArrayList<BusinessCustomer>)session.getAttribute("businessList");
 String ticketStatus=request.getAttribute("ticketStatus").toString();
 ticketStatus=ticketStatus.toLowerCase();
 
 char uCase=ticketStatus.charAt(0);
 
 
 String temp=""+uCase;
 String ticketStatus1=temp.toUpperCase();
  ticketStatus=ticketStatus1+ticketStatus.substring(1,ticketStatus.length());
  

%>
  

<style type="text/css" title="currentStyle"> 
			@import "<%=request.getContextPath() %>/stylesheets/jquery.dataTables_themeroller.css";
			@import "<%=request.getContextPath() %>/stylesheets/jquery-ui-1.8.4.custom.css";
			
	</style>
 
 
<title>Tickets</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.dataTables.js"></script>
</head>
<script>$(document).ready(function(){

	var oTable	= $('#mt').dataTable( {
		"sScrollX": "100%",
		"aaSorting": [[ 1, "asc" ]],
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"bAutoWidth": false,
		"autoHeight": true,
		"bStateSave": false,
		"aoColumns": [ null, null,null,null]  			
	} );

});
</script>

<body   >
<jsp:include page="../jsp/layout/Header.jsp" />
	<!-- Start Header -->
	


<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
			<%
			if(session.getAttribute("designation").toString().equals("HELPDESK EMPLOYEE"))
			{
			%>
			
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Generate Ticket">Create Helpdesk Ticket</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="Tickets">View Tickets</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
				

			<%
			}
			%>	
		
			<%
			if(session.getAttribute("designation").toString().equals("RELATIONSHIP MANAGER"))
			{
			%>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/AssignedTickets.jsp" title="Change Account Title">Change Account Title</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">Close Account</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">Switch to New Product</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/MngrUpdateBizAddress.jsp" title="Update Business Address">Update Business Address</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/AccountPartyManagementHome.jsp" title="Account Party Management">Account Party Management</a></li>
				
			<%
			}
			%>	


			</ul>
			
			<hr />
		</div>
		
		<!-- main content area -->
<div class="maincontent">
<center><font size="5pt" color="black" align="center"><%=ticketStatus %> Tickets</font></center>

<center>
<div id="gradient-style">
				
				
				<hr></hr>
				<br></br>
				<%
					if(!ticketArray.isEmpty()){%>
						<div id="gradient-style" style="width:600px;">
						<table id="mt"  width="500">
						<thead>
						 
					<th><center><b>Ticket Id</b></center></th>
						<th><center><b>Ticket Title</b></center></th>
						<th><center><b>Priority</b></center></th>
				 <th><center><b>Associated Business Customer</b></center></th>
				
						</thead>
						<tbody>
						<%
					 
						int i=0;
						
						for(Ticket tik:ticketArray)
							
{ 
%>
<tr>
		<td><a href="/NexusBankingGroup/AssignTicketServlet?action=updateTicket&&tikid=<%=tik.getId()%>&&tiktitle=<%=tik.getTitle() %>" >
			<center><%=tik.getId()%></center>
		</a></td>
		<td>
		<%=tik.getTitle()%>
		</td>
		<td>
		<%=tik.getPriorityId()%>
		</td>
	 
		<td>
		<%=bList.get(i).getBusinessName()%>
		</td>
		
	</tr>
	
	<%
	i= i+1;	
}
%>
						</tbody>
						</table>
						</div>
	
						<%}	 
							%>

						</div>
						</div>
						</div>
						 

 
 
   	<br/><br/><br/><br/><br/>
</center>

 
</div>
 
 
</div>
   	
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
