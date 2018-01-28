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
<%boolean flag=(Boolean)session.getAttribute("flag"); %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Business Customer</title>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/BusinessCustValidation.js"></script> 
<script>
var calendarWindow = null;
var calendarColors = new Array();
calendarColors['bgColor'] = '#BDC5D0';
calendarColors['borderColor'] = '#333366';
calendarColors['headerBgColor'] = '#143464';
calendarColors['headerColor'] = '#FFFFFF';
calendarColors['dateBgColor'] = '#8493A8';
calendarColors['dateColor'] = '#004080';
calendarColors['dateHoverBgColor'] = '#FFFFFF';
calendarColors['dateHoverColor'] = '#8493A8';
var calendarMonths = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
var calendarWeekdays = new Array('S', 'M', 'T', 'W', 'T', 'F', 'S', 'S');
var calendarUseToday = true;
var calendarFormat = 'y/m/d';
var calendarStartMonday = true;
var calendarScreenX = 100; // either 'auto' or numeric
var calendarScreenY = 100; // either 'auto' or numeric


function getCalendar(in_dateField) 
{
 	if (calendarWindow && !calendarWindow.closed) 
 	 {

 	     alert('Calendar window already open.  Attempting focus...');

 	     try
			{
         calendarWindow.focus();
     		}
     	catch(e) {}
     
     return false;
 	 }

 				var cal_width = 415;
 				var cal_height = 310;

 				// IE needs less space to make this thing
 				if ((document.all) && (navigator.userAgent.indexOf("Konqueror") == -1))
 	 		 	{
   			  			cal_width = 410;
    
 			 }

 			calendarTarget = in_dateField;
 			calendarWindow = window.open('<%=request.getContextPath()%>/jsp/calendar.jsp', 'dateSelectorPopup','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=0,dependent=no,width='+cal_width+',height='+cal_height + (calendarScreenX != 'auto' ? ',screenX=' + calendarScreenX : '') + (calendarScreenY != 'auto' ? ',screenY=' + calendarScreenY : ''));

			return false;
}


/*function validateCalendar()
{
	if (document.registerForm.isStartUpBusiness[0].checked==true)
	{
		return getCalendar(document.registerForm.registrationDate());
	}
	if (document.registerForm.isStartUpBusiness[1].checked==true)
	{
		return getCalendar(document.registerForm.establismentDate());
	}
	
}*/
</script>
<script>
document.getElementById("checkBN").innerHTML = "";
document.getElementById("checkTN").innerHTML = "";
document.getElementById("checkBT").innerHTML = "";
document.getElementById("checkBRN").innerHTML = "";
document.getElementById("checkStart").innerHTML = "";
document.getElementById("checkBSS").innerHTML = "";
document.getElementById("checkEAT").innerHTML="";
document.getElementById("checkBC").innerHTML = "";
document.getElementById("checkEN").innerHTML = "";
document.getElementById("checkC").innerHTML = "";

</script>
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
	<!-- Start Main Content -->
	<div id="main" class="container" >
	<% if(flag!=true){%>
	<jsp:include page="/Layout/BusinessCustOperationsMenu.jsp"/>
	<% }else{%>
	<jsp:include page="/Layout/BusinessCustUpdateMenu.jsp"/>
	<% }%>
		<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Core Business Details</p><br/></br>
				 	</div>
	
	
<form name="registerForm" action="/NexusBankingGroup/CustomerManagementServlet"  method="post" onSubmit="return validfunc1();">

<input type="hidden" name="action" value="sendUpdatedForm1"></input>
		
		
		<br/>	
		<table style="font-size:12px;float:left" >
		
<tr>

<%NonPersonalCustomer npc=new NonPersonalCustomer();%>
<%npc=(NonPersonalCustomer)session.getAttribute("customer");%>

<td><font color="red">Fields marked with * are mandatory</font></td>
</tr>
<tr>
<td style="width:200px;">Business Name<font color="red">*</font></td>
<td><abbr title="Please enter business name">
<input type="text" name="businessName" id="bName" onblur="validBname()" value="<%=npc.getBusinessName()%>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBN"></label></p></td>
</tr>
    
<tr>
<td>Trading Name<font color="red">*</font></td>
<td><abbr title="Please enter trading name">
<input type="text" name="tradingName" onblur="validateTname()" value="<%=npc.getTradingName() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkTN"></label></p></td>
</tr>    

<tr>
<td>Business Type<font color="red">*</font></td>
<td><abbr title="Please select Business type"></abbr>
<SELECT id="businessType" name="businessType" onblur="validatebusinessType()">
<OPTION VALUE=0 >Please Select</option>
<OPTION VALUE="Charity"<%if(npc.getBusinessType().equals("Charity")){out.println("selected");} %>>Charity</OPTION>
<OPTION VALUE="Church"<%if(npc.getBusinessType().equals("Church")){out.println("selected");} %>>Church</OPTION>
<OPTION VALUE="Club/Society"<%if(npc.getBusinessType().equals("Club/Society")){out.println("selected");} %>>Club/Society</OPTION>
<OPTION VALUE="Franchise"<%if(npc.getBusinessType().equals("Franchise")){out.println("selected");} %>>Franchise</OPTION>
<OPTION VALUE="Govt. & Local Authorities"<%if(npc.getBusinessType().equals("Govt. & Local Authorities")){out.println("selected");} %>>Government and Local Authorities</OPTION>
<OPTION VALUE="Partnership"<%if(npc.getBusinessType().equals("Partnership")){out.println("selected");} %>>Partnership</OPTION>
<OPTION VALUE="Private Limited Company"<%if(npc.getBusinessType().equals("Private Limited Company")){out.println("selected");} %>>Private Limited Company</OPTION>
<OPTION VALUE="Public Limited Company"<%if(npc.getBusinessType().equals("Public Limited Company")){out.println("selected");} %>>Public Limited Company</OPTION>
<OPTION VALUE="School/College"<%if(npc.getBusinessType().equals("School/College")){out.println("selected");} %>>School/College</OPTION>

</select>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBT"></label></p>
</td>
</tr>


<tr>
<td>Bank Branch Name<font color="red">*</font></td>
<td><abbr title="Please select Bank Branch"></abbr>
<SELECT id="branchName" name="branchName" onblur="validateBranch()">
<OPTION VALUE=0>Please Select</OPTION>
<OPTION VALUE="Bristol"<%if(npc.getBankBranch().equalsIgnoreCase("Bristol")){out.println("selected");} %>>Bristol</OPTION>
<OPTION VALUE="Cardiff"<%if(npc.getBankBranch().equalsIgnoreCase("Cardiff")){out.println("selected");} %>>Cardiff</OPTION>
<OPTION VALUE="Dover"<%if(npc.getBankBranch().equalsIgnoreCase("Dover")){out.println("selected");} %>>Dover</OPTION>
<OPTION VALUE="Liverpool"<%if(npc.getBankBranch().equalsIgnoreCase("Liverpool")){out.println("selected");} %>>Liverpool</OPTION>
<OPTION VALUE="London"<%if(npc.getBankBranch().equalsIgnoreCase("London")){out.println("selected");} %>>London</OPTION>
<OPTION VALUE="Manchester"<%if(npc.getBankBranch().equalsIgnoreCase("Manchester")){out.println("selected");} %>>Manchester</OPTION>
<OPTION VALUE="Middlesbrough"<%if(npc.getBankBranch().equalsIgnoreCase("Middlesbrough")){out.println("selected");} %>>Middlesbrough</OPTION>
<OPTION VALUE="Newcastle"<%if(npc.getBankBranch().equalsIgnoreCase("Newcastle")){out.println("selected");} %>>Newcastle</OPTION>
</select>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBRN"></label></p>
</td>
</tr>

    
<tr>
<td>Are you a Start-up Business?<font color="red">*</font></td>
<td><abbr title="Please enter startup business"><input type="radio" name="isStartUpBusiness" id="isStart" value="Yes" onclick="validatestartUp1()" onblur="validateStartUp()"<%if(npc.getIsStartUpBusiness().equals("Yes")){out.println("checked");} %>>Yes
<input type="radio" name="isStartUpBusiness" value="No" onclick="validatestartUp2()" onblur="validateStartUp()"<%if(npc.getIsStartUpBusiness().equals("No")){out.println("checked");}%>>No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkStart"></label></p></td>
</tr>

<tr>
<td style="padding-bottom: 0px; ">Establishment Date</td>
<td><input type="text" name="establismentDate"  id="estDate" onblur="validateEDate()" readonly="readonly" value="<%=npc.getDateEstablished()%>"><a id="establismentDate" href="#" onclick="return getCalendar(document.registerForm.establismentDate);"><img id="eImage" src="<%=request.getContextPath() %>/images/calendar.png" border="0" /></a></td>

</tr>


<tr>
<td style="padding-top: 0px;font-size: 10px;">(yyyy/mm/dd)</td>
</tr>

<tr>
<td style="padding-bottom: 0px; ">Registration Date</td>
<td><input type="text" name="registrationDate" id="regDate" onblur="validateRDate()" readonly="readonly" value="<%=npc.getDateOfRegistration()%>"></input><a id="registrationDate" href="#" onclick="return getCalendar(document.registerForm.registrationDate);"><img id="rImage"  src="<%=request.getContextPath() %>/images/calendar.png" border="0" /></a></td>
</tr>

<tr>
<td style="padding-top: 0px;font-size: 10px;">(yyyy/mm/dd)</td>
</tr>


<tr>
<td style="padding-bottom: 0px; ">Expected Annual Turnover<font color="red">*</font></td>
<td><abbr title="Please enter expected annual turnover"><input type="text" name="expectedAnnualTurnover" maxlength="2" value="<%=npc.getExpectedAnnualTurnover() %>" onblur="validateTurnover()"></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkEAT"></label></p></td>
</tr>

<tr>
<td style="padding-top: 0px;font-size: 10px;">( in million pounds)</td>
</tr>

<tr>
<td style="padding-bottom: 0px; ">Total Business Capital<font color="red">*</font></td>
<td><abbr title="Please enter total Business Capital">
<input type="text" name="bCapital" maxlength="3" value="<%=npc.getTotalBusinessCapital() %>" onblur="businessCapital()"></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBC"></label></p></td>
</tr>
<tr>
<td style="padding-top: 0px;font-size: 10px;">( in million pounds)</td>
</tr>

<tr>
<td>Number of Employees<font color="red">*</font></td>
<td><abbr title="Please enter number of employees"><input type="text" name="noOfEmployees" maxlength="10" onblur="numberEmployees()" value="<%=npc.getNumberOfEmployees() %>"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkEN"></label></p></td>
</tr>

<tr>
<td>Business Status<font color="red">*</font></td><td>
<abbr title="Please enter business status">
<input type="radio" name="businessStatus" value="Active"<%if(npc.getBusinessStatus().equals("Active")){out.println("checked");} %>onblur="validateStatus()">Active 
<input type="radio" name="businessStatus" value="Hold"<%if(npc.getBusinessStatus().equals("Hold")){out.println("checked");} %>onblur="validateStatus()">Hold
<input type="radio" name="businessStatus" value="Suspended"<%if(npc.getBusinessStatus().equals("Suspended")){out.println("checked"); }%>onblur="validateStatus()">Suspended</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBSS"></label></p>
</td>
</tr>


<tr>
<td>Country of Registration<font color="red">*</font></td>
<td><abbr title="Please select Country of Registration"></abbr>
<select id="countryOfRegistration" name="countryRegistration" onblur="validateCoreCountry()">
<OPTION VALUE=0>Please Select</OPTION>
<OPTION VALUE="United Kingdom"<%if(npc.getCountryOfRegistration().equals("United Kingdom")){out.println("selected");} %>>United Kingdom</OPTION>
<OPTION VALUE="Australia"<%if(npc.getCountryOfRegistration().equals("Australia")){out.println("selected");} %>>Australia</OPTION>
<OPTION VALUE="Brazil"<%if(npc.getCountryOfRegistration().equals("Brazil")){out.println("selected");} %>>Brazil</OPTION>
<OPTION VALUE="China"<%if(npc.getCountryOfRegistration().equals("Chaina")){out.println("selected");} %>>China</OPTION>
<OPTION VALUE="Canada"<%if(npc.getCountryOfRegistration().equals("Canada")){out.println("selected");} %>>Canada</OPTION>
<OPTION VALUE="India"<%if(npc.getCountryOfRegistration().equals("India")){out.println("selected");} %>>India</OPTION>
<OPTION VALUE="Japan"<%if(npc.getCountryOfRegistration().equals("Japan")){out.println("selected");} %>>Japan</OPTION>
<OPTION VALUE="Kenya"<%if(npc.getCountryOfRegistration().equals("Keneya")){out.println("selected");} %>>Kenya</OPTION>
<OPTION VALUE="NewZealand"<%if(npc.getCountryOfRegistration().equals("NewZeland")){out.println("selected");} %>>NewZealand</OPTION>
<OPTION VALUE="Pakistan"<%if(npc.getCountryOfRegistration().equals("Pakistan")){out.println("selected");} %>>Pakistan</OPTION>
<OPTION VALUE="South Africa"<%if(npc.getCountryOfRegistration().equals("South Africa")){out.println("selected");} %>>South Africa</OPTION>
<OPTION VALUE="Zimbabwe"<%if(npc.getCountryOfRegistration().equals("Zimbabwe")){out.println("selected");} %>>Zimbabwe</OPTION>
<OPTION VALUE="Other"<%if(npc.getCountryOfRegistration().equals("Other")){out.println("selected");} %>>Other</OPTION>
</select>
<p style="color:red;display:inline;font-size:11px"><label id ="checkCore"></label></p>
</td>
</tr>

<%if(npc.getTellMoreAboutYourBusiness()!=null){ %>
<tr>
<td>More about your business</td>
<td><textarea rows="4" cols="27" name="tellMoreAboutYourBusiness" ><%=npc.getTellMoreAboutYourBusiness() %></textarea>
</td>
</tr>
<%} %>

<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td></td>
 
 <td><input type="submit" value="Continue" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
 <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;"></td>
 
 </tr>

</table>
</form>
		
		</div>
	</div>
	</div>
<jsp:include page="/Layout/Footer.jsp"/>

</body>

</html>



















