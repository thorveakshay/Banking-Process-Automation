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
<title>Add Product</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
<script src="<%=request.getContextPath()%>/js/ProductAddValidation.js"></script>
<!-- Date Picker  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/images/themes/base/jquery-ui.css" /> 
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>  

 <script>  $(function() {    $( "#datepicker" ).datepicker({dateFormat: "yy/mm/dd"});  }); 
 </script>
</head>
<body>


	<jsp:include page="layout/Header.jsp"/>
			

<!-- Start Main Content -->
	<div id="main" class="container">
	<jsp:include page="layout/Menu.jsp"/>
		<div>
		<%Product p=(Product)request.getAttribute("product");%>
		<%List<BusinessType> btList=p.getBusinessTypeList();%>
		<%List<AdditionalProduct> apList=p.getAdditionalProduct();%>
	
		<div id="midtitle">
			<h2 style="font-size:20px;padding-top:10px; text-align:center;"> 
			<%String addProduct=(String)session.getAttribute("addProduct"); %>
			<%if(addProduct!=null) %><%=addProduct %><%else { %>Add Product<%} %></h2>
		</div>

		
			
<div style="height:400px;margin-left:230px" >
	<form  name="ProductsAdd" action="/NexusBankingGroup/ProductServlet" onSubmit="return Validation()">  
	<input type="hidden" name="action" value="addProductDetails"></input>
	
<%String submit=(String)session.getAttribute("submit"); %>

<%String reset=(String)session.getAttribute("reset"); %>
	<div id="divt">
		<h5>
		<%String field=(String)session.getAttribute("field"); %>
			<%if(field!=null) %><%=field %><%else { %>Fields marked<%} %> <sup id="astric">* </sup>
			<%String mandatory=(String)session.getAttribute("mandatory"); %>
			<%if(mandatory!=null) %><%=mandatory %><%else { %>are mandatory<%} %></h5>
	</div>
		
	<table style="font-size:15px;text-align:left;" cellspacing="10px" align="left">
		
		
	<tr>
		<td>
	<%String productID=(String)session.getAttribute("productID"); %>
			<%if(productID!=null) %><%=productID %><%else { %>Product Id <%} %><sup id="astric">*</sup>
		</td>
	
		<td>
		<abbr title="<%String pleaseProId=(String)session.getAttribute("pleaseProId"); %>
			<%if(pleaseProId!=null) %><%=pleaseProId %><%else { %>Please enter product id<%} %>">	<input type = "text" name = "ProductId"  size="4" maxlength="4"
		onBlur="checkid()"></abbr>
		
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="pid"></label></sup></p>
		</td>
		</tr>
	<tr>
		<td>
<%String proName=(String)session.getAttribute("proName"); %>
			<%if(proName!=null) %><%=proName %><%else { %>Product Name <%} %><sup id="astric">*</sup>
		</td>
		<td>
	
	<abbr title="<%String pleaseProName=(String)session.getAttribute("pleaseProName"); %>
			<%if(pleaseProName!=null) %><%=pleaseProName %><%else { %>Please enter product name<%} %>	">
			<input type = "text" name = "ProductName" 
	size="31" onBlur="checkname()"/></abbr>
		
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="pname"></label></sup></p>
		
		
		</td>
		
	</tr>
	
	<tr>
		<td>
<%String proDesc=(String)session.getAttribute("proDesc"); %>
			<%if(proDesc!=null) %><%=proDesc %><%else { %>Product Description <%} %>
		</td>
		<td>
	<abbr title="<%String plsProDesc=(String)session.getAttribute("plsProDesc"); %>
			<%if(plsProDesc!=null) %><%=plsProDesc %><%else { %>Please enter product description<%} %>"><textarea  name="ProductDescription" cols="24"  ></textarea></abbr>
		
		</td>
	</tr>
	
	<tr>
		<td>
<%String accType=(String)session.getAttribute("accType"); %>
			<%if(accType!=null) %><%=accType %><%else { %>Account Type <%} %><sup id="astric">*</sup>
		</td>
		<td>
		<abbr title="<%String plsAccType=(String)session.getAttribute("plsAccType"); %>
			<%if(plsAccType!=null) %><%=plsAccType %><%else { %>Please select account type<%} %>"><select name="AccountType" onBlur="checkaccount()">
		<option value="selectat"><%String accTypeField=(String)session.getAttribute("accTypeField"); %>
			<%if(accTypeField!=null) %><%=accTypeField %><%else { %>Select Account Type<%} %></option>
		<option><%String currAcc=(String)session.getAttribute("currAcc"); %>
			<%if(currAcc!=null) %><%=currAcc %><%else { %> Current Account  <%} %> </option>
		<option><%String savAcc=(String)session.getAttribute("savAcc"); %>
			<%if(savAcc!=null) %><%=savAcc %><%else { %>  Savings Account <%} %> </option>
	</select>
	</abbr>
	<p style="display:inline;font-size:13px"><sup id="astric"><label id="account"></label></sup></p>
	
</td>
</tr>	
	<tr>
		<td>
<%String busType=(String)session.getAttribute("busType"); %>
			<%if(busType!=null) %><%=busType %><%else { %>Business Type <%} %><sup id="astric">*</sup>
		</td>
		<td>
		<abbr title="<%String plsBusType=(String)session.getAttribute("plsBusType"); %>
			<%if(plsBusType!=null) %><%=plsBusType %><%else { %>Please select Business type<%} %>"><select multiple name="BusinessType"  onBlur="checkcustomer()">
		<option value="selectct" selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%String busTypeField=(String)session.getAttribute("busTypeField"); %>
			<%if(busTypeField!=null) %><%=busTypeField %><%else { %>-Select Business Type- <%} %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
		<%for(BusinessType bt:btList) {%>
		<option style="font-size:13px" ><%=bt.getBusinessName() %></option>
		<%}%>
		</select>
		</abbr>	
		
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="customer"></label></sup></p>
			
		
		</td>
		
	 
	</tr>
	<tr>
		<td>
	<%String validFrom=(String)session.getAttribute("validFrom"); %>
			<%if(validFrom!=null) %><%=validFrom %><%else { %>Valid From<%} %> <sup id="astric">*</sup>
		</td>
	
		<td> <input type="text" id="datepicker" name="bar" onchange="checkdate()" />
		
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="datevalid"></label></sup></p>
		
				
		</td>
		</tr>
		
		<tr>	
			<td>
	<%String status=(String)session.getAttribute("status"); %>
			<%if(status!=null) %><%=status %><%else { %>Status <%} %><sup id="astric">*</sup>
		</td>
		<td>
		<abbr title="<%String plsStatus=(String)session.getAttribute("plsStatus"); %>
			<%if(plsStatus!=null) %><%=plsStatus %><%else { %>Please select status<%} %>" >
		<input type = "radio" name = "Status" value="Active"onBlur="checkstatus()">
		<%String actv=(String)session.getAttribute("actv"); %>
			<%if(actv!=null) %><%=actv %><%else { %>Active<%} %>
		<input type = "radio" name = "Status" value="Inactive" onBlur="checkstatus()" >
		<%String inactv=(String)session.getAttribute("inactv"); %>
			<%if(inactv!=null) %><%=inactv %><%else { %>Inactive<%} %>
		</abbr>
		
		<p style="display:inline;font-size:13px"><sup id="astric"><label id="pstatus"></label></sup></p>
		
		</td>
				
		</tr>
		
<tr>
	<td>
	<%String addtionalPro=(String)session.getAttribute("addtionalPro"); %>
			<%if(addtionalPro!=null) %><%=addtionalPro %><%else { %>Additional Product(s)<%} %> </td>
	<td>
	<table>
	
		<%for(int i=0;i<apList.size();i++) {%>
		<tr>
		<td>
		<input type="checkbox"  name="AdditionalProduct" value="<%=apList.get(i).getApId()%>"><span style="font-size:13px"><%=apList.get(i).getApName()%></span>
		</td>
		<%if(++i<apList.size()){ %>
		<td>
		<input type="checkbox"  name="AdditionalProduct" value="<%=apList.get(i).getApId()%>"><span style="font-size:13px"><%=apList.get(i).getApName()%></span>
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

		<font color="white"><input type="submit"  value="<%if(submit!=null) %><%=submit %><%else { %>Submit<%} %>"  id="button">
		<input type="reset"  value="<%if(reset!=null) %><%=reset %><%else { %>Reset<%} %>" id="button" onclick="resetdata()" />
			</font>
		</td>
</tr>		
		
		</table>
		
		</form>
	
		
		
		</div>
		</div>
	</div>	
		
	
<jsp:include page="layout/Footer.jsp" />	
		
		
	</body>
</html>