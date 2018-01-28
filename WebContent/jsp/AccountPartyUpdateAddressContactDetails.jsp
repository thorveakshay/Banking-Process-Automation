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
<style>
td {
	font-size: 12px;
}


table {
	margin-top: 20px;
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
<script type="text/javascript">

function confirmLoad()
{
	return confirm("All the details of the form will be lost. Are you sure you want to navigate away from the page?");
}
function ischarinbag(string,bag)
{
 var i;

 for(i=0;i<string.length;i++)
 {
        var charval=string.charAt(i);
	if(bag.indexOf(charval)==-1)
	return 0;
 }
 return 1;
}	
function validateForm()
{


	 if(document.getElementsByName("hno")[0].value==0 || document.getElementsByName("hno")[0].value=="null")
	 {
		  document.getElementById('label').style.visibility="visible";
		  document.getElementById('label').innerHTML="&nbsp;Please enter the House Number.";
	
		document.getElementsByName("hno")[0].value="";
		document.getElementsByName("hno")[0].focus();
		return false;
	 }
	 else
	 {
		 document.getElementById('label').innerHTML="";
	 }
	 if (document.getElementsByName("hno")[0].value.charAt(0)==" ")
	 	{
		 document.getElementById('label').style.visibility="visible";
	 		document.getElementById("hNo").innerHTML=" should not start with blank space"; 
	 		document.getElementsByName("hno")[0].focus();
	 		document.getElementsByName("hno")[0].value="";
	 		return false;
	 	}

var val=ischarinbag(document.getElementsByName("hno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- /");

if(val==0)
{
		document.getElementById('label').style.visibility="visible";
		document.getElementById("label").innerHTML="Only alphanumeric data & some special characters like  -  _  / are allowed"; 
		document.getElementsByName("hno")[0].focus();
		document.getElementsByName("hno")[0].value="";
return false;
		}
else
{
	 document.getElementById('label').innerHTML="";
}

if(document.getElementsByName("bno")[0].value==0 || document.getElementsByName("bno")[0].value=="null")
{
	  document.getElementById('label1').style.visibility="visible";
	  document.getElementById('label1').innerHTML="&nbsp;Please enter the Building Number.";

	document.getElementsByName("bno")[0].value="";
	document.getElementsByName("bno")[0].focus();
	return false;
}

else
{
	document.getElementById('label1').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("bno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- "))
{
	 document.getElementById('label1').style.visibility="visible";
	document.getElementById("label1").innerHTML="Only alphanumeric data & some special characters like  - and space are allowed"; 
	document.getElementsByName("bno")[0].focus();
	document.getElementsByName("bno")[0].value="";
	return false;
}

else
{
	document.getElementById('label1').innerHTML="";
}

if(document.getElementsByName("sname")[0].value==0 || document.getElementsByName("sname")[0].value=="null")
{
	  document.getElementById('street').style.visibility="visible";
	  document.getElementById('street').innerHTML="&nbsp;Please enter the Street name.";

	document.getElementsByName("sname")[0].value="";
	document.getElementsByName("sname")[0].focus();
	return false;
}
else
{
	document.getElementById('street').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("sname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- "))
{
	 document.getElementById('street').style.visibility="visible";
	document.getElementById("street").innerHTML="Only alphanumeric data & some special characters like  - and space are allowed"; 
	document.getElementsByName("sname")[0].focus();
	document.getElementsByName("sname")[0].value="";
	return false;
}
else
{
	document.getElementById('street').innerHTML="";
}

if(document.getElementsByName("cname")[0].value==0 || document.getElementsByName("cname")[0].value=="null")
{
	  document.getElementById('city').style.visibility="visible";
	  document.getElementById('city').innerHTML="&nbsp;Please enter the City name.";

	document.getElementsByName("cname")[0].value="";
	document.getElementsByName("cname")[0].focus();
	return false;
}
else
{
	document.getElementById('city').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("cname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('city').style.visibility="visible";
	document.getElementById("city").innerHTML="Only alphabets are allowed."; 
	document.getElementsByName("cname")[0].focus();
	document.getElementsByName("cname")[0].value="";
	return false;
}

else
{
	document.getElementById("city").innerHTML=""; 
}

if(!ischarinbag(document.getElementsByName("tname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('label5').style.visibility="visible";
	document.getElementById("label5").innerHTML="Only alphabets and space is allowed."; 
	document.getElementsByName("tname")[0].focus();
	document.getElementsByName("tname")[0].value="";
	return false;
}
else
{
	document.getElementById("label5").innerHTML=""; 
}

if(document.getElementsByName("country")[0].value=="")
{

	document.getElementById('label3').style.visibility="visible";
	  document.getElementById('label3').innerHTML="&nbsp;Please select Country Name.";

	document.getElementsByName("country")[0].focus();
	document.getElementsByName("country")[0].value="";
return false;
}
else
{
	document.getElementById('label3').innerHTML="";
}
if(document.getElementsByName("pcode")[0].value==0 || document.getElementsByName("pcode")[0].value=="null")
{
	  document.getElementById('label4').style.visibility="visible";
	  document.getElementById('label4').innerHTML="&nbsp;Please enter the Postalcode.";

	document.getElementsByName("pcode")[0].value="";
	document.getElementsByName("pcode")[0].focus();
	return false;
}

else
{
	document.getElementById('label4').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("pcode")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_/- "))
{
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Only alphanumeric values and some special symbols like _ / - and space are allowed."; 
	document.getElementsByName("pcode")[0].focus();
	document.getElementsByName("pcode")[0].value="";
	return false;
}
else
{
	document.getElementById("label4").innerHTML="";	
}

if(document.forms["myForm"]["email"].value==0)
{
	document.getElementById('emailVal').style.visibility="visible";
	  document.getElementById('emailVal').innerHTML="&nbsp;Please enter the email address.";

	document.getElementsByName("email")[0].value="";
	document.getElementsByName("email")[0].focus();
	return false;
}

	
var x=document.forms["myForm"]["email"].value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || (dotpos+2)>=x.length)
  {
	  document.getElementById('emailVal').style.visibility="visible";
	  document.getElementById('emailVal').innerHTML="&nbsp;Not a valid e-mail address";
  return false;
  }
else
{
	  document.getElementById('emailVal').innerHTML="";
}

if(document.getElementsByName("mCountryCode")[0].value=="" || document.getElementsByName("mCountryCode")[0].value==0 )
{
	document.getElementById('cCode').style.visibility="visible";
	  document.getElementById('cCode').innerHTML="&nbsp;Please enter the country code.";

	document.getElementsByName("mCountryCode")[0].value="";
	document.getElementsByName("mCountryCode")[0].focus();
	return false;
}
else
{
	document.getElementById('cCode').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("mCountryCode")[0].value,"0123456789"))
{
	document.getElementById('cCode').style.visibility="visible";
	  document.getElementById('cCode').innerHTML="&nbsp;Country code can contain only numbers.";

	document.getElementsByName("mCountryCode")[0].value="";
	document.getElementsByName("mCountryCode")[0].focus();
	return false;
	
}
else
{
	document.getElementById('cCode').innerHTML="";
}

if(document.getElementById("mCountryCode").value.length>4)
{

	document.getElementById('cCode').style.visibility="visible";
document.getElementById('cCode').innerHTML="&nbsp;Country code should consist of less than 5 digits.";

document.getElementsByName("mCountryCode")[0].value="";
document.getElementsByName("mCountryCode")[0].focus();
return false;

}
else
{
	document.getElementById('cCode').innerHTML="";
}



if(document.getElementsByName("mAreaCode")[0].value=="" || document.getElementsByName("mAreaCode")[0].value==0)
{
	document.getElementById('aCode').style.visibility="visible";
	  document.getElementById('aCode').innerHTML="&nbsp;Please enter the area code.";

	document.getElementsByName("mAreaCode")[0].value="";
	document.getElementsByName("mAreaCode")[0].focus();
	return false;
}
else
{
	document.getElementById('aCode').innerHTML="";
	}

if(!ischarinbag(document.getElementsByName("mAreaCode")[0].value,"0123456789"))
{
	document.getElementById('aCode').style.visibility="visible";
	  document.getElementById('aCode').innerHTML="&nbsp;Area code can contain only numbers.";

	document.getElementsByName("mAreaCode")[0].value="";
	document.getElementsByName("mAreaCode")[0].focus();
	return false;
	
}
else
{
	document.getElementById('aCode').innerHTML="";
	}

if(document.getElementById("mAreaCode").value.length>6)
{

	document.getElementById('aCode').style.visibility="visible";
document.getElementById('aCode').innerHTML="&nbsp;Contact number can contain only 6 digits.";

document.getElementsByName("mAreaCode")[0].value="";
document.getElementsByName("mAreaCode")[0].focus();
return false;

}
else
{
	document.getElementById('aCode').innerHTML="";
}


if(document.getElementsByName("mNumber")[0].value=="" || document.getElementsByName("mNumber")[0].value==0)
{
	document.getElementById('mNum').style.visibility="visible";
	  document.getElementById('mNum').innerHTML="&nbsp;Please enter the Mobile number.";

	document.getElementsByName("mNumber")[0].value="";
	document.getElementsByName("mNumber")[0].focus();
	return false;
}
else
{
	document.getElementById('mNum').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("mNumber")[0].value,"0123456789"))
{
	document.getElementById('mNum').style.visibility="visible";
	  document.getElementById('mNum').innerHTML="&nbsp;Mobile number can contain only numbers.";

	document.getElementsByName("mNumber")[0].value="";
	document.getElementsByName("mNumber")[0].focus();
	return false;
	
}
else
{
	document.getElementById('mNum').innerHTML="";
}

if(document.getElementById("mNumber").value.length>10)
{

	document.getElementById('mNum').style.visibility="visible";
document.getElementById('mNum').innerHTML="&nbsp;Mobile number can contain only 10 digits.";

document.getElementsByName("mNumber")[0].value="";
document.getElementsByName("mNumber")[0].focus();
return false;

}
else
{
	document.getElementById('mNum').innerHTML="";
}

//2nd option



if(document.getElementsByName("hCountryCode")[0].value=="" || document.getElementsByName("hCountryCode")[0].value==0)
{
	document.getElementById('cCode2').style.visibility="visible";
	  document.getElementById('cCode2').innerHTML="&nbsp;Please enter the country code.";

	document.getElementsByName("hCountryCode")[0].value="";
	document.getElementsByName("hCountryCode")[0].focus();
	return false;
}
else
{
	document.getElementById('cCode2').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("hCountryCode")[0].value,"0123456789"))
{
	document.getElementById('cCode2').style.visibility="visible";
	  document.getElementById('cCode2').innerHTML="&nbsp;Country code can contain only numbers.";

	document.getElementsByName("hCountryCode")[0].value="";
	document.getElementsByName("hCountryCode")[0].focus();
	return false;
	
}
else
{
	document.getElementById('cCode2').innerHTML="";
}

if(document.getElementById("hCountryCode").value.length>6)
{

	document.getElementById('cCode2').style.visibility="visible";
document.getElementById('cCode2').innerHTML="&nbsp;Country code can contain only 6 digits.";

document.getElementsByName("hCountryCode")[0].value="";
document.getElementsByName("hCountryCode")[0].focus();
return false;

}
else
{
	document.getElementById('cCode2').innerHTML="";
	}


if(document.getElementsByName("hAreaCode")[0].value=="" || document.getElementsByName("hAreaCode")[0].value==0)
{
	document.getElementById('aCode2').style.visibility="visible";
	  document.getElementById('aCode2').innerHTML="&nbsp;Please enter the area code.";

	document.getElementsByName("hAreaCode")[0].value="";
	document.getElementsByName("hAreaCode")[0].focus();
	return false;
}

else
{
	document.getElementById('aCode2').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("hAreaCode")[0].value,"0123456789"))
{
	document.getElementById('aCode2').style.visibility="visible";
	  document.getElementById('aCode2').innerHTML="&nbsp;Area code can contain only numbers.";

	document.getElementsByName("hAreaCode")[0].value="";
	document.getElementsByName("hAreaCode")[0].focus();
	return false;
	
}
else
{
	 document.getElementById('aCode2').innerHTML="";
	
	}

if(document.getElementById("hAreaCode").value.length>6)
{

	document.getElementById('aCode2').style.visibility="visible";
document.getElementById('aCode2').innerHTML="&nbsp;Area code can contain only 6 digits.";

document.getElementsByName("hAreaCode")[0].value="";
document.getElementsByName("hAreaCode")[0].focus();
return false;

}
else
{
	document.getElementById('aCode2').innerHTML="";
}

if(document.getElementsByName("hNumber")[0].value=="" || document.getElementsByName("hNumber")[0].value==0)
{
	document.getElementById('mNum2').style.visibility="visible";
	  document.getElementById('mNum2').innerHTML="&nbsp;Please enter the Mobile number.";

	document.getElementsByName("hNumber")[0].value="";
	document.getElementsByName("hNumber")[0].focus();
	return false;
}
else
{
	document.getElementById('mNum2').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("hNumber")[0].value,"0123456789"))
{
	document.getElementById('mNum2').style.visibility="visible";
	  document.getElementById('mNum2').innerHTML="&nbsp;Mobile number can contain only numbers.";

	document.getElementsByName("hNumber")[0].value="";
	document.getElementsByName("hNumber")[0].focus();
	return false;
	
}
else
{
	document.getElementById('mNum2').innerHTML="";
}

if(document.getElementById("hNumber").value.length>10)
{

	document.getElementById('mNum2').style.visibility="visible";
document.getElementById('mNum2').innerHTML="&nbsp;Mobile number can contain only 10 digits.";

document.getElementsByName("hNumber")[0].value="";
document.getElementsByName("hNumber")[0].focus();
return false;

}
else
{
	document.getElementById('mNum2').innerHTML="";
}

//3rd option




if(document.getElementsByName("oCountryCode")[0].value=="" || document.getElementsByName("oCountryCode")[0].value==0)
{
	document.getElementById('cCode3').style.visibility="visible";
	  document.getElementById('cCode3').innerHTML="&nbsp;Please enter the country code.";

	document.getElementsByName("oCountryCode")[0].value="";
	document.getElementsByName("oCountryCode")[0].focus();
	return false;
}
else
{
	document.getElementById('cCode3').innerHTML="";	
}

if(!ischarinbag(document.getElementsByName("oCountryCode")[0].value,"0123456789"))
{
	document.getElementById('cCode3').style.visibility="visible";
	  document.getElementById('cCode3').innerHTML="&nbsp;Country code can contain only numbers.";

	document.getElementsByName("oCountryCode")[0].value="";
	document.getElementsByName("oCountryCode")[0].focus();
	return false;
	
}

else
{
	document.getElementById('cCode3').innerHTML="";
}

if(document.getElementById("oCountryCode").value.length>6)
{

	document.getElementById('cCode3').style.visibility="visible";
document.getElementById('cCode3').innerHTML="&nbsp;Country code can contain only 6 digits.";

document.getElementsByName("oCountryCode")[0].value="";
document.getElementsByName("oCountryCode")[0].focus();
return false;

}
else
{
	document.getElementById('cCode3').innerHTML="";
}


if(document.getElementsByName("oAreaCode")[0].value=="" || document.getElementsByName("oAreaCode")[0].value==0)
{
	document.getElementById('aCode3').style.visibility="visible";
	  document.getElementById('aCode3').innerHTML="&nbsp;Please enter the area code.";

	document.getElementsByName("oAreaCode")[0].value="";
	document.getElementsByName("oAreaCode")[0].focus();
	return false;
}

else
{
	document.getElementById('aCode3').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("oAreaCode")[0].value,"0123456789"))
{
	document.getElementById('aCode3').style.visibility="visible";
	  document.getElementById('aCode3').innerHTML="&nbsp;Area code can contain only numbers.";

	document.getElementsByName("oAreaCode")[0].value="";
	document.getElementsByName("oAreaCode")[0].focus();
	return false;
	
}

else
{
	document.getElementById('aCode3').innerHTML="";
}

if(document.getElementById("oAreaCode").value.length>6)
{

	document.getElementById('aCode3').style.visibility="visible";
document.getElementById('aCode3').innerHTML="&nbsp;Area code can contain only 6 digits.";

document.getElementsByName("oAreaCode")[0].value="";
document.getElementsByName("oAreaCode")[0].focus();
return false;

}

else
{
	document.getElementById('aCode3').innerHTML="";
}

if(document.getElementsByName("oNumber")[0].value=="" || document.getElementsByName("hNumber")[0].value==0)
{
	document.getElementById('mNum3').style.visibility="visible";
	  document.getElementById('mNum3').innerHTML="&nbsp;Please enter the Mobile number.";

	document.getElementsByName("oNumber")[0].value="";
	document.getElementsByName("oNumber")[0].focus();
	return false;
}

else
{
	document.getElementById('mNum3').innerHTML="";
	}
if(!ischarinbag(document.getElementsByName("oNumber")[0].value,"0123456789"))
{
	document.getElementById('mNum3').style.visibility="visible";
	  document.getElementById('mNum3').innerHTML="&nbsp;Mobile number can contain only numbers.";

	document.getElementsByName("oNumber")[0].value="";
	document.getElementsByName("oNumber")[0].focus();
	return false;
	
}

if(document.getElementById("oNumber").value.length>10)
{

	document.getElementById('mNum3').style.visibility="visible";
document.getElementById('mNum3').innerHTML="&nbsp;Mobile number can contain only 10 digits.";

document.getElementsByName("oNumber")[0].value="";
document.getElementsByName("oNumber")[0].focus();
return false;

}
else
{
	document.getElementById('mNum3').innerHTML="";
	}




return true;
}


</script>
</head>
<body>
<jsp:include page="/Layout/Header.jsp" />
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Account Party</h3>
<ul class="leftbox borderedlist">
	<li><a href="<%=request.getContextPath() %>/jsp/AccountOpenerHome.jsp" title="Home" onclick="return confirmLoad()">Home</a></li>
		<li><a href="<%=request.getContextPath() %>/jsp/SearchBusinessCustomer.jsp" title="Search"  onclick="return confirmLoad()">Search Business Customer</a></li>
	<li><a
		href="../../NexusBankingGroup/AccountPartyManagementServlet?action=addAccountParty&&id=<%=session.getAttribute("npid") %>"  onclick="return confirmLoad()">Add
	Account Party</a></li>
	<li><a
		href="../../NexusBankingGroup/AccountPartyManagementServlet?action=viewAccountParty&&id=<%=session.getAttribute("npid") %>"  onclick="return confirmLoad()">View
	Account Party</a></li>

</ul>

</div>
<!-- main content area -->
<div id="center" style="margin-left: 0px;">
<div class="article_wrapper">
<div
	style="color: white; background-color: #5599a7; height: 35px; width: 900px">
<p
	style="font-size: 20px; padding-left: 10px; padding-top: 5px; padding-bottom: 5px">UPDATE
ACCOUNT PARTY DETAILS</p>
<br />
</div>

<form
	action="<%=request.getContextPath() %>/AccountPartyManagementServlet"
	method="post" name="myForm"><input type="hidden" name="action"
	value="updateAccountParty2"></input>

<table width="800px" border="0">
<tr>
			<td colspan="5"><font color="red">Fields marked with * are mandatory</font></td>
			</tr>
<%if(ap.getPreviousAddress()!=null)
	{
	%>
	<tr>
		<td colspan="2" style="color: gray; font-size: 12px">Previous
		Address Details :</td>
	</tr>
	<tr>
		<td width="20%">House No<font color="red">*</font></td>
		<td colspan="3" width=40%><input name="hno" type="text" id="hno" size="20"
			 
			value="<%=ap.getPreviousAddress().getHouseNo() %>" /></td>
		<td width="30%" ><label
			style="visibility: hidden; color: red; font-size: 12px;" name="label"
			id="label"></label></td>
	</tr>
	<tr>
		<td>House Name</td>
		<td colspan="3" width="20%"><input name="hname" type="text" id="hname"
			size="20"  
			<%if(ap.getPreviousAddress().getHouseName()!=null){ %>
			value="<%=ap.getPreviousAddress().getHouseName() %>" <%} %> /></td>
	</tr>
	<tr>
		<td>Building No<font color="red">*</font></td>
		<td colspan="3"><input name="bno" type="text" id="bno" size="20"
			 
			value="<%=ap.getPreviousAddress().getBuildingNo() %>" /></td>
		<td><label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="label1" id="label1"></label></td>
	</tr>

	<tr>
		<td>Street Name<font color="red">*</font></td>
		<td colspan="3"><input name="sname" type="text" id="sname"
			size="20"  
			value="<%=ap.getPreviousAddress().getStreetName() %>" /></td>
		<td><label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="street" id="street"></label></td>
	</tr>
	<tr>
		<td>City Name<font color="red">*</font></td>
		<td colspan="3"><input name="cname" type="text" id="cname"
			size="20"  
			value="<%=ap.getPreviousAddress().getCityName() %>" /></td>
		<td><label
			style="visibility: hidden; color: red; font-size: 12px;" name="city"
			id="city"></label></td>
	</tr>
	<tr>
		<td>Town Name</td>
		<td colspan="3"><input name="tname" type="text" id="tname"
			size="20"  
			<%if(ap.getPreviousAddress().getTownName()!=null){ %>
			value="<%=ap.getPreviousAddress().getTownName() %>" <%} %> /></td><td><label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="label5" id="label5"></label></td>
	</tr>
	<tr>
		<td>Country<font color="red">*</font></td>
		<td colspan="3"><select name="country"
			style="width: 145px;">
				<option value="United Kingdom"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("United Kingdom"))
				      {  	  %>
				selected="selected" <%} %>>United Kingdom</option>
		
			<option value="Australia"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Australia"))
				      {  	  %>
				selected="selected" <%} %>>Australia</option>
			<option value="Brazil"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Brazil"))
				      {  	  %>
				selected="selected" <%} %>>Brazil</option>
			<option value="Canada"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Canada"))
				      {  	  %>
				selected="selected" <%} %>>Canada</option>
			<option value="China"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("China"))
				      {  	  %>
				selected="selected" <%} %>>China</option>
			<option value="India"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("India"))
				      {  	  %>
				selected="selected" <%} %>>India</option>
			<option value="Japan"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Japan"))
				      {  	  %>
				selected="selected" <%} %>>Japan</option>
			<option value="Kenya"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Kenya"))
				      {  	  %>
				selected="selected" <%} %>>Kenya</option>
			<option value="New Zealand"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("New Zealand"))
				      {  	  %>
				selected="selected" <%} %>>New Zealand</option>
			<option value="Pakistan"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Pakistan"))
				      {  	  %>
				selected="selected" <%} %>>Pakistan</option>
			<option value="South Africa"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("South Africa"))
				      {  	  %>
				selected="selected" <%} %>>South Africa</option>
			<option value="Zimbabwe"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Zimbabwe"))
				      {  	  %>
				selected="selected" <%} %>>Zimbabwe</option>
			<option value="Other"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Other"))
				      {  	  %>
				selected="selected" <%} %>>Other</option>

		</select></td>
		<td><label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="label3" id="label3"></label></td>
	</tr>
	<tr>
		<td>Postal Code<font color="red">*</font></td>
		<td colspan="3"><input name="pcode" type="text" id="pcode"
			size="20"  
			value="<%=ap.getPreviousAddress().getPostalCode() %>" /></td>
		<td><label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="label4" id="label4"></label></td>
	</tr>
	<tr>
	<%
	}
%>
		<td colspan="2" style="color: gray; font-size: 12px">Contact
		Details :</td>
	</tr>
	<tr>
		<td>E-mail address<font color="red">*</font></td>
		<td colspan="3"><input name="email" type="text" id="email"
			size="30"   value="<%=ap.getEmail() %>" /></td>
		<td width="30%"><label
			style="visibility: hidden; color: red; font-size: 12px;"
			id="emailVal"></label></td>
	</tr>
	<tr>
		<td colspan="2">Phone Number :</td>

	</tr>
	<tr>
		<td>(Mobile)<font color="red">*</font></td>
		<td>(+)<input name="mCountryCode" type="text"
			id="mCountryCode" size="3" maxlength="3"
			value="<%=ap.getMobileContact().getCountryCode() %>" /><br />
		<font size="1pt">Country Code</font></td>
		<td><input name="mAreaCode" type="text"
			id="mAreaCode" size="6" maxlength="5"
			value="<%=ap.getMobileContact().getAreaCode() %>" /> <br />
		<font size="1pt">Area Code</font></td>
		<td><input name="mNumber" type="text" id="mNumber"
			 size="8" maxlength="8" value="<%=ap.getMobileContact().getContactNumber() %>" /><br />
		<font size="1pt">Phone Number</font></td>
		<td><label
			style="visibility: hidden; color: red; font-size: 12px;" id="cCode"></label>
		<label style="visibility: hidden; color: red; font-size: 12px;"
			id="aCode"></label> <label
			style="visibility: hidden; color: red; font-size: 12px;" id="mNum"></label>
		</td>
	</tr>
	<tr>
		<td>(Home)<font color="red">*</font></td>
		<td>(+)<input name="hCountryCode" type="text"
			id="hCountryCode" size="3" maxlength="3"
			value="<%=ap.getHomeContact().getCountryCode() %>" /><br />
		<font size="1pt">Country Code</font></td>
		<td><input name="hAreaCode" type="text"
			id="hAreaCode" size="6" maxlength="5"
			value="<%=ap.getHomeContact().getAreaCode() %>" /><br />
		<font size="1pt">Area Code</font></td>
		<td><input name="hNumber" type="text" id="hNumber"
			 size="8" maxlength="8" value="<%=ap.getHomeContact().getContactNumber() %>" /><br />
		<font size="1pt">Phone Number</font></td>
		<td><label
			style="visibility: hidden; color: red; font-size: 12px;" id="cCode2"></label>
		<label style="visibility: hidden; color: red; font-size: 12px;"
			id="aCode2"></label> <label
			style="visibility: hidden; color: red; font-size: 12px;" id="mNum2"></label>
		</td>
	</tr>
	<tr>
		<td>(Office)<font color="red">*</font></td>
		<td >(+)<input name="oCountryCode" type="text" id="oCountryCode"
			 size="3" maxlength="3"
			value="<%=ap.getOfficeContact().getCountryCode() %>" /><br />
		<font size="1pt">Country Code</font></td>
		<td ><input name="oAreaCode" type="text" id="oAreaCode" size="6" maxlength="5"
			
			value="<%=ap.getOfficeContact().getAreaCode() %>" /><br />
		<font size="1pt">Area Code</font></td>
		<td><input name="oNumber" type="text" id="oNumber"  size="8" maxlength="8"
			
			value="<%=ap.getOfficeContact().getContactNumber() %>" /><br />
		<font size="1pt">Phone Number</font></td>
		<td><label
			style="visibility: hidden; color: red; font-size: 12px;" id="cCode3"></label>
		<label style="visibility: hidden; color: red; font-size: 12px;"
			id="aCode3"></label> <label
			style="visibility: hidden; color: red; font-size: 12px;" id="mNum3"></label>

		</td>
	</tr>


	<tr>
		<td colspan="5" style="padding-left:150px"><br/>
		<input type="submit" class="button" name="button" id="button" value="Save" onclick="return validateForm()" style="margin-right:30px"/>
		 <input	type="reset" class="button" id="button2" value="Reset" />
			
			</td>
	</tr>
</table>
</form>

</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->

<!-- Start Footer -->
<jsp:include page="/Layout/Footer.jsp" />
</body>
</html>
