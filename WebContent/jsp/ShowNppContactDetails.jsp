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
<title>Show_NPP_Contact_Details</title>
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script>


function home(){

	window.location="<%=request.getContextPath()%>/jsp/backoffice.jsp";

	}



	function myFunction(x) {
		x.style.background = "lightgreen";
	}

	function validateConSelection()
	{
		
		
		 var addr = document.getElementsByName("contact_dd")[0].value;   
	 var lenad=addr.length;
			if(document.getElementsByName("contact_dd")[0].value=="")
			{
			
				document.getElementById('selectCon').style.visibility="visible";
				  document.getElementById('selectCon').innerHTML="&nbsp;Please select a Contact Type.";
			
				document.getElementsByName("contact_dd")[0].focus();
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




<!-- Start Header -->
<!-- Start Main Content -->

<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Quick Links</h3>
<ul class="leftbox borderedlist">
	
	<li id="lft"><a href="<%=request.getContextPath() %>/jsp/AssignedTickets.jsp" title="Assigned Tickets">Assigned Tickets</a></li>


</ul>

<hr />
</div>

<!-- main content area -->
<div class="maincontent">
<form
	action="/NexusBankingGroup/ChangeCustomerContactController">
<input type="hidden" name="action" value="show_customer_hidden" />
<h3><center><font color="black" size="5pt">Business Customer Contact Details</font></center></h3><br>
 <%   long ticketId1= Long.parseLong(request.getParameter("ticketId"));%>
    	  <input type="hidden"  name="ticketId" value="<%=ticketId1%>"/>
    	   <input type="hidden"  name="idno" value="<%=request.getAttribute("idno2")%>"/>
    	   <input type="hidden"  name="textdesc3" value="<%=request.getAttribute("tktdesc2")%>"/>
   <table id="gradient-style" align="center" border"1" style="font-size:2pt;">
	<tr>
		<td><b>Description</b></td>
	 <td width="300" height="50"><%=request.getAttribute("tktdesc2")%></td>
	</tr>
	<tr>
		<td><b>Business Customer Id</b></td>
		<td><%=request.getAttribute("idno2")%></td>
	</tr>




	<tr>
		<td><b>Business Name</b></td>
		<td><%=request.getAttribute("businessname")%></td>
	</tr>
	<tr>
		<td><b>Trading Name</b></td>
		<td><%=request.getAttribute("tradingname")%></td>
	</tr>
	<tr>
		<td><b>Country of Registration</b></td>
		<td><%=request.getAttribute("country_of_reg")%></td>
	</tr>
	<tr>
		<td><b>Email Address</b></td>
		<td><%=request.getAttribute("business_email_id")%></td>
	</tr>
	 <tr>
   <td><b>Contact Type</b></td>
   <td>
   <select name="contact_dd" title="Please select a contact type.">
   <option value="">Please Select</option>
   <option value="Fax">Fax</option>
   <option value="Work">Work</option>
    </select>
    
       <label style="visibility:hidden; color:red; font-size:12px;" id="selectCon"></label>
   </td>
   </tr>
	<tr>

	</tr>
</table>
<div
	style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica, sans-serif; margin-left: 350px;">
<input type="submit"  style="background-color:black;margin-top:20px;  color:white" onclick="return validateConSelection()" value="Update" />

   <input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>

</div>     
   


</form>

</div>


<!-- Start Footer --> <jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
