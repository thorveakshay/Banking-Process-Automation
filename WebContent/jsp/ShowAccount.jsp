 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page import="com.training.model.*"%>
 
<head>
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript">
function closeConfirm()
{

	var op= confirm("Are you sure you want to proceed ?");
	if(op==true)
	{
		alert("Account closed successfully");
		return true;
	}
	else
		return false;
}
</script>




<% 
if(session.getAttribute("uid")==null)
{
 %>
<Script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</Script>
<% 
 }
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Show Account Detail</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
</head>

 <%
 Account acc= new Account();
acc=(Account)request.getAttribute("accountobj");
 
 %>
 
 

<body >

 


<jsp:include page="../jsp/layout/Header.jsp" />
  
 
<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn" style="width: 240px;">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
							
			<li id="lft"><a  href="/NexusBankingGroup/GetCustServlet?action=getBranchList0" title="Change Account Title">Change Account Title</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">Switch to New Product</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList4" title="Update Business Customer Address">Update Business Customer Address</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Contact">Update Business Customer Contact</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList6" title="Account Party Management">Account Party Management</a></li>
		
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">Close Account</a></li>
		
				
			</ul>
			
			<hr />
		</div>
		<center>
		 <font size="4pt"  >
<p style="color:black ;margin-top:0px;font-family:verdana;"><font size="5pt">Account Details</font></p>
</font>
</center>
<br /> 
	
		<!-- main content area -->
 <font size="2pt"  >
<form    method="post" action="/NexusBankingGroup/AmendorSwitchProductServlet?action=closeAccount"> 
 <table id="gradient-style" align="center" style="margin-left: 100px; font-size:2pt;" width="600px" >


<input type="hidden" name="accno" value="<%= acc.getAccno()%>"> 
</input>
<input type="hidden" name="accid" value="<%= acc.getId()%>"> 
</input>
 
<tr>
	<td><font size="2pt"><b>Account Id</b></font></td>
     	<td><font size="2pt"><%=acc.getId() %></font></td>
</tr>
 
<tr>
	<td><font size="2pt"><b>Account Type</b></font></td>
	<td><font size="2pt"><%=acc.getAcctype()%></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Account Number</b></font></td>
	<td><font size="2pt"><%= acc.getAccno()%></font></td>
</tr>
<tr>
<td><font size="2pt"><b>Status</b></font></td>
<td><font size="2pt"><%=acc.getStatus() %></font>
</td>
</tr>

<tr>
<td><font size="2pt"><b>Account Opening Date</b></font></td>
<td><font size="2pt"><%=acc.getAod()%></font>
</td>

</tr>
<tr>
	<td width=200><font size="2pt"><b>Account Closing Date</b></font></td>
	<%if(acc.getAcd()!=null ){%>
	<td><font size="2pt"><%=acc.getAcd()%></font></td>
	<%} %>
	<%if(acc.getAcd()==null ){ %>
	<td><font size="2pt">N/A</font></td>
	<%} %>
</tr>
 
	 <tr>

			<td width=200><font size="2pt"><b>Account Title</b></font></td>
<td width=200><font size="2pt"><%=acc.getAcctitle() %></font> </td>
 
			 
</tr>
  

 

 

 
<tr>
<td><font size="2pt"><b>Branch Id</b></font></td>
<td><font size="2pt"><%=acc.getBranch() %></font></td>	

</tr>
</table>
<br>
<table align="center">
<tr>
 

<td colspan="2">
<center><input id="submit" type="submit" style="background-color:black;  color:white" id="submit" name="submit" value="Close Account" onclick="return closeConfirm()">

</input>
</center>
</td>
</tr>
 
 </table>
</form>
</font>
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
 