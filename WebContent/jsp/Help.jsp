<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>
<%String help=(String)session.getAttribute("help"); %><%if(help!=null) %><%=help %><%else { %>
Help<%} %></title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<!-- Start Header -->
<div id="header">
<div class="container">
<h1><a href="/NexusBankingGroup/LoginServlet?action=loginHome" title="Nexus Banking Group">NEXUS BANKING GROUP<span></span></a></h1>
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
<%if(help!=null) %><%=help %><%else { %>
	Help<%} %></a></li>
	
	
	</ul>
	<div id="banner">
	<%String banner=(String)session.getAttribute("banner"); %>
<%if(banner!=null){ %>
<%=banner %>
<%} else{ %>Welcome to NEXUS BANKING GROUP,We believe in serving you.<%} %></div>
			<hr />
		</div>
	</div>

</div>
</div>

<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->



<!-- main content area -->
<div id="center">
<div class="article_wrapper" style="width:600px" align="justify">
<%String sol=(String)session.getAttribute("sol"); %>
<h2 style="padding-left:5px"><font size="5px"><%if(help!=null) %><%=help %><%else { %>
	Help<%} %></font></h2>

<p><b>
<%String help1=(String)session.getAttribute("help1"); %>
				<%if(help1!=null) %><%=help1 %><%else { %>
Q:Is it possible for a  business customer who has not previously registered with Nexus Bank,to proceed for creation of new account?
<%} %></b></p>
<p><b>-></b><i>
<%String help2=(String)session.getAttribute("help2"); %>
				<%if(help2!=null) %><%=help2 %><%else { %>
A business customer must register with Nexus Bank or already have an account with the bank to open a new account.
<%} %></i></p>

<p><b> <%String help3=(String)session.getAttribute("help3"); %>
				<%if(help3!=null) %><%=help3 %><%else { %>Q:Can a business customer opt for a Relationship Manager stationed at any branch of Nexus Bank?
				<%} %></b></p> 
<p><b>-></b><i>
 <%String help4=(String)session.getAttribute("help4"); %>
				<%if(help4!=null) %><%=help4 %><%else { %>
No.A business customer can opt for a Relationship Manager only at the Bank branch where he has opened his account or at any of those branches where he has opened any accounts previously.
<%} %></i></p>

<p><b>
 <%String help5=(String)session.getAttribute("help5"); %>
				<%if(help5!=null) %><%=help5 %><%else { %>
Q:Is a business customer eligible for any of the products offered by Nexus Bank?
<%} %></b></p>
<p><b>-></b><i>
 <%String help6=(String)session.getAttribute("help6"); %>
				<%if(help6!=null) %><%=help6 %><%else { %>
A business customer is eligible for only those products which are determined by the Management team.
<%} %></i></p>
<p><b>
 <%String help7=(String)session.getAttribute("help7"); %>
				<%if(help7!=null) %><%=help7 %><%else { %>
Q:How many products can be associated with a product intention?<%} %></b></p>
<p><b>-></b><i>
 <%String help8=(String)session.getAttribute("help8"); %>
				<%if(help8!=null) %><%=help8 %><%else { %>
Only one product can be associated with a product intention selected.
<%} %></i></p><br />
<img
	src="<%=request.getContextPath()%>/images/contactus.jpg" width="100"
	height="50" />
	<font size="2.5px"><i><b>
	 <%String help9=(String)session.getAttribute("help9"); %>
				<%if(help9!=null) %><%=help9 %><%else { %>
	for any further query,please call:-+44 (0)20 7885 7864
	<%} %></b></i></font>
	
</div>
</div>
</div>
<jsp:include page="layout/Footer.jsp"/>
</body>
</html>
