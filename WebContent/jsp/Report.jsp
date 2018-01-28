 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="java.util.ArrayList"%>
<%@page import="com.training.model.BusinessCustomer"%><html>
<head>

<script type="text/javascript">

function resetPage()
{
	document.forms["myFormNew"]["CustId"].disabled=true;
 	document.forms["myFormNew"]["custMonth"].disabled=true;
 	document.forms["myFormNew"]["custYear"].disabled=true;

 	document.forms["myFormNew"]["month"].disabled=true;
 	document.forms["myFormNew"]["year"].disabled=true;
 	
 	document.forms["myFormNew"]["year1"].disabled=true;
 	document.getElementById('bsName').innerHTML="";
	document.getElementById('custMnth').innerHTML="";
	document.getElementById('custYr').innerHTML="";
	document.getElementById('mnth').innerHTML="";
	document.getElementById('yr').innerHTML="";
	document.getElementById('yr1').innerHTML="";
	document.getElementsByName("CustId")[0].value="";
	document.getElementsByName("custMonth")[0].value="";
	document.getElementsByName("custYear")[0].value="";
	document.getElementsByName("month")[0].value="";
	document.getElementsByName("year")[0].value="";
	document.getElementsByName("year1")[0].value="";
 	return true;
}
function checkId()
{
	document.forms["myFormNew"]["CustId"].disabled=false;
 	document.forms["myFormNew"]["custMonth"].disabled=false;
 	document.forms["myFormNew"]["custYear"].disabled=false;

 	document.forms["myFormNew"]["month"].disabled=true;
 	document.forms["myFormNew"]["year"].disabled=true;
 	
 	document.forms["myFormNew"]["year1"].disabled=true;
 	document.getElementById('bsName').innerHTML="";
	document.getElementById('custMnth').innerHTML="";
	document.getElementById('custYr').innerHTML="";
	document.getElementById('mnth').innerHTML="";
	document.getElementById('yr').innerHTML="";
	document.getElementById('yr1').innerHTML="";
	document.getElementsByName("CustId")[0].value="";
	document.getElementsByName("custMonth")[0].value="";
	document.getElementsByName("custYear")[0].value="";
	document.getElementsByName("month")[0].value="";
	document.getElementsByName("year")[0].value="";
	document.getElementsByName("year1")[0].value="";
 	return true;
}

function checkMonth()
{
	document.forms["myFormNew"]["CustId"].disabled=true;
 	document.forms["myFormNew"]["custMonth"].disabled=true;
 	document.forms["myFormNew"]["custYear"].disabled=true;

 	document.forms["myFormNew"]["month"].disabled=false;
 	document.forms["myFormNew"]["year"].disabled=false;
 	
 	document.forms["myFormNew"]["year1"].disabled=true;
 	document.getElementById('bsName').innerHTML="";
	document.getElementById('custMnth').innerHTML="";
	document.getElementById('custYr').innerHTML="";
	document.getElementById('mnth').innerHTML="";
	document.getElementById('yr').innerHTML="";
	document.getElementById('yr1').innerHTML="";
	document.getElementsByName("CustId")[0].value="";
	document.getElementsByName("custMonth")[0].value="";
	document.getElementsByName("custYear")[0].value="";
	document.getElementsByName("month")[0].value="";
	document.getElementsByName("year")[0].value="";
	document.getElementsByName("year1")[0].value="";
 	return true;
}

function checkYear()
{
	document.forms["myFormNew"]["CustId"].disabled=true;
 	document.forms["myFormNew"]["custMonth"].disabled=true;
 	document.forms["myFormNew"]["custYear"].disabled=true;

 	document.forms["myFormNew"]["month"].disabled=true;
 	document.forms["myFormNew"]["year"].disabled=true;
 	
 	document.forms["myFormNew"]["year1"].disabled=false;
 	document.getElementById('bsName').innerHTML="";
	document.getElementById('custMnth').innerHTML="";
	document.getElementById('custYr').innerHTML="";
	document.getElementById('mnth').innerHTML="";
	document.getElementById('yr').innerHTML="";
	document.getElementById('yr1').innerHTML="";
	document.getElementsByName("CustId")[0].value="";
	document.getElementsByName("custMonth")[0].value="";
	document.getElementsByName("custYear")[0].value="";
	document.getElementsByName("month")[0].value="";
	document.getElementsByName("year")[0].value="";
	document.getElementsByName("year1")[0].value="";
	
 	return true;
}

function validateSel()
{

	var listItemArray = document.getElementsByName("radId");
	var flag=0;

	//alert("len is "+listItemArray.length); 
		 for (var i=0; i<listItemArray.length; i++) 
		 {
		  var listItem = listItemArray[i];
		  if ( listItem.checked==true) 
		  {
			flag=1;
			break;
		        //  return true;

		  }
		 

		 }


		 //alert("flag value is : "+flag);
		 

	if(flag==0)
	{
		document.getElementById('radioCheck').style.visibility="visible";
		document.getElementById('radioCheck').innerHTML="&nbsp;Please select one of the report criteria.";
		
		//alert("u r wrong");
		
		return false;
	}
	else
	{
			
		document.getElementById('radioCheck').innerHTML="";
		
	}

	document.getElementById('radioCheck').innerHTML="";
	
	
	if(document.myFormNew.radId[0].checked==true)
	{
		
		if(document.getElementsByName("CustId")[0].value=="")
		{
			
			document.getElementById('bsName').style.visibility="visible";
			  document.getElementById('bsName').innerHTML="&nbsp;Please select Business Name.";
		
			document.getElementsByName("CustId")[0].focus();
			document.getElementsByName("CustId")[0].value="";
		return false;
		}
		else
		{
			document.getElementById('bsName').innerHTML="";
		}

	if(document.getElementsByName("custMonth")[0].value=="")
	{
	
		document.getElementById('custMnth').style.visibility="visible";
		  document.getElementById('custMnth').innerHTML="&nbsp;Please select a Month.";
	
		document.getElementsByName("custMonth")[0].focus();
		document.getElementsByName("custMonth")[0].value="";
	return false;
	}
	else
	{
		document.getElementById('custMnth').innerHTML="";
	}

	if(document.getElementsByName("custYear")[0].value=="")
	{
	
		document.getElementById('custYr').style.visibility="visible";
		  document.getElementById('custYr').innerHTML="&nbsp;Please select a Year.";
	
		document.getElementsByName("custYear")[0].focus();
		document.getElementsByName("custYear")[0].value="";
	return false;
	}
	else
	{
		document.getElementById('custYr').innerHTML="";
	}
	
	
}
	

	
	if(document.myFormNew.radId[1].checked==true)
	{
		
		if(document.getElementsByName("month")[0].value=="")
		{
			
			document.getElementById('mnth').style.visibility="visible";
			  document.getElementById('mnth').innerHTML="&nbsp;Please select a Month.";
		
			document.getElementsByName("month")[0].focus();
			document.getElementsByName("month")[0].value="";
		return false;
		}
		else
		{
			document.getElementById('mnth').innerHTML="";
		}


	if(document.getElementsByName("year")[0].value=="")
	{
	
		document.getElementById('yr').style.visibility="visible";
		  document.getElementById('yr').innerHTML="&nbsp;Please select an Year.";
	
		document.getElementsByName("year")[0].focus();
		document.getElementsByName("year")[0].value="";
	return false;
	}
	else
	{
		document.getElementById('yr').innerHTML="";
	}

}

	if(document.myFormNew.radId[2].checked==true)
	{
		if(document.getElementsByName("year1")[0].value=="")
		{
		
			document.getElementById('yr1').style.visibility="visible";
			  document.getElementById('yr1').innerHTML="&nbsp;Please select an Year.";
		
			document.getElementsByName("year1")[0].focus();
			document.getElementsByName("year1")[0].value="";
		return false;
		}
		else
		{
			document.getElementById('yr1').innerHTML="";
		}

	}

	document.myFormNew.submit();
	
	return true;
}

</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report Generation</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>

<%
ArrayList<BusinessCustomer> blist=new ArrayList<BusinessCustomer>();

blist=(ArrayList<BusinessCustomer>) session.getAttribute("blist");


%>
</head>
<body>
<jsp:include page="/jsp/layout/Header.jsp"/> 

	<div id="main" class="container">
<jsp:include page="/jsp/layout/accountMenuHome.jsp"/>
	
 
<div id="midtitle">
			<h2 style="font-size:20px;padding-top:10px; text-align:center;"> 
			Account Report Generation</h2>
		</div>
<form name="myFormNew" action="/NexusBankingGroup/GenerateReportServlet">

<input type="hidden" name="action" value="accountReport">


<table align="center"  width="650px" style="font-size=20px;"> 
 <tr></tr> <tr></tr><tr></tr>
<tr>
<td colspan="3" align="left"><font color="black" size="2pt"><b>Please select an option to generate a Report</b></font></td>
</tr>
<tr></tr>
<tr>
<td colspan="3" align="left"><font size="2pt">Fields marked with <font color="red"><sup>*</sup> </font>are mandatory.</font></td>
</tr>
<tr><td colspan="2" align="left"><font color="red" size ="2pt">
<label style="visibility:hidden; color:red; font-size:12px;"  id="radioCheck"></label></font></td></tr>
<tr>
<td colspan="3" align="left">
<input type="radio" name="radId" value="1" onclick="return checkId()"/><font size="2pt"><b>For Business Customer </b></font>
</td>
</tr>


<tr>
<td  align="left" width="50%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2pt">Business Customer Id</font><font color="red"><sup>*</sup>&nbsp;&nbsp;&nbsp;</font></td>
<td><select id="CustId" name="CustId"  disabled="disabled" >
	<option value="" selected>Please Select</option> 
	
	<%for(BusinessCustomer b:blist) {%>
	
	<option value="<%=b.getId() %>"><%=b.getBusinessName()+"("+b.getId()+")"%></option>
	
	<%
	}
	%>
	 
</select> </td>
<td width="60%"><label style="visibility:hidden; color:red; font-size:12px;"  id="bsName"></label></td>

</tr>
<tr>

<td  align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2pt">Month</font><font color="red"><sup>*</sup>&nbsp;&nbsp;&nbsp;</font></td>
<td><select id="custMonth" name="custMonth" title="Please select" disabled="disabled" >
	<option value="" selected>Please Select</option> 
	<option value="01">Jan</option>
	<option value="02">Feb</option>
 	<option value="03">Mar</option>
 	<option value="04">Apr</option>
 	<option value="05">May</option>
	<option value="06">Jun</option>
	<option value="07">Jul</option>
	<option value="08">Aug</option>
 	<option value="09">Sep</option>
 	<option value="10">Oct</option>
 	<option value="11">Nov</option>
	<option value="12">Dec</option>
 	
</select> </td>
<td width="30%"><label style="visibility:hidden; color:red; font-size:12px;"  id="custMnth"></label></td>
<td></td>
</tr>

<tr>
<td  align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2pt">Year</font><font color="red"><sup>*</sup>&nbsp;&nbsp;&nbsp;</font></td>
<td><select id="custYear" name="custYear" title="Please select" disabled="disabled">
	<option value="" selected>Please Select</option> 
	<option value="2011">2011</option>
	<option value="2012">2012</option>
	<option value="2013">2013</option>
 	
 	
</select> </td>
<td width="30%">
<label style="visibility:hidden; color:red; font-size:12px;"  id="custYr"></label></td>
<td></td>
</tr>

    

<tr><td colspan="3" align="center">OR</td></tr>

<tr>
<td colspan="3" align="left">
<input type="radio" name="radId" value="2" onclick="return checkMonth()"/><font size="2pt"><b>Monthly</b></font></td> 
</tr>

<tr>
 
<td  align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2pt">Month</font><font color="red"><sup>*</sup>&nbsp;&nbsp;&nbsp;</font></td>
<td><select id="month" name="month" title="Please select" disabled="disabled">
	<option value="" selected>Please Select</option> 
	<option value="01">Jan</option>
	<option value="02">Feb</option>
 	<option value="03">Mar</option>
 	<option value="04">Apr</option>
 	<option value="05">May</option>
	<option value="06">Jun</option>
	<option value="07">Jul</option>
	<option value="08">Aug</option>
 	<option value="09">Sep</option>
 	<option value="10">Oct</option>
 	<option value="11">Nov</option>
	<option value="12">Dec</option>
 	
</select></td>
<td width="30%"> <label style="visibility:hidden; color:red; font-size:12px;"  id="mnth"></label></td>
<td></td>
</tr>
<tr>
<td  align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2pt">Year</font><font color="red"><sup>*</sup>&nbsp;&nbsp;&nbsp;</font></td>
<td><select id="year" name="year" title="Please select" disabled="disabled">
	<option value="" selected>Please Select</option> 
	<option value="2011">2011</option>
	<option value="2012">2012</option>
	<option value="2013">2013</option>
 	
 	
</select> </td>
<td width="30%">
<label style="visibility:hidden; color:red; font-size:12px;"  id="yr"></label></td>
<td></td>
</tr>



 
 <tr><td colspan="3" align="center">OR</td></tr>

<tr>
<td  colspan="3" align="left">
<input type="radio" name="radId" value="3" onclick="return checkYear()"/><font size="2pt" ><b>Annually</b></font>
</td>
</tr>

<tr>
<td align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2pt">Year</font><font color="red">*&nbsp;&nbsp;&nbsp;</font></td>
<td><select id="year1" name="year1" title="Please select" disabled="disabled">
	<option value="" selected>Please Select</option> 
	<option value="2011">2011</option>
	<option value="2012">2012</option>
	<option value="2013">2013</option>
 	
  
</select> </td>
<td width="30%">
<label style="visibility:hidden; color:red; font-size:12px;"  id="yr1"></label>
</td>
<td width="30%"><label style="visibility:hidden; color:red; font-size:12px;" id="acNum"></label></td>
</tr>
</table>
<br/>






<br/>

 

  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
  <table align="center">
  <tr>
  <td colspan="3">
  

<input  type="button" style="color:white;border-width:0px;background-color:#5699A7;width:150px; margin-left:230px;" onclick="return validateSel()" value="Generate Report"/> 
  
  
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <input type = "reset" name = "reset" onclick="return resetPage()" style="margin-right:50px" value = "Reset" id="button"></input> 
    </td>
    </tr></table>
</form>
 
 

 
</div>

<jsp:include page="layout/Footer.jsp"/>

</body>
</html>