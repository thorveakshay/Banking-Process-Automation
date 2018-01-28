<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.training.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
<style>
table
{


  font-size:12px;
  text-align:left;
  cell-padding:30px;
}
td
{
padding-left:0px;
padding-right:0px;
}
#Ebutton{
		display: inline;
		float: left;
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee details</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css" />

</head>
<body>
<%Employee e = new Employee();%>
<%e = (Employee)session.getAttribute("emp"); %>
<div id="header">
		<div class="container">
			<h1><a href="/NexusBankingGroup" title="NEXUS BANKING GROUP">NEXUS BANKING GROUP<span></span></a></h1>
			<hr />
			<!-- top navigation -->
			<ul id="navigation">
				<li><font color="white">Welcome <%=e.getfName() +" "+ e.getlName()+" ( "+ e.getDesignation().toLowerCase()+" )"%></font></li>
				<li><a href="/NexusBankingGroup/LoginServlet?action=logout" title="Sign out">Sign out</a></li>
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
<%
	String message = (String) request.getAttribute("msg");
%>




	<!--<div align="center" ><font color="green" size=4px>
	
	 <%
 		if (message != null) {
 		%> <p align="left" ><%=message%></p>
		<%}%> </font></div>
		-->


		
	<div id="main" class="container">
	<jsp:include page="/Layout/AdminMenu.jsp"/>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div align="left">
							 <font color="green" size=3px>
	
							 <%
 							if (message != null) {
 							%> <%=message%>
							<%}%> </font>
					</div><br/>
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
					
						<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px">EMPLOYEE DETAILS</p><br/>
				 	</div> 
			
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
			<%Employee emp = (Employee)session.getAttribute("employee");%>
				<%List<String> groupList= new ArrayList<String>(); %>
				<%groupList = emp.getGroups();%>
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
			
				String empdesg=ConvertToLetterCase(str);
				%>
				
				<form name="ViewTable" action="/NexusBankingGroup/EmployeeManageServlet">

				
				<table ALIGN="left" width="750px" style="float:left">

				<!-- <tr style="border:1px; background-color:#5599a7;
				color:#ffffff; font-size:18px;">
				<td colspan="2" align="center" style="height: 30px">Employee Summary</td>
				</tr>   -->
				<tr></tr>
				<tr></tr>
				<br/>
				<tr>
				
				
				<td style="width:250px;"><b>Employee Id</b></td>
				<td style="width:440px;"><%=emp.getId() %></td>
				<td style="width:10px;"><input type="submit" value="Edit" name="action" id="Ebutton" style="padding-left:6px;padding-right:6px;" onclick = "return editFunction()"/></td>
				</tr>
				<tr>
				<td><b>Status</b></td>
				<td><%=myStatus%></td>
				</tr>
				<tr>
				<td><b>First Name</b></td>
				
				<td><%=emp.getfName() %></td>
				</tr>
				<tr><td><b>Last Name</b></td>
				<td><%=emp.getlName()%></td>
				</tr>
				<tr><td><b>Date of Birth</b><br/>&nbsp;(yyyy/mm/dd)</td>
				<td><%=emp.getDateOfBirth()%></td>
				</tr>
				<tr><td><b>Role of Employee</b></td>
				<td><%=empdesg %></td>
				</tr>
				<tr><td><b>Branch</b></td>
				<td><%=emp.getBranchName() %></td>
				</tr>
				<tr>
				<td><b>Date of Joining</b><br/>&nbsp;(yyyy/mm/dd)</td>
				<td><%=emp.getDateOfJoin() %></td>
				</tr>
				<tr>
				<td><b>Address</b></td>
				<td><%if(emp.getAddress() != null && !(emp.getAddress().equals(""))){ %><%=emp.getAddress()%><%} %><%else{ %><%= "Not Available" %><%} %></td>
				</tr>
				<tr>
				<td><b>Contact Number</b></td>
				<td>
				<%=emp.getContactNumber() %></td>
				</tr>
				
				<tr>
				<td><b>Email ID</b></td>
				<td><%=emp.getEmailId()%></td>
				</tr>
				<tr>
				<td><b>Groups</b></td>
				<td>
					<%for(String s:groupList){%>
					<%=s%><br/>	
					
					<%} %>
						   
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
				<tr><td><br/></td></tr>
				<!--<tr>
				<td>
				<input type="submit" value="Edit" name="action" id="Ebutton" style="padding-left:6px;padding-right:6px;" onclick = "return editFunction()"/>
				</td>
				</tr>
				--></table>
				</form>
			</div>
	</div>
	

</div>
<jsp:include page="/Layout/Footer.jsp" />

</body>
</html>