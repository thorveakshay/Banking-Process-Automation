<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pie Chart</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%String year=(String)request.getAttribute("year"); %>
<%String month=(String)request.getAttribute("month"); %>
<%String type=(String)request.getAttribute("type"); %>

<jsp:include page="/Layout/Header.jsp"/>

	<!-- Start Main Content -->

	<div id="main" class="container">
	<jsp:include page="/Layout/BusinessCustMenu.jsp"/>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
					<%if(type.equalsIgnoreCase("Pie Chart")) { %>
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Pie Chart</p><br/></br>
						<%} else {%>
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Bar Chart</p><br/></br>
						<%} %>
								 	</div>
				 					 	

<IMG SRC="/NexusBankingGroup/CustomerManagementServlet?action=generatereport&&month=<%=month %>&&year=<%=year %>&&type=<%=type %>" WIDTH="600" HEIGHT="400" 
   BORDER="0" USEMAP="#chart" onerror="this.src = 'images/recNotFound.JPG'">
   <a href="jsp/ReportCriteria.jsp" class="button" style="margin-left:280px; font-size:14px;">Back</a>
</div>
</div>
</div>	
<jsp:include page="/Layout/Footer.jsp"/>
</body>
</html>