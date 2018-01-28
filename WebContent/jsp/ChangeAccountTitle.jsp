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

<script type="text/javascript">



function home(){

window.location="<%=request.getContextPath()%>/jsp/ASPHome.jsp";

}

function validate_accno()
{		

	
	var accno = document.getElementsByName("getAccNo")[0].value;   
	 
	 if(document.getElementsByName("getAccNo")[0].value=="")
	 {
		 document.getElementById('selectAc').style.visibility="visible";
		  document.getElementById('selectAc').innerHTML="&nbsp;Please select an Account Number.";
	
	
		document.getElementsByName("getAccNo")[0].focus();
		
		return false;
	 }
	 else
	 {
		  document.getElementById('selectAc').innerHTML="";
	 }
			
	
	return true;
	
}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Select Account</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>

 

<body >


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
				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->
		<center>
		 <font size="4pt"  > <%if(message!=null){%>
<p style="color:red;margin-top:0px;font-family:verdana;"><%=message %></p><br/>
<%} %>
<div style="margin-top:0px;margin-left:250px;font-family:verdana;">
		 <center><font size="5pt" color=black align="center">Change Account Title
		  </font></center>
</div>
<br>

 

<form  method="post"   action="/NexusBankingGroup/AmendorSwitchProductServlet"> 
 
<table id="gradient-style" style="margin-left: 100px; font-size:2pt;" width="600px">

<input type="hidden" name="action" value="accno"/>
<tr>
<td colspan="3" align="left"><font color="black">Field marked with <font color="red"><sup>*</sup> </font>is mandatory.</font></td>
</tr>

 <tr>
	<td align="left"><font size="2pt"><b>Business Customer ID</b></font></td>
   	 <td align="left"><font size="2pt"><%=busid %></font></td>
</tr>
<td align="left"><font size="2pt"><b>Business Name</b></font></td>
<td align="left"><font size="2pt"><%=busname %>
</td>
</tr>
 
<tr>
	<td align="left"><font size="2pt"><b>Account Party ID</b></font></td>
     	<td align="left"><font size="2pt">
		<%=accpid %></font>
	</td>
</tr>

<tr>
	<td align="left"><font size="2pt"><b>Account Party Name</b></font></td>
     	<td align="left"><font size="2pt">
		<%=accpName %></font>
	</td>
</tr>

<tr>
	<td align="left" width=170><font size="2pt"><b>Relationship with Business</b></font></td>
	<td align="left"><font size="2pt"><%=relationshipType %></font></td>
</tr>
 <tr>
 <td align="left"><font size="2pt"><b>Select Account no. <font color="red"><sup>*</sup></font></b></font></td>
<%if(aclist.size()!=0){ %>
<td align="left"><font size="2pt"><select name="getAccNo" id="getAccNo" title="Please select an Account Number.">
<option value="">Select Account Number</option>
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
<td ><font size="2pt"><select name="getAccNo" id="getAccNo" disabled="disabled" title="Please select an Account Number.">

<option value="">Select Account Number<font color="red"><sup>*</sup></font></option>
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
<%if(aclist.size()!=0){ %>
<td align="left">  
	<hr><input type="submit" style="background-color:black;  color:white" onclick="return validate_accno()"  value="Get Account Details" align="center"></td>
<%}%>
<%if(aclist.size()==0){ %>
<td> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" style="background-color:black;  color:white" onclick="return validate_accno()" value="Get Account Details" disabled="disabled"></td>
<%}%>

<td>
 <hr>  
&nbsp;&nbsp;&nbsp;<input type="reset" style="background-color:black;  color:white;" onclick="return home()"  value="Cancel"></td>


</tr>


 
 

</table>
</form>
   	
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
