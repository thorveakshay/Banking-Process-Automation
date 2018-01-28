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
<title>Switch to New Product</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>

 

<body >
<script type="text/javascript">


function call_home(){

	window.location="<%=request.getContextPath()%>/jsp/backoffice.jsp";

	}


function validateAcSelection()
{
	
	
	 var ac = document.getElementsByName("accno")[0].value;   
 var lenac=ac.length;
		if(document.getElementsByName("accno")[0].value=="")
		{
		
			document.getElementById('selectAc').style.visibility="visible";
			  document.getElementById('selectAc').innerHTML="&nbsp;Please select Account Party.";
		
			document.getElementsByName("accno")[0].focus();
		return false;
		}
		else
		{
			document.getElementById('selectAc').innerHTML="";
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
 String message = (String)request.getAttribute("msg"); 
 ArrayList<Account> aclist=(ArrayList<Account>)request.getAttribute("accountlist");
 


%>
	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
					<li id="lft"><a href="<%=request.getContextPath() %>/jsp/ASPHome.jsp" title="Change Account Title">Home</a></li>
			
		<li id="lft"><a  href="/NexusBankingGroup/GetCustServlet?action=getBranchList0" title="Change Account Title">Change Account Title</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">Switch to New Product</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList4" title="Update Business Customer Address">Update Business Customer Address</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Contact">Update Business Customer Contact</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/jsp/AccountPartyManagementHome.jsp" title="Account Party Management">Account Party Management</a></li>
		
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">Close Account</a></li>
				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->
		<center>
 
		 <font size="4pt"  >
		 <%if(message!=null){%>
<p style="color:red;margin-top:0px;font-family:verdana;"><%=message %></p><br/>
<%} %>
<p style="color:black;margin-top:0px;font-family:verdana;"><font size="5pt">Switch to New Product</font></p><br/>
 
		 
 
 

</font>
</center>
<br /> 
 
 

<form  method="post"   action="/NexusBankingGroup/AmendorSwitchProductServlet"> 
 <table id="gradient-style" align="center" style="margin-left: 200px" width="550px">

 
<input type="hidden" name="action" value="accnoSwitch"/>

<input type="hidden" name="busid" value="<%=busid%>"/>
 
 <tr>
	<td><font size="2pt"><b>Business Customer Id</b></font></td>
   	 <td><font size="2pt"><%=busid %></font></td>
</tr>
<td><font size="2pt"><b>Business Name</b></font></td>
<td><font size="2pt"><%=busname %></font>
</td>
</tr>
 
<tr>
	<td><font size="2pt"><b>Account Party Id</b></font></td>
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
	<td width=200><font size="2pt"><b>Relationship with Business Customer</b></font></td>
	<td><font size="2pt"><%=relationshipType %></font></td>
</tr>
 <tr >
 
 <td><font size="2pt"><b>Select Account no. </b></font></td>
<%if(aclist.size()!=0){ %>
<td width="400"  ><select name="accno" id="accno" title="Please select an account number.">
<option value="">Please Select</option>
<%for(Account accp:aclist) 
 {%>
<option value="<%=accp.getAccno()%>"> 
<%=accp.getAcctitle()+" ( "+accp.getAccno()+" )" %></option>
<%}%>
 </select>
 <label style="visibility:hidden; color:red; font-size:12px;" id="selectAc"></label>
</font></td>
<%} %>


<%if(aclist.size()==0){ %>
<td ><font size="3pt"><select name="accno" id="accno" disabled="disabled" title="Please select an Account number.">

<option value="">Please Select</option>
<%for(Account accp:aclist) 
 {%>
<option value="<%=accp.getAccno()%>"> 
<%=accp.getAcctitle()+" ( "+accp.getAccno()+" )" %></option>
<%}%>
 </select>
 <label style="visibility:hidden; color:red; font-size:12px;" id="selectAc"></label>
</font></td>
<%} %>
</tr>

</table>
<table align="center">
<tr height="100">
<%if(aclist.size()==0){ %>
 
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
<td>
 
	<hr><input type="submit" style="background-color:black;margin-left:100px;color:white" onclick="return  validateAcSelection()"  value="Get Account Details " disabled="disabled"></td>

<%} %>
<%if(aclist.size()!=0){ %>
<td><hr><input type="submit" style="background-color:black;color:white" onclick="return  validateAcSelection()"  value="Get Account Details " ></td>

<%} %>
<td> 
 <hr>
<input type="reset" style="background-color:black; margin-left:20px; color:white" value="Cancel" onclick="return call_home()"></td>


</tr>


 
 

</table>
</form>
   	
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
