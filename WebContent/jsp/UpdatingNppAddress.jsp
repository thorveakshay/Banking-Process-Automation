<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="com.training.model.*"%>
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

<script>


function home(){

	window.location="<%=request.getContextPath()%>/jsp/backoffice.jsp";

	}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Non Personal Party Address</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script>
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
function validateAddress()
{


if(document.getElementsByName("txtnumber")[0].value==0 || document.getElementsByName("txtnumber")[0].value=="null")
{
	  document.getElementById('label1').style.visibility="visible";
	  document.getElementById('label1').innerHTML="&nbsp;Please enter the Building number.";

	document.getElementsByName("txtnumber")[0].value="";
	document.getElementsByName("txtnumber")[0].focus();
	return false;
}
else
{
	  document.getElementById('label1').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("txtnumber")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-/"))
{
	 document.getElementById('label1').style.visibility="visible";
	document.getElementById("label1").innerHTML="Please enter only alphabets,numbers and - /"; 
	document.getElementsByName("txtnumber")[0].focus();
	document.getElementsByName("txtnumber")[0].value="";
	return false;
}
else
{
	  document.getElementById('label1').innerHTML="";
}

if(ischarinbag(document.getElementsByName("txtnumber")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-/"))
{
	 document.getElementById('label1').style.visibility="visible";
	document.getElementById("label1").innerHTML="Only alphabets are not allowed."; 
	document.getElementsByName("txtnumber")[0].focus();
	document.getElementsByName("txtnumber")[0].value="";
	return false;
}
else
{
	  document.getElementById('label1').innerHTML="";
}


if (document.getElementsByName("txtnumber")[0].value.charAt(0)==" ")
	{
 document.getElementById('label1').style.visibility="visible";
		document.getElementById("label1").innerHTML="Building Number should not start with blank space"; 
		document.getElementsByName("txtnumber")[0].focus();
		document.getElementsByName("txtnumber")[0].value="";

		return false;
	}
else
{
  document.getElementById('label1').innerHTML="";
}


if(document.getElementsByName("txtstreet")[0].value==0 || document.getElementsByName("txtstreet")[0].value=="null")
{
	  document.getElementById('street').style.visibility="visible";
	  document.getElementById('street').innerHTML="&nbsp;Please enter the Street name.";

	document.getElementsByName("txtstreet")[0].value="";
	document.getElementsByName("txtstreet")[0].focus();
	return false;
}
else
{
	  document.getElementById('street').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("txtstreet")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- "))
{
	 document.getElementById('street').style.visibility="visible";
	document.getElementById("street").innerHTML="Please enter alphabets,numbers,- and space."; 
	document.getElementsByName("txtstreet")[0].focus();
	document.getElementsByName("txtstreet")[0].value="";
	return false;
}
else
{
	  document.getElementById('street').innerHTML="";
}


if(ischarinbag(document.getElementsByName("txtstreet")[0].value,"0123456789- "))
{
	 document.getElementById('street').style.visibility="visible";
	document.getElementById("street").innerHTML="Only numbers are not allowed."; 
	document.getElementsByName("txtstreet")[0].focus();
	document.getElementsByName("txtstreet")[0].value="";
	return false;
}
else
{
	  document.getElementById('street').innerHTML="";
}



if (document.getElementsByName("txtstreet")[0].value.charAt(0)==" ")
{
document.getElementById('street').style.visibility="visible";
	document.getElementById("street").innerHTML="Street name should not start with blank space"; 
	document.getElementsByName("txtstreet")[0].focus();
	document.getElementsByName("txtstreet")[0].value="";

	return false;
}
else
{
document.getElementById('street').innerHTML="";
}



if(document.getElementsByName("txtcname")[0].value==0 || document.getElementsByName("txtcname")[0].value=="null")
{
	  document.getElementById('city').style.visibility="visible";
	  document.getElementById('city').innerHTML="&nbsp;Please enter the City name.";

	document.getElementsByName("txtcname")[0].value="";
	document.getElementsByName("txtcname")[0].focus();
	return false;
}
else
{
	  document.getElementById('city').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("txtcname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('city').style.visibility="visible";
	document.getElementById("city").innerHTML="Only alphabets are allowed."; 
	document.getElementsByName("txtcname")[0].focus();
	document.getElementsByName("txtcname")[0].value="";
	return false;
}
else
{
	  document.getElementById('city').innerHTML="";
}

if (document.getElementsByName("txtcname")[0].value.charAt(0)==" ")
{
document.getElementById('city').style.visibility="visible";
	document.getElementById("city").innerHTML="City name should not start with blank space"; 
	document.getElementsByName("txtcname")[0].focus();
	document.getElementsByName("txtcname")[0].value="";

	return false;
}
else
{
document.getElementById('city').innerHTML="";
}


if(!ischarinbag(document.getElementsByName("txttown")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('label5').style.visibility="visible";
	document.getElementById("label5").innerHTML="Please enter only alphabets and space."; 
	document.getElementsByName("txttown")[0].focus();
	document.getElementsByName("txttown")[0].value="";
	return false;
}
else
{
	  document.getElementById('label5').innerHTML="";
}



if (document.getElementsByName("txttown")[0].value.charAt(0)==" ")
{
document.getElementById('label5').style.visibility="visible";
	document.getElementById("label5").innerHTML="Town name should not start with blank space"; 
	document.getElementsByName("txttown")[0].focus();
	document.getElementsByName("txttown")[0].value="";

	return false;
}
else
{
document.getElementById('label5').innerHTML="";
}




if(document.getElementsByName("txtpostal")[0].value==0 || document.getElementsByName("txtpostal")[0].value=="null")
{
	  document.getElementById('label4').style.visibility="visible";
	  document.getElementById('label4').innerHTML="&nbsp;Please enter the Postal code,alphabets should be in uppercase.";

	document.getElementsByName("txtpostal")[0].value="";
	document.getElementsByName("txtpostal")[0].focus();
	return false;
}
else
{
	  document.getElementById('label4').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("txtpostal")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "))
{
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Please enter only alphabets(capital),numbers and space."; 
	document.getElementsByName("txtpostal")[0].focus();
	document.getElementsByName("txtpostal")[0].value="";
	return false;
}
else
{
	  document.getElementById('label4').innerHTML="";
}


if(ischarinbag(document.getElementsByName("txtpostal")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Only alphabets are not allowed."; 
	document.getElementsByName("txtpostal")[0].focus();
	document.getElementsByName("txtpostal")[0].value="";
	return false;
}
else
{
	  document.getElementById('label4').innerHTML="";
}


if(document.getElementsByName("txtpostal")[0].value.length<2)

{
	 document.getElementById('label4').style.visibility="visible";
		document.getElementById("label4").innerHTML="Postal code can be of minimum 2 and maximum 10 digits."; 
		document.getElementsByName("txtpostal")[0].focus();
		document.getElementsByName("txtpostal")[0].value="";
		return false;
	}
	else
	{
		  document.getElementById('label4').innerHTML="";
	}



if(document.getElementsByName("txtpostal")[0].value.length>10)

{
	 document.getElementById('label4').style.visibility="visible";
		document.getElementById("label4").innerHTML="Postal code can be of minimum 2 and maximum 10 digits."; 
		document.getElementsByName("txtpostal")[0].focus();
		document.getElementsByName("txtpostal")[0].value="";
		return false;
	}
	else
	{
		  document.getElementById('label4').innerHTML="";
	}



if (document.getElementsByName("txtpostal")[0].value.charAt(0)==" ")
{
document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Postal code should not start with blank space"; 
	document.getElementsByName("txtpostal")[0].focus();
	document.getElementsByName("txtpostal")[0].value="";

	return false;
}
else
{
document.getElementById('label4').innerHTML="";
}




if(document.getElementsByName("txtcountry")[0].value==0 || document.getElementsByName("txtcountry")[0].value=="null")
{
	  document.getElementById('label3').style.visibility="visible";
	  document.getElementById('label3').innerHTML="&nbsp;Please enter the Country Name.";

	document.getElementsByName("txtcountry")[0].value="";
	document.getElementsByName("txtcountry")[0].focus();
	return false;
}
else
{
	  document.getElementById('label3').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("txtcountry")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('label3').style.visibility="visible";
	document.getElementById("label3").innerHTML="Please enter only alphabets and space."; 
	document.getElementsByName("txtcountry")[0].focus();
	document.getElementsByName("txtcountry")[0].value="";
	return false;
}
else
{
	  document.getElementById('label3').innerHTML="";
}



if (document.getElementsByName("txtcountry")[0].value.charAt(0)==" ")
{
document.getElementById('label3').style.visibility="visible";
	document.getElementById("label3").innerHTML="Country name should not start with blank space"; 
	document.getElementsByName("txtcountry")[0].focus();
	document.getElementsByName("txtcountry")[0].value="";

	return false;
}
else
{
document.getElementById('label3').innerHTML="";
}
var op= confirm("Are you sure you want to proceed ?");
if(op==true)
{
	alert("Business Customer address updated successfully");
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
<font color="black" size="5pt"><center>Non Personal Party Details</center></font><br/>
   <form action="/NexusBankingGroup/ChangeCustomerAddressController" method="post">
     <input type="hidden"  name="action" value="start_updation"/>
     <% long ticketId=Long.parseLong((request.getParameter("ticketId")));
         Address add= new Address();
         add=(Address)request.getAttribute("address");
     %>
     <input type="hidden"  name="ticketId" value="<%=ticketId %>"/>
     <input type="hidden"  name="idno" value="<%=request.getAttribute("idno2")%>"/>
     <input type="hidden"  name="txttype" value="<%=request.getAttribute("txtadd_type")%>"/>
   
    <table id="gradient-style" align="center" style="margin-left: 100px" width="600">
    <tr>
<td colspan="3" align="left"><font color="black">Fields with <font color="red"><sup>*</sup> </font>mark are mandatory.</font></td>
</tr>
    <tr>
  <td width="40%"><font size="2pt"><b>Description</b></font></td>
  <td width="300" height="50"><font size="2pt"><%=request.getAttribute("tktdesc2")%></font></td>
  </tr><tr>
	<td><font size="2pt"><b>Non Personal Party Id</b></font></td>
	<td><font size="2pt"><%=request.getAttribute("idno2")%></font></td>
</tr> 
   
 
 
  
   <tr>
   <td colspan="2" style="color:green;"><font size="2pt"><b>Address Details</b></td>
   </tr>
   <tr>
   <td><font size="2pt"><b>Address Type</b></font></td>
   <td><font size="2pt"><%=request.getAttribute("txtadd_type")%></font></td>
   </tr>
   <tr>
   <td><font size="2pt"><b>Building Number<font color="red"><sup>*</sup></font></b></font></td>
   <td><font size="2pt"><input type="text" name="txtnumber" title="Please enter building number." onfocus="myFunction(this)" value="<%=request.getAttribute("txtnumber")%>" />
   
    <label style="visibility:hidden; color:red; font-size:12px;" id="label1"></label>
  </font> </td>
   
   
   </tr>
   <tr>
   <td><font size="2pt"><b>Building Name</b></font></td>
   <td><font size="2pt"><input type="text" name="txtbuilding" onfocus="myFunction(this)" value="<%=request.getAttribute("txtbulding")%>"/>
   
   </font></td>
   </tr>
   <tr>
   <td><font size="2pt"><b>Street Name<font color="red"><sup>*</sup></font></b></font></td>
   <td><font size="2pt"><input type="text" name="txtstreet" onfocus="myFunction(this)" value="<%=request.getAttribute("txtstreet")%>"/>
   <label style="visibility:hidden; color:red; font-size:12px;" name="street" id="street"></label>
  </font> </td>
   </tr>
   <tr>
   <td><font size="2pt"><b>City Name<font color="red"><sup>*</sup></font></b></font></td>
   <td><font size="2pt"><input type="text" name="txtcname" title="Please enter city name." onfocus="myFunction(this)" value="<%=request.getAttribute("txtcname")%>"/>
   
    <label style="visibility:hidden; color:red; font-size:12px;" id="city"></label>
   </font></td>
   </tr>
   <tr>
   <td><font size="2pt"><b>Town Name<font color="red"><sup>*</sup></font></b></font></td>
   <td><font size="2pt"><input type="text" name="txttown" onfocus="myFunction(this)" value="<%=request.getAttribute("txttown")%>"/>
    <label style="visibility:hidden; color:red; font-size:12px;" id="label5"></label>
   
 </font>  </td>
   </tr>
   
     <tr>
   <td><font size="2pt"><b>Postal Code<font color="red"><sup>*</sup></font></b></font></td>
   <td><font size="2pt"><input type="text" name="txtpostal" title="Please enter postal code,alphabets should be in uppercase." onfocus="myFunction(this)" value="<%=request.getAttribute("txtpostal")%>"/>
   
   <label style="visibility:hidden; color:red; font-size:12px;" id="label4"></label>
   </font></td>
   </tr>
   
   
  <tr>
		<td><b>Country</b><font color="red"><sup>*</sup></font></td>
		<td><select name="txtcountry" style="width: 145px">
			 <option value="<%=add.getCountry()%>"><%=add.getCountry()%></option>
			<option value="Australia" <%if(add.getCountry().equalsIgnoreCase("Australia")){out.println("selected");}%>>Australia</option>
			<option value="Brazil" <%if(add.getCountry().equalsIgnoreCase("Brazil")){out.println("selected");}%>>Brazil</option>
			<option value="Canada" <%if(add.getCountry().equalsIgnoreCase("Canada")){out.println("selected");}%>>Canada</option>
			<option value="China" <%if(add.getCountry().equalsIgnoreCase("China")){out.println("selected");}%>>China</option>
			<option value="India" <%if(add.getCountry().equalsIgnoreCase("India")){out.println("selected");}%>>India</option>
			<option value="Japan" <%if(add.getCountry().equalsIgnoreCase("Japan")){out.println("selected");}%>>Japan</option>
			<option value="Kenya" <%if(add.getCountry().equalsIgnoreCase("Kenya")){out.println("selected");}%>>Kenya</option>
			<option value="New Zealand" <%if(add.getCountry().equalsIgnoreCase("New Zealand")){out.println("selected");}%>>New Zealand</option>
			<option value="Pakistan" <%if(add.getCountry().equalsIgnoreCase("Pakistan")){out.println("selected");}%>>Pakistan</option>
			<option value="South Africa" <%if(add.getCountry().equalsIgnoreCase("South Africa")){out.println("selected");}%>>South Africa</option>
			<option value="United Kingdom" <%if(add.getCountry().equalsIgnoreCase("United Kingdom")||add.getCountry().equalsIgnoreCase("The United Kingdom")){out.println("selected");}%>>United Kingdom</option>
			<option value="Zimbabwe" <%if(add.getCountry().equalsIgnoreCase("Zimbabwe")){out.println("selected");}%>>Zimbabwe</option>
			<option value="Other" <%if(add.getCountry().equalsIgnoreCase("Other")){out.println("selected");}%>>Other</option>
		</select> <label style="visibility: hidden; color: red; font-size: 12px;"
			name="label3" id="label3"></label></td>
	</tr>
 
          </table> 
     <div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:350px;">
     <input type="submit"  style="background-color:black;margin-top:20px; margin-left:100px;  color:white" onclick="return validateAddress()" value="Update"/>
     
     &nbsp;&nbsp;&nbsp;<input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>
     
     
     </div>
   </form>

</div>
		<br/>		 
   	
	<!-- Start Footer -->
	
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>

</body>
</html>