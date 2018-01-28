<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
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
			<%String aboutUs=(String)session.getAttribute("aboutUs"); %><%if(aboutUs!=null) %><%=aboutUs %><%else { %>
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
			<div id="banner"><%String banner=(String)session.getAttribute("banner"); %>
<%if(banner!=null){ %>
<%=banner %>
<%} else{ %>Welcome to NEXUS BANKING GROUP,We believe in serving you.<%} %></div>
			<hr />
		</div>
	</div>
<!-- Start Main Content -->
	<div id="main" class="container">
		<div id="center">
		
			<%String contactUsFirst=(String)session.getAttribute("contactUsFirst"); %>
			
			<div class="article_wrapper" style="width:650px;" >
				<img src="<%=request.getContextPath()%>/images/contactus-header.jpg" style="width:850px; height:150px"/>
	
				<h2 style="padding-left:35px"><font size="5px"><%if(contactUs!=null) %><%=contactUs %><%else { %>Contact Us<%} %></font></h2><br/>
				
				<p style="padding-left:35px"><font size="3px"><%if(null!=contactUsFirst) { %><%=contactUsFirst %><%} else { %>Please contact us for any further queries on:<%} %></font></p>
				<table style="padding-left:40px">
				<tr>
				<td><h3><font size="3px"><b><%String conhelpdesk=(String)session.getAttribute("conhelpdesk"); %>
			<%if(conhelpdesk!=null){ %>
			<%=conhelpdesk %>
			<%} else{ %> Contact Helpdesk<%} %></b></font></h3>
			<p><font size="2px">
				0167 245678<br/>
				9786785653
			
				
				<a href="mailto:helpdesk@nexusgroup.co.uk">helpdesk@nexusgroup.co.uk</a><br/></font></p></td>
				<td></td>
				<td></td>
				
				<td><h3><font size="3px"><b><%String postus=(String)session.getAttribute("postus"); %>
			<%if(postus!=null){ %>
			<%=postus%>
			<%} else{ %>
				Post Us<%} %></b></font></h3><hr/>
<p><font size="2px">

<%String conadd=(String)session.getAttribute("conadd"); %>
			<%if(conadd!=null){ %>
			<%=conadd %>
			<%} else{ %>


Nexus banking Group<br/>
   Threadneedle St,<br/>              
   London, EC2R 8AH<%} %><br/></font></p></td>
   </tr>
   </table>
			     
	</div>
	</div>
	</div>
<jsp:include page="layout/Footer.jsp"/>

</body>
</html>