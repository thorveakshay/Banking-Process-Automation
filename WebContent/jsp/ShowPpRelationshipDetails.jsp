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
<title>Personal Party Relationship Details</title>
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

function valisdateRelationship()
{
	var rname = document.getElementsByName("txtrname")[0].value;   
	 
	if(rname=="")
	{
		document.getElementById('rname').style.visibility="visible";
		  document.getElementById('rname').innerHTML="&nbsp;Please enter the type of Relationship.";
	
		document.getElementsByName("txtrname")[0].value="";
		document.getElementsByName("txtrname")[0].focus();
		return false;
	}
	else
	{
		 document.getElementById('rname').innerHTML="";
	}
	var op= confirm("Are you sure you want to proceed ?");
	if(op==true)
	{
		alert("Relationship status updated successfully");
		return true;
	}
	else
		return false;	
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
<center><font color="black" size="5pt">Personal Party Details</font></center>
<%long ticketId1= Long.parseLong(request.getParameter("ticketId")); %>
   <form action="/NexusBankingGroup/NewServlet">
     <input type="hidden"  name="action" value="show_pp_tckt_hidden"/>
      <input type="hidden"  name="ticketId" value="<%=ticketId1%>"/>
       <input type="hidden"  name="idno" value="<%=request.getAttribute("personal_party_id")%>"/>
      <br/>
    <table id="gradient-style" align="center" style="margin-left: 10px;font-size:2pt;" width="600px">
    <tr>
  <td><b>Description:</b></td>
  <td width="60%" height="50"><%=request.getAttribute("description")%></td>
  </tr>
  <tr>
	<td><b>Account Party Id:</b></td>
	<td><%=request.getAttribute("personal_party_id")%></td>
</tr> 
   
 
 
  
  
   <tr>
   <td><b>Account Party First Name:</b></td>
   <td><%=request.getAttribute("party_fname")%></td>
   </tr>
   <tr>
   <td><b>Account Party Surname:</b></td>
   <td><%=request.getAttribute("party_sname")%></td>
   </tr>
   
   <tr>
   <td><b>Business Customer Name:</b></td>
   <td><%=request.getAttribute("businessName")%></td>
   </tr>
     <tr>
   <td><b>Email:</b></td>
   <td><%=request.getAttribute("party_email")%></td>
   </tr>
    <tr>
   <td><b>Current Relationship with Business Customer:</b></td>
   <td><%=request.getAttribute("party_relationship")%></td>
   </tr>
    <tr>
<!--    value="<%=request.getAttribute("party_relationship")%>" -->
   <td><b>Relationship with Business Customer<font color="red"><sup>*</sup></font></b></td>
   <td ><select name="txtrname" size="" title="Please select the relationship type.">
   <option value="">Please Select</option>
   <option value="CEO">CEO</option>
   <option value="Trustee">Trustee</option>
   <option value="Owner">Owner</option>
   <option value="Director">Director</option>
   </select>
   
   <label style="visibility:hidden; color:red; font-size:12px;" id="rname"></label>
   
   </td>
   </tr>
   
     </table> 
     <div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:475px;">
     <input type="submit" style="background-color:black;margin-top:20px;  color:white" onclick="return  valisdateRelationship()" value="Update"/>
     
        &nbsp;&nbsp;<input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>
    
     
     </div>
   </form>

</div>
				 
   	
	<!-- Start Footer -->
	<br/>
	<br/>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
