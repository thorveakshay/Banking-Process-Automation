<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="../jsp/layout/Header.jsp" />
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
<title>Show Personal Party Details</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script>


function home(){

	window.location="<%=request.getContextPath()%>/jsp/backoffice.jsp";

	}


function myFunction(x)
{
x.style.background="lightgreen";
}
</script>
</head>
<body>




	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">

				
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/AssignedTickets.jsp" title="Assigned Tickets">Assigned Tickets</a></li>
				 
				
			</ul>
			
			<hr />
		</div>
		
		<!-- main content area -->
<div class="maincontent" >
   <form action="/NexusBankingGroup/NewServlet">
     <input type="hidden"  name="action" value="show_pp_tckt_hidden"/>
      <table id="gradient-style" align="center" border"1" style="font-size:2pt;">
    <tr>
  <td><b>Description</b></td>
  <td><textarea rows="5" cols="40" readonly="readonly"><%=request.getAttribute("description")%></textarea></td>
  </tr><tr>
	<td><b>Personal Party Id</b></td>
	<td>:<input type="text" name="acc_idno" value="<%=request.getAttribute("show_acc_id")%>"/></td>
</tr> 
   
 
 
  
   <tr>
<!--    value="<%=request.getAttribute("party_relationship")%>" -->
   <td><b>New Relationship</b></td>
   <td><input type="text" name="txtrname" onfocus="myFunction(this)"/></td>
   </tr>
   <tr>
   <td><b>Party First Name</b></td>
   <td><input type="text" name="txtfname" value="<%=request.getAttribute("party_fname")%>" readonly="readonly"/></td>
   </tr>
   <tr>
   <td><b>Party SurName</b></td>
   <td><input type="text" name="txtsname" value="<%=request.getAttribute("party_sname")%>" readonly="readonly"/></td>
   </tr>
   
     </table> 
     <div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:350px;">
     <input type="submit"  style="background-color:black;margin-top:20px; value="Update"/>
     
        <input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>

     
 
     
     </div>
   </form>

</div>
				 
   	
	<!-- Start Footer -->
	
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
