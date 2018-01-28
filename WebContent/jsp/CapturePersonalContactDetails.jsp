<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<title>Add Contact Details</title>

<script type="text/javascript">

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
	else
	{
		document.getElementById('emailVal').innerHTML="";
	}



	var x=document.forms["myForm"]["email"].value;
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
 var firstDotPos;
var len=x.length;
var j=0;
 while(len!=0)
 {
	 var a=x.charAt(j);
	// alert("a is "+a);
	 
	 if(a==".")
	 {
		 firstDotPos=j;
		 break;
	 }
	 j++;
	 len--;
	 
		 
 } 
//alert("first index is  : "+firstDotPos);
var i=firstDotPos+1;

   var n=x.charAt(i);
   //alert("N is : "+n);
	if(n=='.')
	{
		
		//alert("i am inside");
		 document.getElementById('emailVal').style.visibility="visible";
		  document.getElementById('emailVal').innerHTML="&nbsp;Not a valid e-mail address";
		return false;
	}
	
 	if (atpos<1 || dotpos<atpos+2 || (dotpos+2)>=x.length)
	  {
		  //alert("for loop"+dotpos);
		  
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

if(document.getElementById("mCountryCode").value.length<2)
{

	document.getElementById('cCode').style.visibility="visible";
document.getElementById('cCode').innerHTML="&nbsp;Country code can contain minimum 2 and maximum 3 digits.";

document.getElementsByName("mCountryCode")[0].value="";
document.getElementsByName("mCountryCode")[0].focus();
return false;

}
else
{
	 document.getElementById('cCode').innerHTML="";
}



if(document.getElementById("mCountryCode").value.length>3)
{

	document.getElementById('cCode').style.visibility="visible";
document.getElementById('cCode').innerHTML="&nbsp;Country code can contain minimum 2 and maximum 3 digits.";

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


if(document.getElementById("mAreaCode").value.length<2)
{

	document.getElementById('aCode').style.visibility="visible";
document.getElementById('aCode').innerHTML="&nbsp;Area code can contain minimum 2 and maximum 6 digits.";

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
document.getElementById('aCode').innerHTML="&nbsp;Area code can contain minimum 2 and maximum 6 digits.";

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
if(document.getElementById("mNumber").value.length!=10)
{

	document.getElementById('mNum').style.visibility="visible";
document.getElementById('mNum').innerHTML="&nbsp;Mobile number should be of 10 digits.";

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





if(document.getElementById("hCountryCode").value.length<2)
{

	document.getElementById('cCode2').style.visibility="visible";
document.getElementById('cCode2').innerHTML="&nbsp;Country code can contain minimum 2 and maximum 3 digits.";

document.getElementsByName("hCountryCode")[0].value="";
document.getElementsByName("hCountryCode")[0].focus();
return false;

}
else
{
	 document.getElementById('cCode2').innerHTML="";
}


if(document.getElementById("hCountryCode").value.length>3)
{

	document.getElementById('cCode2').style.visibility="visible";
document.getElementById('cCode2').innerHTML="&nbsp;Country code can contain minimum 2 and maximum 3 digits.";

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


if(document.getElementById("hAreaCode").value.length<2)
{

	document.getElementById('aCode2').style.visibility="visible";
document.getElementById('aCode2').innerHTML="&nbsp;Area code can contain minimum 2 and maximum 6 digits.";

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
document.getElementById('aCode2').innerHTML="&nbsp;Area code can contain minimum 2 and maximum 6 digits.";

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
	  document.getElementById('mNum2').innerHTML="&nbsp;Please enter the Contact number.";

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
	  document.getElementById('mNum2').innerHTML="&nbsp;Contact number can contain only numbers.";

	document.getElementsByName("hNumber")[0].value="";
	document.getElementsByName("hNumber")[0].focus();
	return false;
	
}
else
{
	document.getElementById('mNum2').innerHTML="";
}



if(document.getElementById("hNumber").value.length<6)
{

	document.getElementById('mNum2').style.visibility="visible";
document.getElementById('mNum2').innerHTML="&nbsp;Contact number can contain minimum 6 and maximum 10 digits.";

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
document.getElementById('mNum2').innerHTML="&nbsp;Contact number can contain minimum 6 and maximum 10 digits.";

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

if(document.getElementById("oCountryCode").value.length<2)
{

	document.getElementById('cCode3').style.visibility="visible";
document.getElementById('cCode3').innerHTML="&nbsp;Country code can contain minimum 2 and maximum 3 digits.";

document.getElementsByName("oCountryCode")[0].value="";
document.getElementsByName("oCountryCode")[0].focus();
return false;

}
else
{
	
	document.getElementById('cCode3').innerHTML="";
}




if(document.getElementById("oCountryCode").value.length>3)
{

	document.getElementById('cCode3').style.visibility="visible";
document.getElementById('cCode3').innerHTML="&nbsp;Country code can contain minimum 2 and maximum 3 digits.";

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




if(document.getElementById("oAreaCode").value.length<2)
{

	document.getElementById('aCode3').style.visibility="visible";
document.getElementById('aCode3').innerHTML="&nbsp;Area code can contain minimum 2 and maximum 6 digits.";

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
document.getElementById('aCode3').innerHTML="&nbsp;Area code can contain minimum 2 and maximum 6 digits.";

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
	  document.getElementById('mNum3').innerHTML="&nbsp;Please enter the Contact number.";

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
	  document.getElementById('mNum3').innerHTML="&nbsp;Contact number can contain only numbers.";

	document.getElementsByName("oNumber")[0].value="";
	document.getElementsByName("oNumber")[0].focus();
	return false;
	
}
else
{
	document.getElementById('mNum3').innerHTML="";
}



if(document.getElementById("oNumber").value.length<6)
{

	document.getElementById('mNum3').style.visibility="visible";
document.getElementById('mNum3').innerHTML="&nbsp;Contact number can contain minimum 6 and maximum 10 digits.";

document.getElementsByName("oNumber")[0].value="";
document.getElementsByName("oNumber")[0].focus();
return false;

}
else
{
	document.getElementById('mNum3').innerHTML="";
}
	

if(document.getElementById("oNumber").value.length>10)
{

	document.getElementById('mNum3').style.visibility="visible";
document.getElementById('mNum3').innerHTML="&nbsp;Contact number can contain minimum 6 and maximum 10 digits.";

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
 
 
<jsp:include page="../jsp/layout/Header.jsp" />


<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox"><font size="2pt"><b>Quick Links</b></font></h3>
<ul class="leftbox borderedlist">
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=addAccountParty"><font size="2pt">Add
	Account Party</font></a></li>
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=viewAccountParty">
		<font size="2pt">View
	Account Party</font></a></li>

</ul>

</div>





<!-- main content area -->
<center><font size="5pt" color=black>Add Account Party</font></center><br/>
<center><font size="5pt" color=black>Contact Details</font></center><br/>
<div id="center" style="margin-left: 50px;">
<div class="article_wrapper" style="width: 500px">

<form name="myForm" onclick="validateEmail()" action="../AccountPartyManagementMainServlet" method="post"><input
	type="hidden" name="action" value="accountPartyDetails4"></input>

<table id="gradient-style" align="center" style="font-size:2pt;" width="600px">

<tr>
<td colspan="3" align="left"><font color="black">Fields with <font color="red"><sup>*</sup> </font>mark are mandatory.</font></td>
</tr>
	<tr>
		<td><b>E-mail ID</b><font color="red"><sup>*</sup></font></td>
		<td><input name="email" type="text" id="email" size="48"
			style="margin-left: 87px" title="Please enter a valid email address,e.g. abc@xyz.co.in or abc@xyz.com" />
			
			
			</td>
	</tr>
	<tr>
	<td colspan="2" align="right"><label style="visibility:hidden; color:red; font-size:12px;" id="emailVal"></label></td>
	</tr>
	<tr>
		<td><b>Phone Number</b> </td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b>(Mobile)</b></td>
		
		<td>
		<b>Country Code</b><font color="red"><sup>*</sup></font><input name="mCountryCode" type="text"
			id="mCountryCode" size="3" style="margin-left: 10px" /><b>Area Code</b><font color="red"><sup>*</sup></font><input
			name="mAreaCode" type="text" id="mAreaCode" size="6"
			style="margin-left: 10px" /> <b>Number</b><font color="red"><sup>*</sup></font><input name="mNumber" type="text"
			id="mNumber" size="10" style="margin-left: 10px" />	</td>
	</tr>
		<tr>	<td colspan="2" align="right"><label style="visibility:hidden; color:red; font-size:12px;" id="cCode"></label>
			<label style="visibility:hidden; color:red; font-size:12px;" id="aCode"></label>
			<label style="visibility:hidden; color:red; font-size:12px;" id="mNum"></label>
			</td>
	</tr>
	<tr>
		<td><b>(Home)</b></td>
		<td><b>Country Code</b><font color="red"><sup>*</sup></font><input name="hCountryCode" type="text"
			id="hCountryCode" size="3" style="margin-left: 10px" /> <b>Area Code<font color="red"><sup>*</sup></font></b><input
			name="hAreaCode" type="text" id="hAreaCode" size="6"
			style="margin-left: 10px" /> <b>Number<font color="red"><sup>*</sup></font></b><input name="hNumber" type="text"
			id="hNumber" size="10" style="margin-left: 10px" />
			
			</tr>
		<tr>	<td colspan="2" align="right"><label style="visibility:hidden; color:red; font-size:12px;" id="cCode2"></label>
			<label style="visibility:hidden; color:red; font-size:12px;" id="aCode2"></label>
			<label style="visibility:hidden; color:red; font-size:12px;" id="mNum2"></label>
			
			</td>
	</tr>
	<tr>
		<td><b>(Office)</b></td>
		<td><b>Country Code</b><font color="red"><sup>*</sup></font><input name="oCountryCode" type="text"
			id="oCountryCode" size="3" style="margin-left: 10px" />
			
			<b> Area Code</b><font color="red"><sup>*</sup></font><input
			name="oAreaCode" type="text" id="oAreaCode" size="6"
			style="margin-left: 10px" /> 
			
			<b>Number</b><font color="red"><sup>*</sup></font><input name="oNumber" type="text"
			id="oNumber" size="10" style="margin-left: 10px" />
			
				</tr>
		<tr>	<td colspan="2" align="right"><label style="visibility:hidden; color:red; font-size:12px;" id="cCode3"></label>
			<label style="visibility:hidden; color:red; font-size:12px;" id="aCode3"></label>
			<label style="visibility:hidden; color:red; font-size:12px;" id="mNum3"></label>
			
			</td>
	</tr>
	<tr>
		
	</tr>
	</table>

<br/>
<table align="center">
	<tr>
		<td colspan="2" align="center"><input
			type="submit" name="button" id="button" value="Add"  onclick="return validateForm()"
			style="background-color: black; color: white; margin-left:80px;" /> 
			<input type="reset" name="button2"
			id="button2" value="Reset" style="background-color: black; color: white; " /></td>
	</tr>

</table>
</form>
<p>&nbsp;</p>
</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->

<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>


