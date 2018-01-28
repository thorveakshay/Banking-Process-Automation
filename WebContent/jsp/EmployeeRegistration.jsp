<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.training.model.Employee" %>
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
<title>Registration Form</title>
   <link rel="stylesheet" type="text/css"  href="<%=request.getContextPath() %>/css/common.css"/> 
   <script>
   function clearRegistrationData()
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
<style>
td
{
padding-left: 0px;
padding-right: 50px;
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
		border: 0.2px solid #fff;
		color: #fff;
		cursor: pointer;
		margin:0;
		padding:3px 8px; /* IE6 */
	}
</style>


<script type="text/javascript" src="<%=request.getContextPath()%>/js/EmployeeValidation.js"></script> 
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
 

 
function killCalendar() 
{
    if (calendarWindow && !calendarWindow.closed) 
    {
        calendarWindow.close();
    }
}


</script>
</head>

<body>

<%Employee e = new Employee();%>
<%e = (Employee)session.getAttribute("emp"); %>
<%String fname=(String)request.getAttribute("first_name"); %>
<%String fields=(String)request.getAttribute("fields"); %>
<%String employee=(String)request.getAttribute("employee"); %>
<%String registration=(String)request.getAttribute("registration"); %>
<%String last_name=(String)request.getAttribute("last_name"); %>
<%String Date_of_birth=(String)request.getAttribute("Date_of_birth"); %>
<%String Role_of_Employee=(String)request.getAttribute("Role_of_Employee"); %>
<%String Select_Role=(String)request.getAttribute("Select_Role"); %>
<%String ADMINISTRATOR=(String)request.getAttribute("ADMINISTRATOR"); %>
<%String BACKOFFICE_EMPLOYEE=(String)request.getAttribute("BACKOFFICE_EMPLOYEE"); %>
<%String COMMERCIAL_ACCOUNT_OPENER=(String)request.getAttribute("COMMERCIAL_ACCOUNT_OPENER"); %>
<%String HELPDESK_EMPLOYEE=(String)request.getAttribute("HELPDESK_EMPLOYEE"); %>
<%String RELATIONSHIP_MANAGER=(String)request.getAttribute("RELATIONSHIP_MANAGER"); %>
<%String Branch=(String)request.getAttribute("Branch"); %>
<%String Select_Branch=(String)request.getAttribute("Select_Branch"); %>
<%String Date_of_Joining=(String)request.getAttribute("Date_of_Joining"); %>
<%String dmy=(String)request.getAttribute("dmy"); %>
<%String Address=(String)request.getAttribute("Address"); %>
<%String ContactNumber=(String)request.getAttribute("ContactNumber"); %>
<%String Email_Id=(String)request.getAttribute("Email_Id"); %>
<%String eg=(String)request.getAttribute("eg"); %>
<%String Group=(String)request.getAttribute("Group"); %>
<%String BB_CAO_Common=(String)request.getAttribute("BB_CAO_Common"); %>
<%String Product=(String)request.getAttribute("Product"); %>
<%String Maintenance=(String)request.getAttribute("Maintenance"); %>
<%String helpdesk=(String)request.getAttribute("helpdesk"); %>
<%String Submit=(String)request.getAttribute("Submit"); %>
<%String reset=(String)request.getAttribute("reset"); %>

<jsp:include page="layout/Header.jsp"></jsp:include>
<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="/Layout/AdminMenuNavg.jsp"/>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px"><%if(employee!=null){ %><%=employee %><%}else{ %>EMPLOYEE <%} %><% if(registration!=null){ %><%=registration %><%}else{ %>REGISTRATION<%} %></p><br/>
				 	</div> 
		  
		  	<form name="f1" action ="/NexusBankingGroup/EmployeeManageServlet" onsubmit="return validateForm();" method="post">
		  	<input type="hidden" name ="action" value ="EmployeeDetails"/>
		  
		  	
			<table align ="left" style="font-size:12px" >
			
			<tr>
			<td colspan="2"><font color="red"><%if(fields!=null){ %><%=fields %><%}else{ %>Fields marked with * are mandatory<%} %></font></td>
			</tr>
			<tr>
			
			<td><%if(fname!=null){ %><%=fname %><%}else{ %>First Name<%} %><font color="red">*</font></td>
			
			<td><abbr title="Please enter first name containing alphabets and . only"><input name = "fname" type="text" onblur="validateFName()"></abbr>
			<p style="color:red;display:inline;font-size:13px"><label id = "checkName"></label></p>
			</td>
			</tr>
			
			<tr>
			<td><% if(last_name!=null){ %><%=last_name %><%}else{ %>Last Name<%} %><font color="red">*</font></td>
			
			<td><abbr title="Please enter last name containing alphabets and . only"><input name = "lname" type="text" onblur="validateLName()" /> </abbr>
			<p style="color:red;display:inline;font-size:13px"><label id = "LastName"></label></p>
			</td>
			</tr>
			
			<tr>
			<td><% if(Date_of_birth!=null){ %><%=Date_of_birth %><%}else{ %>Date of Birth<%} %><font color="red">*</font><br/>(yyyy/mm/dd)</td>
			<td>
			<input type="text" name="dob" onblur="validateDateOfBirth()" readonly="readonly"/>
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
			<td><% if(Role_of_Employee!=null){ %><%=Role_of_Employee %><%}else{ %>Role of Employee<%} %><font color="red">*</font></td>
			<td>
			<select name="designation" onblur="validateDesignation()" onchange="myfun()">
			<option value=0 onclick="myfun()"><% if(Select_Role!=null){ %><%=Select_Role %><%}else{ %>Select Role<%} %></option>
			<option value="ADMINISTRATOR" onclick="myfun()"><% if(ADMINISTRATOR!=null){ %><%=ADMINISTRATOR %><%}else{ %>Administrator<%} %></option>
			<option value="BACKOFFICE EMPLOYEE" onclick="myfun()"><% if(BACKOFFICE_EMPLOYEE!=null){ %><%=BACKOFFICE_EMPLOYEE %><%}else{ %>Back Office Employee<%} %></option>
			<option value="COMMERCIAL ACCOUNT OPENER" onclick="myfun()"><% if(COMMERCIAL_ACCOUNT_OPENER!=null){ %><%=COMMERCIAL_ACCOUNT_OPENER %><%}else{ %>Commercial Account Opener<%} %></option>
			<option value="HELPDESK EMPLOYEE" onclick="myfun()"><% if(HELPDESK_EMPLOYEE!=null){ %><%=HELPDESK_EMPLOYEE %><%}else{ %>HelpDesk Employee<%} %></option>
			<option value="RELATIONSHIP MANAGER" onclick="myfun()"><% if(RELATIONSHIP_MANAGER!=null){ %><%=RELATIONSHIP_MANAGER %><%}else{ %>Relationship Manager<%} %></option>
			
			
			</select>
			<p style="color:red;display:inline;font-size:13px"><label id ="Dsgn"></label></p></td>
			</tr>
			
			<%List<String> branchList=(List<String>)request.getAttribute("branchList");%>
			<tr>
			<td><% if(Branch!=null){ %><%=Branch %><%}else{ %>Branch<%} %><font color="red">*</font></td>
			<td>
			<select name="branch" onblur="validateBranch()">
			<option value=0><% if(Select_Branch!=null){ %><%=Select_Branch %><%}else{ %>Select Branch<%} %></option>
			<%for(String branch:branchList){ %>
			<option value="<%=branch%>"><%=branch%></option>
			<%} %>
			</select><p style="color:red;display:inline;font-size:13px"><label id ="BId"></label></p></td>
		
			</tr>
			<tr>
			<td><% if(Date_of_Joining!=null){ %><%=Date_of_Joining %><%}else{ %>Date of Joining<%} %><font color="red">*</font><br/>(yyyy/mm/dd)</td>
			<td>
			<input type="text" name="datejoin" onblur="validateDateOfJoin()" readonly="readonly"/>
			<a href="#" onclick="return getCalendar(document.f1.datejoin);">
			<img src="<%=request.getContextPath() %>/images/calendar.png" border="0" /></a> 
				<!--  <input name = "datejoin" type="text" />  -->
				<p style="color:red;display:inline;font-size:13px"><label id ="joindate"></label></p>
		    </td>
			</tr>
			
			<tr>
			
			<td><% if(Address!=null){ %><%=Address %><%}else{ %>Address<%} %></td>
			<td><textarea name = "address" rows="3" cols="15" ></textarea>
			</td>
			</tr>
			
			<tr>
			<td><% if(ContactNumber!=null){ %><%=ContactNumber %><%}else{ %>Contact Number <%} %><font color="red">*</font></td>
			
			<td><abbr title="Please enter Contact Number containing digits from 0 to 9"><input name="contactNo" type ="text" onblur="validateNumber()" maxlength="12"></abbr>
	<p style="color:red;display:inline;font-size:13px"><label id = "Cnum"></label></p></td>
			
			</tr>
			
			<tr>
			
			<td><% if(Email_Id!=null){ %><%=Email_Id%><%}else{ %>Email Id<%} %><font color="red">*</font><br/>(eg: my.ownsite@gmail.com)</td>
			
			<td><abbr title="Please enter Email id containing @ and ."><input name="email" type="text" onblur="validateEmail()"/></abbr>
			<p style="color:red;display:inline;font-size:13px"><label id = "EId"></label></p></td>
			
			</tr>
		
			<tr>
			<td><% if(Group!=null){ %><%=Group%><%}else{ %>Group<%} %><font color="red">*</font></td>
			<td><input type="checkbox" name="chbox" id="common" value="BB_CAO_Common"/>&nbsp;<% if(BB_CAO_Common!=null){ %><%=BB_CAO_Common%><%}else{ %>BB_CAO_Common<%} %><br/>
			<input type="checkbox" name="chbox" id="product" value="BB_CAO_Prod" />&nbsp;<% if(Product!=null){ %><%=Product%><%}else{ %>BB_CAO_Product<%} %><br/>
			<input type="checkbox" name="chbox" id="maintenance" value="BB_CAO_Main" />&nbsp;<% if(Maintenance!=null){ %><%=Maintenance%><%}else{ %>BB_CAO_Maintenance<%} %><br/>
			<input type="checkbox" name="chbox" id="hdesk" value="BB_CAO_Hdesk" onblur="validateGroup()"/>&nbsp;<% if(helpdesk!=null){ %><%=helpdesk%><%}else{ %>BB_CAO_Hdesk<%} %>
				<p style="color:red;display:inline;font-size:13px"><label id = "ChGrp"></label></p></td>
			
			</tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr><tr></tr><tr></tr><tr></tr>
            <tr>
			<td></td><td><input id="b1" name="button1" type="submit" value="<%if(Submit!=null){ %><%=Submit %><%}else{ %>Submit<%} %>" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="b2" name="button2" type="reset" value="<%if(reset!=null){ %><%=reset %><%}else{ %>Reset<%} %>" onclick="return clearRegistrationData();" /></td>
			</tr>
			</table>
			</form>
			
		</div>
	</div>
	</div>
	


<jsp:include page="/Layout/Footer.jsp"/>

</body>
</html>