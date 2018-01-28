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
<%@page import="com.training.model.NonPersonalCustomer"%>
<%@page import="com.training.model.NonPersonalCustomer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<html>
<head>
<%boolean flag=(Boolean)session.getAttribute("flag"); %>
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
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>

	<!-- Start Main Content -->
	<div id="main" class="container" style= "width:1000px" >
	<% if(flag!=true){%>
	<jsp:include page="/Layout/BusinessCustOperationsMenu.jsp"/>
	<% }else{%>
	<jsp:include page="/Layout/BusinessCustUpdateMenu.jsp"/>
	<% }%>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Business Address Details</p><br/></br>
				 	</div>
	
	
	
<form name="registerForm" action="/NexusBankingGroup/CustomerManagementServlet"  method="post" onSubmit="return validfunc3()">

<input type="hidden" name="action" value="sendUpdatedForm3"></input>
<input type="hidden" name="businessName" value=" <%=(String)request.getAttribute("msg")%>"></input>
		
		
		<br/>
		
		<table align="center" style="font-size:12px">


<%NonPersonalCustomer npc=new NonPersonalCustomer();%>
<%npc=(NonPersonalCustomer)session.getAttribute("customer");%>



<tr>
<td><font color="red">Fields marked with * are mandatory</font></td>
</tr>


<tr>
<td>Building Number<font color="red">*</font></td>
<td><abbr title="enter building number"><input type="text" name="buildingNumber"  maxlength="20" value="<%=npc.getAl().get(0).getBuildingNumber() %>" onblur ="validateBuildingNo()" /></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkNum"></label></p>
</td>
</tr>

<tr>
<td>Building Name<font color="red"></font></td>
<td><abbr title="enter building number"><input type="text" name="buildingName"  maxlength="30" value="<%=npc.getAl().get(0).getBuildingName()%>" onblur="validateName()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkName"></label></p></td>
</tr>


<tr>
<td>Street Name<font color="red">*</font></td>
<td>
<abbr title="enter street name"><input type="text" name="streetName" maxlength="50" onblur="validateStreet()" value="<%=npc.getAl().get(0).getStreetName() %>" ></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkStreet"></label></p>
</td>
</tr>

<tr>
<td>Town Name<font color="red"></font></td>
<td><abbr title="enter town name"><input type="text" name="townName" maxlength="30" onblur="validateTown()" value="<%=npc.getAl().get(0).getTownName() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkTown"></label></p></td>
</tr>

<tr>
<td>City Name<font color="red">*</font></td>
<td><abbr title="enter city name"><input type="text" name="cityName" maxlength="30" value="<%=npc.getAl().get(0).getCityName() %>" onblur="validateCity()"></abbr><p style="color:red;display:inline;font-size:11px"><label id = "checkCity"></label></p></td>
</tr>

<tr>
<td>Postal Code<font color="red">*</font></td>
<td><abbr title="enter postal number" ><input type="text" name="postalCode"  maxlength="20" onblur="validatePostalNo()" value="<%=npc.getAl().get(0).getPostalCode() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkPostal"></label></p></td>
</tr>

<tr>
<td>Country<font color="red">*</font></td>
<td><abbr title="Please select Country"></abbr>
<select name="country"  onblur="validateCountry()">
<OPTION VALUE=0>--- Please Select ----</OPTION>
<OPTION VALUE="United Kingdom" <%if(npc.getAl().get(0).getCountry().equals("United Kingdom")){out.println("selected");} %>>United Kingdom</OPTION>
<OPTION VALUE="Australia" <%if(npc.getAl().get(0).getCountry().equals("Australia")){out.println("selected");} %>>Australia</OPTION>
<OPTION VALUE="Brazil" <%if(npc.getAl().get(0).getCountry().equals("Brazil")){out.println("selected");} %>>Brazil</OPTION>
<OPTION VALUE="China" <%if(npc.getAl().get(0).getCountry().equals("China")){out.println("selected");} %>>China</OPTION>
<OPTION VALUE="Canada" <%if(npc.getAl().get(0).getCountry().equals("Canada")){out.println("selected");} %>>Canada</OPTION>
<OPTION VALUE="India" <%if(npc.getAl().get(0).getCountry().equals("India")){out.println("selected");} %>>India</OPTION>
<OPTION VALUE="Japan" <%if(npc.getAl().get(0).getCountry().equals("Japan")){out.println("selected");} %>>Japan</OPTION>
<OPTION VALUE="Kenya" <%if(npc.getAl().get(0).getCountry().equals("Kenya")){out.println("selected");} %>>Kenya</OPTION>
<OPTION VALUE="NewZealand" <%if(npc.getAl().get(0).getCountry().equals("NewZealand")){out.println("selected");} %>>NewZealand</OPTION>
<OPTION VALUE="Pakistan" <%if(npc.getAl().get(0).getCountry().equals("Pakistan")){out.println("selected");} %>>Pakistan</OPTION>
<OPTION VALUE="South Africa" <%if(npc.getAl().get(0).getCountry().equals("South Africa")){out.println("selected");} %>>South Africa</OPTION>
<OPTION VALUE="Zimbabwe" <%if(npc.getAl().get(0).getCountry().equals("Zimbabwe")){out.println("selected");} %>>Zimbabwe</OPTION>
<OPTION VALUE="Other" <%if(npc.getAl().get(0).getCountry().equals("Other")){out.println("selected");} %>>Other</OPTION>
</select>
<p style="color:red;display:inline;font-size:11px"><label id ="checkCountry"></label></p>
</td>
</tr>

<tr>
<td>Are your Correspondence and Mailing </td>
</tr>

<tr>
<td> addresses same as Business address ?</td>
<td><abbr title="Please select address details "><input type="radio" name="sameAddress" value="Yes" onblur="validateSameAdd()">Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="sameAddress" value="No" onblur="validateSameAdd()">No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkAddr"></label></p></td> 
</tr>


 <tr>
 <td></td>
 <td><br/><input type="submit" value="submit" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;"></td>
 
 </tr>

</table>
</form>	


	</div>
	
</div>
	
</div>	


</body>
<jsp:include page="/Layout/Footer.jsp"/>

</html>