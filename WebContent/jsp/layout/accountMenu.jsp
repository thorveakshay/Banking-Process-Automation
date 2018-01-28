<!-- left column (products and features) -->
		<div id="leftcolumn">
	
		<h3 class="leftbox" >
					<%String custReg=(String)session.getAttribute("custReg"); %>
			<%if(custReg!=null) %><%=custReg %><%else { %>
			Customer Registration<%} %></h3>
			<ul class="leftbox borderedlist">
			<%String searchCust=(String)session.getAttribute("searchCust"); %>
			<%String manageAccParty=(String)session.getAttribute("manageAccParty"); %>
			<%String genReport=(String)session.getAttribute("genReport"); %>
			<li><a href="<%=request.getContextPath() %>/jsp/SearchBusinessCustomer.jsp" title="Search"><%if(searchCust!=null) %><%=searchCust %><%else { %>Search Business Customer<%} %></a></li>
		<li><a
		href="<%=request.getContextPath() %>/jsp/SearchBusinessCustomer.jsp" title="Manage Account Party"><%if(manageAccParty!=null) %><%=manageAccParty %><%else { %>Manage Account Party<%} %></a></li>
				<li><a href="/NexusBankingGroup/CustomerManagementServlet?action=report"><%if(genReport!=null) %><%=genReport %><%else { %>Report<%} %></a></li>
			
			</ul>
	
	
	
			<h3 class="leftbox" ><%String accCr=(String)session.getAttribute("accCr"); %>
			<%if(accCr!=null) %><%=accCr %><%else { %>Account Opening<%} %></h3>
			<ul class="leftbox borderedlist">
		<li><a href="/NexusBankingGroup/SearchCustomerController?action=search" title="Create Account">	<%String openAc=(String)session.getAttribute("openAc"); %>
			<%if(openAc!=null) %><%=openAc %><%else { %>Open Account<%} %></a></li>
		<li><a href="/NexusBankingGroup/ExistingCustomerController?action=assign" title="Assign Relationship Manager">
		<%String assignRel=(String)session.getAttribute("assignRel"); %>
			<%if(assignRel!=null) %><%=assignRel %><%else { %>
		Assign Relationship Manager<%} %></a></li>
			<li><a href="/NexusBankingGroup/GenerateReportServlet?action=goToPdfReportPage" title="Generate Report">
				<%String genPro=(String)session.getAttribute("genPro"); %><%if(genPro!=null) %><%=genPro %><%else { %>Generate Report<%} %></a></li>  
				<li><a href="/NexusBankingGroup/GenerateReportServlet?action=goToChartPage" title="Generate Chart">
				<%String genChr=(String)session.getAttribute("genChr"); %><%if(genChr!=null) %><%=genChr %><%else { %>Generate Chart<%} %></a></li>
		
				
			</ul>
		
			<!--<h3 class="leftbox header_small">Updates</h3>
<div class="leftbox features" style="height:300px;">
<marquee bgcolor="#f1f0ef" scrollamount="2" direction="up" 
 width="100%" align="left"> <center> <font color="black"><i>
The Nexus Banking Group is declared as the most trusted banking service
provider and a safe haven for business applications, data storage,
security and high QoS connectivity by UK Credit Info as on February 2013<br><br>Robert Berling has 
been appointed as a Chief Financial Officer of Nexus Banking Group<br><br> Guest from Seagate and 
Nexus Banking Group will appear on a show 'Let's Talk Computers'<br></br>For a faster and differentiated banking experience, we are launching Privilege Banking Dedicated Service Areas at Nexus Bank branches across UK shortly</i></font></center></marquee>


</div>
			
					
			<!--  <h3 class="leftbox header_small"></h3>
			<div class="leftbox features">-->
	</div>
	