<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Nexus Banking Group</title>
<link href="<%=request.getContextPath()%>/stylesheets/common1.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Account Party</h3>
<ul class="leftbox borderedlist">
	<li><a
		href="../../NexusBankingGroup/AccountPartyManagementServlet?action=addAccountParty&&id=<%=session.getAttribute("npid") %>">Add
	Account Party</a></li>
	<li><a
		href="../../NexusBankingGroup/AccountPartyManagementServlet?action=viewAccountParty&&id=<%=session.getAttribute("npid") %>">View
	Account Party</a></li>

</ul>

</div>
<!-- main content area -->
<div id="center">
<div class="article_wrapper">

<div id="message">

<h3 style="font-size: 20px;" align=center>Account Party details
added successfully</h3>
</div>



</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->

<!-- Start Footer -->
<jsp:include page="/Layout/Footer.jsp"/></body>
</html>





