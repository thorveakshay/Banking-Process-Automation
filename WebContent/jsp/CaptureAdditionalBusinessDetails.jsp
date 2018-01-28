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

<html>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/BusinessCustValidation.js"></script> 
<head>
<script>
function clearBusinessDetails()
{
	document.getElementById("checkSector").innerHTML = "";
	document.getElementById("checkActivity").innerHTML = "";
	document.getElementById("checkPreciseActivity").innerHTML = "";
	document.getElementById("checkRadio").innerHTML="";
	document.getElementById("checkFund").innerHTML="";
	document.getElementById("checkGoods").innerHTML = "";
	document.getElementById("checkGF").innerHTML = "";
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Additional Business Details</title>
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
	<jsp:include page="/Layout/BusinessCustMenu.jsp"/>
	<div id="center">
		<div class="article_wrapper" style="width: 600px;">
					<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
						<p  style ="font-size:20px ; padding-left:15px;padding-top: 5px;padding-bottom:5px;">Additional Business Details</p><br/></br>
				 	</div>
	
		
<form name="registerForm" action="/NexusBankingGroup/CustomerManagementServlet"  onSubmit="return validfunc2()">

<input type="hidden" name="action" value="sendForm2"></input>
<input type="hidden" name="businessName" value=" <%=(String)request.getAttribute("msg")%>"></input>
	
	<%String field=(String)request.getAttribute("field"); %>	
	<%String industrySector=(String)request.getAttribute("industrySector"); %>		
	<%String mainActivity=(String)request.getAttribute("mainActivity"); %>		
	<%String preciseActivity=(String)request.getAttribute("preciseActivity"); %>		
	<%String DoYouRequireFunding=(String)request.getAttribute("DoYouRequireFunding"); %>		
	<%String HowMuchFundingYouRequire=(String)request.getAttribute("HowMuchFundingYouRequire"); %>		
	<%String DoYouImportExportGoods=(String)request.getAttribute("DoYouImportExportGoods"); %>		
	<%String AreYouPartofGroupOrEnterprise=(String)request.getAttribute("AreYouPartofGroupOrEnterprise"); %>		
	<%String franchiseDetails=(String)request.getAttribute("franchiseDetails"); %>
	<%String PleaseEnterDetails=(String)request.getAttribute("PleaseEnterDetails"); %>
	<%String millionPounds=(String)request.getAttribute("millionPounds"); %>
	
	<table style="font-size:12px" width="700px">
		
<tr>
<td colspan="2">Welcome <%=(String)request.getAttribute("msg")%>,<%if(PleaseEnterDetails!=null) { %><%=PleaseEnterDetails %><%} else { %>Please enter the following details<%}%><br/></td>
</tr>


<tr>
<td colspan="2"><font color="red"><%if(field!=null) { %><%=field %><%} else { %>Fields marked with * are mandatory<%}%></font></td>
</tr>

<tr>
<td style="width:200px;"><%if(industrySector!=null) { %><%=industrySector %><%} else { %>Industry Sector<%}%><font color="red">*</font></td><td style="width:500px;"><abbr title="Please enter Industry Sector"><input type="text" name="industrySector" maxlength="50" onblur="validateIndustrySector()" ></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkSector"></label></p></td>
</tr>
    
<tr>
<td><%if(mainActivity!=null) { %><%=mainActivity %><%} else { %>Main Activity<%}%><font color="red">*</font></td><td><abbr title="Please enter Main Activity"><input type="text" name="mainActivity" maxlength="50" onblur="validateActivity()"></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkActivity"></label></p></td>
</tr>

<tr>
<td><%if(preciseActivity!=null) { %><%=preciseActivity %><%} else { %>Precise Activity<%}%><font color="red">*</font></td><td><input type="text" name="preciseActivity" maxlength="50" onblur="validatePreciseActivity()"></input>
<p style="color:red;display:inline;font-size:11px"><label id = "checkPreciseActivity"></label></p></td>
</tr>


    
<tr>
<td style="padding-bottom: 0px; "><%if(DoYouRequireFunding!=null) { %><%=DoYouRequireFunding %><%} else { %>Do you require funding<%}%><font color="red">*</font></td>
<td><abbr title="Please select funding requirements">
<input type="radio" name="requireFunding" value="Yes" onclick="validateFundingFieldYes()"  onblur = "validateFundRequirement()">Yes
<input type="radio" name="requireFunding" value="No"  onclick="validateFundingFieldNo()" onblur = "validateFundRequirement()">No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkRadio"></label></p></td>
</tr>



<tr>
<td><%if(HowMuchFundingYouRequire!=null) { %><%=HowMuchFundingYouRequire %><%} else { %>How much funding do you require?<%}%><font color="red"></font></td>
<td><abbr title="Please enter funding requirements"><input type="text" name="fundAmount" id="funField" maxlength="5" onblur = "validateFund()"></input></abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkFund"></label></p></td>
</tr>

<tr>
<td style="padding-top: 0px;font-size: 10px;">(<%if(millionPounds!=null) { %><%=millionPounds %><%} else { %>IN MILLION POUNDS<%}%>)</td>
</tr>




<tr>
<td><%if(DoYouImportExportGoods!=null) { %><%=DoYouImportExportGoods %><%} else { %>Do you import/export goods?<%}%><font color="red">*</font></td>
<td><abbr title="Please enter select export/import details"><input type="radio" name="goods" value="Yes" onblur="validateGoods()">Yes
<input type="radio" name="goods" value="No" onblur="validateGoods()">No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkGoods"></label></p></td>
</tr>

<tr>
<td><%if(AreYouPartofGroupOrEnterprise!=null) { %><%=AreYouPartofGroupOrEnterprise%><%} else { %>Are you a part of group/enterprise?<%}%><font color="red">*</font></td>
<td><abbr title="Please enter select Group/Franchise details"><input type="radio" name="groupFranchise" value="Yes" onblur=" validateGroupFranchise()">Yes
<input type="radio" name="groupFranchise" value="No" onblur="validateGroupFranchise()">No</abbr>
<p style="color:red;display:inline;font-size:11px"><label id = "checkGF"></label></p></td>
</tr>
 

<tr>
<td><%if(franchiseDetails!=null) { %><%=franchiseDetails %><%} else { %>Franchise Details<%}%><font color="red"></font></td><td><textarea rows="4" cols="20" name="franchiseDetails"></textarea></td>
</tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td></td>
 <td><input type="submit" value="Continue" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="Reset" style="background-color:#5599a7;color:white;padding-left: 5px;padding-right: 5px;" onclick=" return clearBusinessDetails()"></td>
 
 </tr>

</table>
</form>
</div>
</div>
</div>
	
<jsp:include page="/Layout/Footer.jsp"/>

</body>

</html>

