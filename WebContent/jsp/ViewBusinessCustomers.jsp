 
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@page import="com.training.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.log4j.Logger"%>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@page import="java.util.List"%>
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

List<BusinessCustomer> bcList=new ArrayList<BusinessCustomer>(); 

bcList = (List<BusinessCustomer>) session.getAttribute("bcobj"); 
%>



<head>

  
<script>

function validateReset()
{
	document.getElementById('radioCheck').innerHTML="";
	document.getElementById('customerList').reset();
}

function validateCustomerSelection()
{ 

	
	var listItemArray = document.getElementsByName("businessData");
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
 <style type="text/css" title="currentStyle"> 
			@import "<%=request.getContextPath() %>/stylesheets/jquery.dataTables_themeroller.css";
			@import "<%=request.getContextPath() %>/stylesheets/jquery-ui-1.8.4.custom.css";
			
	</style> 
<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/js/jquery.dataTables.js"></script>

<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />

<script>$(document).ready(function(){

	var oTable	= $('#mt').dataTable( {
		"sScrollX": "100%",
		"aaSorting": [[ 1, "asc" ]],
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"bAutoWidth": false,
		"autoHeight": true,
		"bStateSave": false,
		"aoColumns": [ null, null,null,null,null,null,null]  			
	} );

});  
 
 </script>
 
</head>

<title>Business Customer List</title>
 
  


<jsp:include page="../jsp/layout/Header.jsp" />
  
 

	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
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
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Contact">Update Business Customer Contact</a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/jsp/AccountPartyManagementHome.jsp" title="Account Party Management">Account Party Management</a></li>
		
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">Close Account</a></li>
			
			<%
			}
			%>	

				 
				
				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->
		<body>
		
		<center><font size="5pt" color="black" align="center">Business Customer Search Results</font></center>

<%if(bcList.size()>0){%>

<%
if(session.getAttribute("subLoggedUser")!=null)
if(session.getAttribute("subLoggedUser").toString().equalsIgnoreCase("VIEW_CUSTOMER_DETAILS"))
{
 
%>
<form name="customerList" method="post"   action="/NexusBankingGroup/VerifyCustomerServlet"> 
<input type="hidden" name="action" value="gotoShowBusinessCustomer"> </input> 
 



<%
}
else
{
%>

<form method="post"   action="/NexusBankingGroup/AccountPartyListServlet"> 
<input type="hidden" name="action" value="viewAccountPartyList"> </input> 
<input type="hidden" name="action" value="viewAccountPartyList1"> </input>

<%
}
%>
<center>
<div id="gradient-style">


<hr></hr>
<br></br>
<%
	if(!bcList.isEmpty())
	{
	 
	
	
	%>
		<div id="gradient-style" style="width:610px;">
		<table id="mt"  width="500">
		<thead>
		 
	<th><center><b>Select</b></center></th>
		<th><center><b>Business Id</b></center> </th>
		<th><center><b>Business Name</b></center></th>
		
		<th><center><b>Trading Name </b></center></th>
		<th><center><b>Branch Id </b></center></th>
		<th><center><b>Branch Name</b></center></th>
		<th><center><b>Country</b></center></th>
 
		</thead>
		<tbody>
		 <% for(BusinessCustomer bcust:bcList){%>
		 <tr>
		<td><input type="radio" name="businessData" id="businessData" value="<%=bcust.getBusinessId()+"#"+bcust.getBusinessName()+"#"+bcust.getBranchName()%>"></input>


		</td>

		<td><%=bcust.getBusinessId() %></td>
		<td><%=bcust.getBusinessName() %></td>
		<td><%=bcust.getTradingName() %></td>
		<td><%=bcust.getBranchId() %></td>
		<td><%=bcust.getBranchName() %></td>
		<td><%=bcust.getCountry()%></td>
		</tr>
	
						<% }%>
		</tbody>
		<tr><td colspan="7"></td></tr>
		</table>
		</div>

		 <%
	}

 
		 %>

		</div>

		<table align="center">

		</div>
 		 

 <table align="center" style="margin-left=100px;">

	
<tr><td colspan="7"><label style="visibility:hidden; color:red; font-size:12px; margin-left=280px;" name="radioCheck" id="radioCheck"></label></td></tr>

<tr> 
 
<td colspan="7" > 
<input type="submit" style="background-color:black; margin-left=50px;  color:white" onclick="return validateCustomerSelection()" value="Submit"></input>
  &nbsp;  &nbsp;  &nbsp;   <input type="reset"  style="background-color:black;margin-top:20px;  color:white"  value="Reset" onclick="return validateReset();"></input>

     
</td>
</tr>
</table>
		</div>
 		 



 
 


 <% }%>
</form>
</center> 
	<!-- Start Footer --> 
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html> 
