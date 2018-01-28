 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%><html xmlns="http://www.w3.org/1999/xhtml">
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Enter Details</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
</head>

 

<body >
<script type="text/javascript">


function validateSelection()
{
	
	
		if(document.getElementsByName("accNumber")[0].value=="")
		{
		
			document.getElementById('selectAc').style.visibility="visible";
			  document.getElementById('selectAc').innerHTML="&nbsp;Please select an Account Number.";
		
			document.getElementsByName("accNumber")[0].focus();
		return false;
		}
		else
		{
			 document.getElementById('selectAc').innerHTML="";
		}
		if(document.getElementsByName("contactTypeDd")[0].value=="")
		{
		
			document.getElementById('selectCon').style.visibility="visible";
			  document.getElementById('selectCon').innerHTML="&nbsp;Please select the type of contact.";
		
			document.getElementsByName("contactTypeDd")[0].focus();
		return false;
		}
		else
		{
			document.getElementById('selectCon').innerHTML="";
		}
			
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
		alert("Account closed successfully.");
		</script>

		<%
		}
		}	
	
}
   	 }
%>

   
                        
                    	
<%
String accpid=(String)request.getAttribute("accpid");
String accpName=(String)  request.getAttribute("accpName");
 String busname=(String) request.getAttribute("busname");
 String busid=(String)request.getParameter("busid"); 
 String relationshipType=(String)request.getParameter("relationshipType");
 
 ArrayList<Account> aclist=(ArrayList<Account>)request.getAttribute("accountlist");
 

%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Business Customer Contact Details</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />


	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn" style="width:240px">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
			<li id="lft"><a  href="/NexusBankingGroup/GetCustServlet?action=getBranchList0" title="Change Account Title">Change Account Title</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">Close Account</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">Switch to New Product</a></li>
			<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList4" title="Update Business Customer Address">Update Business Customer Address</a></li>
			 		<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Address">Update Business Customer Contact</a></li>
			 		<li id="lft"><a href="/NexusBankingGroup/jsp/AccountPartyManagementHome.jsp" title="Account Party Management">Account Party Management</a></li>
		
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->
		
<center><font color="black" size="5pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Update Business Contact Details</font></center>
</font>
</center>
<br />
<br />
 

<form  method="post"   action="/NexusBankingGroup/RelationshipManagerServlet"> 

 <input type="hidden" name="action" value="updateBusinessContact"/> 
<table id="gradient-style" align="center" style="margin-left: 250px; font-size:2pt;" width="600px" >
 <tr>
	<td width="50%"><font size="2pt"><b>Business Customer ID</b></font></td>
   	 <td><font size="2pt"><%=busid %></font></td>
</tr>
<td width="40%"><font size="2pt"><b>Business Name</b></font></td>
<td width="60%"><font size="2pt"><%=busname %></font>
</td>
</tr>
 
<tr>
	<td><font size="2pt"><b>Account Party ID</b></font></td>
     	<td><font size="2pt">
		<%=accpid %></font>
	</td>
</tr>

<tr>
	<td><font size="2pt"><b>Account Party Name</b></font></td>
     	<td><font size="2pt">
		<%=accpName %></font>
	</td>
</tr>

<tr>
	<td width=200><font size="2pt"><b>Relationship with Business</b></font></td>
	<td><font size="2pt"><%=relationshipType %></font></td>
</tr>
 <tr >
 <td><font size="2pt"><b>Select Account no. </b></font></td>

<td width="400"  ><select name="accNumber" id="accNumber" title="Please select an Account Number." >

<option value="">Select Account Number</option>
<%for(Account accp:aclist) 
 {%>


 

<option value="<%=accp.getAccno()%>"> 
<%=accp.getAcctitle()+" ( "+accp.getAccno()+" )" %></option>



<%}%>
 </select>

<label style="visibility:hidden; color:red; font-size:12px;" id="selectAc"></label>

</tr>

<tr>
   <td><b><font size="2pt">Contact Type</font></b></td>
   <td>
   <select name="contactTypeDd" title="Please select the contact type." onblur="return  validateSelection()">
   <option value="">Please Select Type of Contact</option>
   <option value="Fax">Fax</option>
   <option value="Work">Work</option> 
   </select>
   <label style="visibility:hidden; color:red; font-size:12px;" id="selectCon"></label>
   </td>
   </tr>
 
   </table>
   <br></br>
<table style="margin-left:480px">
	<tr>
	<td colspan="2" align="center"><input type="submit" style="background-color:black;  color:white" onclick="return  validateSelection()"  value="Proceed ">
<input type="reset" style="background-color:black;  color:white"   value="Cancel"></td>
	</tr>
</table>

</form>
   	
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>

	 