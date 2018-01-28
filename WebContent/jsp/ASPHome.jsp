<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.training.model.*"%>
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
<title>Relationship Manager Home</title>
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

<div id="main" class="container" style = "margin-left:10px;" >
		<!-- left column (products and features) -->
	<div id="leftcolumn" style="width: 240px">
			<h3 class="leftbox">
			<%String adminMenu=(String)session.getAttribute("adminMenu"); %>
			<%if(adminMenu!=null){ %>
			<%=adminMenu%>
			<%} else{ %>Quick Links<%} %></h3>
			<ul class="leftbox borderedlist">
					
			
				<li id="lft"><a  href="/NexusBankingGroup/GetCustServlet?action=getBranchList0" title="Change Account Title">
				 <%String rmMenu1=(String)session.getAttribute("rmMenu1"); %>
			<%if(rmMenu1!=null){ %>
			<%=rmMenu1%>
			<%} else{ %>
			Change Account Title<%} %></a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">
				<%String rmMenu2=(String)session.getAttribute("rmMenu2"); %>
				<%if(rmMenu2!=null){ %>
			<%=rmMenu2%>
			<%} else{ %>Switch to New Product<%} %></a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList4" title="Update Business Customer Address">
				<%String rmMenu3=(String)session.getAttribute("rmMenu3"); %>
				<%if(rmMenu3!=null){ %>
			<%=rmMenu3%>
			<%} else{ %>Update Business Customer Address<%} %></a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Contact">
			 	<%String rmMenu4=(String)session.getAttribute("rmMenu4"); %>
				<%if(rmMenu4!=null){ %>
			<%=rmMenu4%>
			<%} else{ %>Update Business Customer Contact<%} %></a></li>
		
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList6" title="Account Party Management">
			 	<%String rmMenu5=(String)session.getAttribute("rmMenu5"); %>
				<%if(rmMenu5!=null){ %>
			<%=rmMenu5%>
			<%} else{ %>Account Party Management<%} %></a></li>
			
		
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">
				<%String rmMenu6=(String)session.getAttribute("rmMenu6"); %>
				<%if(rmMenu6!=null){ %>
			<%=rmMenu6%>
			<%} else{ %>Close Account<%} %></a></li>
			</ul>
			
			<hr />
		</div>
	 
		<!-- main content area -->
		 
	 
 

 
  <div id="header2" style="height: 470px;" ><center>
   <h2 style="margin-left:200px;margin-top:20px"><font size = "4pt"><b>
    <%String welcomeNote=(String)session.getAttribute("welcomeNote"); %>
			<%if(welcomeNote!=null){ %>
			<%=welcomeNote%>
			<%} else{ %>Welcome<%} %>&nbsp;&nbsp;<%=session.getAttribute("empName")%></b></font></h2></center><br/>
     <div style="margin-left:50px; position: relative; height:650px; margin-top:-5px">
    
     <img src="<%=request.getContextPath() %>/images/relationshipManage.jpg" width="550px" height="300px" />
       <font size = "2pt"><h3><b>
      <br/> 	
     <font size = "2pt"><h3>
     <%String rmHome1=(String)session.getAttribute("rmHome1"); %>
			<%if(rmHome1!=null){ %>
			<%=rmHome1%>
			<%} else{ %>
     "If you deal with every customer in the same way, you will only close 25 to 30 percent of your contacts, because you will only close one personality type. But if you learn how to effectively work with all four personality types, you can conceivably close 100 percent of your contacts."
     <%} %>
	
	 </h3></font><br/>
       
     </div>
    
</div>		 
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
