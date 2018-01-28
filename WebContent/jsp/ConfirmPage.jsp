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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css"/>
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />
<title>Confirm Page</title>
</head>

<body>

<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
	<jsp:include page="layout/accountMenuHome.jsp"/>

<div  id="midtitle" >
	<h2 style="font-size:20px;padding-top:10px;" align="center">Confirmation</h2>
	</div>	
	
<%String branchName=(String) request.getAttribute("branchName"); %>
<%String businessName=(String) request.getAttribute("businessName");%>
<%String ProdIntension=(String) request.getAttribute("productIntention"); %>
<%String ProdName=(String) request.getAttribute("productName"); %>
<%String AccountNo=(String) request.getAttribute("AccountNo"); %>

<form name="f1" action="/NexusBankingGroup/AccountCreationServlet"  method="post">

<input type="hidden" name="action" value="ConfirmationPage"></input>

<%String bname=(String)request.getAttribute("bname"); %>
<p align="left"><label id="labels" >&nbsp;&nbsp;&nbsp;<%=bname %>: Following are the details of your product selection</label></p>
<br/>
<div id="accountdiv">
<table id="result">
<tr>
<td>Business Name</td>
<td><%=businessName %></td>
</tr>
<tr>
<td>Branch Name</td>
<td><%=branchName %></td>
</tr>
<tr>
<td>Product Intention</td>
<td><%=ProdIntension %></td>
</tr>
<tr>
<td>Product Name</td>
<td><%=ProdName%></td>
</tr>
<tr>
<td>Account Number</td>
<td><%=AccountNo %></td>
</tr>

<tr>
<td style="border:0px; padding-top:10px;"></td>
<td style="border:0px; padding-top:10px;"><input type="submit" value="Proceed" id="button"></input>
</td>
</tr>

</table>
</div>
<div>

</div>
</form>

</div>

<jsp:include page="layout/Footer.jsp"></jsp:include> 
</body>
</html>