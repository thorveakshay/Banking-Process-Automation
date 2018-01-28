<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%><html xmlns="http://www.w3.org/1999/xhtml">

<%@page import="com.training.model.*"%>
<%@page import="java.util.ArrayList.*" %>
 
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
<script type="text/javascript">

function home(){

window.location="<%=request.getContextPath()%>/jsp/ASPHome.jsp";

}


function validateAccSelection()
{
	
	
	 var proName = document.getElementsByName("newProName")[0].value;   
 var lenp=proName.length;
		if(document.getElementsByName("newProName")[0].value=="")
		{
		
			document.getElementById('selectPr').style.visibility="visible";
			  document.getElementById('selectPr').innerHTML="&nbsp;Please select Product.";
		
			document.getElementsByName("newProName")[0].focus();
		return false;
		}
		else
		{
			 document.getElementById('selectPr').innerHTML="";
		}

		var op= confirm("Are you sure you want to proceed ?");
		if(op==true)
		{
			alert("Product switched successfully");
			return true;
		}
		else
			return false;
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Switch Product</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>
 
 
 
<body >

  


<jsp:include page="../jsp/layout/Header.jsp" />
  
   	 <%
 Product pro = new Product();
 Account acc= new Account();
 Business bus = new Business();
 ArrayList<Product> proList=new ArrayList<Product>();
 
acc=(Account)request.getAttribute("accountobj");
System.out.println("acc no in jsp is "+acc.getAccno());

pro =(Product)request.getAttribute("productobj");
System.out.println("pro in jsp "+pro.getName());

bus = (Business)request.getAttribute("bus");
System.out.println("bus name is "+bus.getBusinessName());

proList=(ArrayList<Product>)request.getAttribute("prList");
 
 String message = "No active products found !";

%>
	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
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
		 
		 <%if(proList.size()<=1){ %>
<p style="color:red;margin-top:0px;font-family:verdana;"><%=message %></p> <br/>
<%} %>		
<center><font color=black size="5pt">Switch to New Product</font></center> 

</center>
<br>
<font size="3pt"  >
<form  method="post"   action="/NexusBankingGroup/AmendorSwitchProductServlet"> 
 <table id="gradient-style" align="center" border"1" width="600" style="font-size:2pt;">

<input type="hidden" name="action"   value="switchProduct" /> 
<input type="hidden" name="accid"   value="<%=acc.getId() %>" /> 
<input type="hidden" name="busid"   value="<%=bus.getId() %>" /> 
<input type="hidden" name="acctype"   value="<%=acc.getAcctype() %>" /> 
<input type="hidden" name="ano"   value="<%=acc.getAccno() %>"></input> 

 <tr>
		<td colspan="3" align="left"><font color="black">Fields
		marked with <font color="red"><sup>*</sup> </font>are mandatory.</font></td>
	</tr>
<tr>
	<td><font size ="2pt"><b>Business Name</b></font></td>
	<td><font size ="2pt"><%=bus.getBusinessName()%></font></td>
</tr>
 
<tr>
	<td><font size ="2pt"><b>Business Type</b></font></td>
	<td><font size ="2pt"><%=bus.getBusinessType()%></font></td>
</tr>
<tr>
	<td><font size ="2pt"><b>Account Id</b></font></td>
     	<td><font size ="2pt"><%=acc.getId()%></font></td>
</tr>
 
<tr>
	<td><font size ="2pt"><b>Account Type</b></font></td>
	<td><font size ="2pt"><%=acc.getAcctype()%></font></td>
</tr>
<tr>
	<td><font size ="2pt"><b>Account Number</b></font></td>
	<td><font size ="2pt"><%=acc.getAccno()%></font></td>
</tr>
<tr>
<td><font size ="2pt"><b>Status</b></font></td>
<td><font size ="2pt"><%=acc.getStatus()%></font>
</td>
</tr>

<tr>
<td><font size ="2pt"><b>Account Opening Date</b></font></td>
<td><font size ="2pt"><%=acc.getAod()%></font>
</td>

</tr>
<tr>
 <td width=200><font size ="2pt"><b>Account Closing Date</b></font></td>

<%if(acc.getAcd()==null){ %>
<td><font size ="2pt">N/A</font></td>
<%} %>
<%if(acc.getAcd()!=null){ %>
<td><font size ="2pt"><%=acc.getAcd()%></font></td>
<%} %>
 </tr>
  
<tr>
<td><font size ="2pt"><b>Product ID</b></font></td>
<td><font size ="2pt"><%=pro.getId() %></font></td>	

</tr>
<tr>
<td width=200><font size ="2pt"><b>Product Name</b></font></td>

<td><font size ="2pt">
 <%=pro.getName() %></font>
</td>  

</tr>

<tr>
<td><font size ="2pt"><b>Branch Id</b></font></td>
<td><font size ="2pt"><%=acc.getBranch()%></font></td>	

</tr>

 <tr>

<td><font size ="2pt"><b>Select New Product</b> <font color="red">* </font></font></td>

 <%if(proList.size()<=1){ %> 
<td>
<select name="newProName" id="newProName"  disabled="disabled" >
<option value="">Please select</option>
<%for(Product p:proList)	 
{
%> 
  <option value="<%=p.getId() %>"><%=p.getName() %></option>
 <%}%>

</select>
</td>
 <%} %>

 

 <%if(proList.size()>1){ %> 
<td>
<select name="newProName" id="newProName" title="Please select a Product.">
<option value="">Please select</option>
<%for(Product p:proList)	 
{
%> 
  <option value="<%=p.getId() %>"><%=p.getName() %></option>
 <%}%>

</select><label style="visibility:hidden; color:red; font-size:12px;" id="selectPr"></label>
</td><%} %>


 
</td>



 
 </tr>

<tr>
 
 
 
 
 </table>
<table align="center">
<td>
 
<%if(proList.size()<=1){ %>
 
<input type="submit" style="background-color:black;margin-left:200px;  color:white" name="submit" onclick="return validateAccSelection()" value="Switch Product "  disabled="disabled">
</input>
<%} %>

<%if(proList.size()>1){ %>
<input type="submit" style="background-color:black;margin-left:200px;  color:white" name="submit" onclick="return validateAccSelection()" value="Switch Product " >
</input>
<%}%>

<input type="button"  style="background-color:black;margin-top:20px;margin-left:20px;  color:white" onclick="return home()" value="Cancel" ></input>



</td>
</tr>
 
 </table>
</form>
</font>
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
