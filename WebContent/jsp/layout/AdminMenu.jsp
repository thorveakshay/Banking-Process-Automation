
<div id="leftcolumn" style="width: 240px">
		<h3 class="leftbox">
		<%String ProMngmnt=(String)session.getAttribute("ProMngmnt"); %><%if(ProMngmnt!=null) %><%=ProMngmnt %><%else { %>
		Product Management<%} %></h3>
		<ul class="leftbox borderedlist"> 
			<li><a href="/NexusBankingGroup/ProductServlet?action=addProduct" title="Add Product">
			<%String addProduct=(String)session.getAttribute("addProduct"); %><%if(addProduct!=null) %><%=addProduct %><%else { %>Add Product<%} %></a></li>
				<li><a href="/NexusBankingGroup/ProductServlet?action=uploadProduct" title="Upload Product">
				<%String upldPro=(String)session.getAttribute("upldPro"); %><%if(upldPro!=null) %><%=upldPro %><%else { %>Upload Product(s)<%} %></a></li>
				<li><a href="/NexusBankingGroup/ProductServlet?action=viewProduct" title="View Product">
				<%String viewPro=(String)session.getAttribute("viewPro"); %><%if(viewPro!=null) %><%=viewPro %><%else { %>View Product(s)<%} %></a></li>  
			
			</ul>
			<h3 class="leftbox">
			<%String empMngmnt=(String)session.getAttribute("empMngmnt"); %><%if(empMngmnt!=null) %><%=empMngmnt %><%else { %>
			Employee Management<%} %></h3>
			<ul class="leftbox borderedlist"> 
			<%String regEmployee=(String)session.getAttribute("regEmployee"); %>
			<%String viewEmployee=(String)session.getAttribute("viewEmployee"); %>
			<%String searchEmployee=(String)session.getAttribute("searchEmployee"); %>
			
				<li><a href="/NexusBankingGroup/EmployeeManageServlet?action=Register"><%if(regEmployee!=null) %><%=regEmployee %><%else { %>Register Employee<%} %></a></li>
				<li><a href="/NexusBankingGroup/EmployeeManageServlet?action=ViewEmployees"><%if(viewEmployee!=null) %><%=viewEmployee %><%else { %>View Employee(s)<%} %></a></li>
				<li><a href="/NexusBankingGroup/EmployeeManageServlet?action=ViewEmployees"><%if(searchEmployee!=null) %><%=searchEmployee %><%else { %>Search Employee<%} %></a></li>
				
		</ul>
			<h3 class="leftbox">
			<%String helpMng=(String)session.getAttribute("helpMng"); %><%if(helpMng!=null) %><%=helpMng %><%else { %>
			Helpdesk Management<%} %></h3>
			<ul class="leftbox borderedlist"> 
						
			<li id="lft"><a href="<%=request.getContextPath() %>/jsp/UnassignedTickets.jsp" title=" ">
			
			<%String adminLink1=(String)session.getAttribute("adminLink1"); %>
			<%if(adminLink1!=null){ %>
			<%=adminLink1 %>
			<%} else{ %>
   
			Unassigned Tickets <%} %></a></li>
		 		
				<li id ="lft"><a href ="<%=request.getContextPath()%>/LoadAssignedTicketServlet?action=assignedTicketsByAdmin">
				
			<%String adminLink2=(String)session.getAttribute("adminLink2"); %>
			<%if(adminLink2!=null){ %>
			<%=adminLink2 %>
			<%} else{ %>
   
				Assigned Tickets<%} %></a></li>	
				
		 	<li id="lft"><a href="<%=request.getContextPath() %>/jsp/HelpdeskReport.jsp" title="View Ticket Report"><%String ticketReport=(String)session.getAttribute("ticketReport"); %>
			<%if(ticketReport!=null) %><%=ticketReport %><% else { %>View Ticket Report<%} %></a></li>
			</ul><!--
			
				<h3 class="leftbox header_small">
				<%String updates=(String)session.getAttribute("updates"); %><%if(updates!=null) %><%=updates %><%else { %>Updates<%} %></h3>
<div class="leftbox features" style="height:300px;">
<marquee bgcolor="#f1f0ef" scrollamount="3" direction="up" 
 width="100%" align="left"> <center> <font color="black"><i>
 <%String leftcontent1=(String)session.getAttribute("leftcontent1"); %><%if(leftcontent1!=null) %><%=leftcontent1 %><%else { %>
The Nexus Banking Group is declared as the most trusted banking service
provider and a safe haven for business applications, data storage,
security and high QoS connectivity by UK Credit Info as on February 2013<%} %><br><br>
<%String leftcontent2=(String)session.getAttribute("leftcontent2"); %><%if(leftcontent2!=null) %><%=leftcontent2 %><%else { %>
Robert Berling has 
been appointed as a Chief Financial Officer of Nexus Banking Group<%} %><br><br> 
<%String leftcontent3=(String)session.getAttribute("leftcontent3"); %><%if(leftcontent3!=null) %><%=leftcontent3 %><%else { %>
Guest from Seagate and 
Nexus Banking Group will appear on a show 'Let's Talk Computers'<% } %><br></br>
<%String leftcontent4=(String)session.getAttribute("leftcontent4"); %><%if(leftcontent4!=null) %><%=leftcontent4 %><%else { %>
For a faster and differentiated banking experience, we are launching Privilege Banking Dedicated Service Areas at Nexus Bank branches across UK shortly<%} %></i></font></center></marquee>


</div>
			
--></div>
