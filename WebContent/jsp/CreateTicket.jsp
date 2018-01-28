
 



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.training.model.*"%>
<%@page import="java.util.ArrayList"%>
 

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
<title>Ticket Generation</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
<script>
/*
function call_servlet()
{
 if(action.equals("Cancel"))
		 {
	 
				window.location="/NexusBankingGroup/AccountPartyListServlet";
		 }


return true;
	 
} */
</script>

</head>
<body>
<script type="text/javascript">
var flag=true;

function validateReset()
{
	document.getElementById('selectTitle').innerHTML="";
	document.getElementById('selectPriority').innerHTML="";
	document.getElementById('fillDesc').innerHTML="";
	document.getdocument.getElementById('click').reset();
}

function checkTicket()
{ 

	 
			if(document.getElementsByName("title")[0].value=="")
			{
			 
				document.getElementById('selectTitle').style.visibility="visible";
				  document.getElementById('selectTitle').innerHTML="&nbsp;Please select Ticket Title.";
			
				document.getElementsByName("title")[0].focus();
			return false;
			}

			
			else
			{
				
				 document.getElementById('selectTitle').innerHTML="";
					//return false;
			}
				//check priority
				
				if(document.getElementsByName("priority")[0].value=="")
			{
			 
				document.getElementById('selectPriority').style.visibility="visible";
				  document.getElementById('selectPriority').innerHTML="&nbsp;Please select Ticket Priority.";
			
				document.getElementsByName("priority")[0].focus();
			return false;
			}

			
			else
			{
				
				 document.getElementById('selectPriority').innerHTML="";
				//	return false;
			}
				
					
			//check Desciption
			
			 var des = document.getElementsByName("desc")[0].value;   
	 
		  if(des==0)
		  {
			 
			  document.getElementById('fillDesc').style.visibility="visible";
			  document.getElementById('fillDesc').innerHTML="&nbsp;Please provide description.";
		
			  	//alert("Please Enter Valid Branch Name ");
			  	document.getElementsByName("desc")[0].value="";
			  	document.getElementsByName("desc")[0].focus();
			  	return false;
		  }

		  
		  else
		  {
			  
			  document.getElementById('fillDesc').innerHTML="";
			//	return false;
		  }

 
				
			var chk= confirm("Are you sure you want to proceed ?");		
	 

			return chk;
				
}

</script>

 



	


<jsp:include page="../jsp/layout/Header.jsp" />

	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
			<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Generate Ticket">Create Helpdesk Ticket</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="Tickets">View Tickets</a></li>
			
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->


	<%	
		
		String accpName=(String)request.getAttribute("accpName");
	    String accpId=(String)request.getAttribute("accpid");
	 	String busname=(String)request.getAttribute("busname");
		String branchName=(String)request.getAttribute("branchName");
		String busid=(String)request.getAttribute("busid");
		
	
		String relationshipType=(String)request.getAttribute("relationshipType");
		
		%>
		
		<form method="post"   action="/NexusBankingGroup/CreateTicketServlet"> 
		<center><font size="5pt" color=black>New Ticket Form</font></center>


<br/>
<table id="gradient-style" align="center" style="margin-left: 200px; font-size:2pt;">

<tr>
<td colspan="3" align="left"><font color="black">Fields marked with <font color="red"><sup>*</sup> </font>are mandatory.</font></td>
</tr>

<input type="hidden" name="action" value="createticket"> </input>

<input type="hidden" name="accountPartyID" value="<%=accpId %>"></input>
<input type="hidden" name="busid" value="<%=busid%>"></input>
<input type="hidden" name="busname" value="<%=busname%>"></input>
<input type="hidden" name="accpName" value="<%=accpName%>"></input>
<input type="hidden" name="relationshipType" value="<%=relationshipType%>"></input>
<input type="hidden" name="brname" value="<%=branchName%>"></input>
 



<tr>
	<td><b><font size="2pt" >Business Customer ID</font></b></td>
   	 <td><font size="2pt" ><%=busid %></font></td>
</tr>
<td><b><font size="2pt" >Business Name</font></b></td>
<td><font size="2pt" ><%= busname%></font>
</td>
</tr>

<tr>
<td><font size="2pt" ><b>Branch</b></font></td>
<td><font size="2pt" >
<%= branchName%></font>
</td>
</tr>
<tr>
	<td><font size="2pt" ><b>Account Party</b></font></td>
     	<td><font size="2pt" >
	<%= accpName%></font>
	</td>
</tr>
<tr>
	<td width=200><font size="2pt" ><b>Relationship with Business</b></font></td>
	<td><font size="2pt" ><%= relationshipType%></font></td>
</tr>
<tr>
	<td><font size="2pt" ><b>Account Party Id</b></font></td>
	<td><font size="2pt" ><%= accpId%></font></td>
</tr>


<tr>
<td><b><font size="2pt" >Title</font> <sup><font color="red">*</font></sup></b></td>
<td width="400" style = "font:140%/2.2em "Lucida Grande", Tahoma, Verdana, Arial, Helvetica, sans-serif;>
<select id="title" name="title" title="Please select Ticket Title.">
	<option value="" selected>Please Select</option> 
	<option value="Change Account Title">Change Account Title</option>
	<option value="Update Account Party Contact">Update Account Party Contact</option>
 	<option value="Update Account Party Address">Update Account Party Address</option>
 	<option value="Update Account Party Relationship">Update Account Party Relationship</option>
 	<option value="Update Business Customer Address">Update Business Customer Address</option>
	<option value="Update Business Customer Contact">Update Business Customer Contact</option>
 	 
</select>
<label style="visibility:hidden; color:red; font-size:12px;" id="selectTitle"></label>
</td></tr>


<tr>
<td><b><font size="2pt" >Ticket Priority</font> <sup><font color="red">*</font></sup></b></td>
<td width="400" style = "font:140%/2.2em "Lucida Grande", Tahoma, Verdana, Arial, Helvetica, sans-serif;><select id="priority" title="Please select Ticket Priority." name="priority">
	
	<option value="" selected>Please Select</option> 
	<option value="Critical">Critical</option>
	<option value="High">High</option>
	<option value="Medium">Medium</option>
 	<option value="Low">Low</option>
 	
</select>
<label style="visibility:hidden; color:red; font-size:12px;" id="selectPriority"></label>
</td></tr>

<tr>
	<td><b><font size="2pt" >Description </font><sup><font color="red">*</font></sup></b></td>
	<td  style = "font:140%/2.2em "Lucida Grande", Tahoma, Verdana, Arial, Helvetica, sans-serif;><textarea  rows="5"  cols="25"  name="desc"  title="Please provide ticket description."></textarea>
	<label style="visibility:hidden; color:red; font-size:12px;" id="fillDesc"></label>
	</td>


</tr>
</table>
<table name="click" align="center" style="margin-left:180pt;">



<tr>
<td align="left"  colspan="2">
<input type="submit" style="background-color:black;margin-top:20px;  color:white" value="Create Ticket" onclick="return checkTicket()"></input>
&nbsp; &nbsp; &nbsp;
<input type="reset" style="background-color:black;margin-top:20px;  color:white" value="Reset" onclick="return validateReset();"></input> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</td>

</tr>

</table>
</form>


  
   	
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />

</body>
</html>
