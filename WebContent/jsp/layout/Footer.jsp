<div id="footer">
<div class="container"><a id="designby"><%String footer=(String)session.getAttribute("footer"); %>
			<%if(footer!=null){ %>
<%=footer%>
<%} else{ %>Copyright @ Nexus Banking Group<%} %></a>
<!-- ul id="footer_navigation">

	<li class="active"><a
						 href="<%=request.getContextPath() %>/jsp/index.jsp" title="Home" >
<img
		alt="" src="<%=request.getContextPath()%>/images/home.jpg"
		width="25px" height="16px"><br>
	Home</a></li>




	<li><a
		href="<%=request.getContextPath() %>/jsp/About_Us.jsp"
		title="About Us"><img alt=""
		src="<%=request.getContextPath()%>/images/about.jpg" width="25px"
		height="16px"><br>
	About Us</a></li>
	
	
	
	<li><a href="<%=request.getContextPath() %>/jsp/Contact_Us.jsp" title="Contact Us"><img
		alt="" src="<%=request.getContextPath()%>/images/contact.jpg"
		width="25px" height="16px"><br>
	Contact Us</a></li>
	
	
	
	<li><a href="<%=request.getContextPath() %>/jsp/Help.jsp" title="Help"><img alt=""
		src="<%=request.getContextPath()%>/images/help1.jpg" width="25px"
		height="16px"><br>
	Help</a></li>

</ul>-->
</div>
</div>
