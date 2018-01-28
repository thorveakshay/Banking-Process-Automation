<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Basic Detail of Personal Party</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />

<%@page import="com.training.model.*"%>

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
	AccountParty ap = new AccountParty();
	ap = (AccountParty) request.getAttribute("ap");
%>

 
</head>
<body>

<jsp:include page="../jsp/layout/Header.jsp" />
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Account Party</h3>
<ul class="leftbox borderedlist">
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=addAccountParty">Add
	Account Party</a></li>
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=viewAccountParty&&pageNumber=1">View
	Account Party</a></li>

</ul>

</div>
<!-- main content area -->
<center><font color="black" size="5pt" style="text-align:center;">
Account Party Details</font></center>

<div id="center">
<div class="article_wrapper">

 
<table id="gradient-style" align="left" style="margin-left:50px; margin-top:30px  " width="600" >
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
		<td width="50%"><font size="2pt"><b>Name</b></font></td>
		<td><font size="2pt"><%=fullname%></font></td>
	</tr>

	<tr>
		<td><font size="2pt"><b>Date of Birth</b></font></td>
		<td><font size="2pt"><%=ap.getDob()%></font></td>
	</tr>

	<tr>
		<td><font size="2pt"><b>Relationship with the Business</b></font></td>
		<td><font size="2pt"><%=ap.getRelationship()%></font></td>
	</tr>

	<tr>
		<td><font size="2pt"><b>Key Party</b></font></td>
		<td><font size="2pt"><%=ap.getIsKeyParty()%></font></td>
	</tr>


	<tr>
		<td><font size="2pt"><b>Current Address</b></font></td>
		<td><font size="2pt">
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
		</font></td>
	</tr>


	<tr>
		<td><font size="2pt"><b>Previous Address</b></font></td>
		<td><font size="2pt">
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
		</font></td>
	</tr>


	<tr>
		<td><font size="2pt"><b>Contact Numbers </b><br> (Mobile) <br>(Home)<br>(Office)</font>
		
		</td>
		<td><br/> <font size="2pt"><%
 	if (ap.getMobileContact() == null) {
 %> Details not available<br> <%
 	} else {
 		String mno = "";
 		mno = ap.getMobileContact().getCountryCode() + "-"
 				+ ap.getMobileContact().getAreaCode() + "-"
 				+ ap.getMobileContact().getContactNumber();
 %> <%=mno%><br> <%
 	}
 %> <%
 	if (ap.getHomeContact() == null) {
 %> Details not available<br> <%
 	} else {
 		String hno = "";
 		hno = ap.getHomeContact().getCountryCode() + "-"
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
 		hno = ap.getOfficeContact().getCountryCode() + "-"
 				+ ap.getOfficeContact().getAreaCode() + "-"
 				+ ap.getOfficeContact().getContactNumber();
 %> <%=hno%> <%
 	}
 %>
		
	</font>	</td>
	</tr>


	<tr>
		<td><font size="2pt"><b>Email ID</b></font></td>
		<td><font size="2pt">
		<%
			if (ap.getEmail() == null) {
		%> Details not available <%
			} else {
		%> <%=ap.getEmail()%> <%
 	}
 %>
	</font>	</td>
	</tr>







</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->
 
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
