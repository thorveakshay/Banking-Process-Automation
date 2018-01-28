<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.training.model.NonPersonalCustomer"%>
<%@page import="java.util.ArrayList"%><html>
<%@page import="java.util.*"%>
<head>
<script>
function deleteconfirm(){
var choice=confirm("Business Customer Details will be deleted.Do you want to proceed ?");
if (choice==true)
{
return true;
	}
else{
	return false;
}
}
function updateconfirm(){
	var choice=confirm("Business Customer Details will be updated.Do you want to proceed ?");
	if (choice==true)
	{
	return true;
		}
	else{
		return false;
	}
	}
</script>

<style>
td,th
{
padding-left: 5px;
padding-right: 5px;
padding-top: 5px;
padding-bottom:5px;

}
th
{
font-size:15px;
height:10px;
}
table
{
width:100%;

text-align:center;
font-size:13px;
}
#th1
{
background-color: #5599a7;
color: white;

}

</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css" />

<title>Business Customer Details</title>
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
<%
NonPersonalCustomer npc=(NonPersonalCustomer)session.getAttribute("cust");
%>

<!-- left column (products and features) -->
<div id="main" class="container">
<div id="leftcolumn" style="float:left;width:200px">
<h3 class="leftbox">Business Customer</h3>
<ul class="leftbox borderedlist">
<li><a href="<%=request.getContextPath() %>/jsp/CaptuteCoreBusinessDetails.jsp" title="Register">Register Business Customer</a></li>
<li><a href="<%=request.getContextPath() %>/jsp/SearchBusinessCustomer.jsp" title="Search">Search Business Customer</a></li>
<li><a href="../../NexusBankingGroup/AccountPartyManagementServlet?action=addAccountParty&&id=<%=npc.getNonPersonalCustomerID() %>">Add
Account Party</a></li>
<li><a href="../../NexusBankingGroup/AccountPartyManagementServlet?action=viewAccountParty&&id=<%=npc.getNonPersonalCustomerID() %>">View
Account Party</a></li>
</ul>
<hr/>
</div>


<div id="table" style="width: 600px;padding-left:20px;padding-bottom: 30px;float:left"align="left" >

<h2 align="center" style="font-size:18px"><b>BUSINESS CUSTOMER DETAILS</b></h2>
<br/>
<form action="/NexusBankingGroup/CustomerManagementServlet">
<table align="center" width="400px" style="text-align:left; padding: 10px; padding-bottom: 30px" >
<tr>
<th colspan="3" style="color: white; padding-left:5px; bold;background-color:  #5599a7;text-align: left;"><b>Core Business Details</b></th>
</tr>
<tr>
<td style="width:350px;"><b><br>Business ID</b></td>
<td style="padding-right:2px;width:350px;"> <br><%=npc.getNonPersonalCustomerID()%></td>
<td style="padding-left:0px;"><p style="font-size: 18px;">
<a href="/NexusBankingGroup/CustomerManagementServlet?action=updateForm1"><br><u>Edit</u></a></p></td> 
</tr>
<tr><td><b>Business Name</b> </td>
<td><%=npc.getBusinessName()%></td>
</tr>
<tr><td><b>Trading Name</b></td>
<td> <%=npc.getTradingName()%></td></tr>
<tr><td><b>Business Type</b></td>
<td> <%=npc.getBusinessType()%></td></tr>
<tr><td><b>Expected Annual Turnover</b></td><td> <%=npc.getExpectedAnnualTurnover()%></td></tr>
<tr><td><b>Branch </b></td><td><%=npc.getBankBranch()%></td></tr>
<tr><td> <b>Capital Fund</b></td><td><%=npc.getTotalBusinessCapital()%></td></tr>
<tr><td><b>Number of Employees </b></td><td><%=npc.getNumberOfEmployees()%></td></tr>
<tr><td><b>Country Of Registration </b></td><td><%=npc.getCountryOfRegistration()%></td></tr>
<tr><td><br></td></tr>

<tr>
<th colspan="3" style="color: white;font-weight: bold; padding-left:5px;background-color:  #5599a7;text-align: left;"><b>Additional Business Details</b></th>
</tr>
<tr><td><b><br>Industry Sector</b></td>
<td style="padding-right: 2px"><br><%=npc.getIndustrySector()%></td>
<td style="padding-left: 0px"><p style="font-size: 18px;">
<a href="/NexusBankingGroup/CustomerManagementServlet?action=updateForm2"><u><br>Edit</u></a></p></td>
</tr>
<tr><td><b>Main Activity</b> </td>
<td><%=npc.getMainActivity()%></td></tr>
<tr><td><b>Precise Activity</b> </td>
<td><%=npc.getPreciseActivity()%></td></tr>

<tr><td><br></td></tr>
<tr>
<th colspan="3" style="color: white;font-weight: bold;background-color:  #5599a7; padding-left:5px;text-align: left;"><b>Address Details</b></th>
</tr>

<tr><td><br></td></tr>

<tr>
<td><b>Business Address</b></td>
<td style="padding-right: 2px">
<%if(npc.getAl().get(0).getBuildingNumber()!="")
{
	out.println(npc.getAl().get(0).getBuildingNumber()+",");
}
if(npc.getAl().get(0).getBuildingName()!="")
{
	out.println(npc.getAl().get(0).getBuildingName()+",");
}
if(npc.getAl().get(0).getStreetName()!="")
{
	out.println(npc.getAl().get(0).getStreetName());
}%></td>
<td style="padding-left: 0px"><p style="font-size: 18px;"><a href="/NexusBankingGroup/CustomerManagementServlet?action=updateForm3" ><u>Edit</u></a></p></td>
</tr>
<tr><td></td><td style="padding-right: 2px"><%=npc.getAl().get(0).getTownName()+","+npc.getAl().get(0).getCityName()%></td></tr>
<tr><td></td><td style="padding-right: 2px"><%=npc.getAl().get(0).getPostalCode()+","+npc.getAl().get(0).getCountry()%></td>
</tr>


<tr>
</tr>

<tr><td><br></td></tr>
<tr>
<td><b>Correspondence Address</b></td>
<td style="padding-right: 2px">
<%if(npc.getAl().get(1).getBuildingNumber()!="")
{
	out.println(npc.getAl().get(1).getBuildingNumber()+",");
}
if(npc.getAl().get(1).getBuildingName()!="")
{
	out.println(npc.getAl().get(1).getBuildingName()+",");
}
if(npc.getAl().get(1).getStreetName()!="")
{
	out.println(npc.getAl().get(1).getStreetName());
}%>

</td>
<td style="padding-left: 0px"><p style="font-size: 18px;"><a href="/NexusBankingGroup/CustomerManagementServlet?action=updateForm4" ><u>Edit</u></a></p></td></tr>
<tr><td></td><td style="padding-right: 2px"><%=npc.getAl().get(1).getTownName()+","+npc.getAl().get(1).getCityName()%></td></tr>
<tr><td></td><td style="padding-right: 2px"><%=npc.getAl().get(1).getPostalCode()+","+npc.getAl().get(1).getCountry()%></td>
</tr>



<tr>
</tr>

<tr><td><br></td></tr>
<tr>
<td><b>Mailing Address</b></td>
<td style="padding-right: 2px">
<%if(npc.getAl().get(2).getBuildingNumber()!="")
{
	out.println(npc.getAl().get(2).getBuildingNumber()+",");
}
if(npc.getAl().get(2).getBuildingName()!="")
{
	out.println(npc.getAl().get(2).getBuildingName()+",");
}
if(npc.getAl().get(2).getStreetName()!="")
{
	out.println(npc.getAl().get(2).getStreetName());
}%>

</td>
<td style="padding-left: 0px"><p style="font-size: 18px;"><a href="/NexusBankingGroup/CustomerManagementServlet?action=updateForm5" ><u>Edit</u></a></p></td>
</tr>
<tr><td></td><td style="padding-right: 2px"><%=npc.getAl().get(2).getTownName()+","+npc.getAl().get(2).getCityName()%></td></tr>
<tr><td></td><td style="padding-right: 2px"><%=npc.getAl().get(2).getPostalCode()+","+npc.getAl().get(2).getCountry()%></td>
</tr>

<tr><td><br></td></tr>


<tr>
<th colspan="3" style="color: white;font-weight: bold;background-color:  #5599a7; padding-left:5px;text-align: left;"><b>Business Evidences Details</b></th>
</tr>
<tr>
<td style="padding-right: 2px"><b><br>Contact Number work</b> </td>
<td><br><%=npc.getCl().get(1).getCountryCode()%>-<%=npc.getCl().get(1).getAreaCode()%>-<%=npc.getCl().get(1).getContactNumber()%></td>
<td style="padding-left: 0px"><p style="font-size: 18px;"><a href="/NexusBankingGroup/CustomerManagementServlet?action=updateForm6"><u><br>Edit</u></a></p></td></tr>
<tr><td><b>Contact Number Fax</b> </td>
<td><%=npc.getCl().get(0).getCountryCode()%>-<%=npc.getCl().get(0).getAreaCode()%>-<%=npc.getCl().get(0).getContactNumber()%></td></tr>
<tr><td><b>Email Address</b> </td>
<td><%=npc.getEmailId()%></td></tr>
<%if(npc.getAdditionalDetails()!=null){ %>
<tr><td><b>Additional Business Details</b> </td>
<td><%=npc.getAddtionalDetails()%></td></tr>
<%} %>
<tr><td><b>ID proof</b> </td>
<td><%=npc.getPl().get(0).getDocument()%></td></tr>
<tr><td><b>Address Proof</b> </td>
<td><%=npc.getPl().get(1).getDocument()%><br/><br></td></tr>
<tr>
<th colspan="3" style="color: white;font-weight: bold; height:2px; background-color:  #5599a7"></th>
</tr>

<tr><td style="padding-left: 180px"><br/><a href="/NexusBankingGroup/CustomerManagementServlet?action=updateconfirm&&npc_id=<%=npc.getNonPersonalCustomerID()%>" style="font-size: 14px; background-color:#5599a7;color:white;padding-left: 8px;padding-right: 8px;padding-top: 5px;padding-bottom: 15px;" onclick="return updateconfirm();"><b>Confirm</b></a></td>
<td><br/><a href="/NexusBankingGroup/CustomerManagementServlet?action=delete&&id=<%=npc.getNonPersonalCustomerID()%>" style="font-size: 14px; background-color:#5599a7;color:white;padding-left: 8px;padding-right: 8px;padding-top: 5px;padding-bottom: 15px;" onclick="return deleteconfirm();"><b>Delete</b></a></td></tr>




</table>
</form>
</div>
</div>

</body>

<div style="float:left">
<jsp:include page="/Layout/Footer.jsp"/>

</div>

</html>