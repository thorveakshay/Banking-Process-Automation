<!-- Start Header -->

	<div id="header">
		<div class="container">
			<h1><a href="#" title="Nexus Banking Group">Nexus Banking Group<span></span></a></h1>
			<hr />
			<!-- top navigation -->
			<form name="myForm1" action="/NexusBankingGroup/LanguageServlet">
<input type="hidden" name="action" value="checkLang1"/>

			<ul id="navigation">
							<li><a href="/NexusBankingGroup/LoginServlet?action=home" >
							<%String home=(String)session.getAttribute("home"); %>
				<%if(home!=null) %><%=home %><%else { %>Home<%} %></a></li>
			<%String role=(String)request.getSession().getAttribute("designation");%>
				<li> <font color="white">
						<%String welcome=(String)session.getAttribute("welcome"); %>
				<%if(welcome!=null) %><%=welcome %><%else { %>Welcome<%} %>&nbsp;<%=request.getSession().getAttribute("uname")%> (<%=role%>)&nbsp;&nbsp;</font></li>
				<li><a href="/NexusBankingGroup/LoginServlet?action=logout" >
				<%String SignOut=(String)session.getAttribute("SignOut"); %>
				<%if(SignOut!=null) %><%=SignOut %><%else { %>Sign out<%} %></a></li>
		<li>
				<font color="white"><%String lang=(String)session.getAttribute("lang"); %>
				<%if(lang!=null) %><%=lang %><%else { %>English<%} %></font></a></li>
	</ul>
		
			</form>

			<div id="banner">
			<%String banner=(String)session.getAttribute("banner"); %>
<%if(banner!=null){ %>
<%=banner %>
<%} else{ %>

Welcome to Nexus Banking Group,We beleive in serving you <%} %>
				
			</div>
			
				
		</div>
		</div>
