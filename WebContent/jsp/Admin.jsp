<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Admin</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

 <style>
#header2{
		height: 400px;
		position: relative;
		margin-top:-30px;
		margin-left:10px;
		width:500px;
		float:left;
		 
		}
	</style>
</head>


<% 

if(session.getAttribute("designation")!=null)
{
String designation=session.getAttribute("designation").toString();

if(!designation.equals("ADMINISTRATOR"))
{
	%>
<Script>
window.location="<%=request.getContextPath()%>/jsp/error.jsp";
</Script>
<% 
}
}
%>
<body >
 

<jsp:include page="../jsp/layout/Header.jsp" />
   
	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container"   style = "margin-left:10px;" >
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">
			
			<%String adminMenu=(String)session.getAttribute("adminMenu"); %>
			<%if(adminMenu!=null){ %>
			<%=adminMenu %>
			<%} else{ %>
   
			Quick Links <%} %></h3>
			<ul class="leftbox borderedlist">
			<li id="lft"><a href="<%=request.getContextPath() %>/jsp/UnassignedTickets.jsp" title="Change Account Title">
			
			<%String adminLink1=(String)session.getAttribute("adminLink1"); %>
			<%if(adminLink1!=null){ %>
			<%=adminLink1 %>
			<%} else{ %>
   
			Unassigned Tickets <%} %></a></li>
		 		
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
		 
		  
		 
	  
  <div id="header2" ><center>
   <h2 style="margin-left:170px;margin-top:50px"><font size = "4pt"><b>
   <%String welcomeNote=(String)session.getAttribute("welcomeNote"); %>
<%if(welcomeNote!=null){ %>
<%=welcomeNote %>
<%} else{ %>
   Welcome <%} %>&nbsp;&nbsp;<%=session.getAttribute("empName")%></b></font></h2></center><br/>
     <div style="margin-left:40px; position: relative; height:500px; margin-top:-5px">
    
     <img src="<%=request.getContextPath() %>/images/admin.jpg" width="600px" height="300px" />
      <div style="width:800px">
      <p><font size="2pt"><b>
   <br/>
   <%String adminContent=(String)session.getAttribute("adminContent"); %>
<%if(adminContent!=null){ %>
<%=adminContent %>
<%} else{ %>
     
   Executive ability is deciding quickly and getting somebody else to do the work. <%} %></b></font></p>
     </div>
     </div>
    
</div>		 
	
	
		 
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
