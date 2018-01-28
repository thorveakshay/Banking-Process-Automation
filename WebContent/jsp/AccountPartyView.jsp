<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">

	  
   

 function confirmDelete()
 {

    	return confirm("Do you want to delete the account party?");
      
    }
  
function validateSearch()
{
	if(document.getElementById("searchByName").checked==false&&document.getElementById("searchByRelationship").checked==false)

		{alert("Please select a search option");
	return false;
		}
	else if(document.getElementById("searchByName").checked==true&&document.getElementById("txtname").value.length==0)
	{
		alert("Please enter a name to search");
		return false;
	}
	else if(document.getElementById("searchByRelationship").checked==true&&document.getElementById("relationship").value=="")
	{
		alert("Please select a relationship to search");
		return false;
	}
	else
		return true;

		
}
function disableRel()
{
	document.getElementById("txtname").disabled=false;
	document.getElementById("relationship").disabled=true;
	
}

function disableName()
{
	document.getElementById("relationship").disabled=false;
	document.getElementById("txtname").disabled=true;
}




</script>
<style>
td{
	font-size:12px;
	padding:5px;
	}
	th{
	color: #8c8685;
	font-size:12px;
	background: #f1f0ef;

	}
	table{
	margin-top:5px;
	}
	
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Nexus Banking Group</title>
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css" />
<%@page import="com.training.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
	List<AccountParty> list = new ArrayList<AccountParty>();
	list = (List<AccountParty>) request.getAttribute("list");
	String msg=(String)request.getAttribute("msg");
	NonPersonalCustomer npc=(NonPersonalCustomer)session.getAttribute("cust");
%>

</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Account Party</h3>
<ul class="leftbox borderedlist">
	<li><a href="<%=request.getContextPath() %>/jsp/AccountOpenerHome.jsp" title="Home">Home</a></li>
	<li><a href="<%=request.getContextPath() %>/jsp/SearchBusinessCustomer.jsp" title="Search">Search Business Customer</a></li>
	<li><a
		href="../../NexusBankingGroup/AccountPartyManagementServlet?action=addAccountParty&&id=<%=session.getAttribute("npid") %>">Add
	Account Party</a></li>
	<li><a
		href="../../NexusBankingGroup/AccountPartyManagementServlet?action=viewAccountParty&&id=<%=session.getAttribute("npid") %>">View
	Account Party</a></li>

</ul>

</div>
<!-- main content area -->
<div id="center">
<label style="font-size:16px">Welcome, <%=npc.getBusinessName() %></label>
<div class="article_wrapper">
<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px">ACCOUNT PARTY DETAILS</p><br/>
				 	</div> 
<form action="<%=request.getContextPath()%>/AccountPartyManagementServlet">
<input type="hidden" name="action" value="search"></input>
<table width="500">

	
	<tr>
		<td><input type="radio" name="search" value="searchbyname" id="searchByName" onclick="disableRel()">Search
		By Name</input></td>
		<td><input type="text" name="txtname" id="txtname" disabled="disabled"></input></td>
	</tr>
	<tr>
		<td><input type="radio" name="search"
			value="searchbyrelationship" id="searchByRelationship" onclick="disableName()" >Search By Relationship with the
		Business</input></td>
		<td><select name="relationship" id="relationship" disabled="disabled">
			<option selected="selected" value="">Select</option>
			<option value="Director">Director</option>
			<option value="Trustee">Trustee</option>
			<option value="Owner">Owner</option>
			<option value="Partner">Partner</option>
		</select></td>
	</tr>
	<tr>
		<td colspan="2"><br/>
		<center><input type="submit" class="button" name="b1" value="Search" onclick="return validateSearch()"
			style="margin-right: 5px" /><input type="reset" name="b2"
			value="Reset" class="button" style="margin-left: 5px" onclick='window.navigate("../../NexusBankingGroup/AccountPartyManagementServlet?action=viewAccountParty&&id=<%=session.getAttribute("npid") %>")'/></center>
		</td>
	</tr>

</table>
<%if(msg!=null)
	{
	%>
	
	<br/><p style="font-size:12px; color:green"><%=msg %></p>
	
	<%} %>
</form>
<% if(list.size()!=0)
{
	%>
<table width="600px" border="1" style="margin-top: 20px">
	<tr>
		<th width="100">Business Customer ID</th>

		<th width="100">Account Party ID</th>
		<th width="200">Name</th>
		<th>Relationship with the Business</th>

		<th width="auto" nowrap="nowrap"></th>
	
	</tr>

	<%
		for (AccountParty ap : list) {
	%>
	<tr>
		<td><%=ap.getNpid()%></td>
		<td><%=ap.getId()%></td>
		<td><%=ap.getTitle() + " " + ap.getFname() + " "
						+ ap.getLname()%></td>
		<td><%=ap.getRelationship()%></td>
		<td nowrap="nowrap"><a
			href="../../NexusBankingGroup/AccountPartyManagementServlet?action=viewAccountPartyDetails&&id=<%=ap.getId()%>" style="background-color: #659AA6; color:#fff;	border: 4px solid #fff; padding-left:3px;padding-right:3px;display: block;
		float: left;
		width: auto;
	">View
		Details</a></td>
		
	</tr>
	<%
		}
	%>
</table>
<%
}
else
{
%>
<h3 align="center" style="font-size:15px; color:red;margin-left:120px">No account party found.</h3>
<%
}
%>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->

<!-- Start Footer -->
<jsp:include page="/Layout/Footer.jsp"/>
</body>
</html>
