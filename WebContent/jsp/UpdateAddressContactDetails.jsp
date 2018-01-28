<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Party Contact</title>
<link href="<%=request.getContextPath() %>/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css"
	rel="stylesheet" type="text/css" />
<%@page import="com.training.model.*"%>



<script>


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
	 		document.getElementById("label").innerHTML="House number should not start with blank space"; 
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
		document.getElementById("label").innerHTML="Only alphabets,numbers, - / and space are allowed."; 
		document.getElementsByName("hno")[0].focus();
		document.getElementsByName("hno")[0].value="";
return false;
		}
else
{
	  document.getElementById('label').innerHTML="";
}

if(ischarinbag(document.getElementsByName("hno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_/-"))
{
	 
	 document.getElementById('label').style.visibility="visible";
		document.getElementById("label").innerHTML="House number cannot contain only alphabets."; 
		document.getElementsByName("hno")[0].focus();
		document.getElementsByName("hno")[0].value="";
		return false;
	}

	else
	{
		  document.getElementById('label').innerHTML="";
	}

//building no
if(document.getElementsByName("bno")[0].value==0 || document.getElementsByName("bno")[0].value=="null")
{
	  document.getElementById('label1').style.visibility="visible";
	  document.getElementById('label1').innerHTML="&nbsp;Please enter the Building number.";

	document.getElementsByName("bno")[0].value="";
	document.getElementsByName("bno")[0].focus();
	return false;
}
else
{
	  document.getElementById('label1').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("bno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- /"))
{
	 document.getElementById('label1').style.visibility="visible";
	document.getElementById("label1").innerHTML="Only alphabets,numbers, - / and space are allowed."; 
	document.getElementsByName("bno")[0].focus();
	document.getElementsByName("bno")[0].value="";
	return false;
}
else
{
	  document.getElementById('label1').innerHTML="";
}
if(ischarinbag(document.getElementsByName("bno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"))
{
	alert('1');
	 document.getElementById('label1').style.visibility="visible";
	document.getElementById("label1").innerHTML="Building number cannot contain only alphabets."; 
	document.getElementsByName("bno")[0].focus();
	document.getElementsByName("bno")[0].value="";
	return false;
}
else
{
	  document.getElementById('label1').innerHTML="";
}

//Street name

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
	document.getElementById("street").innerHTML="Only alphabets,numbers, - and space are allowed."; 
	document.getElementsByName("sname")[0].focus();
	document.getElementsByName("sname")[0].value="";
	return false;
}
else
{
	  document.getElementById('street').innerHTML="";
}


if(ischarinbag(document.getElementsByName("sname")[0].value,"0123456789- "))
{
	 
	 document.getElementById('street').style.visibility="visible";
	document.getElementById("street").innerHTML="Street name cannot contain only numbers."; 
	document.getElementsByName("sname")[0].focus();
	document.getElementsByName("sname")[0].value="";
	return false;
}
else
{
	  document.getElementById('street').innerHTML="";
}

//City Name

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
	document.getElementById("city").innerHTML="City name can contain only alphabets and spaces."; 
	document.getElementsByName("cname")[0].focus();
	document.getElementsByName("cname")[0].value="";
	return false;
}
else
{
	  document.getElementById('city').innerHTML="";
}



if(ischarinbag(document.getElementsByName("cname")[0].value,"0123456789-"))
{
	 
	 document.getElementById('city').style.visibility="visible";
	document.getElementById('city').innerHTML="City name cannot contain only numbers."; 
	document.getElementsByName("cname")[0].focus();
	document.getElementsByName("cname")[0].value="";
	return false;
}
else
{
	  document.getElementById('city').innerHTML="";
}


//town name
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
	  document.getElementById('label5').innerHTML="";
}



//Country Name


if(document.getElementsByName("country")[0].value=="")
{

	document.getElementById('count').style.visibility="visible";
	  document.getElementById('count').innerHTML="&nbsp;Please select Country Name.";

	document.getElementsByName("country")[0].focus();
	document.getElementsByName("country")[0].value="";
return false;
}
else
{
	  document.getElementById('count').innerHTML="";
}


//Postal code

if(document.getElementsByName("pcode")[0].value==0 || document.getElementsByName("pcode")[0].value=="null")
{

	 
	  document.getElementById('label4').style.visibility="visible";
	  document.getElementById('label4').innerHTML="&nbsp;Please enter the Postalcode,alphabets should be in capital.";

	document.getElementsByName("pcode")[0].value="";
	document.getElementsByName("pcode")[0].focus();
	return false;
}
else
{
	  document.getElementById('label4').innerHTML="";
}

if(ischarinbag(document.getElementsByName("pcode")[0].value,"abcdefghijklmnopqrstuvwxyz0123456789 "))
{
	 
	 
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Please enter uppercase alphabets"; 
	document.getElementsByName("pcode")[0].focus();
	document.getElementsByName("pcode")[0].value="";
	return false;
}

else
{
	  document.getElementById('label4').innerHTML="";
}



if(ischarinbag(document.getElementsByName("pcode")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 
	 document.getElementById('label4').style.visibility="visible";
		document.getElementById("label4").innerHTML="Postal code cannot contain only alphabets."; 
		document.getElementsByName("pcode")[0].focus();
		document.getElementsByName("pcode")[0].value="";
		return false;
	}

	else
	{
		  document.getElementById('label4').innerHTML="";
	}



if(((document.getElementsByName("pcode")[0].value.length)<2)) 
		{
		document.getElementById('label4').style.visibility="visible";
		document.getElementById("label4").innerHTML="Postal code should be of minimum 2 and maximum 10 characters."; 
		document.getElementsByName("pcode")[0].focus();
		document.getElementsByName("pcode")[0].value="";
		return false;
	}

	else
	{
		  document.getElementById('label4').innerHTML="";
	}

if(((document.getElementsByName("pcode")[0].value.length)>10))
{
	document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Postal code should be of minimum 2 and maximum 10 characters."; 
	document.getElementsByName("pcode")[0].focus();
	document.getElementsByName("pcode")[0].value="";
	return false;
}

else
{
	  document.getElementById('label4').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("pcode")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "))
{
	  
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Only alphabets(in capital),numbers and space are allowed."; 
	document.getElementsByName("pcode")[0].focus();
	document.getElementsByName("pcode")[0].value="";
	return false;
}

else
{
	  document.getElementById('label4').innerHTML="";
}

if(document.forms["myForm"]["email"].value==0)
{
	
	document.getElementById('emailVal').style.visibility="visible";
	  document.getElementById('emailVal').innerHTML="&nbsp;Please enter the email address.";

	document.getElementsByName("email")[0].value="";
	document.getElementsByName("email")[0].focus();
	return false;
}

	
var x = document.forms["myForm"]["email"].value;
var alphaExp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

 if (!((document.getElementsByName("email")[0].value).match(alphaExp))) {
	document.getElementById('emailVal').innerHTML = "Please check email ID";
	document.getElementsByName("email")[0].value="";
	document.getElementsByName("email")[0].focus();
	return false;
}  else {
	document.getElementById("email").innerHTML = "";

}

 //country code 

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


if((document.getElementById("mCountryCode").value.length<2) || (document.getElementById("mCountryCode").value.length>3))
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

//Area code


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



//Mobile number

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




if((document.getElementById("hCountryCode").value.length<2) || (document.getElementById("hCountryCode").value.length>3))
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

if(document.getElementById("oCountryCode").value.length>3||document.getElementById("oCountryCode").value.length<2)
{

	document.getElementById('cCode3').style.visibility="visible";
document.getElementById('cCode3').innerHTML="&nbsp;Country code can contain minimum 2 and maximum 3 numbers.";

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
	  document.getElementById('aCode3').innerHTML="&nbsp;Area code contains only numbers.";

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
	  document.getElementById('mNum3').innerHTML="&nbsp;Contact number contains only numbers.";

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

alert('1');


var op= confirm("Are you sure you want to proceed ?");
if(op==true)
{
	alert("Account Party detail(s) updated successfully");
	return true;
}
else
	return false;




}
</script>


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
	ap = (AccountParty) session.getAttribute("ap");

	System.out.println("heyy hiii uacd,...prev house no is  : "+ap.getPreviousAddress().getHouseNo());
%>

<% 
if(session.getAttribute("uid")==null)
{
 %>
<script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</script>
<% 
 
}
%>
</head>
<body>

<!-- Start Header -->
	<jsp:include page="../jsp/layout/Header.jsp" />
<!-- banner message and building background -->
 <hr />
</div>
</div>
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Account Party</h3>
<ul class="leftbox borderedlist">
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=addAccountParty">Add
	Account Party</a></li>
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=viewAccountParty">View
	Account Party</a></li>

</ul>

</div>
<!-- main content area -->
<center style="margin-left: 70px;"><font size="5pt" color=black>Update Account Party Details</font></center>
<div id="center" style="margin-left: 10px;">
<div class="article_wrapper">

<br/>

<form
	name = "myForm" action="<%=request.getContextPath() %>/AccountPartyManagementMainServlet"
	method="post" name="f1"><input type="hidden" name="action"
	value="updateAccountParty2"></input>

<table id="gradient-style" align="center" 	style="margin-left: 50px; font-size: 2pt;" width="600px">
 
 
 
 	<tr>
		<td colspan="2" style="color: gray; font-size: 18px"><b>Previous
		Address Details :</b></td>
	</tr>
	<tr></tr>
	<tr>
		<td width="20%"><b>House Number</b><font color="red"><sup>*</sup></font></td>
		<td><input name="hno" type="text" id="hno" size="20"
			style="margin-left: 87px" title="Please enter House number."
			value="<%=ap.getPreviousAddress().getHouseNo() %>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;" id="label"></label>
		</td>
	</tr>
	<tr>
		<td><b>House Name</b></td>
		<td><input name="hname" type="text" id="hname" size="20"
			style="margin-left: 87px"
			value="<%=ap.getPreviousAddress().getHouseName() %>" /></td>
	</tr>
	<tr>
		<td><b>Building Number</b><font color="red"><sup>*</sup></font></td>
		<td><input name="bno" type="text" id="bno" size="20"
			style="margin-left: 87px" title="Please enter building number."
			value="<%=ap.getPreviousAddress().getBuildingNo() %>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;"  name="label1" id="label1"></label>
		</td>
	</tr>

	<tr>
		<td><b>Street Name</b><font color="red"><sup>*</sup></font></td>
		<td><input name="sname" type="text" id="sname" size="20"
			style="margin-left: 87px" title="Please enter the street name."
			value="<%=ap.getPreviousAddress().getStreetName() %>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="street" id="street"></label></td>
	</tr>
	<tr>
		<td><b>City Name</b><font color="red"><sup>*</sup></font></td>
		<td><input name="cname" type="text" id="cname" size="20"
			style="margin-left: 87px" title="Please enter the city name."
			value="<%=ap.getPreviousAddress().getCityName() %>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="city"
			id="city"></label></td>
	</tr>
	<tr>
		<td><b>Town Name</b></td>
		<td><input name="tname" type="text" id="tname" size="20"
			style="margin-left: 87px"
			value="<%=ap.getPreviousAddress().getTownName() %>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="label5"
			id="label5"></label></td>
	</tr>
	<tr>
		<td><b>Country</b><font color="red"><sup>*</sup></font></td>
		<td><select name="country"
			style="width: 145px; margin-left: 87px" title="Please select a country.">
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
				selected="selected"<%} %>>China</option>
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
			<option value="United Kingdom"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("United Kingdom"))
				      {  	  %>
				selected="selected" <%} %>>United Kingdom</option>
			<option value="Zimbabwe"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Zimbabwe"))
				      {  	  %>
				selected="selected" <%} %>>Zimbabwe</option>
			<option value="Other"
				<%if(ap.getPreviousAddress().getCountry().equalsIgnoreCase("Other"))
				      {  	  %>
				selected="selected" <%} %>>Other</option>

		</select><label style="visibility: hidden; color: red; font-size: 12px;"
			name="count" id="count"></label></td>
	</tr>
	<tr>
		<td><b>Postal Code</b><font color="red"><sup>*</sup></font></td>
		<td><input name="pcode" type="text" id="pcode" size="20" title="Please enter postal code,alphabets should be in uppercase."
			style="margin-left: 87px"
			value="<%=ap.getPreviousAddress().getPostalCode() %>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="label4"
			id="label4"></label></td>
	</tr>
	<tr>
		<td colspan="2" style="color: gray;"><b>Contact
		Details</b></td>
	</tr>
	<tr>
		<td><b>E-mail address</b><font color="red"><sup>*</sup></font></td>
		<td><input name="email" type="text" id="email" size="48" title="Please enter an email address."
			style="margin-left: 87px" value="<%=ap.getEmail() %>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="emailVal" id="emailVal"></label></td>
	</tr>
	<tr>
		<td colspan="2"><b>Phone Number</b></td>

	</tr>
	<tr>
		<td><b>(Mobile)</b></td>
		<td><b>Country Code</b><font color="red"><sup>*</sup></font><input
			name="mCountryCode" type="text" id="mCountryCode" size="3"
			style="margin-left: 10px"
			value="<%=ap.getMobileContact().getCountryCode() %>"  title="Please enter the country code."/> Area Code<font
			color="red"><sup>*</sup></font><input name="mAreaCode" type="text"
			id="mAreaCode" size="6" style="margin-left: 10px" title="Please enter an area code."
			value="<%=ap.getMobileContact().getAreaCode() %>" /> Number<font
			color="red"><sup>*</sup></font><input name="mNumber" type="text"
			id="mNumber" size="10" style="margin-left: 10px" title="Please enter contact number."
			value="<%=ap.getMobileContact().getContactNumber() %>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="cCode"
			id="cCode"></label> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="aCode"
			id="aCode"></label> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="mNum"
			id="mNum"></label></td>
	</tr>
	<tr>
		<td><b>(Home)</b></td>
		<td><b>Country Code</b><font color="red"><sup>*</sup></font><input
			name="hCountryCode" type="text" id="hCountryCode" size="3"
			style="margin-left: 10px" title="Please enter the country code."
			value="<%=ap.getHomeContact().getCountryCode() %>" /> Area Code<font
			color="red"><sup>*</sup></font><input name="hAreaCode" type="text"
			id="hAreaCode" size="6" style="margin-left: 10px" title="Please enter an area code."
			value="<%=ap.getHomeContact().getAreaCode() %>" /> Number<font
			color="red"><sup>*</sup></font><input name="hNumber" type="text"
			id="hNumber" size="10" style="margin-left: 10px"
			value="<%=ap.getHomeContact().getContactNumber() %>" title="Please enter contact number."/> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="cCode2" id="cCode2"></label> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="aCode2" id="aCode2"></label> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="mNum2"
			id="mNum2"></label></td>
	</tr>
	<tr>
		<td><b>(Office)</b></td>
		<td><b>Country Code</b><font color="red"><sup>*</sup></font><input
			name="oCountryCode" type="text" id="oCountryCode" size="3"
			style="margin-left: 10px" title="Please enter the country code."
			value="<%=ap.getOfficeContact().getCountryCode() %>" /> Area Code<font
			color="red"><sup>*</sup></font><input name="oAreaCode" type="text"
			id="oAreaCode" size="6" style="margin-left: 10px" title="Please enter an area code."
			value="<%=ap.getOfficeContact().getAreaCode() %>" /> Number<font
			color="red"><sup>*</sup></font><input name="oNumber" type="text"
			id="oNumber" size="10" style="margin-left: 10px"
			value="<%=ap.getOfficeContact().getContactNumber() %>" title="Please enter contact number."/> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="cCode3" id="cCode3"></label> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="aCode3"
			id="aCode3"></label> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="mNum3"
			id="mNum3"></label></td>
	</tr>
</table>
<br/>
	<table align="center" style="margin-left: 260px;">
	<tr>
		<td colspan="2" align="center"><input type="submit" name="button"
			style="background-color:black;  color:white"
			onclick="return validateAddress()" id="button" value="Save" />&nbsp;&nbsp;&nbsp; <input
			type="button" name="cancelbutton"
			style="background-color:black;  color:white"id="button2"
			value="Cancel" onclick="cancelAction();" /></td>
	</tr>
</table>
</form>

</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->
<div id="bottominfo"></div>
<!-- Start Footer -->
<div id="footer">
<div class="container">
<p id="designby">Copyright© Nexus Banking Group</p>

</div>
</div>
</body>
</html>
