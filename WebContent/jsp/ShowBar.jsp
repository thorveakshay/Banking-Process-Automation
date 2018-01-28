<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.BusinessCustomer"%><html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bar Chart</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<%
ArrayList<BusinessCustomer> blist=new ArrayList<BusinessCustomer>();

blist=(ArrayList<BusinessCustomer>) session.getAttribute("blist");

ArrayList<Long> accountCountPercentage = new ArrayList<Long>();
accountCountPercentage =(ArrayList<Long>)session.getAttribute("accountCountPercentage");
%>


</head>
<% 
String j=(String)session.getAttribute("j").toString();
System.out.println("value of j"+j);
int k=Integer.parseInt(j);
String custId=(String)session.getAttribute("custId");
String custMonth=(String)session.getAttribute("custMonth");
String custYear=(String)session.getAttribute("custYear");
String month=(String)session.getAttribute("month");
String currentMonth=(String)session.getAttribute("currentMonth");
String year=(String)session.getAttribute("year");
String year1=(String)session.getAttribute("year1");
String custName=(String)session.getAttribute("custName"); 
%>
<body>
<jsp:include page="layout/Header.jsp"/>

<!-- Start Main Content -->
	<div id="main" class="container">
<jsp:include page="layout/accountMenuHome.jsp"/>

<center>
<%if(k==1)
{ %><font size="3pt">
<B>Accounts of Business Customer - <%=custName+"("+custId+")" %></B></font>
<%} %>

<%if(k==2)
{%>
<font size="3pt">
<B>Accounts opened in <%=currentMonth+","+year %></B></font>
<%} %>

<%if(k==3)
{%>
<font size="3pt"><B>Accounts opened in <%=year1 %></B></font>
<%} %>
<%if(k==9)
{ %><font size="3pt">
<B>Account distribution (in numbers) till <%=session.getAttribute("todayDate")%></B></font>
<%} %>

</center>
<br/>
<br/>
<form name="showpie" action="/NexusBankingGroup/GenerateReportServlet">
<input type="hidden" name="action" value="ClosePie"></input>
<table align="center">

<IMG SRC="/NexusBankingGroup/GenerateReportServlet?action=viewBarChart" WIDTH="600" HEIGHT="400" BORDER="0" onerror="this.src = 'images/recNotFound.JPG'"></img>
</table>
<br/>
<center>
<input type="submit" value="Close" />
</center>
</form>
</div>

<jsp:include page="layout/Footer.jsp"/>

</body>
</html>