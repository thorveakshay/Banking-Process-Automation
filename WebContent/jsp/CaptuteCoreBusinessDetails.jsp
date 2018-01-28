<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.List"%>
<%@ page import ="java.util.ArrayList"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Core Business Details</title>
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

function disableCalendar()
{
document.getElementById("eImage").style.display="none";
document.getElementById("rImage").style.display="none";
}
</script>
<script>
function clearCustomerData()
{
document.getElementById("checkBN").innerHTML = "";
document.getElementById("checkTN").innerHTML = "";
document.getElementById("checkBT").innerHTML = "";
document.getElementById("checkBRN").innerHTML = "";
document.getElementById("checkStart").innerHTML = "";
document.getElementById("checkBSS").innerHTML = "";
document.getElementById("checkEAT").innerHTML="";
document.getElementById("checkBC").innerHTML = "";
document.getElementById("checkEN").innerHTML = "";
document.getElementById("checkCore").innerHTML = "";
}

</script>
</head>
<body>
<jsp:include page="layout/Header.jsp"/>

  
	<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="/Layout/BusinessCustMenu.jsp"/>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Core Business Details</p><br/></br>
				 	</div>
	
<form name="registerForm" action="/NexusBankingGroup/CustomerManagementServlet" onSubmit="return validfunc1();" method="post">

<input type="hidden" name="action" value="sendForm1"></input>

		<br/>	
		<%String field=(String)request.getAttribute("field"); %>
		<%String businessName=(String)request.getAttribute("businessName"); %>
		<%String tradingName=(String)request.getAttribute("tradingName"); %>
		<%String businessType=(String)request.getAttribute("businessType"); %>
		<%String branchName=(String)request.getAttribute("branchName"); %>
		<%String isStartUp=(String)request.getAttribute("isStartUp"); %>
		<%String estDate=(String)request.getAttribute("estDate"); %>
		<%String regDate=(String)request.getAttribute("regDate"); %>
		<%String turnover=(String)request.getAttribute("turnover"); %>
		<%String totalBusinessCapital=(String)request.getAttribute("totalBusinessCapital"); %>
		<%String noOfEmployees=(String)request.getAttribute("noOfEmployees"); %>
		<%String businessStatus=(String)request.getAttribute("businessStatus"); %>
		<%String countryOfReg=(String)request.getAttribute("countryOfReg"); %>
		<%String moreAboutBusiness=(String)request.getAttribute("moreAboutBusiness"); %>
		<%String millionPounds=(String)request.getAttribute("millionPounds"); %>
		<table width="700px" style="font-size:12px;">
		
<tr>

<td colspan="2"><font color="red"><%if(field!=null) { %><%=field %><%} else { %>Fields marked with * are mandatory<%}%></font></td>
</tr>
<tr>
<td style="width:200px;"><%if(businessName!=null) { %><%=businessName %><%} else { %>Business Name<%}%><font color="red">*</font></td><td style="width:500px;"><abbr title="Please enter business name">
<input type="text" name="businessName" id="bName" onblur="validBname()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBN"></label></p></td>
</tr>
    
<tr>
<td style="width:200px;"><%if(tradingName!=null) { %><%=tradingName %><%} else { %>Trading Name<%}%><font color="red">*</font></td><td><abbr title="Please enter trading name"><input type="text" name="tradingName" maxlength="60" onblur="validateTname()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkTN"></label></p></td>
</tr>

<tr>
<td style="width:200px;"><%if(businessType!=null) { %><%=businessType %><%} else { %>Business Type<%}%><font color="red">*</font></td>
<td><abbr title="Please select  ss type"></abbr>
<SELECT id="businessType" name="businessType" onblur="validatebusinessType()">
<OPTION VALUE=0 selected>Please Select</OPTION>
<OPTION VALUE="Charity">Charity</OPTION>
<OPTION VALUE="Church">Church</OPTION>
<OPTION VALUE="Club/Society">Club/Society</OPTION>
<OPTION VALUE="Franchise">Franchise</OPTION>
<OPTION VALUE="Govt. & Local Authorities">Government and Local Authorities</OPTION>
<OPTION VALUE="Partnership">Partnership</OPTION>
<OPTION VALUE="Private Limited Company">Private Limited Company</OPTION>
<OPTION VALUE="Public Limited Company">Public Limited Company</OPTION>
<OPTION VALUE="School/College">School/College</OPTION>
</select>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBT"></label></p>
</td>
</tr>

<%List<String> branchList=(List<String>)session.getAttribute("branchList");%>
<tr>
<td style="width:200px;"><%if(branchName!=null) { %><%=branchName %><%} else { %>Branch Name<%}%><font color="red">*</font></td>
<td><abbr title="Please select Bank Branch"></abbr>
<SELECT id="branchName" name="branchName" onblur="validateBranch()">
<OPTION VALUE=0 selected>Please Select</OPTION>
<!--<OPTION VALUE="Bristol">Bristol</OPTION>
<OPTION VALUE="Cardiff">Cardiff</OPTION>
<OPTION VALUE="Dover">Dover</OPTION>
<OPTION VALUE="Liverpool">Liverpool</OPTION>
<OPTION VALUE="London">London</OPTION>
<OPTION VALUE="Manchester">Manchester</OPTION>
<OPTION VALUE="Middlesbrough">Middlesbrough</OPTION>
<OPTION VALUE="Newcastle">Newcastle</OPTION>


	--><%for(String branch:branchList){ %>
			<option value="<%=branch%>"><%=branch%></option>
			<%} %>


</select>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBRN"></label></p>
</td>
</tr>

    
<tr>
<td style="width:200px;"><%if(isStartUp!=null) { %><%=isStartUp %><%} else { %>Are you a startup business?<%}%><font color="red">*</font></td>
<td><abbr title="Please enter startup business"><input type="radio" name="isStartUpBusiness" id="isStart" value="Yes" onclick="validatestartUp1()" onblur="validateStartUp()">Yes
<input type="radio" name="isStartUpBusiness" value="No" onclick="validatestartUp2()" onblur="validateStartUp()">No</abbr><p style="color:red;display:inline;font-size:11px"><label id = "checkStart"></label></p></td>
</tr>


 
<tr>
<td style="width:200px;"><%if(estDate!=null) { %><%=estDate %><%} else { %>Establishment Date<%}%><font color="red"></font></td>
<td><input type="text" name="establismentDate" id="estDate" onblur="validateEDate()" readonly="readonly" ><a id="establismentDate" href="#" onclick="return getCalendar(document.registerForm.establismentDate);"><img id="eImage" src="<%=request.getContextPath() %>/images/calendar.png"" border="0" /></a><label style="color:red;font-size:11px"" id="error_doe"> </label></td>
</tr>

<tr>
<td style="padding-top: 0px;font-size: 10px;">(yyyy/mm/dd)</td>
</tr>


<tr>
<td style="width:200px;"><%if(regDate!=null) { %><%=regDate %><%} else { %>Registration Date<%}%><font color="red"></font></td>
<td><input type="text" name="registrationDate" onblur="validateRDate()" id="regDate" readonly="readonly" ><a id="registerDate" href="#" onclick="return getCalendar(document.registerForm.registrationDate);"><img id="rImage" src="<%=request.getContextPath() %>/images/calendar.png"" border="0" /></a><label style="color:red;font-size:11px;" id="error_dor"></label></td>
</tr>

 <tr>
<td style="padding-top: 0px;font-size: 10px;">(yyyy/mm/dd)</td>
</tr>

<tr>
<td style="width:200px;"><%if(turnover!=null) { %><%=turnover %><%} else { %>Expected Annual Turnover<%}%><font color="red">*</font></td>
<td><abbr title="Please enter expected annual turnover"><input type="text" name="expectedAnnualTurnover" maxlength="2" onblur="validateTurnover()"></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkEAT"></label></p></td>
</tr>

<tr>
<td style="padding-top: 0px;font-size: 10px;">(<%if(millionPounds!=null) { %><%=millionPounds %><%} else { %>IN MILLION POUNDS<%}%>)</td>
</tr>

<tr>
<td style="width:200px;"><%if(totalBusinessCapital!=null) { %><%=totalBusinessCapital %><%} else { %>Total Business Capital<%}%><font color="red">*</font></td>
<td><abbr title="Please enter total Business Capital">
<input type="text" name="bCapital" maxlength="3" onblur="businessCapital()"></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBC"></label></p></td>
</tr>
<tr>
<td style="padding-top: 0px;font-size: 10px;">(<%if(millionPounds!=null) { %><%=millionPounds %><%} else { %>IN MILLION POUNDS<%}%>)</td>
</tr>


<tr>
<td style="width:200px;"><%if(noOfEmployees!=null) { %><%=noOfEmployees %><%} else { %>Number of Employees<%}%><font color="red">*</font></td>
<td><abbr title="Please enter number of employees"><input type="text" name="noOfEmployees" maxlength="10" onblur="numberEmployees()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkEN"></label></p></td>
</tr>

<tr>
<td style="width:200px;"><%if(businessStatus!=null) { %><%=businessStatus %><%} else { %>Business Status<%}%><font color="red">*</font></td><td>
<abbr title="Please enter business status">
<input type="radio" name="businessStatus" value="Active" onblur="validateStatus()">Active 
<input type="radio" name="businessStatus" value="Hold" onblur="validateStatus()">Hold
<input type="radio" name="businessStatus" value="Suspended" onblur="validateStatus()">Suspended</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkBSS"></label></p></td>
</tr>


<tr>
<td style="width:200px;"><%if(countryOfReg!=null) { %><%=countryOfReg %><%} else { %>Country of Registration<%}%><font color="red">*</font></td>
<td><abbr title="Please select Country of Registration"></abbr>
<select id="countryOfRegistration" name="countryRegistration" onblur="validateCoreCountry()">
<OPTION VALUE=0 selected>Please Select</OPTION>
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
<p style="color:red;display:inline;font-size:11px"><label id ="checkCore"></label></p>
</td>
</tr>

<tr>
<td><%if(moreAboutBusiness!=null) { %><%=moreAboutBusiness %><%} else { %>More about your Business<%}%></td><br/><td><textarea rows="4" cols="27" name="tellMoreAboutYourBusiness" ></textarea></td>

</tr>



<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td></td>
 <td ><input type="submit" value="Continue" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;" onclick="return clearCustomerData()"></td>
 
 </tr>

</table>
</form>
		
		</div>
	</div>
	</div>
<jsp:include page="/Layout/Footer.jsp"/>


<script type="text/javascript">

window.onload=disableCalendar;
</script>

</body>

</html>