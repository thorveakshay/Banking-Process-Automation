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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Backoffice Employee Home Page</title>
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
 
 if(session.getAttribute("uid")==null)
 {
 
String designation=session.getAttribute("designation").toString();

if(!designation.equals("BACKOFFICE EMPLOYEE"))
{
	%>
<Script>
window.location="<%=request.getContextPath()%>/jsp/error.jsp";
</Script>
<% 
}
 }
%>

<body>
<jsp:include page="../jsp/layout/Header.jsp" />
	<!-- Start Header -->
	
	
<!-- Start Main Content -->

<div id="main" class="container"  style = "margin-left:10px;" >
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">
			<%String boMenuHead=(String)session.getAttribute("boMenuHead"); %>
<%if(boMenuHead!=null){ %>
<%=boMenuHead %>
<%} else{ %>Quick Links
<%} %></h3>
			<ul class="leftbox borderedlist">
			<% 
 
 if(session.getAttribute("uid")!=null)
 {
 
String designation=session.getAttribute("designation").toString();

if(designation.equals("BACKOFFICE EMPLOYEE"))
{
	%>
			 <li id="lft"><a href="<%=request.getContextPath() %>/jsp/AssignedTickets.jsp" title="Assigned Tickets">
			 <%String boMenu=(String)session.getAttribute("boMenu"); %>
<%if(boMenu!=null){ %>
<%=boMenu %>
<%} else{ %>Assigned Tickets<%} %></a></li>
			<li id="lft" style="height:270px"></li>
		<%
}

if(designation.equals("RELATIONSHIP MANAGER"))
{
	%>
			 
		<li id="lft"><a  href="/NexusBankingGroup/GetCustServlet?action=getBranchList0" title="Change Account Title">Change Account Title</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">Switch to New Product</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList4" title="Update Business Customer Address">Update Business Customer Address</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Address">Update Business Customer Contact</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/jsp/AccountPartyManagementHome.jsp" title="Account Party Management">Account Party Management</a></li>
		
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">Close Account</a></li>
				 
		<%
}

 }
		%>		
			</ul>
			
			<hr />
		</div>
		<!-- main content area -->

<div id = "maincontent" >
 <div  style="margin-left:520px">
 
 </div>
 
  <div id="header2" >
   <h2 style="margin-left:250px;margin-top:50px">
  
   <center><b> <%String boHead=(String)session.getAttribute("boHead"); %>
<%if(boHead!=null){ %>
<%=boHead %>
<%} else{ %>Welcome <%} %>
&nbsp;&nbsp;
<%=session.getAttribute("empName") %></b></center></h2>
  
     <div style="margin-left:50px; position: relative; height:650px; margin-top:-5px">
    
     <img src="<%=request.getContextPath() %>/images/backoffice.jpg" width="600px" height="300px" />
      
    
     <br/>
       <div style="width:400px">
      <p ><font size="2pt"><b><%String boContent=(String)session.getAttribute("boContent"); %>
<%if(boContent!=null){ %>
<%=boContent %>
<%} else{ %>
    The back office includes end to end banking operations which includes position keeping, clearance, and settlement. <%} %></b><br/>
   
	 </p>
     </div>
  </div>

</div> 
			<hr />
		</div>
		</div>
	<br/>
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
