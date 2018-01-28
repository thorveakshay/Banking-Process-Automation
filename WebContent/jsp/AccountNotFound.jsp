<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

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
<title>Sorry Message</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" /> 
</head>




<body >


<jsp:include page="../jsp/layout/Header.jsp" />

	<!-- Start Header -->

	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Operations</h3>
			<ul class="leftbox borderedlist"> 
			 
			
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchCustomerToView.jsp" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/gt.jsp" title="Generate Ticket">Create Helpdesk Ticket</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="Tickets">View Tickets</a></li>
				
				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->
<form  name="searchForm"  action="/NexusBankingGroup/ViewAccountDetailServlet"  > 

<input type="hidden" name="action" value="tryAgain"></input>
<font size="5pt" color=#8A3E08 align="left">&nbsp;&nbsp;&nbsp;Sorry! Account does not exist.</font>

   <input type="submit" style="background-color:black;  color:white" value="Try again" ></input>
</form>
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
