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


<%@page import="com.training.model.NonPersonalCustomer"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>show search details</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="description"
	content="Made By Lokesh Charora" />
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
		"aoColumns": [ null, null,null,null]  			
	} );

});
</script>

<%ArrayList<NonPersonalCustomer> npcList=(ArrayList<NonPersonalCustomer>)request.getAttribute("customerList");%>
</head>
<body id="page5" onload="new ElementMaxHeight();">
<%Employee e = new Employee();%>
<%e = (Employee)session.getAttribute("emp"); %>
<jsp:include page="/Layout/Header.jsp"/>


			
<!-- Start Main Content -->
	<div id="main" class="container">
		<jsp:include page="/Layout/BusinessCustOperationsMenu.jsp"/>
		<div id="center">
			
			<div class="article_wrapper">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 700px">
					<p  style ="font-size:20px ; padding-left:200px;padding-top: 5px;padding-bottom:5px;">Business Customer Search Details</p><br/>
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
					if(!npcList.isEmpty()){%>
						<div id="" style="width:700px;">
						<table id="mt" cellpadding="0" cellspacing="0" border="0" class="display" bordercolor="#000">
						<thead>
						<tr style="background-color: #5599a7; height: 25px;">
						<th style="color: white;background-color:#5599a7 ">Customer ID</th>
						<th style="color: white;background-color:#5599a7 ">Business name</th>
						<th style="color: white;background-color:#5599a7 ">Trading name</th>
						<th style="color: white;background-color:#5599a7 ">Email ID</th>
						</tr>
						</thead>
						<tbody>
						<% for(NonPersonalCustomer npc:npcList){%>
						<tr>
						<td style="font-size: 12px;"><a
						href="/NexusBankingGroup/CustomerManagementServlet?action=ViewDetails&&npc_id=<%=npc.getNonPersonalCustomerID()%>"><%=npc.getNonPersonalCustomerID()%></a></td>
						<td style="font-size: 12px;"><%=npc.getBusinessName()%></td>
						<td style="font-size: 12px;"><%=npc.getTradingName()%></td>
						<td style="font-size: 12px;"><%=npc.getEmailId()%></td>
						
						</tr>

						<% }%>
						</tbody>
						</table>
						</div>
	
						<%}
						else
							{%>
									<h2><font color="red" style="font-size:20px;"><%out.println("Sorry,No Match Found."); %></font></h2></br>
									<p style="font-size:12px;"><a href="<%=request.getContextPath()%>/jsp/SearchBusinessCustomer.jsp"><u>Please Click Here to Search again</u></a></p>	
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