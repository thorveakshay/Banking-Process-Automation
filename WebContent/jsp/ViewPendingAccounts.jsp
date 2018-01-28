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
<title>Search Result</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath() %>/js/SearchCustomerResultValidation.js"></script>

<script>
function newWin()
{
	var chk=document.getElementsByName("select");
	var flag=0;
	for(var i=0;i<chk.length;i++){
		if(chk[i].checked==true){
			flag=1;
			break;
		}
	}
	
	if(flag==0){
		 
		return false;
	}
	else{
	window.open("<%=request.getContextPath()%>/jsp/TermsAndConditions.jsp");
	return true;
	}
}
</script>

</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>

<div id="main" class="container">
<jsp:include page="layout/accountMenu.jsp"></jsp:include>

<div  id="midtitle" >
	<h2 style="font-size:20px;padding-top:10px;" align="center">Result of Search</h2>
	</div>

<div style="height: 464px" >

<form name="showDetails" action="/NexusBankingGroup/SearchCustomerController" onsubmit="return checkRadioButton();" method="post">
<input type="hidden" name="action" value="ShowAccDetails"></input>
<%ArrayList<Account>accountList=(ArrayList<Account>)request.getAttribute("accountList"); %>

<br></br>

<table id="result" style=margin-left:10px;>
<tr>
<th>Select</th>
<th>Account Number</th>
<th>Product Name(Product Intension)</th>
<th>Branch</th>
<th>Status</th>
 
</tr>

<%for(Account acc:accountList) { %>
<tr>
<td><input type="checkbox" name="select" value=<%=acc.getId()%>></input></td>
<td><label><%=acc.getAccNumber()%></label></td>
<td><%=acc.getProductName() + "(" +acc.getProductIntension()+")"%></td>
<td><%=acc.getBranch() %></td>
<td><%=acc.getStatus() %></td>
</tr>
<% } %>
</table>

<table id="middleButton">
<tr></tr>
<tr>
<td></td>
<td>&nbsp;&nbsp;<input type="button" value="Back" id="button" onclick="window.location.href='/NexusBankingGroup/SearchCustomerController?action=back'"/>
<input type="submit" value="Select" id="button"  onclick="newWin()"/></td></tr>
</table>


</form>
</div>
</div>

<jsp:include page="layout/Footer.jsp"></jsp:include>
</body>
</html>