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
String designation=session.getAttribute("designation").toString();

 %>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Sorry Message</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
</head>



<body >


<jsp:include page="../jsp/layout/Header.jsp" />

	<!-- Start Header -->

	<!-- Start Main Content -->
<div id="main" class="container">
	 
<!--	<div id="leftcolumn">-->
<!--			<h3 class="leftbox">Quick Links</h3>-->
<!--			<ul class="leftbox borderedlist"> -->
<!--			 -->
<!--			 <li id="lft"><a href="<%=request.getContextPath() %>/jsp/HomeTicket.jsp" title="HomeTicket">Home</a></li>-->
<!--			 -->
<!--			 <li id="lft"><a href="<%=request.getContextPath() %>/jsp/Admin.jsp" title="HomeTicket">Administrator</a></li>-->
<!--				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchCustomerToView.jsp" title="Customer Details">Customer Details</a></li>-->
<!--				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>-->
<!--				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/gt.jsp" title="Generate Ticket">Create Helpdesk Ticket</a></li>-->
<!--				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="Tickets">View Tickets</a></li>-->
<!--				-->
<!--				-->
<!--			</ul>-->
<!--			-->
<!--			<hr />-->
<!--		</div>-->
<!--	-->
		<!-- main content area -->
<form  name="searchForm"  action="/NexusBankingGroup/GetCustServlet"  > 
<br /><br />
<input type="hidden" name="action" value="getBranchList"></input>
<center>
<font size="5pt" color=black align="center">Sorry! No Business Customer found. Please Try Again.</font></center>
<br></br>

<center><input type="submit" style="background-color:black;  color:white" value="Try again" ></input></center>
</form>
<br /><br /><br /><br /><br />
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
