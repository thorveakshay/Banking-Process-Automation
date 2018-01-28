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
<title>Product Selection</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css"/>
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath() %>/js/AccountCreation.js"></script>

<script> 

document.attachEvent("onkeydown", my_onkeydown_handler); 
 
function my_onkeydown_handler() 
{ 
switch (event.keyCode) 
{ 
case 116 : // 'F5' 
event.returnValue = false; 
event.keyCode = 0; 
window.status = "You can't refresh this page"; 
break; 
} 
} 

function Disable() { 
	if (event.button == 2) 
	{ 
	alert("This action is not possible");
	} 
	} 
	document.onmousedown=Disable; 

		
</script>

</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
	<jsp:include page="layout/accountMenuHome.jsp"/>
	
	
<div  id="midtitle" >
<h2 style="font-size:20px;padding-top:10px;" align="center">Select Product</h2>
</div>
		
<form name="formSelectProduct" action="/NexusBankingGroup/AccountCreationServlet" method="post" onsubmit="return validateProduct();">
<input type="hidden" name="action" value="ProductChoice"></input>
<%String bname=(String)request.getAttribute("bname"); %>

<%int serialNo=Integer.parseInt((String)request.getAttribute("serialNo")); %>

<p align="left"><label id="labels" > &nbsp; &nbsp;&nbsp;<%=bname %>: Please select the product for Product Intention</label></p>
<%ArrayList<Account>intentionList=(ArrayList<Account>)request.getAttribute("intentionList"); %>
<%ArrayList<Product>productList=(ArrayList<Product>)request.getAttribute("prodList");%>


<br></br>
<div id="accountdiv">
<table id="middiv">
<tr>
<input id="id" type="hidden" name="intention"  value="<%=intentionList.get(0).getProductIntension()%>" readonly="readonly"></input>
<td>Selected Product Intention</td>
<td><label>&nbsp;<%=intentionList.get(0).getProductIntension()%></label></td>
</tr>
<tr>
<td>Select Product<font color="red">*</font></td>
<td><select id="id" name="chooseProduct" >
<option>Select Product</option>

<!--  Display eligible products -->
<% for(Product prod:productList) { %>
<option><%=prod.getProductName() %></option>
<% } %></select></td>
</tr>
<tr>
<td style="border:0px; padding-top:10px;"></td>
<td style="border:0px; padding-top:10px;"><input type="submit" value="Submit" id="button"></td>
</tr>
</table>
</div>

</form>
</div>
<jsp:include page="layout/Footer.jsp"></jsp:include> 
</body>
</html>