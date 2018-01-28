<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<%@page import="com.training.model.NonPersonalCustomer"%>
<%@page import="java.util.ArrayList"%><html>
<%@page import="java.util.*"%>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css" />
<style>
td,th
{
padding-left: 20px;
padding-right: 10px;
padding-top: 5px;
padding-bottom:5px;

}
th
{
font-size:12px;
height:18px;
}
#th1
{
background-color: #5599a7;
color: white;

}

</style>

<title>Information</title>
</head>
<body>

<jsp:include page="/Layout/Header.jsp"/>
<%String message=(String)request.getAttribute("msg"); %>

<div id="main" class="container">
	<jsp:include page="/Layout/BusinessCustOperationsMenu.jsp"/>
	<div id="center" >
	<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 720px">
						<p  style ="font-size:20px ; padding-left:200px;padding-top: 5px;padding-bottom:5px;"></p><br/></br>
				 	</div>
		    
			    
			    <div id="table" style="width: 460px;height: 200px">
			    <br/>
			    
					 <%if(message!=null){ %>

							<%if(message.equalsIgnoreCase("Sorry,Full Details dont Exist in System")) {%>
							<h2><font color="red" style="font-size:18px;"><%=message %></font></h2>
							
							<% } else if(message.equalsIgnoreCase("Sorry,Business Customer Details does not exist in the System.")) {%>
							<h2><font color="red" style="font-size:18px;"><%=message %></font></h2>

							<%}else { %>

					<h2><font color="#5599a7" style="font-size:18px;"><%=message %></font></h2>
					<% }%>
					<p><a href="<%=request.getContextPath()%>/jsp/SearchBusinessCustomer.jsp"><u><br>Please Click Here to Search again</u></a></p>
					
					<%}%>
			    </div>
			    
		</div>
</div>
</div>
<jsp:include page="/Layout/Footer.jsp"/>





</body>
</html>