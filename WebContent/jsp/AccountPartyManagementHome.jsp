<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.training.model.*"%>


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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Account Party Management Home</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
</head>


<body >
 

<jsp:include page="../jsp/layout/Header.jsp" />
   
	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">

			
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList6" title="Add Account Party">Add Account Party</a></li>
<!--<li id="lft"><a href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=viewAccountParty" title="View Account Party">View Account Party</a></li> -->
<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList8&&pageNumber=1" title="View Account Party">View Account Party</a></li>			
		
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->
		 
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
