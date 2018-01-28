<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


   <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("uid")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
</head>

 <%
 String LoggedUser="CLOSE_ACCOUNT";
 session.setAttribute("LoggedUser",LoggedUser);
 %>
<script>
function call_servlet()
{
	//alert("hii");
	window.location="/NexusBankingGroup/jsp/SearchCustomerBy.jsp";
	
	
}
 </script>

<body onload="call_servlet()" >

</body>
</html>