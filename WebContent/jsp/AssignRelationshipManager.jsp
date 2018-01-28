<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	    <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("user")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.*"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Assign Relationship Manager</title>
<style type="text/css" title="currentStyle">
			@import "<%=request.getContextPath() %>/css/demo_page.css";
			@import "<%=request.getContextPath() %>/css/jquery.dataTables_themeroller.css";
			@import "<%=request.getContextPath() %>/css/jquery-ui-1.8.4.custom.css";
			
	</style>


	<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.dataTables.js"></script>
<script>$(document).ready(function(){

	var oTable	= $('#mt').dataTable( {
		"sScrollX": "100%",
		"aaSorting": [[ 2, "asc" ]],
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"bAutoWidth": false,
		"autoHeight": true,
		"bStateSave": false,
		"aoColumns": [null,null,null,null]  			
	} );

});
	</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/RelationshipManagerValidation.js">
</script>
</head>

<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
<jsp:include page="layout/accountMenuHome.jsp" /> 
<div id="midtitle" >
<h2 style="font-size:20px" align="center">Assign Relationship Manager</h2>
</div>

<%ArrayList<RelationshipManager>rmlist=(ArrayList<RelationshipManager>)request.getAttribute("relmgr");%>
<%int rmsize=rmlist.size(); %>
<%int bid=(Integer)request.getAttribute("id"); %>
<%String bname=(String)request.getAttribute("name"); %>

<%String branch=(String)request.getAttribute("branch"); %>

<form name="f1" action="/NexusBankingGroup/RelationshipManagerController"  onSubmit="return validation(<%=rmsize %>)" method="post">

<input type="hidden" name="action" value="ConfirmDetails"></input>
<p align="left"><label id="labels" >&nbsp;&nbsp;&nbsp;&nbsp;<%=bname %>: Please select Relationship Manager</label></p>

	
<div id="accountdiv">
<h3 style="font-size:13px;">Newly registered Customer details</h3>
<table id="result" border="2px">

<tr></tr>
<tr>

<th>Business Customer ID</th>
<th>Business Customer Name</th>
<th>Branch</th>
</tr>

<!-- display the new customer details -->
<tr>
<td><%=bid %></td>
<td><%=bname %></td>
<td><%=branch %></td>

</tr>

</table></div>

<br></br>
<div style="float:left;width:640px;padding: 0 20px;">
<%
	if(rmlist!= null && !rmlist.isEmpty())
	{%>

<h3 style="font-size:13px;">Relationship Manager list</h3>

<table style="padding-top:10px; margin-left:230px;" id="mt" cellpadding="0" cellspacing="0" border="0" class="display">

<thead>
<tr>
<!-- Relationship Manager list -->
<th style="background-color:#5599a7;">Select</th>
<th style="background-color:#5599a7;">Manager Id</th>
<th style="background-color:#5599a7;">Name</th>
<th style="background-color:#5599a7;">Branch</th>

</tr>
</thead>
<%for(RelationshipManager rel:rmlist){ %>
<tr>
<td><input type="radio" name="check" id=checkid value=<%=rel.getId() %>></td>
<td><%=rel.getId() %></td>
<td><%=rel.getName() %></td>
<td><%=rel.getBranch() %></td>

</tr>
<%} %>

</table>
<br></br>
<div id="buttondiv">
<input type="submit"  name="action" id="button" value="Assign"/>
<input type="reset" value="Reset" id="button"></input>

</div>
<% }
	else
	{
	%><div style="font-size:15px;">
	&nbsp;&nbsp;&nbsp;&nbsp;<p>Relationship Manager is not available for the branch where account has been newly created</p>
	
	&nbsp;&nbsp;&nbsp;&nbsp;<p>Please click on the change button</p>
	 <input type='button' name='check' id="button" value='Change' onclick="window.location.href='/NexusBankingGroup/RelationshipManagerController?action=changeNew'"/>
	
	</div><%
	}
	%>	
	</div>
</form>
</div>

<jsp:include page="layout/Footer.jsp"/>
</body>
</html>



