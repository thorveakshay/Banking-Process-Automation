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
<title>Set Password</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css" />
<script>
function submitPasswordForm()
{
	if(validatePassword1()==false)
	{
		document.forms["setPasswordForm"]["password1"].focus();
		return false;
	}
	if(validatePassword2()==false)
	{
		document.forms["setPasswordForm"]["password2"].focus();
		return false;
	}
	if(validateQuestion()==false)
	{
		document.forms["setPasswordForm"]["SecurityQuestion"].focus();
		return false;
	}
	if(validateAnswer()==false)
	{
		document.forms["setPasswordForm"]["answer"].focus();
		return false;
	}
}



function validatePassword1()
{
	var x=document.forms["setPasswordForm"]["password1"].value;
	var check=document.getElementById("checkPassword1");
	check.innerHTML  = "";
	if(x=="" || x==null )
	  {
		 check.innerHTML ="Please enter a password";
	     return false;
	  }
	if(x.length>30)
	  {
		 check.innerHTML ="Please enter a password less than 30 characters";
	     return false;
	  }
	return true;
}

function validatePassword2()
{
	var x=document.forms["setPasswordForm"]["password2"].value;
	var check=document.getElementById("checkPassword2");
	check.innerHTML  = "";
	if(x=="" || x==null )
	  {
		 check.innerHTML ="Please enter a password";
	     return false;
	  }
	if(x.length>30)
	  {
		 check.innerHTML ="Please enter a password less than 30 characters";
	     return false;
	  }
	return true;
}

function validateQuestion()
{
	var x=document.forms["setPasswordForm"]["SecurityQuestion"].value;
	var check=document.getElementById("checkQuestion");
	check.innerHTML  = "";
	if(x==0)
	  {
		 check.innerHTML ="Please select a Security Question";
	     return false;
	  }
	  return true;
}

function validateAnswer()
{
	var x=document.forms["setPasswordForm"]["answer"].value;
	var check=document.getElementById("checkAnswer");
	check.innerHTML  = "";
	if(x=="" || x==null)
	{
		 check.innerHTML ="Please select a Security Answer";
	     return false;
	}
	return true;
}

</script>
<style>
td {
	padding-left: 0px;
	padding-right: 50px;
	padding-top: 5px;
	padding-bottom: 5px;
}
</style>

</head>
<body>
<%String msg=(String)request.getAttribute("msg"); %>
<jsp:include page="/Layout/Header.jsp" />
<!-- Start Main Content -->
<div id="main" class="container">

<div id="center">
<div class="article_wrapper" style="width: 600px; height: 210px">
<div
	style="color: white; background-color: #5599a7; height: 35px; width: 400px">
<p
	style="font-size: 20px; padding-left: 10px; padding-top: 5px; padding-bottom: 5px">SET
PASSWORD</p>
<br />
</div>

<form action="/NexusBankingGroup/LoginServlet" name="setPasswordForm" onsubmit="return submitPasswordForm();">
<input type="hidden" name="message" value="ChangePassword"></input>
<table>
	<tr>
	<td colspan="2"><font color="red">Fields marked with * are mandatory</font></td>
	</tr>
	<tr>
		<td>New Password<font color="red">*</font></td>
		<td><input type="password" name="password1" onblur="validatePassword1()"><font color="red"><label id="checkPassword1"></label></font></td>
	</tr>
	<tr>
		<td>Retype Password<font color="red">*</font></td>
		<td><input type="password" name="password2" onblur="validatePassword2()"></input>&nbsp;&nbsp;<font color="red"><label id="checkPassword2"><%if(msg!=null) {%><%=msg %><%} %></label></font></td>
	</tr>
	<tr>
		<td>Select Security Question<font color="red">*</font></td>
		<td><select name="SecurityQuestion" onblur="validateQuestion()">
			<option value="0">--Please Select--</option>
			<option value="What is your favorite pet name ?">Whats your
			favorite pet name ?</option>
			<option value="Who is your actor ?">Who is your actor ?</option>
			<option value="What is your favorite color">What is your
			favorite color ?</option>
		</select><font color="red"><label id="checkQuestion"></label></font></td>
	</tr>
	<tr>
		<td>Your Answer<font color="red">*</font></td>
		<td><input type="text" name="answer" onblur="validateAnswer()"></input><font color="red"><label id="checkAnswer"></label></font></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Submit"></input></td>
	</tr>
	
</table>
</form>

</div>
</div>
</div>



<jsp:include page="/Layout/Footer.jsp" />
</body>
</html>