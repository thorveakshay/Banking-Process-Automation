 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

   <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("uid")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Helpdesk Home</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<style>
#header2{
		height: 400px;
		position: relative;
		margin-top:-30px;
		margin-left:10px;
		width:500px;
		float:left;
		
		}
	</style>

</head>



<body >


<jsp:include page="../jsp/layout/Header.jsp" />

	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">
			 <%String adminMenu=(String)session.getAttribute("adminMenu"); %>
			<%if(adminMenu!=null){ %>
<%=adminMenu %>
<%} else{ %>Quick Links<%} %></h3>
			<ul class="leftbox borderedlist"> 
			 
			  
				
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Create Helpdesk Ticket">
				 <%String heMenu1=(String)session.getAttribute("heMenu1"); %>
			<%if(heMenu1!=null){ %>
<%=heMenu1 %>
<%} else{ %>Create Helpdesk Ticket
<%} %></a></li>
			
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="View Tickets"> 
				<%String heMenu2=(String)session.getAttribute("heMenu2"); %>
			<%if(heMenu2!=null){ %>
<%=heMenu2 %>
<%} else{ %>View Tickets<%} %></a></li>
<li id="lft"><a href="<%=request.getContextPath() %>/jsp/HelpdeskReport.jsp" title="View Ticket Report">View Ticket Report</a></li>

				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">
				 <%String heMenu3=(String)session.getAttribute("heMenu3"); %>
			<%if(heMenu3!=null){ %>
<%=heMenu3 %>
<%} else{ %>Customer Details<%} %></a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">
				 <%String heMenu4=(String)session.getAttribute("heMenu4"); %>
			<%if(heMenu4!=null){ %>
<%=heMenu4 %>
<%} else{ %>Account Details<%} %></a></li>

				
			</ul>
			
			<hr />
		</div>
	
	
	 
		 <br/>
		   
<div id="header2" >
   <h2><font size = "3pt" style = "margin-top:-5px; margin-left:200px;"><center><b>
   	<%String welcomeNote=(String)session.getAttribute("welcomeNote"); %>
			<%if(welcomeNote!=null){ %>
<%=welcomeNote %>
<%} else{ %>Welcome<%} %>&nbsp;&nbsp;<%=session.getAttribute("empName") %></b></center></font></h2>

     <div style="margin-left:60px;position: relative;height:650px;margin-top:20px">
     <img src="<%=request.getContextPath() %>/images/help.jpg" width="500px" height="265px" />
     <font size = "2pt"><h3><b>
      <br/> 	
     <font size = "2pt"><h3>
     <%String heHomeContent=(String)session.getAttribute("heHomeContent"); %>
<%if(heHomeContent!=null){ %>
<%=heHomeContent %>
<%} else{ %>
Thank you for your valuable services to the company. It has helped us to grow and will take us to newer heights.You are life to this organization 
	and play a major role in providing best Customer satisfaction.<%} %>
	 </h3></font><br/>

   
 </div>
 </div> 
  
	<!-- Start Footer -->
</div>

<br/>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
