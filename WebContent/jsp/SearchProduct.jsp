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
<title>Search Product</title>
<script>
function activateFirst()
{
	document.forms["searchForm"]["productId"].disabled=false;	
	document.forms["searchForm"]["productName"].disabled=true;
	
	
}

function activateSecond()
{

	document.forms["searchForm"]["productId"].disabled=true;	
	document.forms["searchForm"]["productName"].disabled=false;
	}


</script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<jsp:include page="layout/Header.jsp"/>
<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="layout/Menu.jsp"/>

	<div  id="midtitle" >
	<h2 style="font-size:20px" align="center">Search Product</h2>
	</div>
	
<form name="searchForm" action="/NexusBankingGroup/ProductServlet">

<input type="hidden" name="action" value="searchedProduct"></input>

<table align="center" id="middiv">
<tr>
<td>
Search by:
</td>
</tr>
<tr>
<td><input type="radio" name="searchOption" onchange="return activateFirst();"/></td>
<td>Product Id</td>
<td><input type="text" name="productId" disabled="disabled" /></td>
</tr>

<tr>
<td><input type="radio" name="searchOption" onchange="return activateSecond();"></td>
<td>Product Name</td>
<td><input type="text" name="productName" disabled="disabled" /> </td>
</tr>

<tr>
<td> </td>
<td><input  type="submit" id= "button" value="Search"></td>
<td><input type="reset"  id="button" value="Reset"></td>

</tr>

</table>
</form>

</div>
<jsp:include page="layout/Footer.jsp"/>

</body>
</html>