<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Account Party</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />	
<%@page import="com.training.model.*"%>

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
	AccountParty ap = new AccountParty();
	ap = (AccountParty) request.getAttribute("ap");
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
<script type="text/javascript">
function cancelAction()
{
	document.location.href("<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=cancelUpdate"); 
	
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


function validateUpdate()
{



	
	if(document.getElementsByName("hno")[0].value==0)
	{
		document.getElementById('houseNum').style.visibility="visible";
		document.getElementById("houseNum").innerHTML="Please enter the House number"; 
		document.getElementsByName("hno")[0].focus();
		document.getElementsByName("hno")[0].value="";
		return false
	}
	else
	{
		document.getElementById("houseNum").innerHTML="";
	} 
	if(!ischarinbag(document.getElementsByName("hno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- /"))
	{
		document.getElementById('houseNum').style.visibility="visible";
		document.getElementById("houseNum").innerHTML="Please enter only alphabets,numbers, - / and space."; 
		document.getElementsByName("hno")[0].focus();
		document.getElementsByName("hno")[0].value="";
		return false;
	}
	else
	{
		document.getElementById("houseNum").innerHTML=""; 
	}
	
	if(ischarinbag(document.getElementsByName("hno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.- /"))
	{
		document.getElementById('houseNum').style.visibility="visible";
		document.getElementById("houseNum").innerHTML="&nbsp;House number cannot contain only alphabets."; 
		document.getElementsByName("hno")[0].focus();
		document.getElementsByName("hno")[0].value="";
		return false;
	}
	else
	{
		document.getElementById("houseNum").innerHTML=""; 
	}
	


	
	if(document.getElementsByName("bno")[0].value==0)
	{
		document.getElementById('buliNum').style.visibility="visible";
		document.getElementById("buliNum").innerHTML="Please enter the Building number"; 
		document.getElementsByName("bno")[0].focus();
		document.getElementsByName("bno")[0].value="";
		return false
	}
	else
	{
		document.getElementById("buliNum").innerHTML="";
	}
	 
	if(!ischarinbag(document.getElementsByName("bno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- /"))
	{
		document.getElementById('buliNum').style.visibility="visible";
		document.getElementById("buliNum").innerHTML="Only alphabets,numbers, - / and space are allowed."; 
		document.getElementsByName("bno")[0].focus();
		document.getElementsByName("bno")[0].value="";
		return false;
	}

	else
	{
		document.getElementById("buliNum").innerHTML="";
	} 

	if(ischarinbag(document.getElementsByName("bno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.- /"))
	{
		document.getElementById('buliNum').style.visibility="visible";
		document.getElementById("buliNum").innerHTML="&nbsp;Building number cannot contain only alphabets."; 
		document.getElementsByName("bno")[0].focus();
		document.getElementsByName("bno")[0].value="";
		return false;
	}

	else
	{
		document.getElementById("buliNum").innerHTML="";
	} 
	
	if(document.getElementsByName("sname")[0].value==0)
	{
		document.getElementById('street').style.visibility="visible";
		document.getElementById("street").innerHTML="Please enter the Street Name"; 
		document.getElementsByName("sname")[0].focus();
		document.getElementsByName("sname")[0].value="";
		return false
	}
	else
	{
		document.getElementById("street").innerHTML="";
	} 
	if(!ischarinbag(document.getElementsByName("sname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- /"))
	{
		document.getElementById('street').style.visibility="visible";
		document.getElementById("street").innerHTML="Only alphabets,numbers, - / and space are allowed."; 
		document.getElementsByName("sname")[0].focus();
		document.getElementsByName("sname")[0].value="";
		return false;
	}
	else
	{
		document.getElementById("street").innerHTML="";
	} 

	if(ischarinbag(document.getElementsByName("sname")[0].value,"0123456789.- /"))
	{
		document.getElementById('street').style.visibility="visible";
		document.getElementById("street").innerHTML="Street name cannot contain only numbers."; 
		document.getElementsByName("sname")[0].focus();
		document.getElementsByName("sname")[0].value="";
		return false;
	}
	else
	{
		document.getElementById("street").innerHTML="";
	} 

	
	if(document.getElementsByName("cname")[0].value==0)
	{
		document.getElementById('city').style.visibility="visible";
		document.getElementById("city").innerHTML="Please enter the City Name"; 
		document.getElementsByName("cname")[0].focus();
		document.getElementsByName("cname")[0].value="";
		return false
	}
	else
	{
		document.getElementById("city").innerHTML="";
	}
	 
	if(!ischarinbag(document.getElementsByName("cname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"))
	{
		document.getElementById('city').style.visibility="visible";
		document.getElementById("city").innerHTML="City name can contain only alphabets"; 
		document.getElementsByName("cname")[0].focus();
		document.getElementsByName("cname")[0].value="";
		return false;
	}
	else
	{
		document.getElementById("city").innerHTML="";
	} 
	if(document.getElementsByName("pcode")[0].value==0)
	{
		document.getElementById('post').style.visibility="visible";
		document.getElementById("post").innerHTML="Please enter the Postal Code."; 
		document.getElementsByName("pcode")[0].focus();
		document.getElementsByName("pcode")[0].value="";
		return false
	}
	else
	{
		document.getElementById("post").innerHTML="Please enter the City Name"; 
	}
	if(!ischarinbag(document.getElementsByName("pcode")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "))
	{
		document.getElementById('post').style.visibility="visible";
		document.getElementById("post").innerHTML="Only alphabets(in capital),numbers and spaces are allowed."; 
		document.getElementsByName("pcode")[0].focus();
		document.getElementsByName("pcode")[0].value="";
		return false;
	}
	else
	{
		
		document.getElementById("post").innerHTML="";
	} 

	if(ischarinbag(document.getElementsByName("pcode")[0].value,"ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
	{
		document.getElementById('post').style.visibility="visible";
		document.getElementById("post").innerHTML="Postal code cannot contain only alphabets."; 
		document.getElementsByName("pcode")[0].focus();
		document.getElementsByName("pcode")[0].value="";
		return false;
	}
	else
	{
		
		document.getElementById("post").innerHTML="";
	} 
	if((document.getElementsByName("pcode")[0].value.length)<2)
	{
		document.getElementById('post').style.visibility="visible";
		document.getElementById("post").innerHTML="Postal code can contain minimum 2 and maximum 10 characters."; 
		document.getElementsByName("pcode")[0].focus();
		document.getElementsByName("pcode")[0].value="";
		return false;
	}
	else
	{
		
		document.getElementById("post").innerHTML="";
	} 


	if((document.getElementsByName("pcode")[0].value.length)>10)
	{
		document.getElementById('post').style.visibility="visible";
		document.getElementById("post").innerHTML="Postal code can contain minimum 2 and maximum 10 characters."; 
		document.getElementsByName("pcode")[0].focus();
		document.getElementsByName("pcode")[0].value="";
		return false;
	}
	else
	{
		
		document.getElementById("post").innerHTML="";
	} 
	
	return true;
	
}

</script>
</head>
<body>

<jsp:include page="../jsp/layout/Header.jsp" />
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Account Party</h3>
<ul class="leftbox borderedlist">
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=addAccountParty">Add
	Account Party</a></li>
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=viewAccountParty">View
	Account Party</a></li>

</ul>

</div>
<!-- main content area -->
<p align="center" ><font size="5pt" color=black>Update Account Party Details</font></p>
<div id="center" style="margin-left: 20px;">
<div class="article_wrapper">

<br/>
<form
	action="<%=request.getContextPath() %>/AccountPartyManagementMainServlet"
	method="post"><input type="hidden" name="action"
	value="updateAccountParty1"></input>
<table id="gradient-style" align="center" style="font-size:2pt;" width="600px";>
<tr>
			<td colspan="2"><font color="blue" size="2pt">Fields marked with
			<font color="red"><sup>*</sup> </font> are mandatory.</font></td>
		</tr>
	<tr>
		<td><b>Name</b></td>
		<%
				    String fullname;
				    if(ap.getMname()==null)
				    	{
				    	fullname=ap.getTitle()+" "+ap.getFname()+" "+ap.getLname();
				    		}
				    else
				    {
				    	fullname=ap.getTitle()+" "+ap.getFname()+" "+ap.getMname()+" "+ap.getLname();
				    }
				    	%>
		<td><%=fullname %></td>
	</tr>
	<tr>
		<td><b>Date of Birth</b></td>
		<td><%=ap.getDob() %></td>
	</tr>
	<tr>
		<td><b>Relationship with Business Customer</b><font color="red"><sup>*</sup></font></td>
		<td><select name="relationship" id="relationship">
			<option value="Director"
				<%if(ap.getRelationship().equalsIgnoreCase("Director"))
				      {  	  %>
				selected="selected" <%} %>>Director</option>
			<option value="Trustee"
				<%if(ap.getRelationship().equalsIgnoreCase("Trustee"))
				      {  	  %>
				selected="selected" <%} %>>Trustee</option>
			<option value="Owner"
				<%if(ap.getRelationship().equalsIgnoreCase("Owner"))
				      {  	  %>
				selected="selected" <%} %>>Owner</option>
			<option value="Partner"
				<%if(ap.getRelationship().equalsIgnoreCase("Partner"))
				      {  	  %>
				selected="selected" <%} %>>Partner</option>
		</select><label style="visibility:hidden; color:red; font-size:12px;" id="selectRel"></label></td>
	</tr>

	<tr>
		<td><b>Is a key Party ?</b></td>
		<td><label> <input type="radio" name="keyParty"
			value="yes" id="keyPartyYes"
			<%if(ap.getIsKeyParty().equalsIgnoreCase("yes"))
				        	{
				        	%>
			checked="checked" <%} %> /> Yes</label> <br />
		<label> <input type="radio" name="keyParty" value="no"
			id="keyPartyNo"
			<%if(ap.getIsKeyParty().equalsIgnoreCase("no"))
				        	{
				        	%>
			checked="checked" <%} %> /> No</label> <br />


<label style="visibility:hidden; color:red; font-size:12px;" id="KeyPartyCheck"></label>
		</td>
	</tr>

	<tr>
		<td><b><span style="color: gray">Current Address Details :</span></b><br></br>
		<b>House Number</b><font color="red"><sup>*</sup></font></td>
		<td><br></br>
		<input name="hno" type="text" id="hno"
			value="<%=ap.getCurrentAddress().getHouseNo() %>" />
			<label style="visibility:hidden; color:red; font-size:12px;" id="houseNum"></label>
			</td>
	</tr>
	<tr>
		<td><b>House Name</b></td>
		<td><input name="hname" type="text" id="hname"
			value="<%=ap.getCurrentAddress().getHouseName() %>" /></td>
	</tr>
	<tr>
		<td><b>Building Number</b><font color="red"><sup>*</sup></font></td>
		<td><input name="bno" type="text" id="bno"
			value="<%=ap.getCurrentAddress().getBuildingNo() %>" />
			<label style="visibility:hidden; color:red; font-size:12px;" id="buliNum"></label>
			</td>
	</tr>

	<tr>
		<td><b>Street Name</b><font color="red"><sup>*</sup></font></td>
		<td><input name="sname" type="text" id="sname"
			value="<%=ap.getCurrentAddress().getStreetName() %>" />
			<label style="visibility:hidden; color:red; font-size:12px;" id="street"></label>
			</td>
	</tr>
	<tr>
		<td><b>City Name</b><font color="red"><sup>*</sup></font></td>
		<td><input name="cname" type="text" id="cname"
			value="<%=ap.getCurrentAddress().getCityName() %>" />
			<label style="visibility:hidden; color:red; font-size:12px;" id="city"></label>
			</td>
	</tr>
	<tr>
		<td><b>Town Name</b></td>
		<td><input name="tname" type="text" id="tname"
			value="<%=ap.getCurrentAddress().getTownName() %>" /></td>
	</tr>
	<tr>
		<td><b>Country</b></td>
		<td><select name="country" style="width: 145px">
			<option value="Australia"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Australia"))
				      {  	  %>
				selected="selected" <%} %>>Australia</option>
			<option value="Brazil"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Brazil"))
				      {  	  %>
				selected="selected" <%} %>>Brazil</option>
			<option value="Canada"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Canada"))
				      {  	  %>
				selected="selected" <%} %>>Canada</option>
			<option value="China"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("China"))
				      {  	  %>
				selected="selected" <%} %>>China</option>
			<option value="India"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("India"))
				      {  	  %>
				selected="selected" <%} %>>India</option>
			<option value="Japan"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Japan"))
				      {  	  %>
				selected="selected" <%} %>>Japan</option>
			<option value="Kenya"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Kenya"))
				      {  	  %>
				selected="selected" <%} %>>Kenya</option>
			<option value="New Zealand"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("New Zealand"))
				      {  	  %>
				selected="selected" <%} %>>New Zealand</option>
			<option value="Pakistan"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Pakistan"))
				      {  	  %>
				selected="selected" <%} %>>Pakistan</option>
			<option value="South Africa"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("South Africa"))
				      {  	  %>
				selected="selected" <%} %>>South Africa</option>
			<option value="United Kingdom"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("United Kingdom"))
				      {  	  %>
				selected="selected" <%} %>>United Kingdom</option>
			<option value="Zimbabwe"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Zimbabwe"))
				      {  	  %>
				selected="selected" <%} %>>Zimbabwe</option>
			<option value="Other"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Other"))
				      {  	  %>
				selected="selected" <%} %>>Other</option>

		</select></td>
	</tr>
	<tr>
		<td><b>Postal Code</b><font color="red"><sup>*</sup></font></td>
		<td><input name="pcode" type="text" id="pcode"
			value="<%=ap.getCurrentAddress().getPostalCode() %>" />
			<label style="visibility:hidden; color:red; font-size:12px;" id="post"></label>
			</td>
	</tr>
	</table>
	<br>
<table align="right" style="margin-left: 170px;">
	<tr>
		<td align="right"><input type="submit" name="button"
			style="background-color:black;  color:white" id="button"
		onclick="return validateUpdate()"	
			value="Save and Continue" /></td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="cancelbutton"
			style="background-color:black;  color:white" id="button2"
			value="Cancel" onclick="cancelAction()" /></td>
	</tr>
</table>
</form>

</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->

<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
