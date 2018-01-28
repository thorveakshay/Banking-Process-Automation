<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%>
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
	 
	<%
	if(session.getAttribute("designation").toString().equals("RELATIONSHIP MANAGER"))
	{
		%>
		window.location="<%=request.getContextPath()%>/jsp/ViewBusinessCustomers.jsp";
<%
	}
%>
<%

	if(session.getAttribute("designation").toString().equals("BACKOFFICE EMPLOYEE"))
	{
		%>

		window.location="<%=request.getContextPath()%>/jsp/backoffice.jsp";
	<%
}
%>
<%
		  
	if(session.getAttribute("designation").toString().equals("HELPDESK EMPLOYEE"))
	{
		%>

		window.location="<%=request.getContextPath()%>/jsp/HomeTicket.jsp";
		  <%
			}
		%>
		  
	}


function validateAPSelection()
{
	
	
	 var ap = document.getElementsByName("accParty")[0].value;   
 var lenap=ap.length;
		if(document.getElementsByName("accParty")[0].value=="")
		{
		
			document.getElementById('selectAp').style.visibility="visible";
			  document.getElementById('selectAp').innerHTML="&nbsp;Please select Account Party.";
		
			document.getElementsByName("accParty")[0].focus();
		return false;
		}
		return true;
}

function resetPage(){
	document.getElementById("resetmessage").style.display="none";
	document.getElementById('selectAp').innerHTML="";
	
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Account Party List</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" /> 




</head>


<body>

	<jsp:include page="../jsp/layout/Header.jsp" />

<!-- Start Main Content -->
	<div id="main" class="container">
		<!-- left column (products and features) -->
		<div id="leftcolumn" style="width: 240px">
			<h3 class="leftbox"><font color="black">Quick Links</font></h3>
			<ul class="leftbox borderedlist">
			  
	
			<%
			if(session.getAttribute("designation").toString().equals("HELPDESK EMPLOYEE"))
			{
			%>
			

					
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Generate Ticket">Create Helpdesk Ticket</a></li>
			
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="View Tickets">View Tickets</a></li>

				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
		

				

			<%
			}
			%>	
		
			<%
			if(session.getAttribute("designation").toString().equals("RELATIONSHIP MANAGER"))
			{
			%>
				<li id="lft"><a  href="/NexusBankingGroup/GetCustServlet?action=getBranchList0" title="Change Account Title">Change Account Title</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">Switch to New Product</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList4" title="Update Business Customer Address">Update Business Customer Address</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Address">Update Business Customer Contact</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/jsp/AccountPartyManagementHome.jsp" title="Account Party Management">Account Party Management</a></li>
		
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">Close Account</a></li>
			
			<%
			}
			%>					
			</ul>
			
			<hr />
		</div>
		<!-- main content area -->
<%ArrayList<AccParty> ap=(ArrayList<AccParty>)session.getAttribute("accountParty");
Long npId=(Long)session.getAttribute("npId");
String businessName=(String)session.getAttribute("businessName");
String branchName=(String)session.getAttribute("branchName");
String message = "Sorry ! Account Party does not exist";
String msg=(String) request.getAttribute("msg");

%>
<%if(msg!=null){ %>
<center><label id="resetmessage"><font size="4pt" color="red"><%=msg%></font></label>
</center>
<br/>
<%} %>


 
<div id = "maincontent">
<%if(ap.size()==0){ %>
<center><font size="4pt" color=red><%=message %></font></center> <br/>
<%} %>
<center><font size="5pt" color=black>Business Customer Details</font></center>

 <BR>
<form  method="post" action="/NexusBankingGroup/AccountPartyListServlet">
<input type="hidden" name="action" value="goToCustVeriPage"> </input> 

<input type="hidden" name="action" value="cancel"> </input> 


<input type="hidden" name="branchName" value="<%=branchName%>"> </input> 
<input type="hidden" name="businessName" value="<%=businessName%>"> </input> 
<input type="hidden" name="businessId" value="<%=npId%>"> </input> 

<center></center>


<table id="gradient-style" align="center" border"1"style="margin-left: 200px; font-size:2pt;" width="600px">

<tr>
<td colspan="3" align="left"><font color="black">Field marked with <font color="red"><sup>*</sup> </font>is mandatory.</font></td>
</tr>
 <tr>
 <td width="35%"><font size="2pt"> <b>Business Customer ID </b></font></td>
<td width="65%"> <font size="2pt"><%=npId %></font></td>
 </tr>
 
<tr>
<td><font size="2pt"> <b>Business Name </b></font></td>
<td><font size="2pt"> <%=businessName %> </font> </td>
</tr>

<tr>
<td> <font size="2pt"><b> Branch Name  </b></font></td>
<td><font size="2pt"><%=branchName%></font>   </td>
</tr>



<tr>

<td><font size="2pt"><b> Account Party<font color="red"><sup>*</sup> </b></font></td>



<%if(ap.size()!=0){ %>
<td><select name="accParty" id="accParty" title="Please select an Account Party.">

<option value="">Please Select</option>
<%for(AccParty accp:ap) 
 {%>
<option value="<%=accp.getApId()+"#"+accp.getRelationshipType()+"#"+accp.getFirstName()+" "+accp.getSurname()%>"> 
<%=accp.getFirstName()+" "+accp.getSurname() %></option>
<%}%>

</select>
<label style="visibility:hidden; color:red; font-size:12px;" id="selectAp"></label>
</td>
<%} %>


<%if(ap.size()==0){ %> 
<td><select name="accParty" id="accParty" title="Please select an Account Party." disabled="disabled">
<option value="">Please Select</option>
<%for(AccParty accp:ap) 
 {%>
<option value="<%=accp.getApId()+"#"+accp.getRelationshipType()+"#"+accp.getFirstName()+" "+accp.getSurname()%>"> 
<%=accp.getFirstName()+" "+accp.getSurname() %></option>
<%}%>

</select>
<%} %>

</td>

</tr>
<tr><td colspan="2" align="right"></td></tr>

</table>
<table align="center" >

<BR/>

<tr >

<%if(ap.size()==0){ %> 
<td align="center"  >

<input type="submit"  style="background-color:black;  color:white" onclick="return validateAPSelection()" value="Submit" disabled="disabled" ></input>
</td>
<%} %>


<%if(ap.size()!=0){ %> 

<td  align="center" colspan="3" >

<input type="submit"  style="background-color:black;  color:white" onclick="return validateAPSelection()" value="Submit"></input>
</td>
<%} %>
 
<td align="center" >
<input type="button"  style="background-color:black;margin-left:20px;margin-right:10px;  color:white" onclick="home()" value="Cancel" ></input>
</td>
 

</tr>

 
</table>
</form>		

</div> 
			<hr />
		</div>
	
	<!-- Start Footer -->
	
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
