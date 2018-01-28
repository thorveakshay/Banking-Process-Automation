<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.training.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
 <%
 	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
 	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
 	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
 	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
 	if (request.getSession() == null
 			|| request.getSession().getAttribute("username") == null) {
 		response.sendRedirect(request.getContextPath());
 		return;
 	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<style>
table
{


  font-size:12px;
  text-align:left;
  cell-padding:30px;
}
td
{
padding-left:15px;
padding-right:15px;
}
#button{
		display: inline;
		/*float: left;*/
		width: 100;
		line-height:1em;
		text-align: center;
		background: #659AA6;
		border: 1px solid #fff;
		color: #fff;
		cursor: pointer;
		margin:0;
		padding:3px 8px; /* IE6 */
	}

	tr
	{
	padding-top:5px;}

#button:hover {   color: #grey;   background-colr: #5599a7; } 



</style>

</head>
<body>
<%
	Employee e = new Employee();
%>
<%
	e = (Employee) session.getAttribute("emp");
%>
<div id="header">
		<jsp:include page="layout/Header.jsp"></jsp:include>
	</div>
<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="/Layout/AdminMenu.jsp"/>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px">EMPLOYEE DETAILS</p><br/>
				 	</div> 
				<!--  Employee emp = new Employee();  --> 
				<%!String ConvertToLetterCase(String frmObj) {
				int index;
				String tmpStr = frmObj.toLowerCase();
				String tmpChar;
				String preString;
				String postString;
				int strLen = tmpStr.length();

				if (strLen > 0) {
					for (index = 0; index < strLen; index++) {
						if (index == 0) {
							
							tmpChar = tmpStr.substring(0, 1).toUpperCase();
							postString = tmpStr.substring(1, strLen);
							tmpStr = tmpChar + postString;
							
						} else {
							tmpChar = tmpStr.substring(index, index + 1);
							
							if (tmpChar.equals(" ") && index < (strLen - 1)) {
								tmpChar = tmpStr.substring(index + 1, index + 2).toUpperCase();
								preString = tmpStr.substring(0, index + 1);
								postString = tmpStr.substring(index + 2, strLen);
								tmpStr = preString + tmpChar + postString;
							}
						}
					}
				}
				frmObj = tmpStr;
				return frmObj;
			}%>
				<%
					Employee emp = (Employee) session.getAttribute("employee");
				%>
				<%
					List<String> groupList = new ArrayList<String>();
				%>
				<%
					groupList = emp.getGroups();
				%>
				<%
					String status = emp.getStatus();
				%>
				<%
					status = status.toLowerCase();
				%>
				<%
					char[] statusArray = status.toCharArray();
				%>
				<%
					statusArray[0] = Character.toUpperCase(statusArray[0]);
				%>
				<%
					String myStatus = new String(statusArray);
				%>
				  
				<%
				String str = emp.getDesignation();
			
				String rm=ConvertToLetterCase(str);
				%>
			
				<form name="ViewTable" action="/NexusBankingGroup/EmployeeManageServlet">
				<br/>
				<TABLE ALIGN="left" width="800px">
				<!--  <tr style="border:1px; background-color:#5599a7;
				color:#ffffff; font-size:18px;">
				<td colspan="3" align="center" style="height: 35px">Employee Details</td>
				</tr> -->
	            <tr><td style="font-color=#5599a7;" width="500px"><b>Employee ID</b></td>
				<td width="700px"><%=emp.getId()%></td>
				<td width="500px"></td>
				<td style="width:100px;padding-left:100px;"><a href="<%=request.getContextPath()%>/EmployeeManageServlet?action=ViewEmployees"><font size="3px"><u>Back</u></font></a></td>
				</tr>
				<tr>
				<td><b>Status</b></td>
				<td><%=myStatus%></td>
				</tr>
				<tr>
				<td><b>First Name</b></td>
				
				<td><%=emp.getfName()%></td>
				</tr>
				<tr><td><b>Last Name</b></td>
				<td><%=emp.getlName()%></td>
				</tr>
				<tr><td><b>Date of <br/>Birth</b>&nbsp;(yyyy/mm/dd)</td>
				<td><%=emp.getDateOfBirth()%></td>
				</tr>
				<tr><td><b>Role of Employee</b></td>
				<td><%=rm%></td>
				</tr>
				
				<tr><td><b>Branch</b></td>
				<td><%=emp.getBranchName()%></td>
				</tr>
				
				<tr>
				<td><b>Date of <br/>Joining</b>&nbsp;(yyyy/mm/dd)</td>
				<td><%=emp.getDateOfJoin()%></td>
				</tr>
				<tr>
				<td><b>Address</b></td>
				<td><%
					if (emp.getAddress() != null && !(emp.getAddress().equals(""))) {
				%><%=emp.getAddress()%><%
					}
				%><%
					else {
				%><%="Not Available"%><%
					}
				%></td>
				</tr>
				<tr>
				<td><b>Contact Number</b></td>
				<td>
				<%=emp.getContactNumber()%></td>
				</tr>
				<tr>
				<td><b>Email ID</b></td>
				<td><%=emp.getEmailId()%></td>
				</tr>
				<tr>
				<td><b>Groups</b></td>
				<td>
					<%
						for (String s : groupList) {
					%>
					<%=s%><br/>	
					
					<%
												}
											%>
						   
				</td>					
				</tr>
				<%if(null!=emp.getDateOfLeaving()){ %>
				
				<tr><td><b>Date of <br/>leaving</b>&nbsp;(yyyy/mm/dd)</td>
				<td><%=emp.getDateOfLeaving()%>
				</td></tr>
				<tr>
				<td><b>Reason of leaving</b></td>
				<td><%=emp.getReasonOfLeaving()%></td></tr>
				<%} %>
				
				
			<tr>
				<td align="left" colspan="2" style="padding-left:80px"><br/><br/>
				<input type="submit" name="action" id="button" value="Edit" style="padding-left:15px; padding-right:15px">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
				
				<%if(null!=emp.getDateOfLeaving()){ %>
				<input type="submit" name="action" id="button" value="Activate">
				
				<%}else{ %><input type="submit" name="action" id="button" value="Deactivate" style="padding-left:5px;padding-right:5px"/>
				<%} %>
				</td>
				</tr>
				</TABLE>
				</form>
			</div>
			
			<hr />
		</div>
	</div>
	


<jsp:include page="/Layout/Footer.jsp"/>

</body>
</html>