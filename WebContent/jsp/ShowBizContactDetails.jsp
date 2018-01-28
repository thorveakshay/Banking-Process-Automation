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
<script >

function home(){

	window.location="<%=request.getContextPath()%>/jsp/ASPHome.jsp";

	}
function confirmation()
{
	return confirm("Are you sure you want to proceed");
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

function validateContact()
{

	if(document.getElementsByName("txtCountryCode")[0].value==0 || document.getElementsByName("txtCountryCode")[0].value=="null")
	{
		  document.getElementById('count').style.visibility="visible";
		  document.getElementById('count').innerHTML="&nbsp;Please enter the Country Code.";

		document.getElementsByName("txtCountryCode")[0].value="";
		document.getElementsByName("txtCountryCode")[0].focus();
		return false;
	}
	else
	{
		  document.getElementById('count').innerHTML="";
	}
	if(!ischarinbag(document.getElementsByName("txtCountryCode")[0].value,"0123456789"))
	{
		document.getElementById('count').style.visibility="visible";
		document.getElementById("count").innerHTML="Please enter only numbers."; 
		document.getElementsByName("txtCountryCode")[0].focus();
		document.getElementsByName("txtCountryCode")[0].value="";
		return false;
	}
	else
	{
		  document.getElementById('count').innerHTML="";
	}


	
	 if(document.getElementsByName("txtCountryCode")[0].value.length<2)
		{
			 document.getElementById('count').style.visibility="visible";
				document.getElementById("count").innerHTML="Country code can contain minimum 2 and maximum 3 digits."; 
				document.getElementsByName("txtCountryCode")[0].focus();
				document.getElementsByName("txtCountryCode")[0].value="";

				return false;
		}
		 else
		 {
			 document.getElementById('count').innerHTML="";
		 }


		
	 if(document.getElementsByName("txtCountryCode")[0].value.length>3)
	{
		 document.getElementById('count').style.visibility="visible";
			document.getElementById("count").innerHTML="Country code can contain minimum 2 and maximum 3 digits."; 
			document.getElementsByName("txtCountryCode")[0].focus();
			document.getElementsByName("txtCountryCode")[0].value="";

			return false;
	}
	 else
	 {
		 document.getElementById('count').innerHTML="";
	 }




	 if(document.getElementsByName("txtAreaCode")[0].value==0 || document.getElementsByName("txtCountryCode")[0].value=="null")
		{
			  document.getElementById('area').style.visibility="visible";
			  document.getElementById('area').innerHTML="&nbsp;Please enter the Area Code.";

			document.getElementsByName("txtAreaCode")[0].value="";
			document.getElementsByName("txtAreaCode")[0].focus();
			return false;
		}
		else
		{
			  document.getElementById('area').innerHTML="";
		}
		if(!ischarinbag(document.getElementsByName("txtAreaCode")[0].value,"0123456789"))
		{
			document.getElementById('area').style.visibility="visible";
			document.getElementById("area").innerHTML="Please enter only numbers."; 
			document.getElementsByName("txtAreaCode")[0].focus();
			document.getElementsByName("txtAreaCode")[0].value="";
			return false;
		}
		else
		{
			  document.getElementById('area').innerHTML="";
		}


		 if(document.getElementsByName("txtAreaCode")[0].value.length<2)
			{
				 document.getElementById('area').style.visibility="visible";
					document.getElementById("area").innerHTML="Area code can contain minimum 2 and maximum 6 digits."; 
					document.getElementsByName("txtAreaCode")[0].focus();
					document.getElementsByName("txtAreaCode")[0].value="";
					return false;
			}
			 else
			 {
				 document.getElementById('area').innerHTML="";
			 }
			 

		
		 if(document.getElementsByName("txtAreaCode")[0].value.length>6)
		{
			 document.getElementById('area').style.visibility="visible";
				document.getElementById("area").innerHTML="Area code can contain minimum 2 and maximum 6 digits."; 
				document.getElementsByName("txtAreaCode")[0].focus();
				document.getElementsByName("txtAreaCode")[0].value="";
				return false;
		}
		 else
		 {
			 document.getElementById('area').innerHTML="";
		 }
		 



		 if(document.getElementsByName("txtContact")[0].value==0 || document.getElementsByName("txtContact")[0].value=="null")
			{
				  document.getElementById('con').style.visibility="visible";
				  document.getElementById('con').innerHTML="&nbsp;Please enter the Contact Number.";

				document.getElementsByName("txtContact")[0].value="";
				document.getElementsByName("txtContact")[0].focus();
				return false;
			}
			else
			{
				  document.getElementById('con').innerHTML="";
			}
			if(!ischarinbag(document.getElementsByName("txtContact")[0].value,"0123456789"))
			{
				document.getElementById('con').style.visibility="visible";
				document.getElementById("con").innerHTML="Please enter only numbers."; 
				document.getElementsByName("txtContact")[0].focus();
				document.getElementsByName("txtContact")[0].value="";
				return false;
			}
			else
			{
				  document.getElementById('con').innerHTML="";
			}
			 if(document.getElementsByName("txtContact")[0].value.length<6 || document.getElementsByName("txtContact")[0].value.length>10)
			{
				 document.getElementById('con').style.visibility="visible";
					document.getElementById("con").innerHTML="Contact Number should be of minimum 6 or maximum 10 digits."; 
					document.getElementsByName("txtContact")[0].focus();
					document.getElementsByName("txtContact")[0].value="";
					return false;
			}
			 else
			 {
				 document.getElementById('con').innerHTML="";
			 }
			 
			 var op= confirm("Are you sure you want to proceed ?");
				if(op==true)
				{
					alert("Business Contact details updated successfully");
					return true;
				}
				else
					return false;
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Show Business Customer Contact</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script>
function myFunction(x)
{
	x.style.background="lightgreen";
}




</script>
</head>
<%@page import="com.training.model.NonPersonalCustomer"%>
<%@page import="com.training.model.Contact"%>
<%
	NonPersonalCustomer npc = (NonPersonalCustomer) request
			.getAttribute("businessCustomer");
	Contact contact = (Contact) request.getAttribute("contact");
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
<center><font color="black" size="5pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Update Business Contact Details</font></center><br/>
<input type="hidden" name="action" value="updateContact" />
<input type="hidden" name="txtId" value="<%=npc.getBusinessId()%>"/>
<input type="hidden" name="contactType" value="<%=request.getAttribute("contactType")%>"/>
  <hr/>
<table id="gradient-style" align="center" style="margin-left: 300px; font-size:2pt;" width="550px">
<tr>
		<td width="30%"><b>Business Customer Id</b></td>
		<td><%=npc.getBusinessId()%></td>
	</tr>
	<tr>
		<td><b>Business Name</b></td>
		<td><%=npc.getBusinessName()%></td>
	</tr>

	<tr>
		<td><b>Branch</b></td>
		<td> <%=npc.getBankBranch()%> </input></td>
	</tr>
	<tr>
	<td><b>Trading Name</b></td>
	<td> <%=npc.getTradingName()%></td>
	</tr>
	<tr>
	<td><b>Country Code<font color="red"><sup>*</sup></font></b></td>
	<td><input type="text" name="txtCountryCode" title="Please enter the Country code,use alphabets in uppercase."  onfocus="myFunction(this)" value="<%=contact.getCountryCode()%>"/>
	<label style="visibility:hidden; color:red; font-size:12px;" id="count"></label>
	
	</td>
	</tr>
	<tr>
	<td><b>Area Code<font color="red"><sup>*</sup></font></b></td>
	<td><input type="text" name="txtAreaCode" title="Please enter areacode with minimum 2 and maximum 6 digits."  onfocus="myFunction(this)" value="<%=contact.getAreaCode()%>"/>
	<label style="visibility:hidden; color:red; font-size:12px;" id="area"></label>
	</td>
	</tr>
	<tr>
	<td> <b>Contact Number<font color="red"><sup>*</sup></font></b></td>
	<td><input type="text" name="txtContact" value="<%=contact.getContactNumber()%>" title="Please enter contact number with minimum 6 and maximum 10 digits." onfocus="myFunction(this)" />
	
	<label style="visibility:hidden; color:red; font-size:12px;" id="con"></label>
	</td>
	</tr>
	<tr>
	
</tr>
</table>
<table style="margin-left:480px">
<tr>
<td colspan="2" style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:350px;">
<input type="submit" style="background-color:black;margin-top:20px; color:white" value="Update" onclick="return validateContact()"/>
<input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>
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
