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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/BusinessCustValidation.js"></script>
<head>
<%boolean flag=(Boolean)session.getAttribute("flag"); %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Correspondence Address</title>
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
	<div id="main" class="container">
		<% if(flag!=true){%>
	<jsp:include page="/Layout/BusinessCustOperationsMenu.jsp"/>
	<% }else{%>
	<jsp:include page="/Layout/BusinessCustUpdateMenu.jsp"/>
	<% }%>
<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Correspondence Address Details</p><br/></br>
				 	</div>	
	
	
	
	
<form name="registerForm" action="/NexusBankingGroup/CustomerManagementServlet" method="post" onSubmit="return validfunc4();">
<input type="hidden" name="action" value="sendUpdatedForm4"></input>

		
		
		<br/>
		<table style="font-size:12px" width="700px">
<%NonPersonalCustomer npc=new NonPersonalCustomer();%>
<%npc=(NonPersonalCustomer)session.getAttribute("customer");%>			



		
		
<tr>
<td><font color="red">Fields marked with * are mandatory</font></td>
</tr>
<tr>
<td style="width:200px;">Building Number<font color="red">*</font></td><td style="width:500px;"><abbr title="enter building number">
<input type="text" name="cbuildingNumber" onblur ="cvalidateBuildingNo()" value="<%=npc.getAl().get(1).getBuildingNumber() %>"/></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "ccheckNum"></label></p>
</td>
</tr>

<tr>
<td>Building Name<font color="red"></font></td><td><abbr title="enter building number">
<input type="text" name="cbuildingName" onblur="cvalidateName()"value="<%=npc.getAl().get(1).getBuildingName() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "ccheckName"></label></p></td>
</tr>
<tr>
<td>Street Name<font color="red">*</font></td><td>
<abbr title="enter street name"><input type="text" name="cstreetName" onblur="cvalidateStreet()" value="<%=npc.getAl().get(1).getStreetName() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "ccheckStreet"></label></p>
</td>
</tr>
<tr>
<td>Town Name<font color="red"></font></td><td><abbr title="enter town name">
<input type="text" name="ctownName" onblur="cvalidateTown()" value="<%=npc.getAl().get(1).getTownName() %>">
</abbr><p style="color:red;display:inline;font-size:11px"><label id = "ccheckTown"></label></p></td>
</tr>

<tr>
<td>City Name<font color="red">*</font></td><td><abbr title="enter city name">
<input type="text" name="ccityName" onblur="cvalidateCity()" value="<%=npc.getAl().get(1).getCityName() %>">
</abbr><p style="color:red;display:inline;font-size:11px"><label id = "ccheckCity"></label></p></td>

</tr>

<tr>
<td>Postal Code<font color="red">*</font></td><td><abbr title="enter postal number" >
<input type="text" name="cpostalCode" onblur="cvalidatePostalNo()" value="<%=npc.getAl().get(1).getPostalCode() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "ccheckPostal"></label></p></td>
</tr>

<tr>
<td>Country<font color="red">*</font></td>
<td><abbr title="Please select Country"></abbr>
<select name="ccountry"  onblur="cvalidateCountry()">
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
<p style="color:red;display:inline;font-size:11px"><label id ="ccheckCountry"></label></p>
</td>
</tr>

<tr>
<td>Is your Mailing </td>
</tr>
<tr>
<td> address same as Correspondence address ?</td>
<td><abbr title="Please select address details ">
<input type="radio" name="sameAddress1" value="Yes" onblur="validateSameAdd1()">Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="sameAddress1" value="No" onblur="validateSameAdd1()">No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkAddr1"></label></p></td> 
</tr>




<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td></td>
 <td><input type="submit" value="submit" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;"></td>
 
 </tr>


</table>
</form>
	</div>
	</div>
	</div>
	
	<jsp:include page="/Layout/Footer.jsp"/>
	


</body>


</html>

