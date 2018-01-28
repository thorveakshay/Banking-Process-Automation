<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("user")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/tableStyle.css" />

<script src="<%=request.getContextPath() %>/js/AccountCreation.js"></script>

<script> 

document.attachEvent("onkeydown", my_onkeydown_handler); 
 
function my_onkeydown_handler() 
{ 
switch (event.keyCode) 
{ 
case 116 : // 'F5' 
event.returnValue = false; 
event.keyCode = 0; 
window.status = "You can't refresh this page"; 
break; 
} 
} 

function Disable() { 
	if (event.button == 2) 
	{ 
	alert("This action is not possible");
	} 
	} 
	document.onmousedown=Disable; 

		
</script>

<title>Account Creation</title>
</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
	<jsp:include page="layout/accountMenuHome.jsp"/>

<div  id="midtitle" >
	<h2 style="font-size:20px;padding-top:10px;"  align="center">Product Intention</h2>
	</div>	
<div>
<p><font color="red" size="2pt">&nbsp; &nbsp; &nbsp;&nbsp;Please do not click on 'Back' or 'Refresh' button.</font></p>
<form name="f1" action="/NexusBankingGroup/AccountCreationServlet" onsubmit="return validate();" method="post">
<input type="hidden" name="action" value="AccountDetails"></input>

<%String bname=(String)request.getAttribute("bname"); %>
<p align="left"><label id="labels" >&nbsp; &nbsp; &nbsp;<%=bname %>: Please select the product intention</label></p>


<%ArrayList<String>branches=(ArrayList<String>)request.getAttribute("branchList"); %>

<%String branchSelected=(String)request.getAttribute("branch"); %>


 <!-- Activate textbox or combo box -->
<%String activate=(String)request.getAttribute("activate"); %>
<div id="resultdiv">
<table id="middiv">
<tr>
<td>Branch Name<font color="red">*</font>  </td>

	<!-- activate combo box -->
<%if(activate.equals("ON")) { %>
<td><select id="branchId" name="BranchName" >
<option>Select Branch Name &nbsp; &nbsp; &nbsp;</option>
<%for(String branch:branches) { %>
	<option><%=branch %></option>
	<% } } %>
	</select></td>
	
	<!-- activate text box -->
	<%if(activate.equals("OFF")) { %>
	<input type="hidden" size=23 name="BranchName" readonly="readonly" value=<%=branchSelected %> ></input>
	<td><label><%=branchSelected %></label></td>
	<% } %>

</tr>
<tr>
<td>Product Intention<font color="red">*</font>   </td>
<td><select id="id" name="ProductIntention" >
<option>Select Product Intention</option>
<option value="Current Account">Current Account</option>
<option value="Savings Account">Savings Account</option>
</select>
</td>
</tr>
<tr><td style="border:0px; padding-top:10px;"></td>
<td style="border:0px; padding-top:10px;"><input type="submit" value="Add Account" id="button"></input></td></tr>
</table>


</div>

<br>

</form>
<%String msg=(String)request.getAttribute("msg");%>
<%if("result".equalsIgnoreCase(msg)){ %>
<form name="f2" action="/NexusBankingGroup/AccountCreationServlet" method="post">
<input type="hidden" name="action" value="SubmitDetails"></input>

<div id="resultdiv">
<p id="middiv">Selected Product Intention</p>
<%ArrayList<Account> accList=(ArrayList<Account>)request.getAttribute("acc"); %>
<%int i=1; %>

<table id="result">
<tr>

<th>Intention selected</th>
<th></th>
</tr>
<%if(accList != null && !accList.isEmpty()){ for(Account account:accList){%>
<tr>
<input type="hidden" name="serialNo" readonly="readonly" value=<%=i %>></input>
<td><%=account.getProductIntension()%></td>
<td><a href="/NexusBankingGroup/AccountCreationServlet?action=remove&&intension=<%=account.getProductIntension()%>&&number=<%=i %>">Remove</a></td>
<% i++; } }%>
</tr>

</table>
<div style="margin-top:30px;margin-left:120px;">
<input type="submit" value="Proceed" id="button"></input>
</div>
</div>
</form>

<%String alert=(String)request.getAttribute("alert"); %>
<%if(alert!=null) { %>
<p><font size=2 color="red"> <%=alert %> </font></p>
<% } %>

<%} %>

</div>

</div>
<jsp:include page="layout/Footer.jsp"></jsp:include> 

</body>
</html>