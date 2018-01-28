<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.training.model.NonPersonalCustomer"%>
<%@page import="com.training.model.NonPersonalCustomer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<html>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/BusinessCustValidation.js"></script>
<%boolean flag=(Boolean)session.getAttribute("flag"); %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Additional Business Details</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<style>
td
{
padding-left: 10px;
padding-right: 10px;
padding-top: 5px;
padding-bottom:5px;
}

</style>
</head>

<body>
<jsp:include page="/Layout/Header.jsp"/>
	<!-- Start Main Content -->
	<div id="main" class="container">
	<% if(flag!=true){%>
	<jsp:include page="/Layout/BusinessCustOperationsMenu.jsp"/>
	<% }else{%>
	<jsp:include page="/Layout/BusinessCustUpdateMenu.jsp"/>
	<% }%>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Additional Business Details</p><br/></br>
				 	</div>
	
<form name="registerForm" action="/NexusBankingGroup/CustomerManagementServlet" method="post" onSubmit="return validfunc2()">

<input type="hidden" name="action" value="sendUpdatedForm2"></input>
<%NonPersonalCustomer npc=new NonPersonalCustomer();%>
<%npc=(NonPersonalCustomer)session.getAttribute("customer");%>
	
	
		<table style="font-size:12px" width="700px">
	
<tr>
<td colspan="2"><font color="red">Fields marked with * are mandatory</font></td>
</tr>

<tr>
<td style="width:200px;">Industry Sector<font color="red">*</font></td><td style="width:500px;"><abbr title="Please enter Industry Sector">
<input type="text" name="industrySector" maxlength="50" onblur="validateIndustrySector()" value="<%=npc.getIndustrySector() %>"></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkSector"></label></p></td>
</tr>

 <tr>
<td>Main Activity<font color="red">*</font></td>
<td><abbr title="Please enter Main Activity"><input type="text" name="mainActivity" maxlength="50" value="<%=npc.getMainActivity() %>"onblur="validateActivity()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkActivity"></label></p></td>
</tr>   
    
<tr>
<td>Precise Activity<font color="red">*</font></td><td><input type="text" name="preciseActivity" maxlength="50" onblur="validatePreciseActivity()"  value="<%=npc.getPreciseActivity() %>"></input>
<p style="color:red;display:inline;font-size:11px"><label id = "checkPreciseActivity"></label></p></td>
</tr>
    
<tr>
<td>Do you require funding ?<font color="red">*</font></td>
<td><abbr title="Please select funding requirements">
<input type="radio" name="requireFunding" value="Yes" onclick="validateFundingFieldYes()" onblur = "validateFundRequirement()" <%if(npc.getRequireFunding().equalsIgnoreCase("Yes")){out.println("checked");} %>>Yes
<input type="radio" name="requireFunding" value="No" onclick="validateFundingFieldNo()" onblur = "validateFundRequirement()" <%if(npc.getRequireFunding().equalsIgnoreCase("No")){out.println("checked");} %>>No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkRadio"></label></p></td>
</tr>


<tr>
<td>How much funding do you require ?<font color="red">*</font></td>
<td><abbr title="Please enter funding requirements">
<input type="text" name="fundAmount" id="funField" maxlength="5"  value="<%=npc.getFundAmount() %>" onblur = "validateFund()"></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkFund"></label></p></td>
</tr>

<tr>
<td>Do you import/export goods ?<font color="red">*</font></td>
<td><abbr title="Please enter select export/import details">
<input type="radio" name="goods" <%if(npc.getGoods().equalsIgnoreCase("Yes")){out.println("checked");} %>value="Yes" onblur="validateGoods()">Yes
<input type="radio" name="goods" <%if(npc.getGoods().equalsIgnoreCase("No")){out.println("checked");} %>value="No" onblur="validateGoods()">No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkGoods"></label></p></td>
</tr>

<tr>
<td>Are you a part of Group/Franchise ?<font color="red">*</font></td>
<td><abbr title="Please enter select Group/Franchise details">
<input type="radio" name="groupFranchise" onblur="validateGroupFranchise()" <%if(npc.getGroupFranchise().equalsIgnoreCase("Yes")){out.println("checked");} %>value="Yes" >Yes
<input type="radio" name="groupFranchise" onblur="validateGroupFranchise()"<%if(npc.getGroupFranchise().equalsIgnoreCase("No")){out.println("checked");} %>value="No" >No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkGF"></label></p></td>
</tr>


<tr>
<td>Franchise Details<font color="red"></font></td><td><textarea rows="4" cols="20" name="franchiseDetails"><%=npc.getFranchiseDetails()%></textarea></td>
</tr>

<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td></td>
 <td><input type="submit" value="continue" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;"></td>
 
 </tr>

</table>
</form>
</div>
</div>
</div>
	
<jsp:include page="/Layout/Footer.jsp"/>

</body>

</html>
