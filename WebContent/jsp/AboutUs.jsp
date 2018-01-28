<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
<style>
td
{
padding-left:35px;
padding-right:35px;
padding-top:10px;
padding-bottom:10px;

}
</style>
</head>

<body>
<div id="header">
		<div class="container">
			<h1><a href="#" title="ECOBUSINESS">NEXUS BANKING GROUP<span></span> </a></h1>
	    <hr />
			<!-- top navigation -->
			<ul id="navigation">

	<li><a href="/NexusBankingGroup/LoginServlet?action=loginHome" >
	<%String home=(String)session.getAttribute("home"); %><%if(home!=null) %><%=home %><%else { %>Home<%} %></a></li>
	<li><a
		href="/NexusBankingGroup/LoginServlet?action=aboutUs">
			<%String aboutUs=(String)request.getAttribute("aboutUs"); %><%if(aboutUs!=null) %><%=aboutUs %><%else { %>
		About Us
		<%} %></a></li>
	<li><a href="/NexusBankingGroup/LoginServlet?action=contactUs" >
		<%String contactUs=(String)session.getAttribute("contactUs"); %><%if(contactUs!=null) %><%=contactUs %><%else { %>
Contact Us<%} %></a></li>
	<li><a href="/NexusBankingGroup/LoginServlet?action=help" title="Help">
	<%String help=(String)session.getAttribute("help"); %><%if(help!=null) %><%=help %><%else { %>
	Help<%} %></a></li>
	</ul>
			<hr />
			<!-- banner message and building background -->
			<%String banner=(String)session.getAttribute("banner"); %>
<%if(banner!=null){ %>
<%=banner %>
<%} else{ %><div id="banner">
			Welcome to NEXUS BANKING GROUP,We believe in serving you.<%} %></div>
			<hr />
		</div>
	</div>
<!-- Start Main Content -->
	<div id="main" class="container">
		<div id="center">
		
			
			<div class="article_wrapper" style="width:650px;" >
				<img src="<%=request.getContextPath()%>/images/header_about-us.jpg" style="width:850px; height:160px"/>
	
				<h2 style="padding-left:5px"><font size="5px"><%if(aboutUs!=null) %><%=aboutUs %><%else { %>About Us<%} %></font></h2><br/>
		
		<%String aboutUsFirst=(String)request.getAttribute("aboutUsFirst"); %>
		<%String aboutUsNext=(String)request.getAttribute("aboutUsNext"); %>
		<%String aboutUsNextAfter=(String)request.getAttribute("aboutUsNextAfter"); %>
				
				<p><font size="2px"><%if(aboutUsFirst!=null) { %><%=aboutUsFirst %><%} else { %>Nexus Banking Group is a Public Limited Company and one of the largest commercial banking group in the United Kingdom. The bank provides an automated process for commercial account opening for our business customers.The business bank account with a Business Banking package to meet your business needs features and principles of the products and services.<%}%></font></p>
<p><font size="2px"><%if(aboutUsNext!=null) { %><%=aboutUsNext %><%} else { %>The Bank's roles and functions have evolved and changed over its over 50 years of history.It being a financial institution provides diverse types of functions. It satisfies the financial needs of the sectors such as agriculture, industry, trade, communication, etc. Nexus Banking Group plays a very significant role in a process of economic social needs.<%}%></font></p>
<p><font size="2px"><%if(aboutUsNextAfter!=null) { %><%=aboutUsNextAfter %><%} else { %>The Nexus Banking group is committed to provide trustworthy and certain services to its Business Customers and maintain a healthy relationship between them which 
indeed lead to economic development.<%}%></font> </p>
			     
	</div>
	</div>
	</div>
<jsp:include page="layout/Footer.jsp"/>

</body>
</html>