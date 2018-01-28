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
<title>Show Personal Party Contact Ticket</title>
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


function ischarinbag(string,bag)
{
 var i;

 for(i=0;i<string.length;i++)
 {
        var charval=string.charAt(i);
	if(bag.indexOf(charval)==-1)
	return 0;
 }
 return 1;
}	


function validateContactNum()
{
if(document.getElementsByName("contact_type")[0].value=="")
			{
			
				document.getElementById('typeC').style.visibility="visible";
				  document.getElementById('typeC').innerHTML="&nbsp;Please select the type of contact.";
			
				document.getElementsByName("contact_type")[0].focus();
			return false;
			}
	
	
	
	var cont = document.getElementsByName("txtcontact")[0].value; 
if(document.getElementsByName("txtcontact")[0].value=="")
{
	document.getElementById('contact').style.visibility="visible";
	  document.getElementById('contact').innerHTML="&nbsp;Please enter Contact number of minimum 6 or maximum 10 digits.";

	document.getElementsByName("txtcontact")[0].value="";
	document.getElementsByName("txtcontact")[0].focus();

		return false;

}
else
{
	document.getElementById('contact').innerHTML="";
}
	
	if(document.getElementsByName("txtcontact")[0].value.length<6) 
		
	{
		document.getElementById('contact').style.visibility="visible";
		  document.getElementById('contact').innerHTML="&nbsp;Please enter Contact number of minimum 6 or maximum 10 digits.";
	
		document.getElementsByName("txtcontact")[0].value="";
		document.getElementsByName("txtcontact")[0].focus();
	
			return false;
	
	}
	else
	{
		document.getElementById('contact').innerHTML="";
	}

if(document.getElementsByName("txtcontact")[0].value.length!=10)
	{
		document.getElementById('contact').style.visibility="visible";
		  document.getElementById('contact').innerHTML="&nbsp;Please enter Contact number of minimum 6 or maximum 10 digits.";
	
		document.getElementsByName("txtcontact")[0].value="";
		document.getElementsByName("txtcontact")[0].focus();
	
			return false;
	
	}
	else
	{
		document.getElementById('contact').innerHTML="";
	}


	if(!ischarinbag(document.getElementsByName("txtcontact")[0].value,"0123456789"))
	{
		document.getElementById('contact').style.visibility="visible";
		  document.getElementById('contact').innerHTML="&nbsp;Contact number can contain only numbers.";

		document.getElementsByName("txtcontact")[0].value="";
		document.getElementsByName("txtcontact")[0].focus();
		return false;
		
	}
	else
	{
		 document.getElementById('contact').innerHTML="";
	}

	var op= confirm("Are you sure you want to proceed ?");
	if(op==true)
	{
		alert("Contact details updated successfully");
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
<%long ticketId1= Long.parseLong(request.getParameter("ticketId")); %>
<center><font color="black" size="5pt">Update Personal Party Contact Details</font></center><br/>
   <form action="/NexusBankingGroup/ChangeCustomerContactController">
     <input type="hidden"  name="action" value="show_pp_tckt_hidden"/>
    <input type="hidden"  name="ticketId" value="<%=ticketId1%>"/>
      <input type="hidden"  name="idno" value="<%=request.getAttribute("idno2")%>" />
   <table id="gradient-style" align="center" border"1" style="font-size:2pt;" width="600px">
   <tr>
<td colspan="3" align="left"><font color="black">Fields with <font color="red"><sup>*</sup> </font>mark are mandatory.</font></td>
</tr>
    <tr>
  <td><b>Description</b></td>
<!--  <td><textarea rows="5" cols="40" readonly="readonly" disabled="disabled"><%=request.getAttribute("tktdesc2")%></textarea></td>-->
		<td width="300" height="50"><%=request.getAttribute("tktdesc2")%></td>
  </tr>
  <tr>
	<td width="40%"><b>Account Party Id</b></td>
	<td><%=request.getAttribute("idno2")%></td>
</tr> 
   
 
 
  
   <tr>
   <td><b>First Name</b></td>
   <td><%=request.getAttribute("firstname")%></td>
   </tr>
   <tr>
   <td><b>Last Name</b></td>
   <td><%=request.getAttribute("surname")%></td>
   </tr>
   <tr>
   <td><b>Relationship with Business Customer</b></td>
   <td><%=request.getAttribute("relation")%></td>
   </tr>
   <tr>
   <td><b>Email Address</b></td>
   <td><%=request.getAttribute("email")%></td>
   </tr>
    <tr>
   <td><b>Type of Contact<font color="red">*&nbsp;&nbsp;&nbsp;</font></b></td>
   <td>
   <select name="contact_type">
    <option value="">Please Select</option>
   <option value="Home">HOME</option>
   <option value="Mobile">MOBILE</option>
   <option value="Office">OFFICE</option>
   </select>
   <label style="visibility:hidden; color:red; font-size:12px;" id="typeC"></label>
   </td>
   </tr>
   <tr>
   <td><b>New Contact Number<font color="red">*&nbsp;&nbsp;&nbsp;</font></b></td>
   <td><input type="text" name="txtcontact" title="Please enter new contact number." onfocus="myFunction(this)" />
   <label style="visibility:hidden; color:red; font-size:12px;" id="contact"></label>
   
   </td>
   </tr>
     </table> 
     
     
     <div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:170px;">
  <center> <input type="submit" style="background-color:black;margin-top:20px;  color:white" onclick="return validateContactNum()" value="Update"/>
     
     &nbsp; &nbsp;<input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input></center>  
     
     
     </div>
   </form>

</div>
				 
   	<br/>
   	<br/>
	<!-- Start Footer -->
	
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
