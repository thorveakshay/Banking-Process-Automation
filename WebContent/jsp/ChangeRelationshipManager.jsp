<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<!--     <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("user")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%> -->
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css" title="currentStyle">
			@import "<%=request.getContextPath() %>/css/demo_page.css";
			@import "<%=request.getContextPath() %>/css/jquery.dataTables_themeroller.css";
			@import "<%=request.getContextPath() %>/css/jquery-ui-1.8.4.custom.css";
			
	</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css">
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
		"aoColumns": [null, null,null,null]  			
	} );

});
	</script>
<title>Change Relationship Manager</title>


<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/ChangeRMValidation.js">
</script> 

</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" style="width:900px;
		margin-left: 40px;
		position: relative;
		overflow:hidden;">
<jsp:include page="layout/accountMenuHome.jsp" /> 
<div id="midtitle" >
<h2 style="font-size:20px" align="center">Change Relationship Manager</h2>
</div>

<%ArrayList<Branch> brlist=(ArrayList<Branch>)request.getAttribute("branchlist");%>
<%String busname=(String)request.getAttribute("bname"); %>
<p align="left"><label id="labels" >&nbsp;&nbsp;&nbsp;&nbsp;<%=busname %>: Please select the respective branch to choose Relationship Manager</label></p>
<br></br>

<form name="branchform" action="/NexusBankingGroup/RelationshipManagerController" onSubmit="return branchvalidation()" method="post">
<input type="hidden" name="action" value="BranchDetails"></input>
  <%
	if(brlist!= null && !brlist.isEmpty())
	{%>
    <div id="accountdiv">
    <table id="middiv"> 
<!-- Display list of branch -->
<tr>
<td>Select Branch<font color="red">* </font></td>
<td><select name="selbranch">
<option value=0>Select</option>
<%for(Branch br:brlist)
{%>
<option value=<%=br.getBranchName() %>><%=br.getBranchName() %></option>
<%} %>
</select></td>
<td></td>
</tr>
</table></div>
<br>
<div id="buttondiv">
    <input type="submit" name="action" value="Confirm" id="button">
</div>
<%}else
	{
	%><div style="font-size:15px;">
	&nbsp;&nbsp;&nbsp;&nbsp;<p>Branch List is not available for you</p>
	
	<!-- &nbsp;&nbsp;&nbsp;&nbsp;<p>Please click on back</p> -->
	</div><%
	}
	%>	
</form>

<%String msg=(String)request.getAttribute("msg"); %>
<%if("result".equals(msg)) { %>
	<%ArrayList<RelationshipManager>rmlist=(ArrayList<RelationshipManager>)request.getAttribute("relmgr");%>
	<%int rmsize=rmlist.size(); %>
	
	<form name="f1" action="/NexusBankingGroup/RelationshipManagerController"  onSubmit="return validation(<%=rmsize %>)">
	<input type="hidden" name="action" value="ChangeDetails"></input>
	
	<br></br>
<div style="float:left;width:640px;padding: 0 20px;  margin-left:230px;">
	<%
	if(rmlist!= null && !rmlist.isEmpty())
	{%>
	
	
	<h3 style="font-size:13px;">Relationship Manager list</h3>
		<table style="padding-top:10px;" id="mt" cellpadding="0" cellspacing="0" border="0" class="display">
	<thead>
	<tr>

	<th style="background-color:#5599a7;">Select</th>
	<th style="background-color:#5599a7;">Manager Id</th>
	<th style="background-color:#5599a7;">Name</th>
	<th style="background-color:#5599a7;">Branch</th>

	</tr>
	</thead>
	<!-- Display list of relationship manager based on branch selected-->
		
	
	<%for(RelationshipManager rel:rmlist){ %>
	<tr>
	<td><input type="radio" name="check" id=checkid value=<%=rel.getId() %>></td>
	<td><%=rel.getId() %></td>
	<td><%=rel.getName() %></td>
	<td><%=rel.getBranch() %></td>

	</tr>
	<%}%>
	</table>
	
	<br></br>
	<div id="buttondiv">

	<input type="submit" id="button"  name="action" value="Assign"/>

	<input type="reset" id="button" name="action" value="Reset"></input>

	</div>
	<% }
	else
	{
	%><div style="font-size:15px;">
	&nbsp;&nbsp;&nbsp;&nbsp;<p>Relationship Manager is not available for selected branch</p>
	
	&nbsp;&nbsp;&nbsp;&nbsp;<p>Please reselect the Branch</p>
	</div><%
	}
	%>	
	</div>
	</form>
<%}%>


</div>
<jsp:include page="layout/Footer.jsp"/>

</body>
</html>