<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report Criteria</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>

	<!-- Start Main Content -->

	<div id="main" class="container">
	<jsp:include page="/Layout/BusinessCustMenu.jsp"/>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">View Report</p><br/></br>
				 	</div>
<form name="report" action="/NexusBankingGroup/CustomerManagementServlet">
<input type="hidden" name="action" value="chart"></input>

<div style=size:3px;>
<br/>
<table>
<tr>
<td style="font-size: 15px;width:200px;">Year</td> 
<td><select name="year">
<option>Select</option>
<option>2008</option>
<option>2009</option>
<option>2010</option>
<option>2011</option>
<option>2012</option>
<option>2013</option></select></td>
</tr>
<tr>
<td style="font-size: 15px;width:200px;">Month</td>
<td><select name="month">
<option>Select</option>
<option>January</option>
<option>February</option>
<option>March</option>
<option>April</option>
<option>May</option>
<option>June</option>
<option>July</option>
<option>August</option>
<option>September</option>
<option>October</option>
<option>November</option>
<option>December</option></select></td>
</tr>
<tr>
<td style="font-size: 15px;width:200px;">Type of Report</td> 
<td><select name="type">
<option>Pie Chart</option>
<option>Bar Chart</option>
<option>PDF Report</option>
</select></td>
</tr>
<tr><td style="border:0px; padding-top:10px;"></td>
<td style="border:0px; padding-top:10px;"><input type="button" value="Generate Report" onclick="document.report.submit();" style="background-color:#5699A7"></input></td>
</tr>
</table>
</div>
<br/>

</form>
</div>
</div>
</div>	
<jsp:include page="/Layout/Footer.jsp"/>
</body>
</html>