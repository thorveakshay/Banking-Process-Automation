<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script type="text/javascript">
function confirmLoad()
{
	return confirm("All the details of the form will be lost. Are you sure you want to navigate away from the page?");
}

function clearData()
{
document.getElementById("label").innerHTML = "";
document.getElementById("label1").innerHTML = "";
document.getElementById("street").innerHTML = "";
document.getElementById("city").innerHTML = "";
document.getElementById("label3").innerHTML = "";
document.getElementById("label4").innerHTML = "";
document.getElementById("label5").innerHTML="";
document.getElementById("checkHname").innerHTML = "";

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
function validateAddress()
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
	 		document.getElementById('label').innerHTML="House number should not start with blank space"; 
	 		document.getElementsByName("hno")[0].focus();
	 		document.getElementsByName("hno")[0].value="";
	 		return false;
	 	}
	 else
	 {
		 document.getElementById('label').innerHTML="";
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

if(!ischarinbag(document.getElementsByName("hname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('checkHname').style.visibility="visible";
	document.getElementById("checkHname").innerHTML="Only alphabets are allowed."; 
	document.getElementsByName("hname")[0].focus();
	document.getElementsByName("hname")[0].value="";
	return false;
}

else
{
	document.getElementById("city").innerHTML=""; 
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
if (document.getElementsByName("bno")[0].value.charAt(0)==" ")
	{
document.getElementById('label1').style.visibility="visible";
		document.getElementById('label1').innerHTML="Building number should not start with blank space"; 
		document.getElementsByName("bno")[0].focus();
		document.getElementsByName("bno")[0].value="";
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
	document.getElementById("city").innerHTML="Please enter city name consisting of only alphabets."; 
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
	document.getElementById("label5").innerHTML="Please enter town name consisting of only alphabets."; 
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
	  document.getElementById('label3').innerHTML="Please select Country Name.";

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
	  document.getElementById('label4').innerHTML="Please enter the Postalcode.";

	document.getElementsByName("pcode")[0].value="";
	document.getElementsByName("pcode")[0].focus();
	return false;
}

else
{
	document.getElementById('label4').innerHTML="";
}

if(document.getElementsByName("pcode")[0].value.length<4||document.getElementsByName("pcode")[0].value.length>10)
{
	  document.getElementById('label4').style.visibility="visible";
	  document.getElementById('label4').innerHTML="Please enter a postal code consisting of 4 to 10 characters.";

	document.getElementsByName("pcode")[0].value="";
	document.getElementsByName("pcode")[0].focus();
	return false;
}

else
{
	document.getElementById('label4').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("pcode")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- "))
{
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Only alphanumeric values and some special symbols like - and space are allowed."; 
	document.getElementsByName("pcode")[0].focus();
	document.getElementsByName("pcode")[0].value="";
	return false;
}
else
{
	document.getElementById("label4").innerHTML="";	
}

if(document.getElementById("curDate").value.length==0)
{
	 document.getElementById('checkDate').style.visibility="visible";
		document.getElementById("checkDate").innerHTML="Please enter a date";
		document.getElementById("curDate").focus();
		document.getElementById("curDate").value="";
		return false;
}

else
{
	document.getElementById("checkDate").innerHTML="";
}

var myDate = document.getElementById("curDate").value; 
//check date and print message 
if (isDate(myDate)) { 
	document.getElementById('checkDate').innerHTML="";
} 
else { 
	document.getElementById('checkDate').style.visibility="visible";
	  document.getElementById('checkDate').innerHTML="&nbsp;Please enter date in dd/mm/yyyy format";
	  document.getElementById("curDate").focus();
	  return false;
} 

return true;
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css" />
<title>Nexus Banking Group</title>
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
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
<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px">ADD ACCOUNT PARTY</p><br/>
				 	</div> 
		  
<span style="font-size: 14px">Previous Address
Details</span>
<form action="../AccountPartyManagementServlet" method="post"><input
	type="hidden" name="action" value="accountPartyDetails3"></input>
<table width="700px" border="0">
<tr>
			<td colspan="2"><font color="red">Fields marked with * are mandatory</font></td>
			</tr>
	<tr>
		<td width="30%">House Number<font color="red">*</font></td>
		<td width="30%"><input name="hno" type="text" id="hno" /></td><td width="40%"><label style="visibility:hidden; color:red; font-size:11px;" id="label"></label></td>
	</tr>
	<tr>
		<td>House Name</td>
		<td><input name="hname" type="text" id="hname" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" name="checkHname" id="checkHname"></label>
		</td>
	</tr>
	<tr>
		<td>Building Number<font color="red">*</font></td>
		<td><input name="bno" type="text" id="bno" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" id="label1"></label></td>
	</tr>

	<tr>
		<td>Street Name<font color="red">*</font></td>
		<td><input name="sname" type="text" id="sname" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" name="street" id="street"></label></td>
	</tr>
	<tr>
		<td>City Name<font color="red">*</font></td>
		<td><input name="cname" type="text" id="cname" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" name="city" id="city"></label></td>
	</tr>
	<tr>
		<td>Town Name</td>
		<td><input name="tname" type="text" id="tname" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" id="label5"></label></td>
	</tr>
	<tr>
		<td>Country<font color="red">*</font></td>
		<td><select name="country" style="width: 145px">
			<option value="">------select-------</option>
			<option value="United Kingdom">United Kingdom</option>
			<option value="Australia">Australia</option>
			<option value="Brazil">Brazil</option>
			<option value="Canada">Canada</option>
			<option value="China">China</option>
			<option value="India">India</option>
			<option value="Japan">Japan</option>
			<option value="Kenya">Kenya</option>
			<option value="New Zealand">New Zealand</option>
			<option value="Pakistan">Pakistan</option>
			<option value="South Africa">South Africa</option>
			<option value="Zimbabwe">Zimbabwe</option>
			<option value="Other">Other</option>
		</select></td><td><label style="visibility:hidden; color:red; font-size:11px;" name="label3" id="label3"></label></td>
	</tr>
	<tr>
		<td>Postal Code<font color="red">*</font></td>
		<td><input name="pcode" type="text" id="pcode" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" name="label4" id="label4"></label></td>
	</tr>



	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="right"><input type="submit" name="button" id="button"
			value="Continue" class="button" onclick="return validateAddress()" /></td>
		<td><input type="reset" name="button2" class="button" id="button2" value="Reset"
			style="margin-left: 35px" onclick="return clearData()" /></td>
	</tr>

</table>
</form>
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

