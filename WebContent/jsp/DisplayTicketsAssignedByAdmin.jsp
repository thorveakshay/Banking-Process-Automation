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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<% 
String designation=session.getAttribute("designation").toString();


if(designation.equals("ADMINISTRATOR") )
{
%>

<%
List<Ticket> ticketArray=new ArrayList<Ticket>();    

  ticketArray = (List<Ticket>) session.getAttribute("ticketArray"); 
ArrayList<BusinessCustomer> bList = new ArrayList<BusinessCustomer>();
bList=(ArrayList<BusinessCustomer>)session.getAttribute("bList");
 	
%>

  
 <style type="text/css" title="currentStyle"> 
			@import "<%=request.getContextPath() %>/stylesheets/jquery.dataTables_themeroller.css";
			@import "<%=request.getContextPath() %>/stylesheets/jquery-ui-1.8.4.custom.css";
			
	</style>
<title>Assigned Tickets</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.dataTables.js"></script>

<script>$(document).ready(function(){

	var oTable	= $('#mt').dataTable( {
		"sScrollX": "100%",
		"aaSorting": [[ 1, "asc" ]],
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"bAutoWidth": false,
		"autoHeight": true,
		"bStateSave": false,
		"aoColumns": [ null, null,null,null,null]  			
	} );

});
</script>

<style>
td
{
   width:100px;
   padding-top:0px;
   padding-bottom:0px;
   padding-left:5px;
   padding-right:5px;
}
</style>
</head>

<body onload="fun()" >
<jsp:include page="../jsp/layout/Header.jsp" />
	<!-- Start Header -->


<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">
			<%String adminMenu=(String)session.getAttribute("adminMenu"); %>
			<%if(adminMenu!=null){ %>
			<%=adminMenu %>
			<%} else{ %>
			Quick Links<%} %></h3>
			<ul class="leftbox borderedlist">
			
				
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/UnassignedTickets.jsp" title="Change Account Title">
				
				<%String adminLink1=(String)session.getAttribute("adminLink1"); %>
			<%if(adminLink1!=null){ %>
			<%=adminLink1 %>
			<%} else{ %>
   
				Unassigned Tickets<%} %></a></li>
		 		<li id ="lft"><a href ="<%=request.getContextPath()%>/LoadAssignedTicketServlet?action=assignedTicketsByAdmin ">
		 	<%String adminLink2=(String)session.getAttribute("adminLink2"); %>
			<%if(adminLink2!=null){ %>
			<%=adminLink2 %>
			<%} else{ %>
		 	
		 		Assigned Tickets<%} %></a></li>
		 		<li id="lft" style="height:200px"></li>
	 
				
			</ul>
			
			<hr />
		</div>
		
		<!-- main content area -->
<div class="maincontent">
 
<%
if(session.getAttribute("msg1")!=null)
{
%> 
  
<center><font size="5pt" color="red">
<%String adminSorry=(String)session.getAttribute("adminSorry"); %>
			<%if(adminSorry!=null){ %>
			<%=adminSorry %>
			<%} else{ %>
		 	
		 	

Sorry,there are no assigned tickets.<%} %></font></center>
 
 <%
}
else
{
 %>
 
<center><font size="5pt" >Assigned Tickets</font></center>
 
<center>
<div id="gradient-style">
				
				
				<hr></hr>
				<br></br>
				<%
					if(!ticketArray.isEmpty()){%>
						<div id="gradient-style" style="width:600px;">
						<table id="mt"  width="550">
						<thead>
						 
					<th><center><b>Ticket Id</b></center></th>
						<th><center><b>Ticket Title</b></center> </th>
						<th><center><b>Priority</b></center></th>
							<th><center><b>Assigned To</b></center></th>
					
						<th style="width:200px"><center><b>Associated Business Customer</b></center></th>
				 
						</thead>
						
						
						<tbody>
						<% int i = 0;
						for(Ticket tik:ticketArray){%>
						<tr>
						<td><a href="/NexusBankingGroup/AssignTicketServlet?action=reAssign&&tikid=<%=tik.getId()%>&&tiktitle=<%=tik.getTitle() %>&&tikpriorty=<%=tik.getPriorityId()%>" >
					
						<%=tik.getId()%> 	</a></td>
				 
						
						<td ><%=tik.getTitle() %></td>
						
						<td><%=tik.getPriorityId()%></td>
					    <td><%=tik.getAssignedToName()+" ( employee id: "+tik.getAssigned_to()+" )"%></td>
					 	<td><%=bList.get(i).getBusinessName()%></td>
						</tr>

						<% }%>
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
<%

}
}
%>

</div>
 
</div>
 


 
	
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>

 
