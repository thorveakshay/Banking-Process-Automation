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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View And Modify</title>
<link href="../css/common.css" rel="stylesheet" type="text/css" />

</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
	<!-- Start Main Content -->
	<div id="main" class="container">
	
		<div >
			<h2 align="center" style="font-size:18px">BUSINESS CUSTOMER REGISTRATION</h2>
			<br/>
<table border="1" align="center" style="font-size:12px">
<tr>
<td>Business Name :</td><td> Tata Consultancy Services </td>
</tr>
    
<tr>
<td>Trading Name :</td><td> TCS </td>
</tr>
    
<tr>
<td>Start-up business :</td><td> No</td>
</tr>

<tr>
<td>Establishment Date :</td><td> 12 Jan 1990 </td>
<td>
</tr>


<tr>
<td>Expected Annual Turnover :</td><td> 500</td>
</tr>

<tr>
<td>Business Status :</td><td> Active</td> 
</tr>

<tr>
<td>Does your business require funding :</td><td> Yes </td>
</tr>
     
<tr><td>Number of employees :</td><td> 269000</td>
</tr>

<tr>
<td>Country of Registration :</td><td> India</td>
</tr>

<tr>
<td>Contact Number :</td><td> 9463542342</td>
</tr>

<tr><td>Contact Number(FAX) :</td><td> 499-5447824274</td><td></td>
</tr>
 </table>
 
 <br/>
<p align="center" style="padding-left: 170px">
    <input type="submit" value="Back"></input>
</p>
<br/>
		
		</div>
	</div>
	


<jsp:include page="/Layout/Footer.jsp"/>

</body>
</html>