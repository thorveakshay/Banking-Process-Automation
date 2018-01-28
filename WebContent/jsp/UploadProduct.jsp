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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Product(s)</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function checkFile()
{
	var check_file=document.forms["uploadForm"]["uploadfile"].value;
	var x=document.getElementById("productFile");
	x.innerHTML="";
	if(check_file.match(/xls$/))
	{
		if(confirm("Are you sure to upload the file ?"))
		{
			document.productFile.productFile.submit();
			return true;
		}
		else 
		{
			return false;
		}	
	}
	else
	{
		x.innerHTML="Please select Document in .xls format only";
		return false;
	}
}
function resetvalue()
{	var x=document.getElementById("productFile");
	x.innerHTML="";
}

</script>
</head>
<body>

<jsp:include page="layout/Header.jsp"/>
<!-- Start Main Content -->

	<div id="main" class="container" style="height:500px">
<jsp:include page="layout/Menu.jsp"/>

<div id="midtitle" >
<h2 style="font-size:20px;padding-top:10px" align="center">Upload Product</h2>
</div>	


<form  style="margin-left:230px" method="post" name="uploadForm" 
action="/NexusBankingGroup/UploadServlet"  enctype="multipart/form-data">



<table align="left" id="middiv" style="margin-top: 50px">
<tr>
<td>
Select Document(In .xls format)&nbsp;
</td>
<td><input type="file"  name="uploadfile"></input>
<p style="display:inline;font-size:13px"><sup id="astric"><label id="productFile"></label></sup></p>
</td>
</tr>


<tr height="50px">
<td></td>
<td><input type="submit"  name="action" value="Upload" id="button" onclick="return checkFile()">
<input type="reset" value="Reset" id="button" onclick="return resetvalue()" ></td>

</tr>
</table>
</form>
</div>

<div style="margin-top:20px">
<jsp:include page="layout/Footer.jsp" />
</div>

</body>
</html>