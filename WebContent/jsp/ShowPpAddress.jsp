<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="../jsp/layout/Header.jsp" />
 <%@page import="com.training.model.*"%>
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
<script type="text/javascript">


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
function validateFields()
{
 

	 if(document.getElementsByName("houseNo")[0].value==0 || document.getElementsByName("houseNo")[0].value=="null")
	 {
		  document.getElementById('label').style.visibility="visible";
		  document.getElementById('label').innerHTML="&nbsp;Please enter the House Number.";
	
		document.getElementsByName("houseNo")[0].value="";
		document.getElementsByName("houseNo")[0].focus();
		return false;
	 }
	 else
	 {
		  document.getElementById('label').innerHTML="";
	 }
 
	 if (document.getElementsByName("houseNo")[0].value.charAt(0)==" ")
	 	{
		 document.getElementById('label').style.visibility="visible";
	 		document.getElementById("label").innerHTML="House Number should not start with blank space"; 
	 		document.getElementsByName("houseNo")[0].focus();
	 		document.getElementsByName("houseNo")[0].value="";

	 		return false;
	 	}
	 else
	 {
		  document.getElementById('label').innerHTML="";
	 }


if(!ischarinbag(document.getElementsByName("houseNo")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-/"))
{
		document.getElementById('label').style.visibility="visible";
		document.getElementById("label").innerHTML="Please enter only alphabets,numbers and - /."; 
		document.getElementsByName("houseNo")[0].focus();
		document.getElementsByName("houseNo")[0].value="";
return false;
}
else
{
	  document.getElementById('label').innerHTML="";
}



if(ischarinbag(document.getElementsByName("houseNo")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-/"))
{
	document.getElementById('label').style.visibility="visible";
	document.getElementById("label").innerHTML="Only alphabets are not allowed."; 
	document.getElementsByName("houseNo")[0].focus();
	document.getElementsByName("houseNo")[0].value="";
return false;
}
else
{
  document.getElementById('label').innerHTML="";
}


 

if((document.getElementsByName("buildingNumber")[0].value==0) || (document.getElementsByName("buildingNumber")[0].value=="null"))
{
	  document.getElementById('label1').style.visibility="visible";
	  document.getElementById('label1').innerHTML="&nbsp;Please enter the Building number.";

	document.getElementsByName("buildingNumber")[0].value="";
	document.getElementsByName("buildingNumber")[0].focus();
	return false;
}
else
{
	  document.getElementById('label1').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("buildingNumber")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-/"))
{
	 document.getElementById('label1').style.visibility="visible";
	document.getElementById("label1").innerHTML="Please enter only alphabets,numbers and - /."; 
	document.getElementsByName("buildingNumber")[0].focus();
	document.getElementsByName("buildingNumber")[0].value="";
	return false;
}
else
{
	  document.getElementById('label1').innerHTML="";
}
 
if (document.getElementsByName("buildingNumber")[0].value.charAt(0)==" ")
	{
document.getElementById('label1').style.visibility="visible";
		document.getElementById("label1").innerHTML="Building Number should not start with blank space"; 
		document.getElementsByName("buildingNumber")[0].focus();
		document.getElementsByName("buildingNumber")[0].value="";

		return false;
	}
else
{
 document.getElementById('label1').innerHTML="";
}


if(ischarinbag(document.getElementsByName("buildingNumber")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-/ "))
{
	 document.getElementById('label1').style.visibility="visible";
	document.getElementById("label1").innerHTML="Only alphabets are not allowed."; 
	document.getElementsByName("buildingNumber")[0].focus();
	document.getElementsByName("buildingNumber")[0].value="";
	return false;
}
else
{
	  document.getElementById('label1').innerHTML="";
}





if(document.getElementsByName("streetName")[0].value==0 || document.getElementsByName("streetName")[0].value=="null")
{
	  document.getElementById('street').style.visibility="visible";
	  document.getElementById('street').innerHTML="&nbsp;Please enter the Street name.";

	document.getElementsByName("streetName")[0].value="";
	document.getElementsByName("streetName")[0].focus();
	return false;
}
else
{
	  document.getElementById('street').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("streetName")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- "))
{
	 document.getElementById('street').style.visibility="visible";
	document.getElementById("street").innerHTML="Please enter only alphabets,numbers,space and - ."; 
	document.getElementsByName("streetName")[0].focus();
	document.getElementsByName("streetName")[0].value="";
	return false;
}
else
{
	  document.getElementById('street').innerHTML="";
}

if (document.getElementsByName("streetName")[0].value.charAt(0)==" ")
{
document.getElementById('street').style.visibility="visible";
	document.getElementById("street").innerHTML="Street name should not start with blank space"; 
	document.getElementsByName("streetName")[0].focus();
	document.getElementsByName("streetName")[0].value="";

	return false;
}
else
{
document.getElementById('street').innerHTML="";
}
 
if(ischarinbag(document.getElementsByName("streetName")[0].value,"0123456789- "))
{
	 document.getElementById('street').style.visibility="visible";
	document.getElementById("street").innerHTML="Only numbers are not allowed."; 
	document.getElementsByName("streetName")[0].focus();
	document.getElementsByName("streetName")[0].value="";
	return false;
}
else
{
	  document.getElementById('street').innerHTML="";
}


if(document.getElementsByName("cityName")[0].value==0 || document.getElementsByName("cityName")[0].value=="null")
{
	  document.getElementById('city').style.visibility="visible";
	  document.getElementById('city').innerHTML="&nbsp;Please enter the City name.";

	document.getElementsByName("cityName")[0].value="";
	document.getElementsByName("cityName")[0].focus();
	return false;
}
else
{
	  document.getElementById('city').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("cityName")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('city').style.visibility="visible";
	document.getElementById("city").innerHTML="&nbsp;Only alphabets are allowed."; 
	document.getElementsByName("cityName")[0].focus();
	document.getElementsByName("cityName")[0].value="";
	return false;
}
else
{
	  document.getElementById('city').innerHTML="";
}

 
if (document.getElementsByName("cityName")[0].value.charAt(0)==" ")
{
document.getElementById('city').style.visibility="visible";
	document.getElementById("city").innerHTML="City name should not start with blank space"; 
	document.getElementsByName("cityName")[0].focus();
	document.getElementsByName("cityName")[0].value="";

	return false;
}
else
{
document.getElementById('city').innerHTML="";
}


if(!ischarinbag(document.getElementsByName("townName")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('label5').style.visibility="visible";
	document.getElementById("label5").innerHTML="Please enter only alphabets and space."; 
	document.getElementsByName("townName")[0].focus();
	document.getElementsByName("townName")[0].value="";
	return false;
}
else
{
	  document.getElementById('label5').innerHTML="";
}
 


if (document.getElementsByName("townName")[0].value.charAt(0)==" ")
{
document.getElementById('label5').style.visibility="visible";
	document.getElementById("label5").innerHTML="Town name should not start with blank space"; 
	document.getElementsByName("townName")[0].focus();
	document.getElementsByName("townName")[0].value="";

	return false;
}
else
{
document.getElementById('label5').innerHTML="";
}




if(document.getElementsByName("postalCode")[0].value==0 || document.getElementsByName("postalCode")[0].value=="null")
{
	  document.getElementById('label4').style.visibility="visible";
	  document.getElementById('label4').innerHTML="&nbsp;Please enter the Postal code,alphabets should be in capital.";

	document.getElementsByName("postalCode")[0].value="";
	document.getElementsByName("postalCode")[0].focus();
	return false;
}
else
{
	  document.getElementById('label4').innerHTML="";
}

 
if(!ischarinbag(document.getElementsByName("postalCode")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "))
{
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Only alphanumeric values and spaces are allowed."; 
	document.getElementsByName("postalCode")[0].focus();
	document.getElementsByName("postalCode")[0].value="";
	return false;
}
else
{
	  document.getElementById('label4').innerHTML="";
}



if(ischarinbag(document.getElementsByName("postalCode")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Only alphabets are not allowed."; 
	document.getElementsByName("postalCode")[0].focus();
	document.getElementsByName("postalCode")[0].value="";
	return false;
}
else
{
	  document.getElementById('label4').innerHTML="";
}

if((document.getElementsByName("postalCode")[0].value.length)<2)

{
	 document.getElementById('label4').style.visibility="visible";
		document.getElementById("label4").innerHTML="Postal code can contain minimum 2 and maximum 10 characters."; 
		document.getElementsByName("postalCode")[0].focus();
		document.getElementsByName("postalCode")[0].value="";
		return false;
	}
	else
	{
		  document.getElementById('label4').innerHTML="";
	}


if((document.getElementsByName("postalCode")[0].value.length)>10)

{
	 document.getElementById('label4').style.visibility="visible";
		document.getElementById("label4").innerHTML="Postal code can contain minimum 2 and maximum 10 characters."; 
		document.getElementsByName("postalCode")[0].focus();
		document.getElementsByName("postalCode")[0].value="";
		return false;
	}
	else
	{
		  document.getElementById('label4').innerHTML="";
	}


if (document.getElementsByName("postalCode")[0].value.charAt(0)==" ")
{
document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Postal code should not start with blank space"; 
	document.getElementsByName("postalCode")[0].focus();
	document.getElementsByName("postalCode")[0].value="";

	return false;
}
else
{
document.getElementById('label5').innerHTML="";
}
 


	if(document.getElementsByName("country")[0].value==0 || document.getElementsByName("country")[0].value=="null")
{
	  document.getElementById('label3').style.visibility="visible";
	  document.getElementById('label3').innerHTML="&nbsp;Please enter the Country Name.";

	document.getElementsByName("country")[0].value="";
	document.getElementsByName("country")[0].focus();
	return false;
}
else
{
	  document.getElementById('label3').innerHTML="";
}
if(!ischarinbag(document.getElementsByName("country")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('label3').style.visibility="visible";
	document.getElementById("label3").innerHTML="Only alphabets are allowed."; 
	document.getElementsByName("country")[0].focus();
	document.getElementsByName("country")[0].value="";
	return false;
}
else
{
	  document.getElementById('label3').innerHTML="";
}

 

if (document.getElementsByName("country")[0].value.charAt(0)==" ")
{
document.getElementById('label3').style.visibility="visible";
	document.getElementById("label3").innerHTML="Country name should not start with blank space"; 
	document.getElementsByName("country")[0].focus();
	document.getElementsByName("country")[0].value="";

	return false;
}
else
{
document.getElementById('label3').innerHTML="";
}
var op= confirm("Are you sure you want to proceed ?");
if(op==true)
{
	alert("Account Party address updated successfully");
	return true;
}
else
	return false;}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Personal Party Address</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
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
<center><font color="black" size="5pt">Update Personal Party Address Details</font></center><br>
   <form action="/NexusBankingGroup/ChangeCustomerAddressController">
     <input type="hidden"  name="action" value="start_pp_address_updation"/>
  
  <%Address add = new Address();
  PersonalParty pp = new PersonalParty();
  pp = (PersonalParty)request.getAttribute("accParty");
  add=(Address)request.getAttribute("address");
 
  long ticketId1= Long.parseLong(request.getParameter("ticketId"));
 //	long ticketId= Long.parseLong((String)request.getAttribute("ticketId")); %>
 	  <input type="hidden"  name="ticketId" value="<%=ticketId1%>"/>
 	    <input type="hidden"  name="idno" value="<%=request.getAttribute("idno2")%>" />
    <table id="gradient-style" align="center" border"1" style="font-size:2pt;" width="600px">
    <tr>
  <td width="40%"><font size="2pt"><b>Description</b></font></td>
  <td width="60%" height="50"><font size = "2pt"><%=request.getAttribute("tktdesc2")%></font></td>
  </tr>
  <tr>
	<td><font size="2pt"><b>Personal Party Id</b></font></td>
	<td><font size="2pt"><%=request.getAttribute("idno2")%></font></td>
</tr> 
   
 
 
  
   <tr>
   <td><font size="2pt"><b>Party Name</b></font></td>
   <td><font size="2pt"><%=pp.getFirstName()+" "+pp.getSurName()%></font></td>
   </tr>
   
   <tr>
   <td><font size="2pt"><b>House Number<font color="red"><sup>*</sup></font></b></font></td>

   <td><font size="2pt"><input type="text" name="houseNo" title="Please enter House number." value="<%=add.getHouseNumber()%>" onfocus="myFunction(this)"/>
    <label style="visibility:hidden; color:red; font-size:12px;" id="label"></label>
   </font></td>


   </tr>
   <tr>
   <td><font size="2pt"><b>House Name</b></font></td>
   <td><font size="2pt"><input type="text" name="houseName"  onfocus="myFunction(this)" value="<%=add.getHouseName()%> " /> </font></td>
   </tr>
   <tr>
   <td><font size="2pt"><b>Building Number<font color="red"><sup>*</sup></font></b></font></td>

   <td><font size="2pt"><input type="text" title="Please enter Building number." name="buildingNumber" value="<%=add.getBuildingNumber()%>" onfocus="myFunction(this)"/> 
   <label style="visibility:hidden; color:red; font-size:12px;" id="label1"></label>
   </font></td>
   </tr>
   
    <tr>
   <td><font size="2pt"><b>Street Name<font color="red"><sup>*</sup></font></b></font></td>
   <td><font size="2pt"><input type="text" name="streetName" onfocus="myFunction(this)" value="<%=add.getStreetName()%>"/>
     
    <label style="visibility:hidden; color:red; font-size:12px;" id="street"></label>
   </font> </td>
   </tr>
   
   
   <tr>
   <td><font size="2pt"><b>City Name<font color="red"><sup>*</sup></font></b></font></td>

   <td><font size="2pt"><input type="text" title="Please enter city name." name="cityName" value="<%=add.getCityName()%>" onfocus="myFunction(this)"/> 
   <label style="visibility:hidden; color:red; font-size:12px;" id="city"></label>
   </font> </td>


   </tr>
   <tr>
   <td><font size="2pt"><b>Town Name</b></font></td>
   <td><font size="2pt"><input type="text" name="townName" onfocus="myFunction(this)" value="<%=add.getTownName()%>"/> 
   <label style="visibility:hidden; color:red; font-size:12px;" id="label5"></label>
   
  </font> </td>
   </tr>
  
   <tr>
   <td><font size="2pt"><b>Postal Code<font color="red"><sup>*</sup></font></b></font></td>
   <td> <font size="2pt"><input type="text" title="Please enter postal code,alphabets should be in capital."   name="postalCode" onfocus="myFunction(this)" value="<%=add.getPostalCode()%>" />
   
      <label style="visibility:hidden; color:red; font-size:12px;" id="label4"></label>
   </font> </td>
   </tr>
 <tr>
		<td><b>Country</b><font color="red"><sup>*</sup></font></td>
		<td><select name="country" style="width: 145px" title="Please select a country.">
			<option value="">Please select</option>
			<option	value="<%=add.getCountry()%>"><%=add.getCountry()%></option>
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
     <div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:200px;">
     <center><input type="submit" style="background-color:black;margin-top:20px; color:white "onclick="return validateFields()" value="Update"/>
     
     &nbsp;&nbsp; <input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input></center>
     
     
     </div>
   </form>

</div>
				 
   	
   	<br/>
   	<br/>
	<!-- Start Footer -->
	
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
