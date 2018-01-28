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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Add Personal Detail</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />


 <script >

 function validateReset()
 {

 	 document.getElementById('label').innerHTML="";
 	 document.getElementById('label1').innerHTML="";
 	 document.getElementById('street').innerHTML="";
 	 document.getElementById('city').innerHTML="";
 	 document.getElementById('label3').innerHTML="";
 	document.getElementById('label4').innerHTML="";
 	document.getElementById('checkDate').innerHTML="";
	 
 	 document.getElementById('searchForm').reset(); 
 	
 	
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



 function isDate(myDate) { 
 	
     var objDate,  // date object initialized from the myDate string 
         mSeconds, // myDate in milliseconds 
         day,      // day 
         month,    // month 
         year;     // year 
     // date length should be 10 characters (no more no less) 
     if (myDate.length !== 10) { 
         return false; 
     } 
     // third and sixth character should be '/' 
     if (myDate.substring(2, 3) !== '/' || myDate.substring(5, 6) !== '/') { 
         return false; 
     } 
     // extract month, day and year from the myDate (expected format is mm/dd/yyyy) 
     // subtraction will cast variables to integer implicitly (needed 
     // for !== comparing) 
     day = myDate.substring(0, 2) - 0; // because months in JS start from 0 
     month = myDate.substring(3, 5) - 1; 
     year = myDate.substring(6, 10) - 0; 
     // test year range 
     if ((year < 1000) || (year > 3000)) { 
         return false; 
     } 
     // convert myDate to milliseconds 
     mSeconds = (new Date(year, month, day)).getTime(); 
     // initialize Date() object from calculated milliseconds 
     objDate = new Date(); 
     objDate.setTime(mSeconds); 
     // compare input date and parts from Date() object 
     // if difference exists then date isn't valid 
     if (objDate.getFullYear() !== year || 
         objDate.getMonth() !== month || 
         objDate.getDate() !== day) { 
         return false; 
     } 
     // otherwise return true 
     return true; 
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
	 		document.getElementById("label").innerHTML="House number should not start with a blank space"; 
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
		document.getElementById("label").innerHTML="Only alphabets,numbers,- /and space are allowed."; 
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
		document.getElementById("label").innerHTML="&nbsp;Only alphabets are not allowed."; 
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
	  document.getElementById('label1').innerHTML="&nbsp;Please enter the Building number.";

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
	document.getElementById("label1").innerHTML="&nbsp;Please enter only alphabets,numbers,- and space."; 
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
	 document.getElementById('label1').style.visibility="visible";
	document.getElementById("label1").innerHTML="&nbsp;Only alphabets are not allowed."; 
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
	document.getElementById("street").innerHTML="&nbsp;Please enter only alphabets,numbers,- and space are allowed."; 
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
	document.getElementById("street").innerHTML="&nbsp;Only numbers are not allowed."; 
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
	document.getElementById("city").innerHTML="&nbsp;Only alphabets are allowed."; 
	document.getElementsByName("cname")[0].focus();
	document.getElementsByName("cname")[0].value="";
	return false;
}
else
{
	  document.getElementById('city').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("tname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('label5').style.visibility="visible";
	document.getElementById("label5").innerHTML="&nbsp;Only alphabets and space is allowed."; 
	document.getElementsByName("tname")[0].focus();
	document.getElementsByName("tname")[0].value="";
	return false;
}
else
{
	  document.getElementById('label5').innerHTML="";
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
if(!ischarinbag(document.getElementsByName("pcode")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "))
{
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Pstal code can contain alphabets(in capital),numbers and space."; 
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
		document.getElementById("label4").innerHTML="Only alphabets are not allowed."; 
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

var dateSt=new Date(myDate.substr(6),myDate.substr(3,2)-1,myDate.substr(0,2));

var curdate=new Date();
if (dateSt<curdate) { 
	document.getElementById('checkDate').innerHTML="";
} 
else { 
	document.getElementById('checkDate').style.visibility="visible";
	  document.getElementById('checkDate').innerHTML="&nbsp;Date entered should be present or past date.";
	  document.getElementById("curDate").focus();
	  return false;
} 
// check date and print message 
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
		href="<%=request.getContextPath() %>/NexusBankingGroup/AccountPartyManagementMainServlet?action=viewAccountParty&&pageNumber=1">View
	Account Party</a></li>

</ul>

</div>
<!-- main content area -->
<div id="center" style="margin-left: 80px;">
<div class="article_wrapper">

<center style="margin-left: 60px;"><font size="5pt" color=black>&nbsp;&nbsp;&nbsp;&nbsp;Current Address Details</font></center>
<br/>
<form name="searchForm" action="<%=request.getContextPath() %>/AccountPartyManagementMainServlet" method="post"><input
	type="hidden" name="action" value="accountPartyDetails2"></input>


<table id="gradient-style" align="left">


<table id="gradient-style" align="center" width="500" style="font-size:2pt; margin-left:0px">
<tr>
<td colspan="2"><font color="blue" size="2pt">Fields with <font color="red"><sup>*</sup> </font>mark are mandatory.</font></td>
</tr>
	<tr>
		<td width="30%"><b>House No</b><font color="red"><sup>*</sup></font></td>
		<td width="70%"><input  type="text" name="hno" id="hno" 
		title="Please enter the House number." />
		<label style="visibility:hidden; color:red; font-size:12px;" name="label" id="label"></label>
		</td>
	</tr>
	<tr>
		<td><b>House Name</b></td>
		<td><input name="hname" type="text" id="hname" /></td>
	</tr>
	<tr>
		<td><b>Building No</b><font color="red"><sup>*</sup></font></td>
		<td><input name="bno" type="text" id="bno" 
		title="Please enter the Building number." />
		<label style="visibility:hidden; color:red; font-size:12px;" name="label1" id="label1"></label>
		</td>
	</tr>

	<tr>
		<td><b>Street Name</b><font color="red"><sup>*</sup></font></td>
		<td><input name="sname" type="text" id="sname"  
		title="Please enter the Street name."/>
		<label style="visibility:hidden; color:red; font-size:12px;" name="street" id="street"></label>
		
		</td>
	</tr>
	<tr>
		<td><b>City Name</b><font color="red"><sup>*</sup></font></td>
		<td><input name="cname" type="text" id="cname" 
		title="Please enter the city name." />
		
		<label style="visibility:hidden; color:red; font-size:12px;" name="city" id="city"></label>
		</td>
	</tr>
	<tr>
		<td><b>Town Name</b></td>
		<td><input name="tname" type="text" id="tname"   />
		<label style="visibility:hidden; color:red; font-size:12px;" name="label5" id="label5"></label>
		
		</td>
	</tr>
	<tr>
		<td><b>Country</b><font color="red"><sup>*</sup></font></td>
		<td><select name="country" style="width: 145px"
		title="Please select the country.">
			<option value="">------select-------</option>
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
			<option value="United Kingdom">United Kingdom</option>
			<option value="Zimbabwe">Zimbabwe</option>
			<option value="Other">Other</option>

		</select>
		<label style="visibility:hidden; color:red; font-size:12px;" name="label3" id="label3"></label>
		</td>
	</tr>
	<tr>
		<td><b>Postal Code</b><font color="red"><sup>*</sup></font></td>
		<td><input name="pcode" type="text" id="pcode"  
		title="Please enter the Postal code,alphabets should be in capital." />
		<label style="visibility:hidden; color:red; font-size:12px;" name="label4" id="label4"></label>
		</td>
	</tr>
	<tr>
		<td><b>Date on which started<br />
		staying at the current address<br />
		(in dd/mm/yyyy)</b><font color="red"><sup>*</sup></font></td>
		<td valign="bottom"><input name="curDate" type="text"
			id="checkDOB"
			title="Please select a date."/><label style="visibility:hidden; color:red; font-size:12px;" name="checkDate" id="checkDate"></label></td>
	</tr>


	</table>
	
	<table align="center">

</table>



</div>
<br />
<table align="center">
	
	<tr>

		<td align="center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="button" id="button" style="background-color:black;  color:white" onclick="return validateAddress()" value="Save and Continue" />

		

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="button2" id="button2" onclick="return validateReset()" value="Reset"
			style="background-color:black;  color:white"  /></td>
	</tr>

</table>


</form>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->

<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
