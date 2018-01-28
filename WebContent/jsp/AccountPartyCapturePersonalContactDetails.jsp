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
	  document.getElementById('emailVal').innerHTML="&nbsp;Please enter a valid e-mail address";
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
	  document.getElementById('cCode').innerHTML="&nbsp;Country code should consist of only numbers.";

	document.getElementsByName("mCountryCode")[0].value="";
	document.getElementsByName("mCountryCode")[0].focus();
	return false;
	
}
else
{
	document.getElementById('cCode').innerHTML="";
}

if(document.getElementById("mCountryCode").value.length>3||document.getElementById("mCountryCode").value.length<2)
{

	document.getElementById('cCode').style.visibility="visible";
document.getElementById('cCode').innerHTML="&nbsp;Country code should consist of 2 or 3 digits.";

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
	  document.getElementById('aCode').innerHTML="&nbsp;Area code should consist of only numbers.";

	document.getElementsByName("mAreaCode")[0].value="";
	document.getElementsByName("mAreaCode")[0].focus();
	return false;
	
}
else
{
	document.getElementById('aCode').innerHTML="";
	}

if(document.getElementById("mAreaCode").value.length>5||document.getElementById("mAreaCode").value.length<2)
{

	document.getElementById('aCode').style.visibility="visible";
document.getElementById('aCode').innerHTML="&nbsp;Area code should consist of 2 to 5 digits.";

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
	  document.getElementById('mNum').innerHTML="&nbsp;Mobile number should consist of only numbers.";

	document.getElementsByName("mNumber")[0].value="";
	document.getElementsByName("mNumber")[0].focus();
	return false;
	
}
else
{
	document.getElementById('mNum').innerHTML="";
}

if(document.getElementById("mNumber").value.length>8||document.getElementById("mNumber").value.length<5)
{

	document.getElementById('mNum').style.visibility="visible";
document.getElementById('mNum').innerHTML="&nbsp;Contact number should consist of 5 to 8 digits.";

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
	  document.getElementById('cCode2').innerHTML="&nbsp;Country code should consist of only numbers.";

	document.getElementsByName("hCountryCode")[0].value="";
	document.getElementsByName("hCountryCode")[0].focus();
	return false;
	
}
else
{
	document.getElementById('cCode2').innerHTML="";
}

if(document.getElementById("hCountryCode").value.length>3||document.getElementById("hCountryCode").value.length<2)
{

	document.getElementById('cCode2').style.visibility="visible";
document.getElementById('cCode2').innerHTML="&nbsp;Country code should consist of 2 or 3 digits.";

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
	  document.getElementById('aCode2').innerHTML="&nbsp;Area code should consist of only numbers.";

	document.getElementsByName("hAreaCode")[0].value="";
	document.getElementsByName("hAreaCode")[0].focus();
	return false;
	
}
else
{
	 document.getElementById('aCode2').innerHTML="";
	
	}

if(document.getElementById("hAreaCode").value.length>5||document.getElementById("hAreaCode").value.length<2)
{

	document.getElementById('aCode2').style.visibility="visible";
document.getElementById('aCode2').innerHTML="&nbsp;Area code should consist of 2 to 5 digits.";

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
	  document.getElementById('mNum2').innerHTML="&nbsp;Please enter the Home number.";

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
	  document.getElementById('mNum2').innerHTML="&nbsp;Mobile number should consist of only numbers.";

	document.getElementsByName("hNumber")[0].value="";
	document.getElementsByName("hNumber")[0].focus();
	return false;
	
}
else
{
	document.getElementById('mNum2').innerHTML="";
}

if(document.getElementById("hNumber").value.length>8||document.getElementById("hNumber").value.length<5)
{

	document.getElementById('mNum2').style.visibility="visible";
document.getElementById('mNum2').innerHTML="&nbsp;Contact number should be of 5 to 8 digits.";

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
	  document.getElementById('cCode3').innerHTML="&nbsp;Country code should consist of only numbers.";

	document.getElementsByName("oCountryCode")[0].value="";
	document.getElementsByName("oCountryCode")[0].focus();
	return false;
	
}

else
{
	document.getElementById('cCode3').innerHTML="";
}

if(document.getElementById("oCountryCode").value.length>3||document.getElementById("oCountryCode").value.length<2)
{

	document.getElementById('cCode3').style.visibility="visible";
document.getElementById('cCode3').innerHTML="&nbsp;Country code should consist of 2 or 3 digits.";

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
	  document.getElementById('aCode3').innerHTML="&nbsp;Area code should consist of only numbers.";

	document.getElementsByName("oAreaCode")[0].value="";
	document.getElementsByName("oAreaCode")[0].focus();
	return false;
	
}

else
{
	document.getElementById('aCode3').innerHTML="";
}

if(document.getElementById("oAreaCode").value.length>5||document.getElementById("oAreaCode").value.length<2)
{

	document.getElementById('aCode3').style.visibility="visible";
document.getElementById('aCode3').innerHTML="&nbsp;Area code should consist of 2 to 5 digits.";

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
	  document.getElementById('mNum3').innerHTML="&nbsp;Please enter the office number.";

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
	  document.getElementById('mNum3').innerHTML="&nbsp;Mobile number should consist of only numbers.";

	document.getElementsByName("oNumber")[0].value="";
	document.getElementsByName("oNumber")[0].focus();
	return false;
	
}

if(document.getElementById("oNumber").value.length>8||document.getElementById("oNumber").value.length<5)
{

	document.getElementById('mNum3').style.visibility="visible";
document.getElementById('mNum3').innerHTML="&nbsp;Contact number should consist of 5 to 8 digits.";

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
<div class="article_wrapper" style="width: 500px">
<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px">ADD ACCOUNT PARTY</p><br/>
				 	</div> 

<span style="font-size: 14px">Contact Details</span>
<form action="../AccountPartyManagementServlet" method="post" name="myForm"><input
	type="hidden" name="action" value="accountPartyDetails4"></input>

<table width="800px" border="0">
<tr>
			<td colspan="2"><font color="red">Fields marked with * are mandatory</font></td>
			</tr>


	<tr>
		<td width="10%">E-mail address<font color="red">*</font></td>
		<td width="45%" align="right"><input name="email" type="text" id="email" size="48"
			style="margin-left: 87px" /></td><td width="20%" align="left">	<label style="visibility:hidden; color:red; font-size:11px;" id="emailVal"></label></td>
	</tr>
	<tr>
		<td>Phone Number :</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>(Mobile)<font color="red">*</font></td>
		<td align="right">Country Code &nbsp (+)<input name="mCountryCode" type="text"
			id="mCountryCode" size="3" maxlength="3" style="margin-left: 10px" /> Area Code<input
			name="mAreaCode" type="text" id="mAreaCode" size="6" maxlength="5"
			style="margin-left: 10px" /> Number<input name="mNumber" type="text"
			id="mNumber" size="8" maxlength="8" style="margin-left: 10px" />
				</td><td><label style="visibility:hidden; color:red; font-size:11px;" id="cCode"></label>
			<label style="visibility:hidden; color:red; font-size:11px;" id="aCode"></label>
			<label style="visibility:hidden; color:red; font-size:11px;" id="mNum"></label>
			</td>
	</tr>
	<tr>
		<td>(Home)<font color="red">*</font></td>
		<td align="right">Country Code &nbsp (+)<input name="hCountryCode" type="text"
			id="hCountryCode" size="3" maxlength="3" style="margin-left: 10px" /> Area Code<input
			name="hAreaCode" type="text" id="hAreaCode" size="6" maxlength="5"
			style="margin-left: 10px" /> Number<input name="hNumber" type="text"
			id="hNumber" size="8" maxlength="8" style="margin-left: 10px" />
			</td><td><label style="visibility:hidden; color:red; font-size:11px;" id="cCode2"></label>
			<label style="visibility:hidden; color:red; font-size:11px;" id="aCode2"></label>
			<label style="visibility:hidden; color:red; font-size:11px;" id="mNum2"></label>
			</td>
	</tr>
	<tr>
		<td>(Office)<font color="red">*</font></td>
		<td align="right">Country Code &nbsp (+)<input name="oCountryCode" type="text"
			id="oCountryCode" size="3" maxlength="3" style="margin-left: 10px" /> Area Code<input
			name="oAreaCode" type="text" id="oAreaCode" size="6" maxlength="5"
			style="margin-left: 10px" /> Number<input name="oNumber" type="text"
			id="oNumber" size="8" maxlength="8" style="margin-left: 10px" />
			</td><td><label style="visibility:hidden; color:red; font-size:11px;" id="cCode3"></label>
			<label style="visibility:hidden; color:red; font-size:11px;" id="aCode3"></label>
			<label style="visibility:hidden; color:red; font-size:11px;" id="mNum3"></label>
			
			</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="padding-right: 100px"><input
			type="submit" class="button" name="button" id="button" value="Submit"
			style="margin-right: 10px" onclick="return validateForm()"/> <input type="reset" name="button2"
			id="button2" class="button" value="Reset" style="margin-left: 10px" /></td>
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


