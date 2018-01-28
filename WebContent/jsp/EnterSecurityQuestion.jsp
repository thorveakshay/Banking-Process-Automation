<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%
int i=Integer.parseInt(session.getAttribute("setQuestion").toString());
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter Security Question</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css"
	rel="stylesheet" type="text/css" />


<script type="text/javascript">

function validateQue()
{

	if(document.getElementsByName("selectQuestion1")[0].value=="")
	{

		document.getElementById('que1').style.visibility="visible";
		  document.getElementById('que1').innerHTML="&nbsp;Please select Security Question.";

		document.getElementsByName("selectQuestion1")[0].focus();
		document.getElementsByName("selectQuestion1")[0].value="";
	return false;
	}
	else
	{
		  document.getElementById('que1').innerHTML="";
	}



	 if(document.getElementsByName("answer1")[0].value==0 || document.getElementsByName("answer1")[0].value=="null")
	 {
		  document.getElementById('ans1').style.visibility="visible";
		  document.getElementById('ans1').innerHTML="&nbsp;Please enter the Security Answer.";
	
		document.getElementsByName("answer1")[0].value="";
		document.getElementsByName("answer1")[0].focus();
		return false;
	 }
	 else
	 {
		  document.getElementById('ans1').innerHTML="";
	 }

		if(document.getElementsByName("selectQuestion2")[0].value=="")
		{

			document.getElementById('que2').style.visibility="visible";
			  document.getElementById('que2').innerHTML="&nbsp;Please select Security Question.";

			document.getElementsByName("selectQuestion2")[0].focus();
			document.getElementsByName("selectQuestion2")[0].value="";
		return false;
		}
		else
		{
			  document.getElementById('que2').innerHTML="";
		}

		 if((document.getElementsByName("selectQuestion1")[0].value)==(document.getElementsByName("selectQuestion2")[0].value))
		 {

		
			 document.getElementById('que2').style.visibility="visible";
			  document.getElementById('que2').innerHTML="&nbsp;Please select another Security Question.";
		
			document.getElementsByName("selectQuestion2")[0].value="";
			document.getElementsByName("selectQuestion2")[0].focus();
			return false;

		 }
		 else
		 {
			  document.getElementById('que2').innerHTML="";
		 }


		 if(document.getElementsByName("answer2")[0].value==0 || document.getElementsByName("answer2")[0].value=="null")
		 {
			  document.getElementById('ans2').style.visibility="visible";
			  document.getElementById('ans2').innerHTML="&nbsp;Please enter the Security Answer.";
		
			document.getElementsByName("answer2")[0].value="";
			document.getElementsByName("answer2")[0].focus();
			return false;
		 }
		 else
		 {
			  document.getElementById('ans2').innerHTML="";
		 }


		 var op= confirm("Are you sure you want to proceed ?");
			if(op==true)
			{
				alert("Account party added successfully");
				return true;
			}
			else
				return false;
	 
}

</script>

</head>
<%
 //String partyId=session.getAttribute("partyId");
    //session.setAttribute("partyId",partyId);
%>
<body>
<jsp:include page="../jsp/layout/Header.jsp" />
<form name="askQuestion"  action="<%=request.getContextPath() %>/AccountPartyManagementMainServlet" method="post">
<br/>
<center style="margin-left: 70px;"><font size="5pt" color=black>Add Security Question</font></center>
<br/>
<input type="hidden" name="action" value="enterQuestion"/>
<table id="gradient-style" align="center" 	style="margin-left: 50px; font-size: 2pt;" width="600px">
<tr>
<td colspan="3" align="left"><font color="black">Fields marked with <font color="red"><sup>*</sup> </font>are mandatory.</font></td>
</tr>
<%
if(i==1)
{
%>
 <tr>
 <td width="20%"><b>Select Question</b></td>
 <td><select name="selectQuestion1" title="Please select Security Question.">
 <option value="">Please select your secret question</option>
 <option value="What is your birth place?">What is your birth place?</option>
 <option value="What is your favorite sport?">What is your favorite sport?</option>
 <option value="Where is your nick name?">Where is your nick name?</option>
 <option value="Where is your birth place?">Where is your birth place?</option>
  </select>
  	<label style="visibility:hidden; color:red; font-size:12px;" id="que1"></label>
  
 </td>
 </tr>
 <tr>
 <td><b>
 Answer</b>
 </td>
 <td>
 <input type="text" name="answer1"  title="Please enter Security Answer."/> 	<label style="visibility:hidden; color:red; font-size:12px;" id="ans1"></label>
 </td>
 </tr>

<% 
}
if(i==2)
{
%>
<tr>
 <td><b>Select Question</b></td>
 <td><select name="selectQuestion1" title="Please select Security Question.">
 <option value="">Please select your secret question 1</option>
 <option value="What is your birth place?">What is your birth place?</option>
 <option value="What is your favorite sport?">What is your favorite sport?</option>
 <option value="Where is your nick name?">Where is your nick name?</option>
 <option value="Where is your birth place?">Where is your birth place?</option>
  </select>
   	<label style="visibility:hidden; color:red; font-size:12px;" id="que1"></label>
  
 </td>
 </tr>
 <tr>
 <td><b>
 Answer</b>
 </td>
 <td>
 <input type="text" name="answer1" title="Please enter Security Answer."/>
  	<label style="visibility:hidden; color:red; font-size:12px;" id="ans1"></label>
 </td>
 </tr>
 
<tr>
 <td><b>Select Question</b></td>
 <td><select name="selectQuestion2" title="Please select Security Question.">
 <option value="">Please select your secret question 2</option>
 <option value="What is your birth place?">What is your birth place?</option>
 <option value="What is your favorite sport?">What is your favorite sport?</option>
 <option value="Where is your nick name?">Where is your nick name?</option>
 <option value="Where is your birth place?">Where is your birth place?</option>
  </select>
   	<label style="visibility:hidden; color:red; font-size:12px;" id="que2"></label>
  
 </td>
 </tr>
 <tr>
 <td><b>
 Answer</b>
 </td>
 <td>
 <input type="text" title="Please enter Security Answer."  name="answer2"/>
  	<label style="visibility:hidden; color:red; font-size:12px;" id="ans2"></label>
 
 </td>
 </tr>
 
<%
}
%></table>
<br/>
<table align="center">
<tr>
<td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" style="background-color:black;  color:white" onclick="return validateQue()" color:white" value="Proceed" />
</td>
</tr>
 </table>
</form>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>