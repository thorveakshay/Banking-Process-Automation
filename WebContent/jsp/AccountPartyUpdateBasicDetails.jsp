<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("username")==null){
     response.sendRedirect(request.getContextPath());
     return;
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
td{
	font-size:12px;
	padding:5px;
	}
	th{
	color: #8c8685;
	font-size:12px;
	background: #f1f0ef;

	}
	table{
	margin-top:20px;
	}
	
	
</style>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Nexus Banking Group</title>
<link href="<%=request.getContextPath()%>/css/common.css"
	rel="stylesheet" type="text/css" />
<%@page import="com.training.model.*"%>

<%
	AccountParty ap = new AccountParty();
	ap = (AccountParty) request.getAttribute("ap");
%>

<script type="text/javascript">
function confirmLoad()
{
	return confirm("All the details of the form will be lost. Are you sure you want to navigate away from the page?");
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


	 if(document.getElementsByName("hno")[0].value==0 || document.getElementsByName("hno")[0].value=="null")
	 {
		  document.getElementById('label').style.visibility="visible";
		  document.getElementById('label').innerHTML="&nbsp;Please enter the House Number.";
	
		document.getElementsByName("hno")[0].value="";
		document.getElementsByName("hno")[0].focus();
		return false;
	 }
	 else
	 {
		 document.getElementById('label').innerHTML="";
	 }
	 if (document.getElementsByName("hno")[0].value.charAt(0)==" ")
	 	{
		 document.getElementById('label').style.visibility="visible";
	 		document.getElementById("hNo").innerHTML=" should not start with blank space"; 
	 		document.getElementsByName("hno")[0].focus();
	 		document.getElementsByName("hno")[0].value="";
	 		return false;
	 	}

var val=ischarinbag(document.getElementsByName("hno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- /");

if(val==0)
{
		document.getElementById('label').style.visibility="visible";
		document.getElementById("label").innerHTML="Only alphanumeric data & some special characters like  -  _  / are allowed"; 
		document.getElementsByName("hno")[0].focus();
		document.getElementsByName("hno")[0].value="";
return false;
		}
else
{
	 document.getElementById('label').innerHTML="";
}

if(document.getElementsByName("bno")[0].value==0 || document.getElementsByName("bno")[0].value=="null")
{
	  document.getElementById('label1').style.visibility="visible";
	  document.getElementById('label1').innerHTML="&nbsp;Please enter the Building Number.";

	document.getElementsByName("bno")[0].value="";
	document.getElementsByName("bno")[0].focus();
	return false;
}

else
{
	document.getElementById('label1').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("bno")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- "))
{
	 document.getElementById('label1').style.visibility="visible";
	document.getElementById("label1").innerHTML="Only alphanumeric data & some special characters like  - and space are allowed"; 
	document.getElementsByName("bno")[0].focus();
	document.getElementsByName("bno")[0].value="";
	return false;
}

else
{
	document.getElementById('label1').innerHTML="";
}

if(document.getElementsByName("sname")[0].value==0 || document.getElementsByName("sname")[0].value=="null")
{
	  document.getElementById('street').style.visibility="visible";
	  document.getElementById('street').innerHTML="&nbsp;Please enter the Street name.";

	document.getElementsByName("sname")[0].value="";
	document.getElementsByName("sname")[0].focus();
	return false;
}
else
{
	document.getElementById('street').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("sname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- "))
{
	 document.getElementById('street').style.visibility="visible";
	document.getElementById("street").innerHTML="Only alphanumeric data & some special characters like  - and space are allowed"; 
	document.getElementsByName("sname")[0].focus();
	document.getElementsByName("sname")[0].value="";
	return false;
}
else
{
	document.getElementById('street').innerHTML="";
}

if(document.getElementsByName("cname")[0].value==0 || document.getElementsByName("cname")[0].value=="null")
{
	  document.getElementById('city').style.visibility="visible";
	  document.getElementById('city').innerHTML="&nbsp;Please enter the City name.";

	document.getElementsByName("cname")[0].value="";
	document.getElementsByName("cname")[0].focus();
	return false;
}
else
{
	document.getElementById('city').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("cname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('city').style.visibility="visible";
	document.getElementById("city").innerHTML="Only alphabets are allowed."; 
	document.getElementsByName("cname")[0].focus();
	document.getElementsByName("cname")[0].value="";
	return false;
}

else
{
	document.getElementById("city").innerHTML=""; 
}

if(!ischarinbag(document.getElementsByName("tname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "))
{
	 document.getElementById('label5').style.visibility="visible";
	document.getElementById("label5").innerHTML="Only alphabets and space is allowed."; 
	document.getElementsByName("tname")[0].focus();
	document.getElementsByName("tname")[0].value="";
	return false;
}
else
{
	document.getElementById("label5").innerHTML=""; 
}

if(document.getElementsByName("pcode")[0].value==0 || document.getElementsByName("pcode")[0].value=="null")
{
	  document.getElementById('label4').style.visibility="visible";
	  document.getElementById('label4').innerHTML="&nbsp;Please enter the Postalcode.";

	document.getElementsByName("pcode")[0].value="";
	document.getElementsByName("pcode")[0].focus();
	return false;
}

else
{
	document.getElementById('label4').innerHTML="";
}

if(!ischarinbag(document.getElementsByName("pcode")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_/- "))
{
	 document.getElementById('label4').style.visibility="visible";
	document.getElementById("label4").innerHTML="Only alphanumeric values and some special symbols like _ / - and space are allowed."; 
	document.getElementsByName("pcode")[0].focus();
	document.getElementsByName("pcode")[0].value="";
	return false;
}
else
{
	document.getElementById("label4").innerHTML="";	
}



return true;
}


</script>
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Account Party</h3>
<ul class="leftbox borderedlist">
	<li><a href="<%=request.getContextPath() %>/jsp/AccountOpenerHome.jsp" title="Home" onclick="return confirmLoad()">Home</a></li>
		<li><a href="<%=request.getContextPath() %>/jsp/SearchBusinessCustomer.jsp" title="Search"  onclick="return confirmLoad()">Search Business Customer</a></li>
	<li><a
		href="../../NexusBankingGroup/AccountPartyManagementServlet?action=addAccountParty&&id=<%=session.getAttribute("npid") %>"  onclick="return confirmLoad()">Add
	Account Party</a></li>
	<li><a
		href="../../NexusBankingGroup/AccountPartyManagementServlet?action=viewAccountParty&&id=<%=session.getAttribute("npid") %>"  onclick="return confirmLoad()">View
	Account Party</a></li>

</ul>

</div>
<!-- main content area -->
<div id="center" style="margin-left: 0px;">
<div class="article_wrapper">
<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px">UPDATE ACCOUNT PARTY DETAILS</p><br/>
				 	</div> 

<form
	action="<%=request.getContextPath() %>/AccountPartyManagementServlet"
	method="post"><input type="hidden" name="action"
	value="updateAccountParty1"></input>
<table width="700px" border="0">
<tr><td colspan="2"><font color="red">Fields marked with * are mandatory</font></td></tr>
	<tr>
		<td width="30%">Name</td>
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
		<td width="30%"><%=fullname %></td>
	</tr>
	<tr>
		<td>Date of Birth</td>
		<td><%=ap.getDob() %></td>
	</tr>
	<tr>
		<td>Relationship with Business</td>
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
		</select></td>
	</tr>

	<tr>
		<td>Is a key Party ?</td>
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

		</td>
	</tr>

	<tr>
		<td><span style="color: gray">Current Address Details :</span><br></br>
		House No<font color="red">*</font></td>
		<td><br></br>
		<input name="hno" type="text" id="hno"
			value="<%=ap.getCurrentAddress().getHouseNo() %>" /></td><td width="40%"><br/><label style="visibility:hidden; color:red; font-size:12px;" name="label" id="label"></label>
		</td>
	</tr>
	<tr>
		<td>House Name</td>
		<td><input name="hname" type="text" id="hname"
			<%if(ap.getCurrentAddress().getHouseName()!=null){ %>value="<%=ap.getCurrentAddress().getHouseName() %>" <%} %>/></td>
	</tr>
	<tr>
		<td>Building No<font color="red">*</font></td>
		<td><input name="bno" type="text" id="bno"
			value="<%=ap.getCurrentAddress().getBuildingNo() %>" /></td>
	<td><label style="visibility:hidden; color:red; font-size:12px;" name="label1" id="label1"></label>
		</td></tr>

	<tr>
		<td>Street Name<font color="red">*</font></td>
		<td><input name="sname" type="text" id="sname"
			value="<%=ap.getCurrentAddress().getStreetName() %>" /></td>
	<td><label style="visibility:hidden; color:red; font-size:12px;" name="street" id="street"></label>
		</td></tr>
	<tr>
		<td>City Name<font color="red">*</font></td>
		<td><input name="cname" type="text" id="cname"
			value="<%=ap.getCurrentAddress().getCityName() %>" /></td>
	<td><label style="visibility:hidden; color:red; font-size:12px;" name="city" id="city"></label>
		</td></tr>
	<tr>
		<td>Town Name</td>
		<td><input name="tname" type="text" id="tname"
			<%if(ap.getCurrentAddress().getTownName()!=null){ %>value="<%=ap.getCurrentAddress().getTownName() %>"<%} %> /></td>
	<td><label style="visibility:hidden; color:red; font-size:12px;" name="label5" id="label5"></label>
		</td></tr>
	<tr>
		<td>Country<font color="red">*</font></td>
		<td><select name="country" style="width: 145px">
			<option value="United Kingdom"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("United Kingdom"))
				      {  	  %>
				selected="selected" <%} %>>United Kingdom</option>
		
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
			<option value="Zimbabwe"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Zimbabwe"))
				      {  	  %>
				selected="selected" <%} %>>Zimbabwe</option>
			<option value="Other"
				<%if(ap.getCurrentAddress().getCountry().equalsIgnoreCase("Other"))
				      {  	  %>
				selected="selected" <%} %>>Other</option>

		</select></td><td>	<label style="visibility:hidden; color:red; font-size:12px;" name="label3" id="label3"></label></td>
	</tr>
	<tr>
		<td>Postal Code<font color="red">*</font></td>
		<td><input name="pcode" type="text" id="pcode"
			value="<%=ap.getCurrentAddress().getPostalCode() %>" /></td>
	<td><label style="visibility:hidden; color:red; font-size:12px;" id="label4"></label></td></tr>

	<tr>
		<td align="right"><input type="submit" name="button"
			style="margin-right: 15px; margin-top: 15px" id="button"
			value="Continue" class="button" onclick="return validateAddress()"/></td>
		<td><input type="reset" class="button" value="Reset"
			style="margin-left: 5px; margin-top: 15px"/></td>
	</tr>
</table>
</form>

</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->

<!-- Start Footer -->
<jsp:include page="/Layout/Footer.jsp"/>
</body>
</html>
