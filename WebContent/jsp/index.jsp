<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Login</title>
<script>

function CheckLogin()
{
	var log=document.forms["f4"]["username"].value;

	var num=/^[1-9][0-9]+$/;
	if(log.match(num))
	{
    }
	else
	{
		alert("Please enter Employee ID as a User Name");
		return false; 
	}
	return true;
}
</script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css"/>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css"/>
</head>
<body>
<!-- Start Header -->
<div id="header">
<div class="container">
<h1><a href="/NexusBankingGroup/LoginServlet?action=loginHome" title="Nexus Banking Group">NEXUS BANKING GROUP<span></span></a></h1>
<hr />
<!-- top navigation -->
<form name="myForm" action="/NexusBankingGroup/LanguageServlet">
<input type="hidden" name="action" value="sendLanguage"/>



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
	
	<li><select name="lang">
	<option value="" selected="selected">
	<%String selLang=(String)session.getAttribute("selLang"); %><%if(selLang!=null) %><%=selLang %><%else { %>
	Select Language<%} %></option>
<option value="french">French</option>
<option value="spanish">Spanish</option>
<option value="german">German</option>
</select>&nbsp;<input type="submit" value="Go" style="background-color:#5699A7"/></li>
	

 


</ul>
</form>
<hr />
<!-- banner message and building background -->
<div id="banner">
			<%String banner=(String)session.getAttribute("banner"); %>
<%if(banner!=null){ %>
<%=banner %>
<%} else{ %>

Welcome to Nexus Banking Group,We beleive in serving you <%} %>
				
			</div>
<hr />
</div>
</div>
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">

<h3 class="leftbox header_small">
<%String updateHeading=(String)session.getAttribute("updateHeading"); %><%if(updateHeading!=null) %><%=updateHeading%><%else { %>


NBG News<%} %></h3>
<div class="leftbox features" style="height:415px;">
<marquee bgcolor="#f1f0ef" scrollamount="3" direction="up" 
 width="100%" height="90%" align="left"> <center> <font color="black"><i>

 <%String leftcontent1=(String)session.getAttribute("leftcontent1"); %>
<%if(leftcontent1!=null){ %>
<%=leftcontent1 %>
<%} else{ %>
The Nexus Banking Group is declared as the most trusted banking service
provider and a safe haven for business applications, data storage,
security and high QoS connectivity by UK Credit Info as on February 2013.<%} %><br>

<%String leftcontent2=(String)session.getAttribute("leftcontent2"); %>
<%if(leftcontent2!=null){ %>
<%=leftcontent2 %>
<%} else{ %>
Robert Berling has 
been appointed as a Chief Financial Officer of Nexus Banking GroupGuest from Seagate and 
Nexus Banking Group will appear on a show 'Let's Talk Computers'For a faster and differentiated banking experience, we are launching Privilege Banking Dedicated Service Areas at Nexus Bank branches across UK shortly<%} %></i></font></center></marquee>


</div>
<hr />
</div>



<!-- main content area -->
<div id="center"><a href="#"><img
	src="<%=request.getContextPath()%>/images/banner.jpg" width="380"
	height="400" /></a>



<div>
<p><font size="2.8px">
<%String centercontent1=(String)session.getAttribute("centercontent1"); %>
<%if(centercontent1!=null){ %>
<%=centercontent1 %>
<%} else{ %>We get to know you, your goals and
expected outcomes and find solutions that directly cater to your
business needs.<%} %><br/>
<%String centercontent2=(String)session.getAttribute("centercontent2"); %>
<%if(centercontent2!=null){ %>
<%=centercontent2 %>
<%} else{ %>It's our privilege to work with you and provide you with
flexible solutions. <%} %>
</font></p>
<br/>


</div>
</div>
<!-- product sales boxes -->
<div id="rightcolumn">
<div class="rightbox_wrapper">
<div class="rightbox">

<div class="product_wrapper">
<h4 style="color: #5699A7">
<%String scrlogin=(String)session.getAttribute("scrlogin"); %><%if(scrlogin!=null) %><%=scrlogin %><%else { %>
		
Secure Login

<%} %></h4>


<form name="f4" method="post" action="/NexusBankingGroup/LoginServlet" >
<input type="hidden" name="action" value="loginDetails"></input>
<%String login=(String)session.getAttribute("login"); %>

<table cellspacing="8px" align="left">
	<tr>
		<td>
		<p style="font-size: 13px; color: #8c8685" ><b>
		<%String userName=(String)session.getAttribute("userName"); %><%if(userName!=null) %><%=userName %><%else { %>
		Username<%} %></b></p>
		</td>
	</tr>
	<tr>
		<td><input type="text" id="uname" name="username" maxlength="6">  </input></td>
	</tr>
	<tr>
		<td>
		<p style="font-size: 13px; color: #8c8685"><b>
		<%String pswrd=(String)session.getAttribute("pswrd"); %><%if(pswrd!=null) %><%=pswrd %><%else { %>
		
		Password<%} %></b></p>
		</td>

	</tr>

	<tr>
		<td><input type="password" id="pwd" name="password"></input></td>
	</tr>
	
	<tr >
		
		<td colspan="2" style="padding-top:10px">
		<input type="submit" name="login" value="<%if(login!=null) %><%=login %><%else { %> Login <%} %>"  onclick="return CheckLogin();"
			style="color: white; border-width: 0px; background-color: #5699A7; width: 80px;"></input>
		</td>
	</tr>	

<tr>
	<td>
		<%
			String msg = (String) request.getAttribute("msg");
			String msgPass = (String) request.getAttribute("msgPass");
			if (msg != null && msgPass!=null) {
		%><font color="red"> <%=msg%> </font><br />
		<font color="red"> <%=msgPass%> </font>
		<%
			}
		%>
		</td>
	</tr>
</table>
</form>
</div>
</div>
</div>
<div class="rightbox_wrapper">
<div class="rightbox">
<h4><b>
<%String footer=(String)session.getAttribute("footer"); %>
<%if(footer!=null){ %>
<%=footer %>
<%} else{ %>
Your growth. Our Responsibility.
<%} %></b></h4>
<img src="<%=request.getContextPath()%>/images/business.jpg" width="280"
	height="200" alt="Your growth. Our Responsibility." class="product_image" />
<div class="product_wrapper"></div>
</div>
</div>

<div class="product_wrapper"></div>
</div>
</div>
<hr />
<!-- Start Bottom Information -->




<jsp:include page="layout/Footer.jsp" />
</body>
</html>
