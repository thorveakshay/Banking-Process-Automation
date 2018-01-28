<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css"/>
<title>Account Creation Success</title>
</head>
<body>
<jsp:include page="layout/Header.jsp"></jsp:include>
<div id="main" class="container">
	<jsp:include page="layout/Menu.jsp"/>

<div  id="midtitle" >
	<h2 style="font-size:20px" align="center">Product Intension</h2>
	</div>	

<h2 id="rel">All the accounts are successfully generated.</h2>

</div>

<jsp:include page="layout/Footer.jsp"></jsp:include> 
</body>
</html>