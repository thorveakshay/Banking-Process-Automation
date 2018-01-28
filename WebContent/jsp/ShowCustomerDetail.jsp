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
<% 
if(session.getAttribute("uid")==null)
{
 %>
<Script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</Script>
<% 
 
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Show Customer Details</title>
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script>


function home(){

	window.location="<%=request.getContextPath()%>/jsp/HomeTicket.jsp";

	}



	function myFunction(x) {
		x.style.background = "lightgreen";
	}

	function checkNumber()
	{
		var cNo = document.getElementsByName("txtcontact")[0].value; 
		if(cNo==0)
		{
			document.getElementById('conNum').style.visibility="visible";
			  document.getElementById('conNum').innerHTML="&nbsp;Please enter contact number.";
		
			document.getElementsByName("txtcontact")[0].value="";
			document.getElementsByName("txtcontact")[0].focus();
		
				return false;
		
		}
		else
		{
			 document.getElementById('conNum').innerHTML="";
		}
				
		var lenc=cNo.length;
		var k=0; 
	 

		while(lenc!=0)
		{

			var n3 = cNo.charCodeAt(k);
	 

			if(n3<48 || n3>57 && n3!=0)
			{
				document.getElementById('conNum').style.visibility="visible";
				  document.getElementById('conNum').innerHTML="&nbsp;Please enter only numbers.";
			
				document.getElementsByName("txtcontact")[0].value="";
		
				document.getElementsByName("txtcontact")[0].focus();
				return false;
				break;
			}
			else
			{
				document.getElementById('conNum').innerHTML="";
			}
				
			k++;
			lenc--;


		}
		
		return true
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
<table id="gradient-style" align="center" border"1" style="font-size:2pt;">
	<tr>
		<td><b>Description</b></td>
		<td><textarea rows="5" cols="40" readonly="readonly"><%=request.getAttribute("tktdesc2")%></textarea></td>
	</tr>
	<tr>
		<td><b>Business Customer Id</b></td>
		<td>:<input type="text" name=idno
			value="<%=request.getAttribute("idno2")%>" /></td>
	</tr>




	<tr>
		<td><b>Business Name</b></td>
		<td><input type="text" name="txtbname"
			value="<%=request.getAttribute("businessname")%>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td><b>Trading Name</b></td>
		<td><input type="text" name="txttname"
			value="<%=request.getAttribute("tradingname")%>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td><b>Country of Registration</b></td>
		<td><input type="text" name="txtcountry"
			value="<%=request.getAttribute("country_of_reg")%>"
			readonly="readonly" /></td>
	</tr>
	<tr>
		<td><b>Email Address</b></td>
		<td><input type="text" name="txtemail"
			value="<%=request.getAttribute("business_email_id")%>"
			readonly="readonly" /></td>
	</tr>
	<tr>
		<!--	value="<%=request.getAttribute("contact_no")%>"-->
		<td><b>Contact Number</b></td>
		<td><input type="text" name="txtcontact"
			onfocus="myFunction(this)" />
			
			<label style="visibility:hidden; color:red; font-size:12px;" id="conNum"></label>
			</td>
	</tr>
	<tr>

	</tr>
</table>
<div
	style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica, sans-serif; margin-left: 350px;">
<input type="submit" style="background-color:black;margin-top:20px;  color:white" onclick="return checkNumber()" value="Update" />

<input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>




</div>
</form>

</div>


<!-- Start Footer --> <jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
