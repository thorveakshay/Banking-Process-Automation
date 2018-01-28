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
if(session.getAttribute("uid")==null)
{
 %>
<Script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</Script>
<% 
 
}
%>


<script >


function home(){

window.location="<%=request.getContextPath()%>/jsp/HomeTicket.jsp";

}


function validateCustomerSelection()
{ 
	var listItemArray = document.getElementsById("businessData");
var flag=0;

//alert("len is "+listItemArray.length); 
	 for (var i=0; i<listItemArray.length; i++) 
	 {
	  var listItem = listItemArray[i];
	  if ( listItem.checked==true) 
	  {
		flag=1;
		break;
	        //  return true;

	  }

	 }


	 //alert("flag value is : "+flag);
	 
if(flag==1)
{

//alert("u r r8");

	
return true;

}
if(flag==0)
{
	document.getElementById('radioCheck').style.visibility="visible";
	document.getElementById('radioCheck').innerHTML="&nbsp;Please select a Business Customer.";
	
	//alert("u r wrong");
	
	return false;
}	

else
{
	
	document.getElementById('radioCheck').innerHTML="";
}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Business Customer List</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>
 
 

<body >

  


<jsp:include page="../jsp/layout/Header.jsp" />
  
 
<%ArrayList<BusinessCustomer> bcList=(ArrayList<BusinessCustomer>)request.getAttribute("bcobj"); %>
	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
				
			 <li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Create Helpdesk Ticket">Create Helpdesk Ticket</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="Tickets">View Tickets</a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
				

			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->

<form  method="post"   action="/NexusBankingGroup/SearchCustomerServlet"> 
<input type="hidden" name="action" value="showBusinessCustomer"> </input> 
 <table id="gradient-style" align="center" style="margin-left: 300px; font-size:2pt;">

<tr>
<th>Select</th>
<th>Business Id</th>
<th>Business Name</th>
<th>Trading Name</th>
<th>Branch Id</th>
<th>Branch Name</th>
<th>Country of Registration</th>



</tr>


<%for(BusinessCustomer bcust:bcList) { %>
<tr>
<td><input type="radio" name="busid" id="businessData" value=<%=bcust.getBusinessId() %>></input></td>
<td><%=bcust.getBusinessId() %></td>
<td><%=bcust.getBusinessName() %></td>
<td><%=bcust.getTradingName() %></td>
<td><%=bcust.getBranchId() %></td>
<td><%=bcust.getBranchName() %></td>
<td><%=bcust.getCountry()%></td>



</tr>
<%} %>

<tr>
<td colspan="7" align="center">
<label style="visibility:hidden; color:red; font-size:12px;" id="radioCheck"></label>
</td>
</tr>

<tr>
<td colspan="7" align="center">
<input type="submit" style="background-color:black;  color:white" onclick="return validateCustomerSelection()" value="Get Details"></input>

<input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value="Cancel" ></input>

</td>
</tr>

</table>



</form>






<!--<br></br>
<hr>
</hr>

<p align="center">
    <input type="submit" style="background-color:black;  color:white" value="Get Details"></input>
     </p>--->


	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
