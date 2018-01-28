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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function BusinessBranchName()
{
	document.forms["searchForm"]["bn"].disabled=false;
	document.forms["searchForm"]["tn"].disabled=false;
	document.forms["searchForm"]["BN"].disabled=true;
	document.forms["searchForm"]["TN"].disabled=true;
	
return true;	
}
function BranchTradingName()
{
	document.forms["searchForm"]["BN"].disabled=false;
	document.forms["searchForm"]["TN"].disabled=false;
	document.forms["searchForm"]["bn"].disabled=true;
	document.forms["searchForm"]["tn"].disabled=true;
	
return true;
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
	if(a=="" || a==null )
	  {
	  alert("Please Enter Business Name");
	  return false;
	  }
	  if(b==0|| b==null){
		alert("Please select Branch Name");
		return false;
		  }
}
if(document.searchForm.bs[0].checked==false && document.searchForm.bs[1].checked==true && document.searchForm.bs[2].checked==false)
{
		if(d==""||d==null){
		alert("Please Enter Trading Name ");
		return false;}
		if(c==0||c==null)
		{
		alert("Please select Branch Name");
		return false;

			}
}
if(document.searchForm.bs[0].checked==false && document.searchForm.bs[1].checked==false && document.searchForm.bs[2].checked==true)
{
var number=/^[0-9]+$/
var num=/^[1-9][0-9]+$/
		if(e==""||e==null){
		alert("Please Enter Account Number");
		return false;}

		if(e.match(number))
		{
			if(e.length!=14){
				alert("Please enter 14 digit account number");
				return false;
				}
			}
		else{
			alert("Please Enter Numbers only");return false;
		}
		
}


if(document.searchForm.bs[0].checked==false && document.searchForm.bs[1].checked==false && document.searchForm.bs[2].checked==false)
{   alert("Please Select one option to search");
	return false;
}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Business Customer</title>

<link href=  "<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<style>
table
{
padding-top:10px;
padding-top:10px;
padding-top:10px;
padding-top:10px;
}
td
{
padding-top:10px;
padding-top:10px;
padding-top:10px;
padding-top:10px;
}
</style>

</head>
<body>
<jsp:include page="layout/Header.jsp"/>


	<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="/Layout/BusinessCustOperationsMenu.jsp"/>
	<div id="center">
	<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Search Business Customer</p><br/></br>
				 	</div>
	
	
<form name="searchForm" action="/NexusBankingGroup/CustomerManagementServlet" method="post" onSubmit="return validateForm()">
<input type="hidden" name="action" value="SearchCustomer"></input>
<table align="left" style="font-size:12px">
<tr>
<td><font color="red">Fields marked with * are mandatory</font></td>
</tr>
	<tr>
<td>
<input type="radio" name="bs"  onchange="return BusinessBranchName();"><font size="2px">Search by Business Name and Branch Name </font>
</td>
</tr>
<tr>
<td style="padding-left:30px">Business Name<font color="red">*</font></td><td><input id=bn type="text" name="BusinessName" disabled="disabled"></td>
</tr>
<tr>
<td style="padding-left:30px">Bank Branch Name<font color="red">*</font></td>
<td>
<SELECT id="tn" name="BranchName" disabled="disabled">
<OPTION VALUE=0>Please Select</OPTION>
<OPTION VALUE="Bristol">Bristol</OPTION>
<OPTION VALUE="Cardiff">Cardiff</OPTION>
<OPTION VALUE="Dover">Dover</OPTION>
<OPTION VALUE="Liverpool">Liverpool</OPTION>
<OPTION VALUE="London">London</OPTION>
<OPTION VALUE="Manchester">Manchester</OPTION>
<OPTION VALUE="Middlesbrough">Middlesbrough</OPTION>
<OPTION VALUE="Newcastle">Newcastle</OPTION>
</select>
</td>
</tr> 


<tr>
<td>
<input type="radio" name="bs"  onchange="return BranchTradingName();"><font size="2px">Search by Trading Name and Branch Name</font>
</td>
</tr>
<tr>
<td style="padding-left:30px">Trading Name<font color="red">*</font></td><td><input id=TN type="text" name="TradingName" disabled="disabled"></td>
</tr>
<tr>
<td style="padding-left:30px">Bank Branch Name<font color="red">*</font></td>
<td>
<SELECT id="BN" name="BranchName" disabled="disabled">
<OPTION VALUE=0>Please Select</OPTION>
<OPTION VALUE="Bristol">Bristol</OPTION>
<OPTION VALUE="Cardiff">Cardiff</OPTION>
<OPTION VALUE="Dover">Dover</OPTION>
<OPTION VALUE="Liverpool">Liverpool</OPTION>
<OPTION VALUE="London">London</OPTION>
<OPTION VALUE="Manchester">Manchester</OPTION>
<OPTION VALUE="Middlesbrough">Middlesbrough</OPTION>
<OPTION VALUE="Newcastle">Newcastle</OPTION>
</select>
</td>
</tr>


<tr>
<td>
<input type="radio" name="bs"  onchange="return AccountNumberOn();">Search by Account Number
</td>
</tr>
<tr>
<td style="padding-left:30px">Account Number<font color="red">*</font></td>
<td><input id=AN type="text" name="AccountNumber" disabled="disabled"></td>
</tr>


<tr>
<td style="padding-left: 180px;">
   <br><input type="submit" value="Search" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;"></input>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="Reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;"></input>
</td>
</tr>
</table>
</form>
</div>
</div>
</div>
<jsp:include page="/Layout/Footer.jsp"/>
</body>
</html>