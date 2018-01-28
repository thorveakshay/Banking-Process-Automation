<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">



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


function home(){

	window.location="<%=request.getContextPath()%>/jsp/backoffice.jsp";

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

function myFunction(x)
{
	x.style.background="lightgreen";
}


function validateConDetails()
{


	if(document.getElementsByName("txtarea")[0].value=="" || document.getElementsByName("txtarea")[0].value==0)
	{
		document.getElementById('areaCode').style.visibility="visible";
		  document.getElementById('areaCode').innerHTML="&nbsp;Please enter the area code.";

		document.getElementsByName("txtarea")[0].value="";
		document.getElementsByName("txtarea")[0].focus();
		return false;
	}
	else
	{
		 document.getElementById('areaCode').innerHTML="";
	}

	if(!ischarinbag(document.getElementsByName("txtarea")[0].value,"0123456789"))
	{
		document.getElementById('areaCode').style.visibility="visible";
		  document.getElementById('areaCode').innerHTML="&nbsp;Area code can contain only numbers.";

		document.getElementsByName("txtarea")[0].value="";
		document.getElementsByName("txtarea")[0].focus();
		return false;
		
	}
	else
	{
		 document.getElementById('areaCode').innerHTML="";
	}

	if(((document.getElementById("txtarea").value.length)<2) || ((document.getElementById("txtarea").value.length)>6))
	{

		document.getElementById('areaCode').style.visibility="visible";
	document.getElementById('areaCode').innerHTML="&nbsp;Area Code should be of minimum 2 and maximum 6 digits.";

	document.getElementsByName("txtarea")[0].value="";
	document.getElementsByName("txtarea")[0].focus();
	return false;

	}
	else
	{
		 document.getElementById('areaCode').innerHTML="";
	}




	if(document.getElementsByName("txtcountry")[0].value=="" || document.getElementsByName("txtcountry")[0].value==0 )
	{
		document.getElementById('contCode').style.visibility="visible";
		  document.getElementById('contCode').innerHTML="&nbsp;Please enter the country code.";

		document.getElementsByName("txtcountry")[0].value="";
		document.getElementsByName("txtcountry")[0].focus();
		return false;
	}
	else
	{
		 document.getElementById('contCode').innerHTML="";
	}
	if(!ischarinbag(document.getElementsByName("txtcountry")[0].value,"+0123456789"))
	{
		document.getElementById('contCode').style.visibility="visible";
		  document.getElementById('contCode').innerHTML="&nbsp;Country code can contain only numbers.";

		document.getElementsByName("txtcountry")[0].value="";
		document.getElementsByName("txtcountry")[0].focus();
		return false;
		
	}
	else
	{
		 document.getElementById('contCode').innerHTML="";
	}


	 if (document.getElementsByName("txtcountry")[0].value.charAt(0)!="+")
	 {
		 document.getElementById('contCode').style.visibility="visible";
		  document.getElementById('contCode').innerHTML="&nbsp;Country code should start with + sign.";

		document.getElementsByName("txtcountry")[0].value="";
		document.getElementsByName("txtcountry")[0].focus();
		return false;
	 }
	 else 
	 {
		 document.getElementById('contCode').innerHTML="";
	 }
		if((document.getElementById("txtcountry").value.length)<3) 
		{

			document.getElementById('contCode').style.visibility="visible";
		document.getElementById('contCode').innerHTML="&nbsp;Country Code can contain maximum 4 digits.";

		document.getElementsByName("txtcountry")[0].value="";
		document.getElementsByName("txtcountry")[0].focus();
		return false;

		}
		else
		{
			 document.getElementById('contCode').innerHTML="";
		}

	
	if((document.getElementById("txtcountry").value.length)>4) 
	{

		document.getElementById('contCode').style.visibility="visible";
	document.getElementById('contCode').innerHTML="&nbsp;Country Code can contain maximum 4 digits.";

	document.getElementsByName("txtcountry")[0].value="";
	document.getElementsByName("txtcountry")[0].focus();
	return false;

	}
	else
	{
		 document.getElementById('contCode').innerHTML="";
	}


	if(document.getElementsByName("txtcontact")[0].value=="" || document.getElementsByName("txtcontact")[0].value==0)
	{
		document.getElementById('conNum').style.visibility="visible";
		  document.getElementById('conNum').innerHTML="&nbsp;Please enter the Mobile number.";

		document.getElementsByName("txtcontact")[0].value="";
		document.getElementsByName("txtcontact")[0].focus();
		return false;
	}
	else
	{
		 document.getElementById('conNum').innerHTML="";
	}
	if(!ischarinbag(document.getElementsByName("txtcontact")[0].value,"0123456789"))
	{
		document.getElementById('conNum').style.visibility="visible";
		  document.getElementById('conNum').innerHTML="&nbsp;Mobile number can contain only numbers.";

		document.getElementsByName("txtcontact")[0].value="";
		document.getElementsByName("txtcontact")[0].focus();
		return false;
		
	}
	else
	{
		 document.getElementById('conNum').innerHTML="";
	}
	if(document.getElementById("txtcontact").value.length!=10)
	{

		document.getElementById('conNum').style.visibility="visible";
	document.getElementById('conNum').innerHTML="&nbsp;Mobile number should be of 10 digits.";

	document.getElementsByName("txtcontact")[0].value="";
	document.getElementsByName("txtcontact")[0].focus();
	return false;

	}
	else
	{
		 document.getElementById('conNum').innerHTML="";
	}
	var op= confirm("Are you sure you want to proceed ?");
	if(op==true)
	{
		alert("Business Customer contact updated successfully");
		return true;
	}
	else
		return false;

		
}


</script>
<jsp:include page="../jsp/layout/Header.jsp" />
<head>
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

<% 
String designation=session.getAttribute("designation").toString();

if(!designation.equals("BACKOFFICE EMPLOYEE"))
{
	%>
<Script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</Script>
<% 
}
%>




<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Updating NPP Contact</title>
<link href="<%=request.getContextPath() %>/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css"
	rel="stylesheet" type="text/css" />

</head>
<body>
<!-- Start Header -->
<!-- Start Main Content -->

<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Quick Links</h3>
<ul class="leftbox borderedlist">
	
	<li id="lft"><a
		href="<%=request.getContextPath() %>/jsp/AssignedTickets.jsp"
		title="Assigned Tickets">Assigned Tickets</a></li>



</ul>
<hr />
</div>

<!-- main content area -->
<div class="maincontent">

<h3><center><font color="black" size="5pt">Business Customer Contact Details</font></center></h3><br>
<form
	action="/NexusBankingGroup/ChangeCustomerContactController"
	method="post"><input type="hidden" name="action"
	value="start_updation" /> <% long ticketId=Long.parseLong((request.getParameter("ticketId"))); %>
<input type="hidden" name="ticketId" value="<%=ticketId %>" /> <input
	type="hidden" name="idno" value="<%=request.getAttribute("idno2")%>" />
<input type="hidden" name="contactType"
	value="<%=request.getAttribute("txt_contact_type")%>" />

<table id="gradient-style" align="center" style="margin-left:250px" width="550px">




	<tr>
		<td width="40%"><font size="2pt"><b>Description</b></font></td>

		<td width="300" height="50"><font size="2pt"><%=request.getAttribute("tktdesc2")%></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Non Personal Party Id</b></font></td>
		<td><font size="2pt"><%=request.getAttribute("idno2")%></font></td>
	</tr>




	<tr>
		<td><font size="2pt" color="green"><b>Contacts Details</b></font></td>
		<td></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Contacts Type</b></font></td>

		<td><font size="2pt"><%=request.getAttribute("txt_contact_type")%></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Area Code<font color="red"><sup>*</sup></font></b></font></td>
		<td><font size="2pt"><input type="text" name="txtarea"
			onfocus="myFunction(this)" title="Please enter Area code."
			value="<%=request.getAttribute("txt_area_code")%>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			id="areaCode"></label></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Country Code<font color="red"><sup>*</sup></font></b></font></td>
		<td><font size="2pt"><input type="text" name="txtcountry"
			onfocus="myFunction(this)" title="Please enter Country code."
			value="<%=request.getAttribute("txt_country_code")%>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			id="contCode"></label></font></td>
	</tr>
	<tr>
		<td><font size="2pt"><b>Contact Number<font
			color="red"><sup>*</sup></font></b></font></td>
		<td><font size="2pt"><input type="text" name="txtcontact"
			onfocus="myFunction(this)" title="Please enter contact number."
			value="<%=request.getAttribute("txt_contact")%>" /> <label
			style="visibility: hidden; color: red; font-size: 12px;" id="conNum"></label></font>
		</td>
	</tr>
</table>
<div
	style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica, sans-serif; margin-left:450px;">
<input type="submit"
	style="background-color: black; margin-top: 20px; color: white"
	onclick="return validateConDetails()" value="Update" /> <input
	type="button"
	style="background-color: black; margin-top: 20px; color: white"
	onclick="return home()" value="Cancel"></input></div>
</form>

</div>
</div>
<br/>
<br/>
<br/>
 
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>

</body>
</html>