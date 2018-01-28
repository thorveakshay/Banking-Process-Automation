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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
function confirmDelete()
{

   	return confirm("Do you want to delete the account party?");
     
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
	margin-top:20px;
	}
	
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Nexus Banking Group</title>
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css" />
<%@page import="com.training.model.*"%>


<%
	AccountParty ap = new AccountParty();
	ap = (AccountParty) request.getAttribute("ap");
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
<div class="article_wrapper">
<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px">ACCOUNT PARTY DETAILS</p><br/>
				 	</div> 
<table width="600px" border="1" style="margin-top: 20px">
	<tr>
		<%
			String fullname;
			if (ap.getMname() == null) {
				fullname = ap.getTitle() + " " + ap.getFname() + " "
						+ ap.getLname();
			} else {
				fullname = ap.getTitle() + " " + ap.getFname() + " "
						+ ap.getMname() + " " + ap.getLname();
			}
		%>
		<td width="50%"><b>Name</b></td>
		<td><%=fullname%></td>
	</tr>

	<tr>
		<td><b>Date of Birth</b></td>
		<td><%=ap.getDob()%></td>
	</tr>

	<tr>
		<td><b>Relationship with the Business</b></td>
		<td><%=ap.getRelationship()%></td>
	</tr>

	<tr>
		<td><b>Key Party</b></td>
		<td><%=ap.getIsKeyParty()%></td>
	</tr>


	<tr>
		<td><b>Current Address</b></td>
		<td>
		<%
			if (ap.getCurrentAddress() == null) {
		%> Details not available <%
			} else {
				String add = "";
				if (ap.getCurrentAddress().getHouseNo() != null)
					add = add + ap.getCurrentAddress().getHouseNo() + ", ";
				if (ap.getCurrentAddress().getHouseName() != null)
					add = add + ap.getCurrentAddress().getHouseName() + ", ";
				if (ap.getCurrentAddress().getBuildingNo() != null)
					add = add + ap.getCurrentAddress().getBuildingNo()
							+ ",<br>";
				if (ap.getCurrentAddress().getStreetName() != null)
					add = add + ap.getCurrentAddress().getStreetName() + ", ";
				if (ap.getCurrentAddress().getTownName() != null)
					add = add + ap.getCurrentAddress().getTownName() + ",<br>";
				if (ap.getCurrentAddress().getCityName() != null)
					add = add + ap.getCurrentAddress().getCityName() + ", ";
				if (ap.getCurrentAddress().getCountry() != null)
					add = add + ap.getCurrentAddress().getCountry() + ", ";
				if (ap.getCurrentAddress().getPostalCode() != null)
					add = add + ap.getCurrentAddress().getPostalCode();
		%> <%=add%> <%
 	}
 %>
		</td>
	</tr>


	<tr>
		<td><b>Previous Address</b></td>
		<td>
		<%
			if (ap.getPreviousAddress() == null) {
		%> Details not available <%
			} else {
				String add1 = "";
				if (ap.getPreviousAddress().getHouseNo() != null)
					add1 = add1 + ap.getPreviousAddress().getHouseNo() + ", ";
				if (ap.getPreviousAddress().getHouseName() != null)
					add1 = add1 + ap.getPreviousAddress().getHouseName() + ", ";
				if (ap.getPreviousAddress().getBuildingNo() != null)
					add1 = add1 + ap.getPreviousAddress().getBuildingNo()
							+ ",<br>";
				if (ap.getPreviousAddress().getStreetName() != null)
					add1 = add1 + ap.getPreviousAddress().getStreetName()
							+ ", ";
				if (ap.getPreviousAddress().getTownName() != null)
					add1 = add1 + ap.getPreviousAddress().getTownName()
							+ ",<br>";
				if (ap.getPreviousAddress().getCityName() != null)
					add1 = add1 + ap.getPreviousAddress().getCityName() + ", ";
				if (ap.getPreviousAddress().getCountry() != null)
					add1 = add1 + ap.getPreviousAddress().getCountry() + ", ";
				if (ap.getPreviousAddress().getPostalCode() != null)
					add1 = add1 + ap.getPreviousAddress().getPostalCode();
		%> <%=add1%> <%
 	}
 %>
		</td>
	</tr>


	<tr>
		<td><b>Contact Numbers <br> (Mobile) <br>(Home)<br>(Office)
		</b>
		</td>
		<td><br> <%
 	if (ap.getMobileContact() == null) {
 %> Details not available<br> <%
 	} else {
 		String mno = "";
 		mno = "+"+ap.getMobileContact().getCountryCode() + "-"
 				+ ap.getMobileContact().getAreaCode() + "-"
 				+ ap.getMobileContact().getContactNumber();
 %> <%=mno%><br> <%
 	}
 %> <%
 	if (ap.getHomeContact() == null) {
 %> Details not available<br> <%
 	} else {
 		String hno = "";
 		hno = "+"+ap.getHomeContact().getCountryCode() + "-"
 				+ ap.getHomeContact().getAreaCode() + "-"
 				+ ap.getHomeContact().getContactNumber();
 %> <%=hno%> <br>
		<%
			}
		%> <%
 	if (ap.getOfficeContact() == null) {
 %> Details not available <%
 	} else {
 		String hno = "";
 		hno = "+"+ap.getOfficeContact().getCountryCode() + "-"
 				+ ap.getOfficeContact().getAreaCode() + "-"
 				+ ap.getOfficeContact().getContactNumber();
 %> <%=hno%> <%
 	}
 %>
		
		</td>
	</tr>


	<tr>
		<td><b>Email ID</b></td>
		<td>
		<%
			if (ap.getEmail() == null) {
		%> Details not available <%
			} else {
		%> <%=ap.getEmail()%> <%
 	}
 %>
		</td>
	</tr>




<tr>
<td colspan="2" align="center" style="padding-left:40%;">
	<a
			href="../../NexusBankingGroup/AccountPartyManagementServlet?action=updateAccountPartyDetails&&id=<%=ap.getId()%>" style="background-color: #659AA6; color:#fff;	border: 4px solid #fff; padding-left:3px;padding-right:3px;display: block;
		float: left;
		width: auto; margin-right:5%;">Edit</a><a
			href="../../NexusBankingGroup/AccountPartyManagementServlet?action=deleteAccountParty&&id=<%=ap.getId()%>" id="mylink" onclick="return confirmDelete()" style="background-color: #659AA6; color:#fff;	border: 4px solid #fff; padding-left:3px;padding-right:3px;display: block;
		float: left;
		width: auto;">Delete</a>
</td>
</tr>



</table>

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
