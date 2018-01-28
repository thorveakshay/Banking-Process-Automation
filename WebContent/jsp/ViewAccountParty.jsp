 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>View Account Party </title>
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />	
<%@page import="com.training.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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

List<AccountParty> list=new ArrayList<AccountParty>(); 

 list = (List<AccountParty>) session.getAttribute("list"); 
	 
%>

 
</head>
<style type="text/css" title="currentStyle"> 
			@import "<%=request.getContextPath() %>/stylesheets/jquery.dataTables_themeroller.css";
			@import "<%=request.getContextPath() %>/stylesheets/jquery-ui-1.8.4.custom.css";
			
	</style>
 
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
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
		"aoColumns": [ null, null,null,null, null,null,null]  			
	} );

});
function confirmDelete( x)
{
 
	var chk=confirm("Are you sure you want to delete account party ?");
if(chk==true)

{
alert("Account Party deleted successfully")
	window.location="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=deleteAccountParty&&id="+x;
	
}

else
	return chk;	
}

</script>


<body>
<!-- Start Header -->
 
<jsp:include page="../jsp/layout/Header.jsp" />
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox"><font size="2pt"><b>Quick Links</b></font></h3>
<ul class="leftbox borderedlist">
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=addAccountParty"><font size="2pt">
		
	Add Account Party</font></a></li>
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=viewAccountParty&&pageNumber=1"><font size="2pt">View
	Account Party</font></a></li>

</ul>

</div>
<center> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="5pt" color=black>Account Party Details</font></center><br/>
 
		 
 
<!-- main content area -->


<div id="gradient-style" align="center">
		
				
				
				<%
				if(!list.isEmpty()){
					
					%>
						<div id="gradient-style" style="width:600px;">
						<table id="mt"  width="500" align="center">
						<thead>
						 
					<th><center><b>Business Id</b></center></th>
						<th><center><b>Account Party Id</b></center> </th>
						<th><center><b>Name</b></center></th>
				 <th><center><b>Relationship with Business</b></center></th>
						<th><center> </center></th>
						<th><center> </center></th>
						
						<th><center> </center></th>
						</thead>
						<tbody>
						<%
		for (AccountParty ap : list) {
	%>
	<tr>
		<td><%=ap.getNpid()%></td>
		<td><%=ap.getId()%></td>
		<td><%=ap.getTitle() + " " + ap.getFname() + " "
						+ ap.getLname()%></td>
		<td><%=ap.getRelationship()%></td>
		<td><a
			href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=viewAccountPartyDetails&&id=<%=ap.getId()%>">View
		Details</a></td>
		<td><a
			href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=updateAccountPartyDetails&&id=<%=ap.getId()%>">Update</a></td>
			<td><a
			href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=deleteAccountParty&&id=<%=ap.getId()%>" onclick="return confirmDelete(<%=ap.getId() %>)">Delete</a></td>
	</tr>
	<%
		}
	%>
						</tbody>
						</table>
						</div>
	
						<%}	 
							%>

						</div>
						
						 

 
 
   	
<div id="center">
<div class="article_wrapper">

 


</div>
<hr />
</div>
<!-- product sales boxes -->
<!-- Start Bottom Information -->
 </div>
<!-- Start Footer -->

<jsp:include page="../jsp/layout/Footer.jsp" />

 
</body>
</html>
 