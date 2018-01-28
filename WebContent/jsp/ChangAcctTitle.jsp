 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page import="com.training.model.*"%>
 
<head>

<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />

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
<%
	if(session.getAttribute("designation").toString().equalsIgnoreCase("RELATIONSHIP MANAGER"))
	{
	%>


	{

	window.location="<%=request.getContextPath()%>/jsp/ASPHome.jsp";

	}

	<%
}
	else
		if(session.getAttribute("designation").toString().equalsIgnoreCase("BACKOFFICE EMPLOYEE"))
		{
			%>


			{

			window.location="<%=request.getContextPath()%>/jsp/backoffice.jsp";

			}

			<%
					}	
					
%>

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


function validateTitle()
{

var ttl = document.getElementsByName("setAccTitle")[0].value;   

if( document.getElementsByName("setAccTitle")[0].value==0)
{
	  document.getElementById('title').style.visibility="visible";
	  document.getElementById('title').innerHTML="&nbsp;Please enter the Account title.";

	document.getElementsByName("setAccTitle")[0].value="";
	document.getElementsByName("setAccTitle")[0].focus();
	return false;
}
else
{
	 document.getElementById('title').innerHTML="";
}
if(	!ischarinbag(document.getElementsByName("setAccTitle")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ- _/"))

{

document.getElementById('title').style.visibility="visible";
document.getElementById('title').innerHTML="&nbsp;Only alphabets,space and - _ / are allowed.";



document.getElementsByName("setAccTitle")[0].value="";

document.getElementsByName("setAccTitle")[0].focus();
return false;

}
else
{
	document.getElementById('title').innerHTML="";
}

if(document.getElementsByName("setAccTitle")[0].value.length>50)
{

	document.getElementById('title').style.visibility="visible";
	document.getElementById('title').innerHTML="&nbsp;Only 50 characters are allowed.";



	document.getElementsByName("setAccTitle")[0].value="";

	document.getElementsByName("setAccTitle")[0].focus();
	return false;
}
else
{
	document.getElementById('title').innerHTML="";
}



var newAccTitle=document.getElementsByName("setAccTitle")[0].value;

var oldAcctTitle=document.getElementsByName("oldAcctTitle")[0].value;
if(newAccTitle==oldAcctTitle)
{
	  document.getElementById('title').style.visibility="visible";
	  document.getElementById('title').innerHTML="&nbsp;Please enter the new Account title.";

	document.getElementsByName("setAccTitle")[0].value=oldAcctTitle=document.getElementsByName("oldAcctTitle")[0].value;
	document.getElementsByName("setAccTitle")[0].focus();
	return false;
}
else
{
	 document.getElementById('title').innerHTML="";
}

var op= confirm("Are you sure you want to proceed ?");
if(op==true)
{
	alert("Account title changed successfully");
	return true;
}
else
	return false;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Change Account Title</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>

 <%
 Account acc= new Account();
acc=(Account)request.getAttribute("accountobj");
String oldAccTitle=acc.getAcctitle();

String tikId=null;

if(request.getAttribute("tikId")!=null)
tikId=request.getAttribute("tikId").toString();
 
%> 
	
 
 
 

<body >

 


<jsp:include page="../jsp/layout/Header.jsp" />
  
 
<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn" style="width: 240px">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
				<%
			if(session.getAttribute("designation").toString().equals("RELATIONSHIP MANAGER"))
			{
			%>
				<li id="lft"><a  href="/NexusBankingGroup/GetCustServlet?action=getBranchList0" title="Change Account Title">Change Account Title</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">Switch to New Product</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList4" title="Update Business Customer Address">Update Business Customer Address</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Contact">Update Business Customer Contact</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/jsp/AccountPartyManagementHome.jsp" title="Account Party Management">Account Party Management</a></li>
		
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">Close Account</a></li>
			
			<%
			}
			%>
			
			<%
			if(session.getAttribute("designation").toString().equals("BACKOFFICE EMPLOYEE"))
			{
			%>
				
			<li id="lft"><a href="<%=request.getContextPath() %>/jsp/AssignedTickets.jsp" title="Assigned Tickets">Assigned Tickets</a></li>
					
			<%
			}
			%>
			
				
			
				
			</ul>
			
			<hr />
		</div>
		<center>
		 <font size="4pt"  >
<center><p style="color:black;margin-top:0px;font-family:verdana; "><font size="5pt">Account Details</font></p></center>
</font>
</center>
<br />

	
		<!-- main content area -->
 <font size="2pt"  > 
 <form action="/NexusBankingGroup/AmendorSwitchProductServlet?action=updateAccTitle" method="post">
 
   <table id="gradient-style" align="center" style="margin-left: 200px; font-size:2pt;" width="600px" >
 
<input type="hidden" name="accno" value="<%=acc.getAccno()%>"> 
</input>
<input type="hidden" name="accid" value="<%=acc.getId()%>"> 

<input type="hidden" name="tikId" value="<%=tikId%>"> 
<input type="hidden" name="oldAcctTitle" value="<%=acc.getAcctitle()%>"> 

</input>
 <tr>
<td colspan="3" align="left"><font color="black">Field marked with <font color="red"><sup>*</sup> </font>is mandatory.</font></td>
</tr>
<tr>
	<td width="50%"><font size="2pt" ><b>Account ID</b></font></td>
     	<td><font size="2pt"><%=acc.getId() %></font></td>
</tr>
 
<tr>
	<td><font size="2pt"><b>Account Type</b></font></td>
	<td><font size="2pt"><%=acc.getAcctype()%></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>Account Number</b></font></td>
	<td><font size="2pt"><%= acc.getAccno()%></font></td>
</tr>
<tr>
<td><font size="2pt"><b>Status</b></font></td>
<td><font size="2pt"><%=acc.getStatus()%></font>
</td>
</tr>

<tr>
<td width="70%"><font size="2pt" ><b>Account Opening Date</b></font></td>
<td>
 
<font size="2pt"><%=acc.getAod()%></font>
  
</td>

</tr>
<tr>
	<td width="50%"><font size="2pt"><b>Account Closing Date</b></font></td>
	
	<%if(acc.getAcd()!=null){ %>
	<td><font size="2pt"><%=acc.getAcd()%></font></td>
	<%}%>
	
	<%if(acc.getAcd()==null){ %>
	<td><font size="2pt">N/A</font></td>
	<%}%>
	
</tr>
<tr>
<td><font size="2pt"><b>Branch</b></font></td>
<td><font size="2pt"><%=acc.getBranch()%></font></td>	

</tr>
 
 <tr>

			<td width="50%"><font size="2pt"><b>New Account Title<font color="red"><sup>*</sup></font></b></font></td>

			<td  width="50%">
			 <font size="2pt">
			<input type="text" name="setAccTitle"   size="50" value="<%=acc.getAcctitle() %>" title="Please change the Account Title.">
			<label style="visibility:hidden; color:red; font-size:12px;" id="title"></label>
			</input> </font>
			</td>  
</tr>
 
 

 

</table>

 

 <div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:470px;margin-top:25px;">
 
<input id="submit" type="submit" style="background-color:black;  color:white" id="submit" name="submit" onclick="return  validateTitle()" value="Proceed"  >

</input>
&nbsp;
<input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>
 
 </div>
 
 
</form>
</font>
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
 