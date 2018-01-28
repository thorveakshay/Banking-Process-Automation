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
<%@ page import="com.training.model.*"%>
<%@ page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Product</title>

<style type="text/css" title="currentStyle">
			@import "<%=request.getContextPath() %>/css/demo_page.css";
			@import "<%=request.getContextPath() %>/css/jquery.dataTables_themeroller.css";
			@import "<%=request.getContextPath() %>/css/jquery-ui-1.8.4.custom.css";
			
	</style>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css"/>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css"/>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/tableStyle.css"/>
	<%-- Pagination --%>

<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.dataTables.js"></script>
<script>$(document).ready(function(){

	var oTable	= $('#mt').dataTable( {
		"sScrollX": "100%",
		"aaSorting": [[ 0, "asc" ]],
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"bAutoWidth": false,
		"autoHeight": true,
		"bStateSave": false,
		"aoColumns": [null, null,null,null, null]  			
	} );

});
	</script>


</head>
<body>


<%
	List<Product> pList = (List<Product>) request.getAttribute("product");
%>
<jsp:include page="layout/Header.jsp"/>
<!-- Start Main Content -->


<div id="main" class="container" >
<jsp:include page="layout/Menu.jsp"/>


<div id="midtitle">

<h2 style="font-size:20px; padding-top: 10px" align="center">View
Product(s)</h2>
</div>
<br/>
<div style="float:left;width:650px;padding: 0 10px;" >
<%
if (!pList.isEmpty()) {
%>

<form method="post">	
<table id="mt" cellpadding="0" cellspacing="0" border="0" style="font-size:12px" >

	<thead>
	<tr >
		<th >
		Product Id
		</th>
		<th >
	Product Name
		</th>
		<th >
		Account Type
		</th>
		<th >
		Status
		</th>
		<th >
		Valid From(yyyy-mm-dd)
		</th>
		
	</tr>
</thead>
	<%
		for (Product p : pList) {
	%>
	<tr>
		<td>
		<p><a
			href="/NexusBankingGroup/ProductServlet?action=deleteOrUpdate&&productId=<%=p.getProductId()%>" >
		<%=p.getProductId()%></a></p>
		</td>
		<td>
		<p><%=p.getProductName()%></p>
		</td>
		<td><%=p.getAccountType()%></td>
		<td><%=p.getStatus()%></td>
		<td><%=p.getValidFrom()%></td>
	</tr>
	
	<%
		}
	%>

	</table>
	
	<%
	}
	%>

</form>
</div>

</div>
<div>
<jsp:include page="layout/Footer.jsp" />
</div>
</body>
</html>