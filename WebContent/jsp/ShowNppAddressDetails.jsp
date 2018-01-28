<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../jsp/layout/Header.jsp" />
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
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Non Personal Party Address Details</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

function home(){

	window.location="<%=request.getContextPath()%>/jsp/backoffice.jsp";

	}


function myFunction(x)
{
	x.style.background="lightgreen";
}


function validateAdSelection()
{
	
	
	 var addr = document.getElementsByName("address_dd")[0].value;   
 var lenad=addr.length;
		if(document.getElementsByName("address_dd")[0].value=="")
		{
		
			document.getElementById('selectAddr').style.visibility="visible";
			  document.getElementById('selectAddr').innerHTML="&nbsp;Please select an Address Type.";
		
			document.getElementsByName("address_dd")[0].focus();
		return false;
		}
		else
		{
			document.getElementById('selectAddr').innerHTML="";
		}
			
		return true;
}
</script>



</head>
<body>
<br/>


<!-- Start Header -->
	<!-- Start Main Content -->
<center><font size="5pt" color="black" align="center" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Non Personal Party Details</font></center>
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

   <form action="/NexusBankingGroup/ChangeCustomerAddressController">
     <input type="hidden"  name="action" value="update_address_tkt_hidden"/>
    <%   long ticketId1= Long.parseLong(request.getParameter("ticketId"));%>
    	  <input type="hidden"  name="ticketId" value="<%=ticketId1%>"/>
    	  <input type="hidden"  name="idno" value="<%=request.getAttribute("idno2")%>" />
    	  <input type="hidden"  name="textdesc3" value="<%=request.getAttribute("tktdesc2")%>" />
    <table id="gradient-style" align="center" border"1" style="font-size:2pt;" width="600px">
    <tr>
  <td width="30%"><font size = "2pt"><b>Description</b></font></td>
  <td width="70%"><%=request.getAttribute("tktdesc2")%></td>
  </tr><tr>
	<td><font size = "2pt"><b>Non Personal Party Id</b></font></td>
	<td><font size = "2pt"><%=request.getAttribute("idno2")%></font></td>
</tr> 
   
 
 
  
   <tr>
   <td><font size = "2pt"><b>Business Name</b></font></td>
   <td><font size = "2pt"><%=request.getAttribute("businessname")%></font></td>
   </tr>
   <tr>
   <td><font size = "2pt"><b>Trading Name</b></font></td>
   <td><font size = "2pt"><%=request.getAttribute("tradingname")%></font></td>
   </tr>
   
   <td><font size = "2pt"><b>Email Address</b></font></td>
   <td><font size = "2pt"><%=request.getAttribute("business_email_id")%></font></td>
   </tr>
  
   <tr>
   <td><font size = "2pt"><b>Address Type</b></font></td>
   <td>
   <select name="address_dd" title="Please select an address type.">
   <option value="">Please Select</option>
   <option value="Business Address">Business Address</option>
   <option value="Correspondence Address">Correspondence Address</option>
   <option value="Mailing Address">Mailing Address</option>
   </select>
   <label style="visibility:hidden; color:red; font-size:12px;" id="selectAddr"></label>
   </td>
   </tr>
      
     </table> 
     <div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:430px;">
     <input type="submit"  style="background-color:black;margin-top:20px; color:white" onclick="return validateAdSelection()" value="Update"/>
     
    &nbsp;&nbsp; <input type="button"  style="background-color:black;margin-top:30px;  color:white" onclick="return home()" value="Cancel" ></input>

     
     
     </div>
   </form>

</div>
		<br></br>		 
   	
	<!-- Start Footer -->
	
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>

</body>
</html>