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
<%@page import="java.util.ArrayList"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%String srch=(String)session.getAttribute("srch"); %><%if(srch!=null) %><%=srch %><%else { %>
Search<%} %></title>
 
<script src="<%=request.getContextPath() %>/js/SearchCustomerValidation.js"></script>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/tableStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="layout/Header.jsp"></jsp:include>

<div id="main" class="container">+
<jsp:include page="layout/accountMenuHome.jsp"></jsp:include>

<div  id="midtitle" >
	<h2 style="font-size:20px;padding-top:10px;" align="center"><%String srchCust=(String)session.getAttribute("srchCust"); %><%if(srchCust!=null) %><%=srchCust %><%else { %>
	Search Customer<%} %></h2>
	</div>

<div style="height: 464px;" id="resultdiv" >
<form name="searchForm" action="/NexusBankingGroup/SearchCustomerController" onsubmit="return validate();" method="post">
<input type="hidden" name="action" value="SearchDetails"></input>
<%String select=(String)session.getAttribute("select"); %>
<%String reset=(String)session.getAttribute("reset"); %>

<%ArrayList<String>branches=(ArrayList<String>)request.getAttribute("branchList"); %>


<font size="2pt">Fields marked with <font color="red"><sup>*</sup> </font>are mandatory.</font>
<br> 
<table id="middiv">
<tr>
<td>
<%String srchBy=(String)session.getAttribute("srchBy"); %><%if(srchBy!=null) %><%=srchBy %><%else { %>
Search by<%} %>:
</td>
</tr>
<tr>
<td><input type="radio" name="searchOption" onclick="return activateFirst();"/></td>
<td> <%String busName=(String)session.getAttribute("busName"); %><%if(busName!=null) %><%=busName %><%else { %>
Business Name<%} %><font color="red">*</font></td>
<td><input type="text" name="businessName" disabled="disabled" onblur="checkBusinessName()"/></td>
<td id="astric">
			<sup><label id="bb"></label></sup>
		</td>
		
</tr>
<tr>
<td></td><td> <%String brName=(String)session.getAttribute("brName"); %><%if(brName!=null) %><%=brName %><%else { %>
Branch Name<%} %><font color="red">*</font></td>
<td><select name="bBranch" disabled="disabled" id="branchName"/>
	<option value="select" ><%if(select!=null) %><%=select %><%else { %>Select<%} %></option>
	<%for(String branch:branches) { %>
	<option><%=branch %></option>
	<% } %>
	</select></td>
	<td id="astric">
			<sup><label id="bbranch"></label></sup>
		</td>
		
</tr>

<tr>
<td><input type="radio" name="searchOption" onclick="return activateSecond();"></td>
<td>  <%String trName=(String)session.getAttribute("trName"); %><%if(trName!=null) %><%=trName %><%else { %>
Trading Name<%} %><font color="red">*</font></td>
<td><input type="text" name="tradingName" disabled="disabled" onblur="checkTradingName()"/> </td>
<td id="astric">
			<sup><label id="tb"></label></sup>
		</td>

</tr>
<tr>
<td></td>
<td>
 <%if(brName!=null) %><%=brName %><%else { %>
Branch Name
<%} %><font color="red">*</font></td>

<td><select name="tBranch" disabled="disabled" />
	<option value="select"><%if(select!=null) %><%=select %><%else { %>Select<%} %></option>
	<%for(String branch:branches) { %>
	<option><%=branch %></option>
	<% } %>
	</select></td>
	<td id="astric">
			<sup><label id="tbranch"></label></sup>
		</td>
</tr>

<tr>
<td><input type="radio" name="searchOption" onclick="return activateThird();"></td>
<td> <%String accNum=(String)session.getAttribute("accNum"); %><%if(accNum!=null) %><%=accNum %><%else { %>
Account Number<%} %><font color="red">*</font></td>
<td><input type="text" name="accountNo" maxlength="14"  disabled="disabled" onblur="checkAccountNo()"></input></td>
<td id="astric">
			<sup><label id="acno"></label></sup>
		</td>

</tr>

<tr></tr>

<tr> </tr>
<tr>
<td> </td>
<td></td>
</tr>
</table>
<div style="margin-top:10px;margin-left:180px;">
<input type="submit" value=" <%if(srch!=null) %><%=srch %><%else { %>Search<%} %>" id="button">
<input type="reset" value="<%if(reset!=null) %><%=reset %><%else { %>Reset<%} %>" id="button" onclick="return resetFields();">
</div>
</form>
</div>
</div>
<jsp:include page="layout/Footer.jsp"></jsp:include>

</body>
</html>