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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/BusinessCustValidation.js"></script>     

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Business Address Details</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<style>
td
{
padding-left: 10px;
padding-right: 10px;
padding-top: 5px;
padding-bottom:5px;
}

</style>
<script>
function clearBAddress()
{
	document.getElementById("checkNum").innerHTML = "";
	document.getElementById("checkName").innerHTML = "";
	document.getElementById("checkStreet").innerHTML = "";
	document.getElementById("checkTown").innerHTML = "";
	document.getElementById("checkCity").innerHTML = "";
	document.getElementById("checkPostal").innerHTML = "";
	document.getElementById("checkCountry").innerHTML = "";
	document.getElementById("checkAddr").innerHTML = "";
	
	}
</script>
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>

	<!-- Start Main Content -->
		<div id="main" class="container">
	<jsp:include page="/Layout/BusinessCustMenu.jsp"/>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Business Address Details</p><br/></br>
				 	</div>
	
<form name="registerForm" action="/NexusBankingGroup/CustomerManagementServlet" onSubmit="return validfunc3();" method="post">

<input type="hidden" name="action" value="sendForm3"></input>
<input type="hidden" name="businessName" value=" <%=(String)request.getAttribute("msg")%>"></input>
		

		<br/>
		
		<table width="700px" style="font-size:12px">

<tr>
<td colspan="2">Welcome <%=(String)request.getAttribute("msg")%>, Please enter the following details.<br/></td>
</tr>

<tr>
<td colspan="2"><font color="red">Fields marked with * are mandatory</font></td>
</tr>


<tr>
<td style="width:200px;">Building Number<font color="red">*</font></td><td style="width:500px;"><abbr title="enter building number"><input type="text" name="buildingNumber" maxlength="20" onblur ="validateBuildingNo()" /></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkNum"></label></p>
		</td>
</tr>

<tr>
<td>Building Name<font color="red"></font></td><td><abbr title="enter building number"><input type="text" name="buildingName" maxlength="30"  onblur="validateName()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkName"></label></p></td>
</tr>

<tr>
<td>Street Name<font color="red">*</font></td><td>
<abbr title="enter street name"><input type="text" name="streetName" maxlength="50" onblur="validateStreet()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkStreet"></label></p>
</td>
</tr>

<tr>
<td>Town Name<font color="red">*</font></td><td><abbr title="enter town name"><input type="text" name="townName" maxlength="30" onblur="validateTown()"></abbr><p style="color:red;display:inline;font-size:11px"><label id = "checkTown"></label></p></td>
</tr>

<tr>
<td>City Name<font color="red">*</font></td><td><abbr title="enter city name"><input type="text" name="cityName" maxlength="30" onblur="validateCity()"></abbr><p style="color:red;display:inline;font-size:11px"><label id = "checkCity"></label></p></td>

</tr>

<tr>
<td>Postal Code<font color="red">*</font></td><td><abbr title="enter postal number" ><input type="text" name="postalCode" maxlength="20" onblur="validatePostalNo()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkPostal"></label></p></td>
</tr>

<!--<tr>-->
<!--<td>Country<font color="red">*</font></td><td><abbr title="enter country name using 3 to 20 alphabets only" ><input type="text" name="country" maxlength="30" onblur="validateCountry()"></abbr>-->
<!--<p style="color:red;display:inline;font-size:11px"><label id = "checkCountry"></label></p>-->
<!--</td>-->
<!--</tr>-->


<tr>
<td>Country<font color="red">*</font></td>
<td><abbr title="Please select Country of Registration"></abbr>
<select name="country"  onblur="validateCountry()">
<OPTION VALUE=0 selected>--- Please Select ----</OPTION>
<OPTION VALUE="United Kingdom">United Kingdom</OPTION>
<OPTION VALUE="Australia">Australia</OPTION>
<OPTION VALUE="Brazil">Brazil</OPTION>
<OPTION VALUE="China">China</OPTION>
<OPTION VALUE="Canada">Canada</OPTION>
<OPTION VALUE="India">India</OPTION>
<OPTION VALUE="Japan">Japan</OPTION>
<OPTION VALUE="Kenya">Kenya</OPTION>
<OPTION VALUE="NewZealand">NewZealand</OPTION>
<OPTION VALUE="Pakistan">Pakistan</OPTION>
<OPTION VALUE="South Africa">South Africa</OPTION>
<OPTION VALUE="Zimbabwe">Zimbabwe</OPTION>
<OPTION VALUE="Other">Other</OPTION>
</select>
<p style="color:red;display:inline;font-size:11px"><label id ="checkCountry"></label></p>
</td>
</tr>

<tr>
<td colspan="2">Are your Registered and  Mailing addresses same as Business address ?</td> 
<td></td>
</tr>

<tr>
<td></td>
<td><abbr title="Please select address details ">
<input type="radio" name="sameAddress" value="Yes" onblur="validateSameAdd()">Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="sameAddress" value="No" onblur="validateSameAdd()">No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkAddr"></label></p></td> 
</tr>


<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td></td>
 <td><input type="submit" value="Continue" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;" onclick="return clearBAddress()"></td>
 
 </tr>

</table>
</form>	
	</div>
	</div>
	</div>
	

	<jsp:include page="/Layout/Footer.jsp"/>
	


</body>


</html>