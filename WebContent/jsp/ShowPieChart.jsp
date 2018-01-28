<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />


</head>
<body>
<jsp:include page="layout/Header.jsp"/>
<!-- Start Main Content -->
	<div id="main" class="container">
<jsp:include page="layout/Menu.jsp"/>

<p align="center">Report Generation Page </p>
	
<form action="/NexusBankingGroup/GenerateReportServlet">


<input type="submit" value="Generate Report"/>
</form>
</div>

<jsp:include page="layout/Footer.jsp"/>

</body>
</html>