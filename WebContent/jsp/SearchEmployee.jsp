<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.training.model.Employee" %>
 <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("username")==null){
     response.sendRedirect(request.getContextPath());
     return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Employee</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="description"
	content="Made By Saurabh Varshneya" />
<link  rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css/common.css">
<style type="text/css" title="currentStyle">
			@import "<%=request.getContextPath() %>/stylesheets/demo_page.css";
			@import "<%=request.getContextPath() %>/stylesheets/jquery.dataTables_themeroller.css";
			@import "<%=request.getContextPath() %>/stylesheets/jquery-ui-1.8.4.custom.css";
			
	</style>
<script>
function chName()
{

	document.forms["fRadio"]["t2"].disabled=true;
	document.forms["fRadio"]["t2"].value="";

	document.forms["fRadio"]["button1"].disabled=false;
	
	
		
}

function chId()
{
	document.forms["fRadio"]["t1"].disabled=true;
	document.forms["fRadio"]["t1"].value="";


	document.forms["fRadio"]["button1"].disabled=false;
}

function actButton()
{
	
	document.forms["fRadio"]["button1"].disabled=false;
	
	
}

function deactButton()
{

	
	document.forms["fRadio"]["t1"].disabled=false;
	document.forms["fRadio"]["t2"].disabled=false;
	document.forms["fRadio"]["button1"].disabled=true;
	document.getElementById("fRadio").submit();
}

function deactResetButton()
{
	document.forms["fRadio"]["t1"].disabled=false;
	document.forms["fRadio"]["t2"].disabled=false;
	document.forms["fRadio"]["button1"].disabled=true;
}

</script>


<style>
td,th
{
padding-left: 10px;
padding-right: 10px;
padding-top: 5px;
padding-bottom:5px;

}
th
{
font-size:15px;
height:35px;
}
table
{
width:100%;

}
#th1
{
background-color: #5599a7;
color: white;

}

</style>
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
		"aoColumns": [ null, null,null]  			
	} );

});
</script>

<%ArrayList<Employee> empList=(ArrayList<Employee>)request.getAttribute("EmployeeList");%>
</head>
<body id="page5" onload="new ElementMaxHeight();">
<%Employee e = new Employee();%>
<%e = (Employee)session.getAttribute("emp"); %>
<jsp:include page="layout/Header.jsp"></jsp:include>
<!-- Start Main Content -->
	<div id="main" class="container">
		<jsp:include page="/Layout/AdminMenu.jsp"/>
		<div id="center">
			
			<div class="article_wrapper">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
					<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px;">SEARCH EMPLOYEE</p><br/>
					 </div>
		  		
			
			</div>
			<div id="table">
				<div class="col-2 maxheight"><!-- box begin -->
				<div class="box maxheight">
				<div class="border-top maxheight">
				<div class="border-right maxheight">
				<div class="border-bot maxheight">
				<div class="border-left maxheight">
				<div class="left-top-corner maxheight">
				<div class="right-top-corner maxheight">
				<div class="right-bot-corner maxheight">
				<div class="left-bot-corner maxheight">
				<div class="inner">
				
				<hr></hr>
				<br></br>
				<%
					if(!empList.isEmpty()){%>
						<div id="" style="width:600px;">
						<table id="mt" cellpadding="0" cellspacing="0" border="0" class="display" bordercolor="#000">
						<thead>
						<tr style="background-color: #5599a7; height: 25px;">
						<th style="color: white;background-color:#5599a7 ">Employee Id</th>
						<th style="color: white;background-color:#5599a7 ">Name</th>
						<th style="color: white;background-color:#5599a7 ">Designation</th>
						</tr>
						</thead>
						<tbody>
						<% for(Employee emp:empList){%>
						<tr>
						<td style="font-size: 12px;"><a
						href="/NexusBankingGroup/EmployeeManageServlet?action=viewComplete&&id=<%=emp.getId()%>"><%=emp.getId()%></a></td>
						<td style="font-size: 12px;"><%=emp.getfName()%>&nbsp;&nbsp;<%=emp.getlName() %></td>
						<td style="font-size: 12px;"><%=emp.getDesignation()%></td>
						</tr>

						<% }%>
						</tbody>
						</table>
						</div>
	
						<%}
						else
							{%>
									<center><br></br><b style="color: #2cb6e9;font-size:14px;"><%out.println("Employee not found");%></b></center>
							<%}
							%>

						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
						</div>
			
			
			 
	
	
	


<jsp:include page="/Layout/Footer.jsp"/>

</body>
</html>