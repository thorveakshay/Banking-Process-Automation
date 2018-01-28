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
<%boolean flag=(Boolean)session.getAttribute("flag"); %>
<head>
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
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Mailing Address Details</p><br/></br>
				 	</div>	
	
	
	
	
<form name="registerForm" action="/NexusBankingGroup/CustomerManagementServlet" method="post" onSubmit="return validfunc5();">
<input type="hidden" name="action" value="sendUpdatedForm5"></input>

		
		
		<br/>
		<table style="font-size:12px" width="700px">
<%NonPersonalCustomer npc=new NonPersonalCustomer();%>
<%npc=(NonPersonalCustomer)session.getAttribute("customer");%>			



		
		
<tr>
<td><font color="red">Fields marked with * are mandatory</font></td>
</tr>
<tr>
<td style="width:200px;">Building Number<font color="red">*</font></td><td style="width:500px;"><abbr title="enter building number">
<input type="text" name="mbuildingNumber" maxlength="30" onblur ="mvalidateBuildingNo()" value="<%=npc.getAl().get(2).getBuildingNumber() %>"/></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "mcheckNum"></label></p>
</td>
</tr>

<tr>
<td>Building Name<font color="red"></font></td><td><abbr title="enter building number">
<input type="text" name="mbuildingName" maxlength="30" onblur="mvalidateName()"value="<%=npc.getAl().get(2).getBuildingName() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "mcheckName"></label></p></td>
</tr>
<tr>
<td>Street Name<font color="red">*</font></td><td>
<abbr title="enter street name"><input type="text" name="mstreetName" maxlength="50" onblur="mvalidateStreet()" value="<%=npc.getAl().get(2).getStreetName() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "mcheckStreet"></label></p>
</td>
</tr>
<tr>
<td>Town Name<font color="red"></font></td><td><abbr title="enter town name">
<input type="text" name="mtownName" maxlength="30" onblur="mvalidateTown()" value="<%=npc.getAl().get(2).getTownName() %>">
</abbr><p style="color:red;display:inline;font-size:11px"><label id = "mcheckTown"></label></p></td>
</tr>

<tr>
<td>City Name<font color="red">*</font></td><td><abbr title="enter city name">
<input type="text" name="mcityName" maxlength="30" onblur="mvalidateCity()" value="<%=npc.getAl().get(2).getCityName() %>">
</abbr><p style="color:red;display:inline;font-size:11px"><label id = "mcheckCity"></label></p></td>

</tr>

<tr>
<td>Postal Code<font color="red">*</font></td><td><abbr title="enter postal number" >
<input type="text" name="mpostalCode" maxlength="20" onblur="mvalidatePostalNo()" value="<%=npc.getAl().get(2).getPostalCode() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "mcheckPostal"></label></p></td>
</tr>

<tr>
<td>Country<font color="red">*</font></td>
<td><abbr title="Please select Country"></abbr>
<select name="mcountry"  onblur="mvalidateCountry()">
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
<p style="color:red;display:inline;font-size:11px"><label id ="mcheckCountry"></label></p>
</td>
</tr>






<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td></td>
 <td><input type="submit" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;" value="submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;""></td>
 
 </tr>


</table>
</form>
	</div>
	</div>
	</div>
	
	<jsp:include page="/Layout/Footer.jsp"/>
	


</body>


</html>

