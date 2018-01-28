<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%>
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
<% String month= (String)request.getAttribute("month");
String year= (String)request.getAttribute("year");
String ticketMonth=null;
if(month.equals("1"))
		ticketMonth="January";
else if(month.equals("2"))
	ticketMonth="February";
else if(month.equals("3"))
	ticketMonth="March";
else if(month.equals("4"))
	ticketMonth="April";
else if(month.equals("5"))
	ticketMonth="May";
else if(month.equals("6"))
	ticketMonth="June";
else if(month.equals("7"))
	ticketMonth="July";
else if(month.equals("8"))
	ticketMonth="August";
else if(month.equals("9"))
	ticketMonth="September";
else if(month.equals("10"))
	ticketMonth="October";
else if(month.equals("11"))
	ticketMonth="November";
else if(month.equals("12"))
	ticketMonth="December";

%>


 


<link href="<%=request.getContextPath() %>/stylesheets/common.css" rel="stylesheet" type="text/css" />
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
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/HelpdeskReport.jsp" title="View Ticket Report">View Ticket Report</a></li>

				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>

				
			</ul>
			
			<hr />
		</div>
		<center><font color=black size="5pt">Helpdesk Tickets raised in the month of
							<%=ticketMonth %> <%=year %></font>
							<br/>
		<img src="/NexusBankingGroup/ChartHelpdeskController?action=bargenerate&&month=<%=month %>&&year=<%=year %>" onerror="this.src = 'images/error.JPG'" ></img>
		
		
		
	</center>

<a href="jsp/HelpdeskReport.jsp" class="button" style="margin-left:333px; font-size:14px;">Back</a>




 <br/>
 <br/>
 <br/>
 
</div>
 
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>




