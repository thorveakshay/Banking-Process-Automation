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
<script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</script>
<% 
 
}
%>

<script>

function home(){

	window.location="<%=request.getContextPath()%>/jsp/ASPHome.jsp";

	}


</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Business Customer Details</title>

<title>Show Business Customer Address</title>

<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
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
	return false;
 }
 return true;
}	

function validateAddress()
{
	if(document.getElementsByName("txtBuildingNumber")[0].value==0 || document.getElementsByName("txtBuildingNumber")[0].value=="null")
	{
		  document.getElementById('bulNum').style.visibility="visible";
		  document.getElementById('bulNum').innerHTML="&nbsp;Please enter the Building number.";

		document.getElementsByName("txtBuildingNumber")[0].value="";
		document.getElementsByName("txtBuildingNumber")[0].focus();
		return false;
	}
	else
	{
		  document.getElementById('bulNum').innerHTML="";
	}
	if(!ischarinbag(document.getElementsByName("txtBuildingNumber")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-/"))
	{
		 document.getElementById('bulNum').style.visibility="visible";
		document.getElementById("bulNum").innerHTML="Only alphabets,numbers and - / are allowed."; 
		document.getElementsByName("txtBuildingNumber")[0].focus();
		document.getElementsByName("txtBuildingNumber")[0].value="";
		return false;
	}
	else
	{
		document.getElementById('bulNum').innerHTML="";
	}

	if(ischarinbag(document.getElementsByName("txtBuildingNumber")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"))
	{
		 document.getElementById('bulNum').style.visibility="visible";
		document.getElementById("bulNum").innerHTML="Buliding number cannot contain only alphabets."; 
		document.getElementsByName("txtBuildingNumber")[0].focus();
		document.getElementsByName("txtBuildingNumber")[0].value="";
		return false;
	}
	else
	{
		document.getElementById('bulNum').innerHTML="";
	}
	
	if(document.getElementsByName("txtStreet")[0].value==0 || document.getElementsByName("txtStreet")[0].value=="null")
	 {
		  document.getElementById('street').style.visibility="visible";
		  document.getElementById('street').innerHTML="&nbsp;Please enter the Street name.";
	
		document.getElementsByName("txtStreet")[0].value="";
		document.getElementsByName("txtStreet")[0].focus();
		return false;
	 }
	else
	{
		 document.getElementById('street').innerHTML="";

	}
			
	
	if(!ischarinbag(document.getElementsByName("txtStreet")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- "))
	{
		 document.getElementById('street').style.visibility="visible";
		document.getElementById("street").innerHTML="Buliding number cannot contain only alphabets."; 
		document.getElementsByName("txtStreet")[0].focus();
		document.getElementsByName("txtStreet")[0].value="";
		return false;
	}
	
	else
	{
		 document.getElementById('street').innerHTML="";

	}


	if(ischarinbag(document.getElementsByName("txtStreet")[0].value,"0123456789- "))
	{
		 document.getElementById('street').style.visibility="visible";
		document.getElementById("street").innerHTML="Only numbers are not allowed."; 
		document.getElementsByName("txtStreet")[0].focus();
		document.getElementsByName("txtStreet")[0].value="";
		return false;
	}
	
	else
	{
		 document.getElementById('street').innerHTML="";

	}
	
	if (document.getElementsByName("txtStreet")[0].value.charAt(0)==" ")
	{
	document.getElementById('street').style.visibility="visible";
		document.getElementById("street").innerHTML="Street name should not start with blank space"; 
		document.getElementsByName("txtStreet")[0].focus();
		document.getElementsByName("txtStreet")[0].value="";

		return false;
	}
	else
	{
	document.getElementById('street').innerHTML="";
	}

	
	if(document.getElementsByName("txtCity")[0].value==0 || document.getElementsByName("txtCity")[0].value=="null")
	 {
		  document.getElementById('city').style.visibility="visible";
		  document.getElementById('city').innerHTML="&nbsp;Please enter the City name.";
	
		document.getElementsByName("txtCity")[0].value="";
		document.getElementsByName("txtCity")[0].focus();
		return false;
	 }
	else
	{
		document.getElementById('city').innerHTML="";

	}
	if(!ischarinbag(document.getElementsByName("txtCity")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
	{
		 document.getElementById('city').style.visibility="visible";
		document.getElementById("city").innerHTML="Only alphabets are allowed."; 
		document.getElementsByName("txtCity")[0].focus();
		document.getElementsByName("txtCity")[0].value="";
		return false;
	}
	else
	{
		document.getElementById('city').innerHTML="";

	}

	if (document.getElementsByName("txtCity")[0].value.charAt(0)==" ")
	{
	document.getElementById('city').style.visibility="visible";
		document.getElementById("city").innerHTML="City name should not start with blank space"; 
		document.getElementsByName("txtCity")[0].focus();
		document.getElementsByName("txtCity")[0].value="";

		return false;
	}
	else
	{
	document.getElementById('city').innerHTML="";
	}

	
	if(!ischarinbag(document.getElementsByName("txtTown")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
	{
		 document.getElementById('town').style.visibility="visible";
		document.getElementById("town").innerHTML="Only alphabets are allowed."; 
		document.getElementsByName("txtTown")[0].focus();
		document.getElementsByName("txtTown")[0].value="";
		return false;
	}
	
	else
	{
		document.getElementById('town').innerHTML="";

	}

	if (document.getElementsByName("txtTown")[0].value.charAt(0)==" ")
	{
	document.getElementById('town').style.visibility="visible";
		document.getElementById("town").innerHTML="Town name should not start with blank space"; 
		document.getElementsByName("txtTown")[0].focus();
		document.getElementsByName("txtTown")[0].value="";

		return false;
	}
	else
	{
	document.getElementById('town').innerHTML="";
	}



	
	if(document.getElementsByName("txtPostal")[0].value==0 || document.getElementsByName("txtPostal")[0].value=="null")
	 {
		  document.getElementById('post').style.visibility="visible";
		  document.getElementById('post').innerHTML="&nbsp;Please enter the Postal code.";
	
		document.getElementsByName("txtPostal")[0].value="";
		document.getElementsByName("txtPostal")[0].focus();
		return false;
	 }
	else
	{
		document.getElementById('post').innerHTML="";

	}
	if(!ischarinbag(document.getElementsByName("txtPostal")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "))
	{
		 document.getElementById('post').style.visibility="visible";
		document.getElementById("post").innerHTML="Please enter the Postal code alphabets in upper case."; 
		document.getElementsByName("txtPostal")[0].focus();
		document.getElementsByName("txtPostal")[0].value="";
		return false;
	}
	else
	{
		document.getElementById('post').innerHTML="";

	}
	if(ischarinbag(document.getElementsByName("txtPostal")[0].value,"0123456789"))
	{
		 document.getElementById('post').style.visibility="visible";
		document.getElementById("post").innerHTML="Postal code should be a combination of alphabets and numbers."; 
		document.getElementsByName("txtPostal")[0].focus();
		document.getElementsByName("txtPostal")[0].value="";
		return false;
	}
	else
	{
		document.getElementById('post').innerHTML="";

	}

	if (document.getElementsByName("txtPostal")[0].value.charAt(0)==" ")
	{
	document.getElementById('post').style.visibility="visible";
		document.getElementById("post").innerHTML="Postal code should not start with blank space."; 
		document.getElementsByName("txtPostal")[0].focus();
		document.getElementsByName("txtPostal")[0].value="";

		return false;
	}
	else
	{
	document.getElementById('post').innerHTML="";
	}
	
	if(ischarinbag(document.getElementsByName("txtPostal")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
	{
		 document.getElementById('post').style.visibility="visible";
		document.getElementById("post").innerHTML="Postal code cannot contain only alphabets."; 
		document.getElementsByName("txtPostal")[0].focus();
		document.getElementsByName("txtPostal")[0].value="";
		return false;
	}
	else
	{
		document.getElementById('post').innerHTML="";

	}


	if((document.getElementsByName("txtPostal")[0].value.length)<2)

	{
		 document.getElementById('post').style.visibility="visible";
			document.getElementById("post").innerHTML="Postal code can contain minimum 2 and maximum 10 characters."; 
			document.getElementsByName("txtPostal")[0].focus();
			document.getElementsByName("txtPostal")[0].value="";
			return false;
		}
		else
		{
			  document.getElementById('post').innerHTML="";
		}


	if((document.getElementsByName("txtPostal")[0].value.length)>10)

	{
		 document.getElementById('post').style.visibility="visible";
			document.getElementById("post").innerHTML="Postal code can contain minimum 2 and maximum 10 characters."; 
			document.getElementsByName("txtPostal")[0].focus();
			document.getElementsByName("txtPostal")[0].value="";
			return false;
		}
		else
		{
			  document.getElementById('post').innerHTML="";
		}
		
	
		
	if(document.getElementsByName("txtCountry")[0].value==0 || document.getElementsByName("txtCountry")[0].value=="null")
	 {
		  document.getElementById('country').style.visibility="visible";
		  document.getElementById('country').innerHTML="&nbsp;Please enter the Country name.";
	
		document.getElementsByName("txtCountry")[0].value="";
		document.getElementsByName("txtCountry")[0].focus();
		return false;
	 }
	else
	{
		document.getElementById('country').innerHTML="";

	}
	if(!ischarinbag(document.getElementsByName("txtCountry")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
	{
		 document.getElementById('country').style.visibility="visible";
		document.getElementById("country").innerHTML="Only alphabets are allowed."; 
		document.getElementsByName("txtCountry")[0].focus();
		document.getElementsByName("txtCountry")[0].value="";
		return false;
	}
	else
	{
		document.getElementById('country').innerHTML="";

	}


	if (document.getElementsByName("txtCountry")[0].value.charAt(0)==" ")
	{
	document.getElementById('country').style.visibility="visible";
		document.getElementById("country").innerHTML="Country name should not start with blank space"; 
		document.getElementsByName("txtCountry")[0].focus();
		document.getElementsByName("txtCountry")[0].value="";

		return false;
	}
	else
	{
	document.getElementById('country').innerHTML="";
	}


	var op= confirm("Are you sure you want to proceed ?");
	if(op==true)
	{
		alert("Business Customer details updated successfully");
		return true;
	}
	else
		return false;
}
</script>
</head>
<%@page import="com.training.model.NonPersonalCustomer"%>
<%@page import="com.training.model.Address"%>
<%
	NonPersonalCustomer npc = (NonPersonalCustomer) request
			.getAttribute("businessCustomer");
	Address add = (Address) request.getAttribute("address");
%>
<body>
	<!-- Start Header -->
	
	 
<!-- Start Main Content -->



<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn" style="width: 240px">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
			<li id="lft"><a  href="/NexusBankingGroup/GetCustServlet?action=getBranchList0" title="Change Account Title">Change Account Title</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">Close Account</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">Switch to New Product</a></li>
			<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList4" title="Update Business Customer Address">Update Business Customer Address</a></li>
			 		<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Contact">Update Business Customer Contact</a></li>
			 		<li id="lft"><a href="/NexusBankingGroup/jsp/AccountPartyManagementHome.jsp" title="Account Party Management">Account Party Management</a></li>
		
			</ul>
			
			<hr />
		</div>
		
		<!-- main content area -->
<div class="maincontent" >
				 <form name="f1" action="/NexusBankingGroup/RelationshipManagerServlet" method="post">
<h3><font color="black" size="5pt"><center>Non Personal Party Details</center></font></h3><br/>
<input type="hidden" name="action" value="updateAddress" />
<input type="hidden" name="txtId" value="<%=npc.getBusinessId()%>" />
<input type="hidden" name="addressType" value="<%=request.getAttribute("addressType")%>"/>
  <hr/>
<table id="gradient-style" align="center" style="margin-left: 100px; font-size:2pt;" width="550px">

<tr>
		<td><b>Business Customer Id</b></td>
		<td><%=npc.getBusinessId()%></td>
	</tr>
	<tr>
		<td><b>Business Name</b></td>
		<td><%=npc.getBusinessName()%></td>
	</tr>

	<tr>
		<td><b>Branch</b></td>
		<td><%=npc.getBankBranch()%></td>
	</tr>
	<tr>
	<td><b>Trading Name</b></td>
	<td><%=npc.getTradingName()%></td>
	</tr>
	<tr>
	<td><b>Building Number<font color="red"><sup>*</sup></font></b></td>
	<td><input type="text" name="txtBuildingNumber" title="Please enter the Building number."  onfocus="myFunction(this)"  value="<%=add.getBuildingNumber()%>"/>
	<label style="visibility:hidden; color:red; font-size:12px;" id="bulNum"></label>
   
	</td>
	</tr>
	<tr>
	<td><b>Building Name</b></td>
	<td><input type="text" name="txtBuildingName"  onfocus="myFunction(this)" value="<%=add.getBuildingName() %>"/></td>
	</tr>
	<tr>
	<td> <b>Street Name<font color="red"><sup>*</sup></font></b></td>
	<td><input type="text" name="txtStreet"  onfocus="myFunction(this)" title="Please enter the street name."  value="<%=add.getStreetName() %>"/>
	<label style="visibility:hidden; color:red; font-size:12px;" id="street"></label>
   
	</td>
	</tr>
	
	<tr>
	<td><b>City Name<font color="red"><sup>*</sup></font></b></td>
	<td><input type="text" name="txtCity"  onfocus="myFunction(this)" title="Please enter city name."  value="<%=add.getCityName()%>"/>
	<label style="visibility:hidden; color:red; font-size:12px;" id="city"></label>
	</td>
	</tr>
	<tr>
	<td><b>Town Name</b></td>
	<td><input type="text" name="txtTown"  onfocus="myFunction(this)"  value="<%=add.getTownName()%>"/>
	<label style="visibility:hidden; color:red; font-size:12px;" id="town"></label>
	</td>
	</tr>
	<tr>
	<td><b>Postal Code<font color="red"><sup>*</sup></font></b></td>
	<td><input type="text" name="txtPostal" title="Please enter Postal code,alphabets should be in uppercase."  onfocus="myFunction(this)" value="<%=add.getPostalCode()%>"/>
	<label style="visibility:hidden; color:red; font-size:12px;" id="post"></label>
	</td>
	</tr>
	<tr>
	<td><b>Country<font color="red"><sup>*</sup></font></b></td>
	<td><input type="text" name="txtCountry"  onfocus="myFunction(this)" value="<%=add.getCountry()%>"/>
	<label style="visibility:hidden; color:red; font-size:12px;" id="country"></label>
	</td>
	</tr>
	
<tr></tr>
</table>
<table  style="margin-left:450px">
<tr>
<td>
<input type="submit"  style="background-color:black;margin-top:20px;  color:white" onclick="return validateAddress()" value="Update"/>
</td>
<td > 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>
</td>

</tr>
</table>

	<!--<div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:350px;">  
		 	<a href="/NexusBankingGroup/ChangeCustomerContactController" >Proceed</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="#" >Cancel</a>
		</div>
-->

</form>	
</div>	 
</div>



 			<hr />
		
	
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
