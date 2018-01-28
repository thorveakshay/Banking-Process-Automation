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
<title>Register Business Customer</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<style>
/*td
{
padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;
}*/

</style>
<script>
function clearBEvidences()
{
	document.getElementById("checkID").innerHTML = "";
	document.getElementById("checkAdd").innerHTML = "";
	document.getElementById("filename1").innerHTML = "";
	document.getElementById("filename2").innerHTML = "";
	document.getElementById("EId").innerHTML = "";
	document.getElementById("cnt").innerHTML ="";
	document.getElementById("cnt").innerHTML = "";
	document.getElementById("cnt").innerHTML = "";
	document.getElementById("cntf").innerHTML = "";
	
}
</script>
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>

	<!-- Start Main Content -->
	
	<div id="main" class="container" >
	<jsp:include page="/Layout/BusinessCustMenu.jsp"/>
	<div id="center">
		<div class="article_wrapper" style="width: 800px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Business Customer Evidences</p><br/></br>
				 	</div>
	
<form name="registerForm" action="/NexusBankingGroup/UploadProofServlet" enctype="multipart/form-data" 
onSubmit="return validfunc6();" method="post">

<input type="hidden" name="action" value="sendForm6"></input>

<input type="hidden" name="businessName" value=" <%=(String)request.getAttribute("msg")%>"></input>
	<br/>
		
		<table align="left" width="800px" style="font-size:12px;">
		
 
			<tr>
		
<td colspan="2" style="padding-left: 10px;">Welcome <%=(String)request.getAttribute("msg")%>, Please enter the following details.<br/></td>

</tr>
	
<tr>
<td colspan="2" style="padding-left: 10px;"><font color="red">Fields marked with * are mandatory</font></td>
</tr>

<tr>
<td style="width:200px; padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;">Contact Number(Work)<font color="red">*</font></td>
<td style="width:600px;"><abbr title="Please enter phone number">+
<input type="text" id="w_countryCode" name="w_countryCode" size="3" maxlength="2" onblur="validateNumber2()">
&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="w_areaCode" name="w_areaCode" size="3" maxlength="3" onblur="validateNumber1()">
&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="phone_no" name="phone_no" maxlength="7" onblur="validateNumber()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "cnt"></label></p></td>
</tr>

<tr>
<td style="padding-top: 0px; padding-bottom: 0px;"></td>
<td style="color:black;display:inline;font-size:11px">Country code&nbsp;&nbsp; Area code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone number</td>
</tr>

<tr>
<td style="padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;">Contact Number(Fax)<font color="red" >*</font></td>
<td><abbr title="Please enter fax number">+<input type="text" id="f_countryCode" name="f_countryCode" size="3" maxlength="2" onblur="validateNumber2F()">
&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="f_areaCode" name="f_areaCode" size="3" maxlength="3" onblur="validateNumber1F()">
&nbsp;--&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="fax_no" name="fax_no" maxlength="7" onblur="validateFNumber()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "cntf"></label></p></td>
</tr>


<tr>
<td style="padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;""></td>
<td style="color:black;display:inline;font-size:11px">Country code&nbsp;&nbsp; Area code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fax number</td>
</tr>


<tr>
<td style="padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;">Email Address<font color="red" >*</font></td>
<td style="padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:10px;"><abbr title="Please enter Main Activity"><input type="text" name="emailId" onblur="validateEmailId()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "EId"></label></p></td>
</tr>

<!--<tr>
<td style="padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;">Additional Details</td><td style="padding-left: 0px;padding-right: 0px;padding-top: 5px;padding-bottom:10px;"><textarea rows="4" cols="27" name="details"></textarea></td>
</tr>

--><tr>
<td style="padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;">Select Id proof<font color="red" >*</font></td>
<td style="padding-left: 10px;"><abbr title="Please select Id Proof"></abbr>
<SELECT id="idProof" name="idProof" onblur="validateIdProof()">
<OPTION VALUE=0 selected>Please Select

<OPTION VALUE="Copy of Form 16">Copy of Form 16</OPTION>
<OPTION VALUE="Copy of Utility Bill">Copy of Utility Bill</OPTION>
</SELECT>
<p style="color:red;display:inline;font-size:11px"><label id = "checkID"></label></p>
</td>
</tr>

<tr>
<td style="padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;">Id Proof <sup><font color="red">*</font></sup>(Upload .jpg,.jpeg format only)</td>
<td style="padding-left: 10px;"><abbr title="Please upload document"><input type="file" name="file_uploading1" title="Upload id proof" ></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "filename1"></label></p></td>
</tr>

<tr>
<td style="padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;">Select Address proof<font color="red" >*</font></td>
<td style="padding-left: 10px;"><abbr title="Please select Address Proof"></abbr>
<SELECT id="addProof" name="addProof" onblur="validateAddProof()">
<OPTION VALUE=0 selected>Please Select
<OPTION VALUE="License">License</OPTION>
<OPTION VALUE="Copy of Utility Bill">Copy of Utility Bill</OPTION>
</SELECT>
<p style="color:red;display:inline;font-size:11px"><label id = "checkAdd"></label></p>
</td>
</tr>

<tr>
<td style="padding-left: 10px;padding-right: 0px;padding-top: 5px;padding-bottom:5px;">Address Proof <sup><font color="red">*</font></sup>(Upload .jpg,.jpeg format only)</td>
<td style="padding-left: 10px;"><abbr title="Please upload document"><input type="file" name="file_uploading2"  title="Upload address proof"></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "filename2"></label></p></td>
</tr>


<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td></td>
 <td style="padding-left: 10px;"><input type="submit" value="Submit" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;" onclick="return clearBEvidences()"></td>
 
 </tr>

</table>
		</form>
		</div>
	</div>
	</div>
<jsp:include page="/Layout/Footer.jsp"/>

</body>

</html>