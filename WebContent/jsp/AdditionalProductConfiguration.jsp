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
<%@page import="com.training.model.*" %>
<%@page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Additional Product Configuration</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
<jsp:include page="layout/accountMenuHome.jsp" /> 
<div id="midtitle" >
<h2 style="font-size:20px;padding-top:10px;" align="center">Additional Product Configuration</h2>
</div>

<%ArrayList<AdditionalProduct> aplist=null; %>
<% aplist=(ArrayList<AdditionalProduct>) request.getAttribute("adprdlist");%>

<%String msg=(String)request.getAttribute("msg"); %>

<form name="adproform" action="/NexusBankingGroup/AdditionalProductConfigurationController" method="post">
<%String bname=(String)request.getAttribute("bname"); %>
<p align="left"><label id="labels" >&nbsp;&nbsp;&nbsp;&nbsp;<%=bname %>: Please select the additional product</label></p>
<br/>
<div id="middiv">
<input type="hidden" name="action" value="getap"></input>
<%if(0!=aplist.size() && "success".equals(msg)) { %>
<div id="accountdiv">
<!--  <h3 style="font-size:13px;">Select Additional Product</h3>-->
<table align ="left" id="result">

<tr></tr>
<tr>
<th>Select</th>
<th>Additional Product ID</th>
<th>Additional Product Name</th>

</tr>

<!-- Displaying list of eligible additional products -->


<%for(AdditionalProduct ap:aplist){ %>
<tr>
<td><input type="checkbox" name="check" value=<%=ap.getApId() %>></input></td>
<td><%=ap.getApId() %></td>
<td><%=ap.getApName() %></td>

</tr><%} %>
<tr>
<td style="border:0px; padding-top:10px;"></td>
<td style="border:0px; padding-top:10px;"><input type="submit" name="action" value="Submit" id="button"></input></td>
<td style="border:0px; padding-top:10px;"></td>
</tr>
</table>

</div>



<%}  else{ %>
&nbsp;&nbsp;&nbsp;&nbsp;<%=msg %>
<%} %>


</div><!-- 
<br></br><br></br>
<br></br>
<div id="buttondiv">
&nbsp;&nbsp;&nbsp;<input type="submit" name="action" value="Submit" id="button"></input>
</div>

 -->
</form>
</div>

<jsp:include page="layout/Footer.jsp"/>
</body>
</html>