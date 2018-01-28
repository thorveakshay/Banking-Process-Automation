<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.AccountParty"%>
<%@page import="com.training.model.BusinessCustomer"%><html
	xmlns="http://www.w3.org/1999/xhtml">
<head>


<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
	if (request.getSession() == null
			|| request.getSession().getAttribute("uid") == null) {
		response.sendRedirect(request.getContextPath()
				+ "/jsp/index.jsp");
		return;
	}

	ArrayList<String> seqAns = (ArrayList<String>) session.getAttribute("seqans");
%>

<script type="text/javascript">
function goToHomePage()
{ 
	
	
	<%if (session.getAttribute("designation").toString().equals(
					"HELPDESK EMPLOYEE")) {%>
					window.location="/NexusBankingGroup/jsp/HomeTicket.jsp";
					//window.location="/NexusBankingGroup/jsp/ASPHome.jsp";
 
<%}%>
	<%if (session.getAttribute("designation").toString().equals(
					"RELATIONSHIP MANAGER")) {%>
	
 {
	window.location="/NexusBankingGroup/jsp/ASPHome.jsp";
	 
	}
	<%}%>

}	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Customer Verification</title>
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
	<script>
	/*
	 function call_servlet()
	 {
	 if(action.equals("Cancel"))
	 {
	
	 window.location="/NexusBankingGroup/AccountPartyListServlet";
	 }


	 return true;
	 
} */
</script>
</head>



<body>


<jsp:include page="../jsp/layout/Header.jsp" />

<!-- Start Header -->
<!-- Start Main Content -->

<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn" style="width: 240px">
<h3 class="leftbox">Quick Links</h3>
<ul class="leftbox borderedlist">

	<%
		if (session.getAttribute("designation").toString().equals(
				"HELPDESK EMPLOYEE")) {
	%>



	<li id="lft"><a
		href="/NexusBankingGroup/GetCustServlet?action=getBranchList3"
		title="Generate Ticket">Create Helpdesk Ticket</a></li>

	<li id="lft"><a
		href="<%=request.getContextPath()%>/jsp/Tickets.jsp"
		title="View Tickets">View Tickets</a></li>

	<li id="lft"><a
		href="/NexusBankingGroup/GetCustServlet?action=getBranchList7"
		title="Customer Details">Customer Details</a></li>
	<li id="lft"><a
		href="<%=request.getContextPath()%>/jsp/SearchAccount.jsp"
		title="Account Details">Account Details</a></li>


	<%
		}
	%>

	<%
		if (session.getAttribute("designation").toString().equals(
				"RELATIONSHIP MANAGER")) {
	%>
	<li id="lft"><a
		href="/NexusBankingGroup/GetCustServlet?action=getBranchList0"
		title="Change Account Title">Change Account Title</a></li>
	<li id="lft"><a
		href="/NexusBankingGroup/GetCustServlet?action=getBranchList2"
		title="Switch To New Product">Switch to New Product</a></li>
	<li id="lft"><a
		href="/NexusBankingGroup/GetCustServlet?action=getBranchList4"
		title="Update Business Customer Address">Update Business Customer
	Address</a></li>
	<li id="lft"><a
		href="/NexusBankingGroup/GetCustServlet?action=getBranchList5"
		title="Update Business Customer Contact">Update Business Customer
	Contact</a></li>
	<li id="lft"><a
		href="/NexusBankingGroup/jsp/AccountPartyManagementHome.jsp"
		title="Account Party Management">Account Party Management</a></li>

	<li id="lft"><a
		href="/NexusBankingGroup/GetCustServlet?action=getBranchList1"
		title="Close Account">Close Account</a></li>

	<%
		}
	%>






</ul>

<hr />
</div>

<!-- main content area --> <%

ArrayList<String> seqQue = new ArrayList<String>();
seqQue = (ArrayList<String>) session.getAttribute("seqQue");

 	String acc_Party = (String) session.getAttribute("AccPartyName");
 	String accpId = (String) session.getAttribute("accPartyID");
 	String busname = (String) session.getAttribute("busName");
 	String brname = (String) session.getAttribute("branchName");
 	Long busId = (Long) session.getAttribute("busId");

 
 	

 
 	String relationshipType = (String) session
 			.getAttribute("relationshipType");
   
	
 
 	String msg = (String) request.getAttribute("msg");
 	  
  
 %>



<form name="f1"
	action="/NexusBankingGroup/VerifyCustomerServlet" method="post">
	<%if(msg!=null){ %>
	<center><font color = red size = "4pt"><%=msg %> </font></center><br/>
	<%}%>
<center><font color=black size="5pt">Customer
Verification</font></center>
<br />
<%
	if (seqAns.size() == 0) {
%>

<table align="center" border"1" width="580">
	<tr>
		<td colspan="3" align="center"><font color="black"> <font
			size="4pt" color="red">Failed to Verify.No Question has been
		Found in the Database. </font></font></td>
	</tr>
</table>
<%
	}
%>
<table id="gradient-style" align="center" border"1" width="580">
	<tr>
		<td colspan="3" align="left"><font color="black">Fields
		marked with <font color="red"><sup>*</sup> </font>are mandatory.</font></td>
	</tr>

	<tr>

		<input type="hidden" name="action" value="verifyCustomer"></input>

		<%
			if (seqAns.size() == 1) {
		%>
		<input type="hidden" name="answer" value="<%=seqAns.get(0)%>"></input>
		<%
			}
		%>

		<%
			if (seqAns.size() == 2) {
		%>

		<%
			}
		%>


	</tr>

	<tr>

		<input type="hidden" name="accountPartyID" value="<%=accpId%>"></input>
		<input type="hidden" name="busid" value="<%=busId%>"></input>
		<input type="hidden" name="busname" value="<%=busname%>"></input>
		<input type="hidden" name="accpName" value="<%=acc_Party%>"></input>
		<input type="hidden" name="relationshipType"
			value="<%=relationshipType %>"></input>
		<input type="hidden" name="brname" value="<%=brname%>"></input>

	</tr>








	<tr>
		<td width="50%"><font size="2pt"><b>Business Customer
		Id</b></font></td>
		<td><font size="2pt"><%=busId%></font></td>
	</tr>
	<td><font size="2pt"><b>Business Name</b></font></td>
	<td><font size="2pt"><%=busname%></font></td>
	</tr>

	<tr>
		<td><font size="2pt"><b>Branch</b></font></td>
		<td><font size="2pt"> <%=brname%></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Account Party</b></font></td>
		<td><font size="2pt"> <%=acc_Party%></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Relationship with
		Business Customer</b></font></td>
		<td><font size="2pt"><%=relationshipType%></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Account Party Id</b></font></td>
		<td><font size="2pt"><%=accpId%></font></td>
	</tr>
	<%
		if (seqQue.size() == 0) {
	%>
	<table align="center" style="margin-top: 10px">
		<tr>
			<td><input type="button" style=" background-color: black; color: white" value="Close"	onclick=" return goToHomePage()"></input></td>
		</tr>
	</table>
	<%
		}
	%>
	<%
		if (seqQue.size() == 1) {
	%>
	<tr>
		<td><font size="2pt"><b>Security Question</b></font></td>
		<td><font size="2pt"><%=seqQue.get(0)%></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Security Answer<font
			color="red">&nbsp;*</font></b></font></td>
		<td><font size="2pt"> <input type="password" name="seqans" title="Please enter Security Answer."/>
		<label style="visibility: hidden; color: red; font-size: 12px;"
			id="fillAns"></label> </font></td>
	</tr>
	<%
		}
	%>

	<%
		if (seqQue.size() == 2) {
	%>
	<tr>
		<td><font size="2pt"><b>Security Question 1</b></font></td>
		<td><font size="2pt"><%=seqQue.get(0)%></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Security Answer<font
			color="red">&nbsp;*</font></b></font></td>
		<td><font size="2pt"> <input type="password" name="seqans" title="Please enter Security Answer."/>
		<label style="visibility: hidden; color: red; font-size: 12px;"
			id="fillAns"></label> </font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Security Question 2</b></font></td>
		<td><font size="2pt"><%=seqQue.get(1)%></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Security Answer<font
			color="red">&nbsp;*</font></b></font></td>
		<td><font size="2pt"> <input type="password"
			name="seqans1" title="Please enter Security Answer."/> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			id="fillAns1"></label> </font></td>
	</tr>

	<%
		}
	%>


</table>
<%
	if (seqAns.size() != 0) {
%>

<table name="click" align="center" style="margin-left: 160pt;">
	<tr height="100">
	<td>
<center>	
<input type="submit" style="background-color: black; color: white;" onclick="return checkAnswer()" value="Verify" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center>
		</td>
		<td><input type="submit" style="background-color: black; color: white" value="reset" onclick="return validateReset();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>


	</tr>





</table>
<%
	}
%>

</form>

<!-- Start Footer --></div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
