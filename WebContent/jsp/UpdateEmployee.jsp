<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.training.model.Employee" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
<title>Update Form</title>
   <link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/common.css"/> 

<style>
td
{
padding-left: 10px;
padding-right: 10px;
padding-top: 5px;
padding-bottom:5px;
}
#b1,#b2{
		display: inline;
		/*float: left;*/
		width: auto;
		line-height:1em;
		text-align: center;
		background: #659AA6;
		border: 1px solid #fff;
		color: #fff;
		cursor: pointer;
		margin:0;
		padding:3px 8px; /* IE6 */
	}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/EmployeeValidation.js"></script> 
<script>
// }}}
// {{{ settings (Editable)

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
 
// }}}
// {{{ getCalendar()
 
function getCalendar(in_dateField) 
{
    if (calendarWindow && !calendarWindow.closed) {
        alert('Calendar window already open.  Attempting focus...');
        try {
            calendarWindow.focus();
        }
        catch(e) {}
        
        return false;
    }
 
    var cal_width = 415;
    var cal_height = 310;
 
    // IE needs less space to make this thing
    if ((document.all) && (navigator.userAgent.indexOf("Konqueror") == -1)) {
        cal_width = 410;
       
    }
 
    calendarTarget = in_dateField;
    calendarWindow = window.open('<%=request.getContextPath()%>/jsp/calendar.jsp', 'dateSelectorPopup','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=0,dependent=no,width='+cal_width+',height='+cal_height + (calendarScreenX != 'auto' ? ',screenX=' + calendarScreenX : '') + (calendarScreenY != 'auto' ? ',screenY=' + calendarScreenY : ''));
 
    return false;
}
 
// }}}
// {{{ killCalendar()
 
function killCalendar() 
{
    if (calendarWindow && !calendarWindow.closed) 
    {
        calendarWindow.close();
    }
}
 
// }}}
 

</script>
<script>
   function clearRegisteredData()
   {
   	document.getElementById("checkName").innerHTML = "";
   	document.getElementById("LastName").innerHTML = "";
   	document.getElementById("BirthDate").innerHTML = "";
   	document.getElementById("Dsgn").innerHTML = "";
   	document.getElementById("BId").innerHTML = "";
   	document.getElementById("Cnum").innerHTML = "";
   	document.getElementById("EId").innerHTML = "";
   	document.getElementById("joindate").innerHTML = "";
   	document.getElementById("ChGrp").innerHTML = "";
   	return true;
   }
   </script>
</head>

<body>
<%Employee emp = (Employee)session.getAttribute("employee");%>
<%Employee e = new Employee();%>
<%e = (Employee)session.getAttribute("emp"); %>
<div id="header">
		<div class="container">
			<h1><a href="/NexusBankingGroup" title="NEXUS BANKING GROUP">NEXUS BANKING GROUP<span></span></a></h1>
			<hr />
			<!-- top navigation -->
			<ul id="navigation">
				<li><font color="white">Welcome <%=e.getfName() +" "+ e.getlName()+" ( "+ e.getDesignation().toLowerCase()+" )"%></font></li>
				<li><a href="/NexusBankingGroup/LoginServlet?action=logout" title="Logout" title="Logout">Logout</a></li>
			</ul>
			<hr />
			<!-- banner message and building background -->
			<div id="banner">
				Welcome to NEXUS BANKING GROUP,We believe in serving you.
			</div>
			<hr />
		</div>
	</div>
<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="/Layout/AdminMenuNavg.jsp"/>
	<div id="center">
		<div class="article_wrapper">
			<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  align="left"style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px">UPDATE EMPLOYEE</p><br/>
				 	</div> 
		  
		<br/>
    
		  	<form name="f1" action ="/NexusBankingGroup/EmployeeManageServlet" onsubmit="return validateForm()" method="post">
		  	<input type="hidden" name ="action" value ="UpdatedEmployeeDetails"/>
		  	<!--  <p align="center"style="color:red;">Fields marked with * are mandatory</p> -->
			<table align ="center" style="font-size:15px;width: 800px"; >
			<tr>
			<td></td><td></td><td></td><td><a href="/NexusBankingGroup/jsp/viewProfileA.jsp"><font size="3px" ><u>Back</u></font></a> 		  
		  </td>
		  </tr>
		  <tr><td colspan="2"><p align="left"style="color:red;font-size:13px"">Fields marked with * are mandatory</p></td></tr>
			<tr>
			<td style="width:200px;">First Name<font color="red">*</font></td>
			
			<td style="width:400px;"><abbr title="Please enter first name containing alphabets and . only"><input name = "fname" type="text" onblur="validateFName()"  value=<%=emp.getfName() %>></abbr>
			<p style="color:red;display:inline;font-size:13px"><label id = "checkName"></label></p>
			</td>
			</tr>
			
			<tr>
			<td>Last Name<font color="red">*</font></td>
			
			<td><abbr title="Please enter last name containing alphabets and . only"><input name = "lname" type="text"  onblur="validateLName()" value=<%= emp.getlName() %>> </abbr>
			<p style="color:red;display:inline;font-size:13px"><label id = "LastName"></label></p>
			</td>
			</tr>
			
			<tr>
			<td>Date of Birth</td>
			<td>
			<input type="text" name="dob" readonly="readonly" onblur="validateDateOfBirth()" value=<%=emp.getDateOfBirth() %>>
			<a href="#" onclick="return getCalendar(document.f1.dob);">
			<img src="<%=request.getContextPath() %>/images/calendar.png" border="0" /></a> 
			<p style="color:red;display:inline;font-size:13px"><label id = "BirthDate"></label></p>
			<!--  <input name = "dob" type="text" />  -->
		    </td>
			</tr>
			
			<!--  <tr>
			<td>Status</td>
			<td><input name = "status" type="radio" />Active<br/>
			<input name = "status" type="radio" />Inactive</td>
			</tr>  -->
			
			<tr>
			<td>Role of Employee<font color="red">*</font></td>
			<td>
			<select name="designation" onblur="validateDesignation()" onchange="myfun()">
			<option value=0>Select Role</option>
			<option value="ADMINISTRATOR"  <%if(emp.getDesignation().equalsIgnoreCase("ADMINISTRATOR")){ out.println("selected");}%>onclick="myfun()">Administrator</option>
			<option value="RELATIONSHIP MANAGER"  <%if(emp.getDesignation().equalsIgnoreCase("RELATIONSHIP MANAGER")){ out.println("selected");}%>onclick="myfun()">Relationship Manager</option>
			<option value="HELPDESK EMPLOYEE"  <%if(emp.getDesignation().equalsIgnoreCase("HELPDESK EMPLOYEE")){ out.println("selected");}%>onclick="myfun()">HelpDesk Employee</option>
			<option value="BACKOFFICE EMPLOYEE" <% if(emp.getDesignation().equalsIgnoreCase("BACKOFFICE EMPLOYEE")){ out.println("selected");}%>onclick="myfun()" >Back Office Employee</option>
			<option value="COMMERCIAL ACCOUNT OPENER" <% if(emp.getDesignation().equalsIgnoreCase("COMMERCIAL ACCOUNT OPENER")){ out.println("selected");}%>onclick="myfun()" >Commercial Account Opener</option>
			</select>
			<p style="color:red;display:inline;font-size:13px"><label id ="Dsgn"></label></p></td>
			</tr>
			
			<%List<String> branchList=(List<String>)request.getAttribute("branchList");%>
			<tr>
			<td>Branch<font color="red">*</font></td>
			<td>
			<select name="branch" onblur="validateBranch()">
			<option value=0>Select Branch</option>
			<%for(String branch:branchList){ %>
			<option value="<%=branch%>"<%if(emp.getBranchName().equalsIgnoreCase(branch)){ out.println("selected");}%>><%=branch%></option>
			<%} %>
			</select><p style="color:red;display:inline;font-size:13px"><label id ="BId"></label></p></td>
		
			</tr>
			
			<tr>
			<td>Date of Joining</td>
			<td>
			<input type="text" name="datejoin" readonly="readonly" onblur="validateDateOfJoin()" value=<%=emp.getDateOfJoin()%>>
				<!--  <input name = "datejoin" type="text" />  -->
				<a href="#" onclick="return getCalendar(document.f1.datejoin);">
			<img src="<%=request.getContextPath() %>/images/calendar.png" border="0" /></a> 
				<p style="color:red;display:inline;font-size:13px"><label id = "joindate"></label></p>
		    </td>
			</tr>
			
			<tr>
			
			<td>Address</td>
			<td><textarea name = "address" rows="3" cols="15" ><%if(emp.getAddress() != null && !(emp.getAddress().equals(""))){ %><%=emp.getAddress()%><%} %><%else{ %><%=""%><%} %></textarea>
			</td>
			</tr>
			
			<tr>
			<td>Contact Number <font color="red">*</font></td>
			
			<td><abbr title="Please enter Contact Number containing digits from 0 to 9"><input name="contactNo" type ="text" onblur="validateNumber()" value=<%=emp.getContactNumber() %>></abbr>
	<p style="color:red;display:inline;font-size:13px"><label id = "Cnum"></label></p></td>
			
			</tr>
			
			<tr>
			
			<td>Email Id<font color="red">*</font></td>
			
			<td><abbr title="Please enter Email id containing @ and ."><input name="email" type="text" onblur="validateEmail()" value=<%=emp.getEmailId()%>></abbr>
			<p style="color:red;display:inline;font-size:13px"><label id = "EId"></label></p></td>
			
			</tr>
		
			<tr><td>Group</td>
			<%List<String> gList=emp.getGroups(); %>
			<td><input type="checkbox" name="chbox" value="BB_CAO_Common" <%if(gList.contains("BB_CAO_Common")){out.println("checked");}  %>>Common<br/>
			<input type="checkbox" name="chbox" value="BB_CAO_Prod" <%if(gList.contains("BB_CAO_Prod")){out.println("checked");}  %>>Prod<br/>
			<input type="checkbox" name="chbox" value="BB_CAO_Main" <%if(gList.contains("BB_CAO_Main")){out.println("checked");}  %>>Main<br/>
			<input type="checkbox" name="chbox" onblur="validateGroup()"  value="BB_CAO_Hdesk" <%if(gList.contains("BB_CAO_Hdesk")){out.println("checked");}  %>>HDESK
			<p style="color:red;display:inline;font-size:13px"><label id = "ChGrp"></label></p></td>
			
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr><tr></tr><tr></tr><tr></tr>
            <tr>
			<td></td><td><input id="b1" name="button1" type="submit" value="Update" />&nbsp;&nbsp;&nbsp;
		
						<input id="b2" name="button2" type="reset" onclick="return clearRegisteredData()" /></td>
			</tr>
			</table>
			</form>
			
		</div>
	</div>
	</div>
	


<jsp:include page="/Layout/Footer.jsp"/>

</body>
</html>