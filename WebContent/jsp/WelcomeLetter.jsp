<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.ArrayList" %>
	<%@page import="com.training.model.*" %>
	
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome letter</title>
<script>
function printpage()
  {
  window.print()
  }

function confirmClose()
{
	var x=confirm('Are you sure you want to close the document?');
		if(x)
		{
			window.close();
		}
		else
		{
			
		}
			
}

function callServlet()
{
	 
	window.location="<%=request.getContextPath()%>/RelationshipManagerController?action=pdf";
}
</script>
</head>
<body>

<%ArrayList<Account> accno=(ArrayList<Account>)request.getAttribute("accnumlist");
session.setAttribute("accno",accno);
%>
   
<%String bname=(String)request.getAttribute("custname"); 
session.setAttribute("custname",bname);
%> 

<%CustomerAddress custaddr=(CustomerAddress)request.getAttribute("customeraddrs"); 

session.setAttribute("custaddr",custaddr);
%>


<%int id= (Integer)request.getAttribute("busid");

session.setAttribute("id",id);
%>			
<%String relmgr=(String)request.getAttribute("relmgr");

session.setAttribute("relmgr",relmgr);
%>	
<!-- 
<div align="center">
<img src="<%=request.getContextPath()%>/images/nexusimg.jpg" alt="nexus bank" class=buttondiv align="middle" width="10%" height="20%" />
</div>
<hr></hr> -->
<br><p>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("MMMM d, yyyy"); %>
 <%= df.format(new java.util.Date()) %> </p>
<p><b>Mr.Vishal Tiwari,</b><br>
Account Manager,<br>
Nexus Banking Group,<br>
1 Basinghall Avenue,<br>
London, EC2V 5DD.<br>
<br>
 
</p>

 
<!-- address -->
Dear <b><%=bname%>,</b><br></br>

<%if(null!=custaddr.getBuildingNo()){%><%=custaddr.getBuildingNo()%>,<%} %><%if(null!=custaddr.getBuildingName()) {%><%=custaddr.getBuildingName() %>,<br><%} %>
<%if(null!=custaddr.getStreetName()){ %><%=custaddr.getStreetName() %>,<%} %><%if(null!=custaddr.getTownName()) {%><%=custaddr.getTownName() %><br><%} %>
<%if(null!=custaddr.getCityName()){ %><%=custaddr.getCityName() %>,<%} %><br>
<%if(null!=custaddr.getCountry()){ %><%=custaddr.getCountry() %>-<%} %><%if(null!=custaddr.getPostalCode()){ %><%=custaddr.getPostalCode() %><br></br><%} %>

Thank you for choosing Nexus Banking Group as your Commercial
account opening partner. We are confident that you will be very satisfied with the
banking services that we offer. The information enclosed will help you
to make use of our banking services.<br>

 
Please call <b><%=relmgr %></b>,  your Relationship Manager,
for any further query.
<br/>
Your account details 
<table>
<tr>
<th>Account number</th>
<th>Product intension</th>
<th>Product name</th>
</tr>


<%for(Account acc:accno){%>
<tr>
<td><%=acc.getAccNumber()%></td>
<td><%=acc.getProductIntension()%></td>
<td><%=acc.getProductName()%></td>
</tr>	

<%}%>
</table>
<br/>When you call, 
please have it in hand so that we can accelerate your requests. 
As your banking needs change, we will be pleased to help you assess
those needs and offer you the banking services that will help you to achieve 
your new goals.<br/>
 
<p>
Your Relationship Manager can be reached during regular business hours in the following way:<br/>
Phone: +44 (0)20 7885 8888 <br/>
Website: <font color=blue><u>http://www.nbg.com</u></font><br/>
Email: <font color=blue><u>nbgcontact@nbg.com</u></font>
</p>
Once again, welcome to NBG and thank you for opening an account.
<br><br>
Sincerely,<br/>
<div>
<img src="<%=request.getContextPath()%>/images/signature.png" align="left" width="10%" height="3%" />
</div>
<br/><br/><br/><br/>
<br/><br/>
<div>
Vishal Tiwari,<br>
Account Manager.<br>
</div>
 
<br></br>
<input type="button" value="Print" id="button" style="color:white;border-width:0px;background-color:#5699A7;width:80px;" onclick="printpage()">
<input type="button" value="Close" id="button" style="color:white;border-width:0px;background-color:#5699A7;width:80px;" onclick=" confirmClose()">
<input type="submit" value="Save As PDF" id="button" style="color:white;border-width:0px;background-color:#5699A7;width:80px;" onclick=" callServlet()">

</body>
</html>