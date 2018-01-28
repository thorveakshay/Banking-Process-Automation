<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.Ticket"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<%
ArrayList<Ticket> ticketArray=new ArrayList<Ticket>();
if(request.getAttribute("ticketArray")!=null)
{
ticketArray=(ArrayList<Ticket>)request.getAttribute("ticketArray");
}
%>

 <script>
function call_servlet()
{
	//alert("hii");
	window.location="/NexusBankingGroup/LoadAssignedTicketServlet?action=assignedTicket&&pageNumber=1";
	
	
}
 </script>

<title>Assigned Tickets</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
</head>




<body onload="call_servlet()" >
<jsp:include page="../jsp/layout/Header.jsp" />
	<!-- Start Header -->
	


<!-- Start Main Content -->
 
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
