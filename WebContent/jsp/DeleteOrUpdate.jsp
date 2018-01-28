<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	    <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("user")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.training.model.*"%>
<%@page import ="com.training.constants.CaoConstants.*"%>
<%@page import="java.util.*"%>
<%@page import="com.training.services.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Or Update Product</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/ProductDeleteUpdateValidation.js">
</script>
<!-- Date Picker  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/images/themes/base/jquery-ui.css" /> 
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>  

 <script>  $(function() {    $( "#datepicker" ).datepicker({dateFormat: "yy/mm/dd"});  }); 
 </script>
<script>
function confirmdelete()
{
	
	
	if(confirm("Are you sure you want to delete the product?"))
		{
		document.ProductsAdd.submit();
		return true;
	}
	else
	{
	return false;
	}

}
function confirmupdate()
{
	if(Valid()==true)
	{
		if(confirm("Are you sure you want to update the product ?"))
		{
		document.ProductsAdd.submit();
		return true;
		}
		else
		{
		return false;
		}
	}
else
{
return false;
}
}
</script>
</head>

<body>
	<jsp:include page="layout/Header.jsp"/>
<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="layout/Menu.jsp"/>
	
	
	
	
		<%Product p=(Product)request.getAttribute("product");%>
		<%List<BusinessType> totalbtList=p.getBusinessTypeList();%>
		<%List<AdditionalProduct> totalapList=p.getAdditionalProduct();%>
		<%List<BusinessType> btList=(List<BusinessType>)request.getAttribute("business");%>
		<%List<AdditionalProduct> apList=(List<AdditionalProduct>)request.getAttribute("additional");%>
		<div id="midtitle">
			<h2 style="font-size:20px;padding-top:10px; text-align:center;">Delete Or Update Product</h2>
		</div>
		
<div style="height:400px;margin-left:230px" >		
<form name ="ProductsAdd"  method="POST" action="/NexusBankingGroup/ProductServlet" >  
	
	
	
		<h5>Fields marked <sup id="astric">* </sup>are mandatory</h5>
	
		
	<table style="font-size:15px;text-align:left;" cellspacing="10px" align="left">
		
		
	<tr>
		<td>
Product Id 
		</td>
	
		<td>
		<abbr title="Please enter product id">	<input type = "hidden" name = "ProductId"  size="4"
	value="<%=p.getProductId()%>" readonly="readonly"	onchange="checkid()"></abbr>
		<label><%=p.getProductId()%></label>
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="pid"></label></sup></p>
		</td>
		</tr>
	<tr>
		<td>
Product Name <sup id="astric">*</sup>
		</td>
		<td>
	
	<abbr title="Please enter product name">	<input type = "text" name = "ProductName" 
value="<%=p.getProductName()%>"	size="31" onBlur="checkname()"></abbr>
		
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="pname"></label></sup></p>
		
		
		</td>
		
	</tr>
	
	<tr>
		<td>
Product Description 
		</td>
		<td>
	<abbr title="Please enter product description"><textarea  name="ProductDescription" cols="24"  ><%if(p.getDescription()!=null){p.getDescription();}%></textarea></abbr>
		
		</td>
	</tr>
	
	<tr>
		<td>

Account Type <sup id="astric">*</sup>
		</td>
		<td>
		<abbr title="Please select account type"><select name="AccountType" onBlur="checkaccount()">
		<option value="selectat">-Select Account Type-</option>
		<option value="Current Account" <%if("Current Account".equalsIgnoreCase(p.getAccountType())){out.println("selected");}%>> Current Account </option>
		<option value="Savings Account" <%if("Savings Account".equalsIgnoreCase(p.getAccountType())){out.println("selected");}%>> Savings Account  </option>
		</select>
	</abbr>
	<p style="display:inline;font-size:13px"><sup id="astric"><label id="account"></label></sup></p>
</td>
</tr>	
	<tr>
				<td>
Business Type <sup id="astric">*</sup>
		</td>
		<td>
		<abbr title="Please select Business type"><select multiple name="BusinessType"  onBlur="checkcustomer()">
		<option value="selectct">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Select Business Type- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
		<%for(BusinessType bt:btList) {%>
		<option style="font-size:13px"  <%for(BusinessType b:totalbtList){if(b.getBusinessName().equals(bt.getBusinessName())){out.println("selected");break;}} %>><%=bt.getBusinessName()%></option>
		<%}%>
		</select>
		</abbr>	
		
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="customer"></label></sup></p>
			
		
		</td>
		
	 
	</tr>
	<tr>
		<td>
Valid From <sup id="astric">*</sup>
		</td>
		
		<td> <input type="text" name="bar" id="datepicker" onBlur="return checkdate()" value="<%=p.getValidFrom()%>"/>
		
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="datevalid"></label></sup></p>
		
				
		</td>
		</tr>
		
		<tr>	
			<td>
Status <sup id="astric">*</sup>
		</td>
		<td>
		<abbr title="Please select status" >
		<input type = "radio" name = "Status" value="Active" <%if("Active".equalsIgnoreCase(p.getStatus())){out.println("checked");} %>  onBlur="checkstatus()">Active
		<input type = "radio" name = "Status" value="Inactive" <%if("Inactive".equalsIgnoreCase(p.getStatus())){out.println("checked");} %>     onBlur="checkstatus()" >Inactive
		</abbr>
		
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="pstatus"></label></sup></p>
		
		</td>
				
		</tr>
		
<tr>
	<td>
Additional Product(s) </td>
	<td>
	<table>
	
		<%for(int i=0;i<apList.size();i++) {%>
		<tr>
		<td>
		<input type="checkbox" name="AdditionalProduct" value="<%=apList.get(i).getApId()%>" <%for(AdditionalProduct ap:totalapList){if(ap.getApId()==apList.get(i).getApId()){out.println("checked");break;}} %>><span style="font-size:13px"><%=apList.get(i).getApName()%></span>
		</td>
		<%if(++i<apList.size()){ %>
		<td>
		<input type="checkbox"  name="AdditionalProduct" value="<%=apList.get(i).getApId()%>" <%for(AdditionalProduct ap:totalapList){if(ap.getApId()==apList.get(i).getApId()){out.println("checked");break;}} %> ><span style="font-size:13px"><%=apList.get(i).getApName()%></span>
		</td>
		<%} %>
		</tr>
		<%}%>
	</table>
	
	</td>
		</tr>
<tr>	

		<td></td>		
		<td>
		
		<input type="Submit" name="action"  value="Update"  id="button" onclick="return confirmupdate()">
		<input   type="Submit" name="action" value="Delete" id="button" onclick="return confirmdelete()">
		<input type="button" value="Cancel" id="button" onclick="window.location.href='/NexusBankingGroup/ProductServlet?action=viewProduct'">
	
	<!-- 	<input type="Reset"  value="Reset" id="button" > -->
		</td>
</tr>		
	
	
</table>
		</form>	

		
		</div>
	</div>	
	

	<jsp:include page="layout/Footer.jsp" />	
		
		
	</body>
</html>