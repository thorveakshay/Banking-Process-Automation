<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.training.model.*"%>
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

if(!designation.equals("HELPDESK EMPLOYEE"))
{
	%>
<Script>
window.location="<%=request.getContextPath()%>/jsp/error.jsp";
</Script>
<% 
}
%>




<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search Account</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>

 

<body >
<script >


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


 
function validate_accno()
{
	var accno = document.getElementsByName("getAccNo")[0].value;   
	 
	 if(accno==0)
	 {
		 document.getElementById('accNo').style.visibility="visible";
		  document.getElementById('accNo').innerHTML="&nbsp;Please enter an Account Number.";
	
		document.getElementsByName("getAccNo")[0].value="";
		document.getElementsByName("getAccNo")[0].focus();
		
		return false;
	 }
	 else
	 {
		 document.getElementById('accNo').innerHTML="";
	 }
	
		
		if(!ischarinbag(document.getElementsByName("getAccNo")[0].value,"0123456789"))
		{
			document.getElementById('accNo').style.visibility="visible";
			document.getElementById("accNo").innerHTML="Please enter only numbers."; 
			document.getElementsByName("getAccNo")[0].focus();
			document.getElementsByName("getAccNo")[0].value="";
			return false;
		}

		else
		{
			 document.getElementById('accNo').innerHTML="";
		}
		 if(document.getElementsByName("getAccNo")[0].value.length!=14)
		{

			document.getElementById('accNo').style.visibility="visible";
		document.getElementById("accNo").innerHTML="Account Number should be of 14 digits."; 
		document.getElementsByName("getAccNo")[0].focus();
		document.getElementsByName("getAccNo")[0].value=""; 
		return false;
		}
			else
			{
				 document.getElementById('accNo').innerHTML="";
			}
		 if (document.getElementsByName("getAccNo")[0].value.charAt(0)=="0")
		{
			document.getElementById('accNo').style.visibility="visible";
			document.getElementById("accNo").innerHTML="Account Number should not start with 0(zero)"; 
			document.getElementsByName("getAccNo")[0].focus();
			document.getElementsByName("getAccNo")[0].value="";
			return false;
		}
		
			else
			{
				 document.getElementById('accNo').innerHTML="";
			}
			
		
	//call_servlet();
	return true;
	
	
}
</script>


<jsp:include page="../jsp/layout/Header.jsp" />
   	 <%
 Account acc= new Account();
   	 if(request.getAttribute("accountobj")!=null)
   	 {
acc=(Account)request.getAttribute("accountobj");
if(acc==null)
{
	%>
<script>
document.getElementsByName("getAccNo")[0].value="";
 
</script>

<%
}
if(acc!=null)
{
	if(acc.getId()==-1)
{
	%>
	<script>
	alert("Invalid Account Number");
 
	</script>

<%
}	
	else{	
		if(acc.getId()==-11)
		{
		%>
	<script>
		alert("Account title changed successfully.");
		</script>

		<%
		}
		}	
	
}
   	 }
%>
	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Generate Ticket">Create Helpdesk Ticket</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="Tickets">View Tickets</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
				
				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->
		<center>
		 <font size="4pt"  >
<center><p style="color:black;margin-top:0px;font-family:verdana;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Get Account Details</p></center>
</font>
</center>
<br />

 

<form  method="post"   action="/NexusBankingGroup/ViewAccountDetailServlet"> 
 
<!--<table id="gradient-style" align="center" style="margin-left: 300px" width="600px">

<input type="hidden" name="action" value="searchaccount"></input>

<tr>
<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="3pt">Account Number</font> <font color="red">* </font> </td>
<td  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <font size="3pt"  >
<input type="text" name="getAccNo"   maxlength="16" >
</input>
<label style="visibility:hidden; color:red; font-size:12px;" id="accNo"></label>
</font>
</td>
</tr>
 
<tr>
<td colspan="2">
 
 <br />
 
<center>
<input  type="submit"  name="submit" value="Proceed" onclick="return validate_accno()" >
</input>
</center>
</td>
 </tr>

</table>
-->




<table id="gradient-style" align="center" width="600px" style="margin-left: 100px; font-size:2pt;">

<input type="hidden" name="action" value="searchaccount"></input>

<tr>
<td align="left" ><font size="2pt"><b>Account Number</font><font color="red">*</font></b></td>
<td align="left">  <font size="2pt"  >
<input type="text" name="getAccNo"   maxlength="16" title="Please enter an Account Number." >
</input></font>
</td>
<td align="left" width="40%">
<label style="visibility:hidden; color:red; font-size:12px;" id="accNo"></label>
</td>

</tr>

</table>
<br/>
<table align="center">

<tr>

<td colspan="2" > 

<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input  type="submit"  name="submit" style="background-color:black;  color:white" value="Proceed" onclick="return validate_accno()" >
</input>
</center>
</td>
</tr>

</table>











</form>
   	
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
