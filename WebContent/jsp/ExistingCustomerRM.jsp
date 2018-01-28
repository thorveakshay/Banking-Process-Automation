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
<title>Assign Relationship Manager</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/tableStyle.css">
</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
<jsp:include page="layout/accountMenuHome.jsp" /> 
<div id="midtitle" >
<h2 style="font-size:20px" align="center">Assign Relationship Manager for existing customer</h2>
</div>

<%int bid=(Integer)request.getAttribute("id"); %>
<%String bname=(String)request.getAttribute("name"); %>
<%String rm=(String)request.getAttribute("rm"); %>

<%String branch=(String)request.getAttribute("branch"); %>

<div id="middiv">

<form name="armexistingcust" action="/NexusBankingGroup/RelationshipManagerController">
<input type="hidden" name="action" value="exRMdetails"></input>

<%String busname=(String)request.getAttribute("bname"); %>
<p align="left"><label id="labels" >&nbsp;&nbsp;&nbsp;&nbsp;<%=busname %>: Following Relationship Manager is assigned to you.</label></p>
<br/>
<div id="accountdiv">
<table align ="left" id="result" border="1px">
<caption>Assigned Relationship Manager details</caption>
<tr>

<th>Business Customer ID</th>
<th>Business Customer Name</th>
<th>Relationship Manager</th>
<th>Branch</th>

</tr>
<!-- display the existing customer details -->
<tr>
<td><%=bid %></td>
<td><%=bname %></td>
<td><%=rm %></td>
<td><%=branch %></td>
</tr>
</table></div>
<br></br><br></br>
<br></br>
<div style="margin-left:250px;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="action" value="Submit" id="button"></input>
<input type='button' name='check'  value='Change' id="button1" style="color:white;border-width:0px;background-color:#5699A7;width:80px;" onclick="window.location.href='/NexusBankingGroup/RelationshipManagerController?action=change'"/>
</div>

</form>
</div>
</div>
<jsp:include page="layout/Footer.jsp"/>
</body>
</html>