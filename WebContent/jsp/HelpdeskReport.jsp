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
<script type="text/javascript">
function chartValidation()
{
if(document.getElementById("month").value=="")
		{
	alert("Please select a month");
	return false;
		}
if(document.getElementById("year").value=="")
{
alert("Please select an year");
return false;
}

if(document.getElementById("pie").checked==false&&document.getElementById("bar").checked==false&&document.getElementById("pdf").checked==false)
{
alert("Please select a type of report");
return false;
}
}
</script>


 


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
		<center><font color=black size="5pt">View Ticket Report<br/><br/></font></center>
	<form action="/NexusBankingGroup/ChartHelpdeskController" method="post">
<input type="hidden" name="action" value="chart"></input>
<center>
<table width="400" id="gradient-style">
<tr>
<td align="left">Month </td>
<td align="left"><select name="month" id="month" style="width:150px">
<option value="">
Select month
</option>
<option value="1">
January
</option>
<option value="2">
February
</option>
<option value="3">
March
</option>
<option value="4">
April
</option>
<option value="5">
May
</option>
<option value="6">
June
</option>
<option value="7">
July
</option>
<option value="8">
August
</option>
<option value="9">
September
</option>
<option value="10">
October
</option>
<option value="11">
November
</option>
<option value="12">
December
</option>
</select></td>
</tr>


<tr>
<td align="left">
Year
</td>
<td align="left">
<select name="year" id="year"  style="width:150px">
<option value="">
Select year
</option>
<option value="2012">
2012
</option>
<option value="2013">
2013
</option>

</select>
</td>
</tr>

<tr>
<td align="left">
Type of Report
</td>
<td align="left">
<input type="radio" name="choice" value="pie" id="pie">Pie Chart</input>
<input type="radio" name="choice" value="bar" id="bar">Bar Chart</input>
<input type="radio" name="choice" value="pdf" id="pdf">PDF Report</input>
</td>
</tr>

<tr>
<td colspan="2" align="center">

<br/>

<input type="submit" style="background-color:black;  color:white" value="Generate" onclick="return chartValidation()"></input>
</td>
</tr>
</table>

</center>










</form>


 <br/>
 <br/>
 <br/>
 
</div>
 
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
