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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/BusinessCustValidation.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mailing Address Details</title>
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
function clearMailAddress()
{
	document.getElementById("mcheckNum").innerHTML = "";
	document.getElementById("mcheckName").innerHTML = "";
	document.getElementById("mcheckStreet").innerHTML= "";
	document.getElementById("mcheckTown").innerHTML= "";
	document.getElementById("mcheckCity").innerHTML = "";
	document.getElementById("mcheckCountry").innerHTML = "";
	document.getElementById("mcheckPostal").innerHTML = "";
	
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
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Mailing Address Details</p><br/></br>
				 	</div>
	
<form name="registerForm" action="/NexusBankingGroup/CustomerManagementServlet" onSubmit="return validfunc5();" method="post">

<input type="hidden" name="action" value="sendForm5"></input>
<input type="hidden" name="businessName" value=" <%=(String)request.getAttribute("msg")%>"></input>
		

<table style="font-size:12px;text-align: left" align="left" width="700px">
		
<tr>
<td colspan="2">Welcome <%=(String)request.getAttribute("msg")%>, Please enter the following details.<br/></td>
</tr>
		
<tr>
<td colspan="2"><font color="red">Fields marked with * are mandatory</font></td>
</tr>

<tr>
<td style="width:200px;">Building Number<font color="red">*</font></td><td style="width:500px;"><abbr title="enter building number"><input type="text" name="mbuildingNumber" maxlength="30" onblur ="mvalidateBuildingNo()" /></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "mcheckNum"></label></p>
		</td>
</tr>

<tr>
<td>Building Name<font color="red"></font></td><td><abbr title="enter building number"><input type="text" name="mbuildingName" maxlength="30" onblur="mvalidateName()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "mcheckName"></label></p></td>
</tr>

<tr>
<td>Street Name<font color="red">*</font></td><td>
<abbr title="enter street name"><input type="text" name="mstreetName" maxlength="50" onblur="mvalidateStreet()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "mcheckStreet"></label></p>
</td>
</tr>

<tr>
<td>Town Name<font color="red"></font></td><td><abbr title="enter town name"><input type="text" name="mtownName" maxlength="30" onblur="mvalidateTown()"></abbr><p style="color:red;display:inline;font-size:11px"><label id = "mcheckTown"></label></p></td>
</tr>

<tr>
<td>City Name<font color="red">*</font></td><td><abbr title="enter city name"><input type="text" name="mcityName" maxlength="30" onblur="mvalidateCity()"></abbr><p style="color:red;display:inline;font-size:11px"><label id = "mcheckCity"></label></p></td>

</tr>

<tr>
<td>Postal Code<font color="red">*</font></td><td><abbr title="enter postal number" ><input type="text" name="mpostalCode" maxlength="20" onblur="mvalidatePostalNo()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "mcheckPostal"></label></p></td>
</tr>

<!--<tr>
<td>Country<font color="red">*</font></td><td><abbr title="enter country name using 3 to 20 alphabets only" ><input type="text" name="mcountry" maxlength="30" onblur="mvalidateCountry()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "mcheckCountry"></label></p>
</td>
</tr>
<tr></tr>-->

<tr>
<td>Country<font color="red">*</font></td>
<td><abbr title="Please select Country of Registration"></abbr>
<select name="mcountry"  onblur="mvalidateCountry()">
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
<p style="color:red;display:inline;font-size:11px"><label id ="mcheckCountry"></label></p>
</td>
</tr>

<tr></tr>
<tr></tr>
<tr>
<td></td>
 <td><input type="submit" value="Continue" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;" onclick="return clearMailAddress()"></td>
 
 </tr>


</table>
</form>
	</div>
	</div>
	</div>
	
	<jsp:include page="/Layout/Footer.jsp"/>
	


</body>


</html>