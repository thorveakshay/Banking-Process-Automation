<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Contact Us</title>
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
	<li><a href="/NexusBankingGroup/LoginServlet?action=loginHome" title="Home">Home</a></li>
	<li><a
		href="/NexusBankingGroup/LoginServlet?action=aboutUs"
		title="About Us">About Us</a></li>
	<li><a href="/NexusBankingGroup/LoginServlet?action=contactUs" title="Contact Us">Contact Us</a></li>
	<li><a href="/NexusBankingGroup/LoginServlet?action=help" title="Help">Help</a></li>
</ul>
<hr />

<!-- banner message and building background -->
<div id="banner" ><font size="4px" color="white"><i>Your dreams. Our passion </i></font>


</div>
</div>
</div>
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">

<h3 class="leftbox header_small">Updates</h3>
<div class="leftbox features" style="height:415px;">
<marquee bgcolor="#f1f0ef" scrollamount="3" direction="up" 
 width="100%" height="90%" align="left"> <center> <font color="black"><i>
The Nexus Banking Group is declared as the most trusted banking service
provider and a safe haven for business applications, data storage,
security and high QoS connectivity by UK Credit Info as on February 2013<br><br>Robert Berling has 
been appointed as a Chief Financial Officer of Nexus Banking Group<br><br> Guest from Seagate and 
Nexus Banking Group will appear on a show 'Let's Talk Computers'<br></br>For a faster and differentiated banking experience, we are launching Privilege Banking Dedicated Service Areas at Nexus Bank branches across UK shortly</i></font></center></marquee>


</div>
</div>
<div id="midtitle" style="margin-left:230px">
			<h2 style="font-size:20px;padding-top:10px; text-align:center;">Contact Us</h2>
		</div>

<!-- main content area -->
<div id="center">
<div class="article_wrapper"><br />
<img src="<%=request.getContextPath() %>/images/contact us.jpg" width="600" height="200"
	alt="Image:product" class="product_image" /> <br />
<div align="left">
<p >Address: Nexus Bank, 1 Basinghall Avenue, London, EC2V 5DD <br /></p>
<p>E-mail: contactus@nbg.com</p>
<p>Telephone Number: +44 (0)20 7885 8888 </p>
<p>Fax Number: +44 (0)20 7885 9999</p>
</div>
</div>
</div>
</div>
<jsp:include page="layout/Footer.jsp" />
</body>
</html>
