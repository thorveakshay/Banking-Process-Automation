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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<title>Relationship Manager</title>
<script>
function newWin()
{
	window.open("<%=request.getContextPath()%>/jsp/TermsAndConditions.jsp");
}
</script>
</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
<jsp:include page="layout/accountMenuHome.jsp" /> 

<%String name=(String)request.getAttribute("selectedrm"); %>

<div style="font-size:15px" style="height:350px;">

&nbsp;&nbsp;<%if(null!=name){ %>
<%="Relationship manager "+name+" assigned successfully" %>

<%} %>
<form name="f3" action="/NexusBankingGroup/RelationshipManagerController" method="post">
<input type="hidden" name="action" value="success"></input>

<br></br>
<div style="margin-left:150px;">
&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="action" id="button" value="Proceed" onclick="newWin()"></input>
</div>


</form>
</div>

</div>

<jsp:include page="layout/Footer.jsp"></jsp:include>
</body>
</html>









