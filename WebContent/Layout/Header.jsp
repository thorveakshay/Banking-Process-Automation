
<!-- Start Header -->
	<div id="header">
		<div class="container">
			<h1><a href="/NexusBankingGroup" title="NEXUS BANKING GROUP">NEXUS BANKING GROUP<span></span></a></h1>
			<hr />
			<!-- top navigation -->
			<ul id="navigation">
			<li><a href="/NexusBankingGroup/LoginServlet?action=home" >Home</a></li>
			<li style="color:white">Welcome, <%=request.getSession().getAttribute("name")+"("+request.getSession().getAttribute("designation")+")" %></li>
			<li><a href="/NexusBankingGroup/LoginServlet?action=logout">Sign Out</a></li>
			</ul>
			<hr />
			<!-- banner message and building background -->
			<div id="banner">
				Welcome to NEXUS BANKING GROUP,We believe in serving you.
			</div>
			<hr />
		</div>
	</div>
