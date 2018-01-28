<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

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
if(session.getAttribute("uid")==null)
{
 %>
<Script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</Script>
<% 
 
}
%>



<script  type="text/javascript" src="../js/javascript.js">

</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search Customer</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>

 

<body >

<script>
function BusinessTradingName()
{
	document.forms["searchForm"]["bn"].disabled=false;
	document.forms["searchForm"]["tn"].disabled=false;
	document.forms["searchForm"]["BN"].disabled=true;
	document.forms["searchForm"]["TN"].disabled=true;
	return 1;
}
function BranchTradingName()
{
document.forms["searchForm"]["BN"].disabled=false;
document.forms["searchForm"]["TN"].disabled=false;
document.forms["searchForm"]["bn"].disabled=true;
document.forms["searchForm"]["tn"].disabled=true;
return 2;

}

function AccountNumberOn()
{
	document.forms["searchForm"]["AN"].disabled=false;
	document.forms["searchForm"]["BN"].disabled=true;
	document.forms["searchForm"]["TN"].disabled=true;
	document.forms["searchForm"]["bn"].disabled=true;
	document.forms["searchForm"]["tn"].disabled=true;
	
	return true;
}


function validateForm()
{

	var a=document.forms["searchForm"]["bn"].value;
	var b=document.forms["searchForm"]["tn"].value;
	var c=document.forms["searchForm"]["BN"].value;
	var d=document.forms["searchForm"]["TN"].value;
	var e=document.forms["searchForm"]["AN"].value;
if(document.searchForm.bs[0].checked==true && document.searchForm.bs[1].checked==false && document.searchForm.bs[2].checked==false)
{
	if(a=="" || a==null ||b==""|| b==null)
	  {
	  alert("Please Enter Details");
	  return false;
	  }
}
if(document.searchForm.bs[0].checked==false && document.searchForm.bs[1].checked==true && document.searchForm.bs[2].checked==false )
{
		if(c==""||c==null||d==""||d==null){
		alert("Please Enter Details");
		return false;}
}
if(document.searchForm.bs[0].checked==false && document.searchForm.bs[1].checked==false && document.searchForm.bs[2].checked==true )
{
	if(e==""||e==null){
	alert("Please Enter Account Number Details");
	return false;}
}

if(document.searchForm.bs[0].checked==false && document.searchForm.bs[1].checked==false && document.searchForm.bs[2].checked==false)
{   alert("Please Enter Details");
	return false;
}
}
</script>
 
 
<%

System.out.println(session.getAttribute("LoggedUser"));


%>
<jsp:include page="../jsp/layout/Header.jsp" />

	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links </h3>
			<ul class="leftbox borderedlist">
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Generate Ticket">Create Helpdesk Ticket</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="Tickets">View Tickets</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
				

				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->

<form  name="searchForm"  action="/NexusBankingGroup/SearchCustomerServlet"  > 
<input type="hidden" name="action" value="searchCustomer"></input>
<center><font size="5pt" color=#8A3E08 align="center">Search Business Customer</font></center>
 <table id="gradient-style" align="center" style="margin-left: 300px" width="400px" >
<tr height="10"></tr>
<tr>
<td colspan="2"><font color="blue">Fields with <font color="red"><sup>*</sup> </font>mark are mandatory.</font></td>
</tr>
<tr height="10"></tr>
<tr>
<td>
<input type="radio" name="bs"  onchange="return BusinessTradingName();"></input><b>By Business Name and Branch Name </b>
</td>
</tr>
<tr>
<td align="right">Business Name<font color="red">*&nbsp;&nbsp;&nbsp;</font></td><td><input id=bn type="text" name="BusinessName" disabled="disabled"></input>

<label style="visibility:hidden; color:red; font-size:12px;" id="bsName"></label>


</td>
</tr>
    
<tr>
<td align="right">Branch Name<font color="red">*&nbsp;&nbsp;&nbsp;</font></td>
<td><input id=tn type="text" name="BranchName" disabled="disabled"/>

<label style="visibility:hidden; color:red; font-size:12px;" id="brName"></label>

</td>
</tr>

<tr>
<td>
<input type="radio" name="bs"  onchange="return BranchTradingName();"/><b>By Branch Name and Trading Name</b> 



</td>
</tr>
<tr>
<td align="right">Trading Name<font color="red">*&nbsp;&nbsp;&nbsp;</font></td><td><input id=BN type="text" name="TradingName" disabled="disabled"/>

<label style="visibility:hidden; color:red; font-size:12px;" id="trName"></label>
</td>
</tr>
<tr>
<td align="right">Branch Name<font color="red">*&nbsp;&nbsp;&nbsp;</font></td><td><input id=TN type="text" name="TbName" disabled="disabled"/>

<label style="visibility:hidden; color:red; font-size:12px;" id="tbrName"></label>
</td>
</tr>

<tr>
<td>
<input type="radio" name="bs"  onchange="return AccountNumberOn();"/><b>By Account Number</b>
</td>
</tr>
<tr>
<td align="right">Account Number<font color="red">*&nbsp;&nbsp;&nbsp;</font></td><td><input id=AN type="text" name="AccountNumber" disabled="disabled"/>
<label style="visibility:hidden; color:red; font-size:12px;" id="acNum"></label>
</td>
</tr>
<tr>

</tr>



</table>
<hr/>
<hr/>
<br></br>
   <p align="center">
    <input type="submit" style="background-color:black;  color:white" value="Search" onclick="return validateSearch();"></input>
    <input type="reset" style="background-color:black;  color:white" value="Reset"></input>
    </p>
    <br></br>
	
	



</form>
   	
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
