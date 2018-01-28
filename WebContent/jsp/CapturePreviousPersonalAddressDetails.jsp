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
		 		document.getElementById("label").innerHTML="House Number should not start with blank space"; 
		 		document.getElementsByName("hno")[0].focus();
		 		document.getElementsByName("hno")[0].value="";

		 		return false;
		 	}
		 else
		 {
			 document.getElementById('label').innerHTML="";
		 }
		 
	

	if(!ischarinbag(document.getElementsByName("hno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- /"))
	{
			document.getElementById('label').style.visibility="visible";
			document.getElementById("label").innerHTML="Only alphabets, numbers, - /and space are allowed."; 
			document.getElementsByName("hno")[0].focus();
			document.getElementsByName("hno")[0].value="";
	return false;
			}
	 else
	 {
		 document.getElementById('label').innerHTML="";
	 }

	if(ischarinbag(document.getElementsByName("hno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ- /"))
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
		document.getElementById("label1").innerHTML="Please enter only alphabets, numbers, - and space are allowed."; 
		document.getElementsByName("bno")[0].focus();
		document.getElementsByName("bno")[0].value="";
		return false;
	}
	 else
	 {
		 document.getElementById('label1').innerHTML="";
	 }


	if(ischarinbag(document.getElementsByName("bno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ- "))
	{
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
		document.getElementById("street").innerHTML="Please enter only alphabets, numbers, - and space are allowed."; 
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
		document.getElementById("city").innerHTML="&nbsp;Please enter only alphabets."; 
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
		document.getElementById("label5").innerHTML="Please enter only alphabets and space is allowed."; 
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
		  document.getElementById('label4').innerHTML="&nbsp;Please enter the Postalcode,alphabets used should be in capital.";

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
		document.getElementById("label4").innerHTML="Only alphabets(in capital),numbers and spaces are allowed."; 
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


	if((document.getElementsByName("pcode")[0].value.length)<2)
	{
		document.getElementById('label4').style.visibility="visible";
		document.getElementById("label4").innerHTML="Postal code can contain minimum 2 and maximum 10 characters."; 
		document.getElementsByName("pcode")[0].focus();
		document.getElementsByName("pcode")[0].value="";
		return false;
	}
	else
	 {
		 document.getElementById('label4').innerHTML="";
	 }

	if((document.getElementsByName("pcode")[0].value.length)>10)
	{
		document.getElementById('label4').style.visibility="visible";
		document.getElementById("label4").innerHTML="Postal code can contain minimum 2 and maximum 10 characters."; 
		document.getElementsByName("pcode")[0].focus();
		document.getElementsByName("pcode")[0].value="";
		return false;
	}
	else
	 {
		 document.getElementById('label4').innerHTML="";
	 }

	
	return true;
	 }

		  
	 



</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath() %>/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css"
	rel="stylesheet" type="text/css" />
<title>Add Previous Address</title>
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
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=viewAccountParty">View
	Account Party</a></li>

</ul>

</div>

<!-- main content area -->
<center><font size="5pt" color=black
	>Account Party</font></center>
<br>
<center><font size="5pt" color=black
	>Previous Address Details</font></center>

<div id="center" style="margin-left: 30px;">
<div class="article_wrapper">
<br/>
<form
	action="<%=request.getContextPath() %>/AccountPartyManagementMainServlet"
	method="post"><input type="hidden" name="action"
	value="accountPartyDetails3"></input>
	
<table id="gradient-style" align="center" style="font-size: 2pt;"
	width="600px">
	
		<tr>
<td colspan="2"><font color="blue" size="2pt">Fields with <font color="red"><sup>*</sup> </font>mark are mandatory.</font></td>
</tr>
	
	
	<tr>
		<td width="200"><b>House Number</b><font color="red"><sup>*</sup></font></td>
		<td><input name="hno" type="text" id="hno" title="Please enter the House number." /> <label
			style="visibility: hidden; color: red; font-size: 12px;" id="label"></label>
		</td>
	</tr>
	<tr>
		<td><b>House Name</b></td>
		<td><input name="hname" type="text" id="hname" onblur="return validateAddress()"/>
		
		<label style="visibility:hidden; color:red; font-size:12px;" id="label"></label>
		</td>
	</tr>
	<tr>
		<td><b>Building Number</b><font color="red"><sup>*</sup></font></td>
		<td><input name="bno" type="text" id="bno" title="Please enter the Building number." /> <label
			style="visibility: hidden; color: red; font-size: 12px;" id="label1"></label>
		</td>
	</tr>

	<tr>
		<td><b>Street Name</b><font color="red"><sup>*</sup></font></td>
		<td><input name="sname" type="text" id="sname" title="Please enter the Street name."/> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="street" id="street"></label></td>
	</tr>
	<tr>
		<td><b>City Name</b><font color="red"><sup>*</sup></font></td>
		<td><input name="cname" type="text" id="cname" title="Please enter the City name."/> <label
			style="visibility: hidden; color: red; font-size: 12px;" name="city"
			id="city"></label></td>
	</tr>
	<tr>
		<td><b>Town Name</b></td>
		<td><input name="tname" type="text" id="tname" /> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="label5" id="label5"></label></td>
	</tr>
	<tr>
		<td><b>Country</b><font color="red"><sup>*</sup></font></td>
		<td><select name="country" style="width: 145px" title="Please select the Country.">
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
		</select> <label style="visibility: hidden; color: red; font-size: 12px;"
			name="label3" id="label3"></label></td>
	</tr>
	<tr>
		<td><b>Postal Code</b><font color="red"><sup>*</sup></font></td>
		<td><input name="pcode" type="text" id="pcode" title="Please enter Postal code,alphabets should be in capital."/> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			name="label4" id="label4" onblur="return validateAddress()"></label></td>
	</tr>
</table>
	
<br/>
<table align="center">

	<tr>
		<td align="right"><input type="submit" name="button" id="button"
			style="background-color: black; color: white; margin-left:180px;" onclick="return validateAddress()" value="Save and Continue" /></td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="button2" id="button2" value="Reset"
			style="background-color: black; color: white;" /></td>
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

