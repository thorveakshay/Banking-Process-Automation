<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.training.model.*"%>
<%@page import="java.util.ArrayList"%>
<head>

   <%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
if(request.getSession()==null || request.getSession().getAttribute("uid")==null){
     response.sendRedirect(request.getContextPath()+"/jsp/index.jsp");
     return;
}
%>
<% 
if(session.getAttribute("uid")==null)
{
 %>
<Script>
window.location="<%=request.getContextPath()%>/jsp/index.jsp";
</Script>
<% 
 
}
%>

<script type="text/javascript">

function validateReset()
{
	document.getElementById('radioCheck').innerHTML="";
	 document.getElementById('bsName').innerHTML="";
	 document.getElementById('brName').innerHTML="";
	 document.getElementById('trName').innerHTML="";
	 document.getElementById('tbrName').innerHTML="";
	 document.getElementById('acNum').innerHTML="";
	 document.getElementById('searchForm').reset();
	
	
}
 
function ischarinbag(string,bag)
{
 var i;
 for(i=0;i<string.length;i++)
 {
    var charval=string.charAt(i);
	if(bag.indexOf(charval)==-1)
	return false;
 }
 return true;
}



function validateSearchBy()
{


	var listItemArray = document.getElementsByName("bs");
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
		document.getElementById('radioCheck').innerHTML="&nbsp;Please select one of the search options.";
		
		//alert("u r wrong");
		
		return false;
	}
	else
	{
			
		document.getElementById('radioCheck').innerHTML="";
		
	}
		
	
	
	
	var businessName=document.getElementsByName("BusinessName")[0].value;
	var branchName=document.getElementsByName("BranchName1")[0].value;
	var tradingName=document.getElementsByName("TradingName")[0].value;
	var accountNumber=document.getElementsByName("AccountNumber")[0].value;
	var tbName=document.getElementsByName("BranchName2")[0].value;
	 
	var  len=businessName.length;
	var len1=branchName.length;
	var len2=tradingName.length; 
	var  len4=accountNumber.length;
	var  len5=tbName.length;
	

	
	if(document.searchForm.bs[0].checked==true)	//1st condition
	{
		
		var bname = document.getElementsByName("BusinessName")[0].value;   
		 
		  if(bname==0)
		 {
			  document.getElementById('bsName').style.visibility="visible";
			  document.getElementById('bsName').innerHTML="&nbsp;Please enter Business Name.";
		
			document.getElementsByName("BusinessName")[0].value="";
			document.getElementsByName("BusinessName")[0].focus();
			return false;
		 }
		  else
		  {
			  document.getElementById('bsName').innerHTML="";
		  }
				
		  var lenbs=bname.length;
		  var i=0; 


if(	!ischarinbag(document.getElementsByName("BusinessName")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- _/"))

{

	  document.getElementById('bsName').style.visibility="visible";
	  document.getElementById('bsName').innerHTML="&nbsp;Only alphabets and numbers are allowed.";
	  

	
	document.getElementsByName("BusinessName")[0].value="";
	
	document.getElementsByName("BusinessName")[0].focus();
	return false;

}
else
{
	 document.getElementById('bsName').innerHTML="";
}


if(ischarinbag(document.getElementsByName("BusinessName")[0].value,"0123456789- _/"))

{

	  document.getElementById('bsName').style.visibility="visible";
	  document.getElementById('bsName').innerHTML="&nbsp;Business name cannot be only numbers.";
	  

	
	document.getElementsByName("BusinessName")[0].value="";
	
	document.getElementsByName("BusinessName")[0].focus();
	return false;

}
else
{
	 document.getElementById('bsName').innerHTML="";
}


	//branch name

		
		  	
		  	
		
		  		if(document.getElementsByName("BranchName1")[0].value=="")
		  		{
		  		
		  			document.getElementById('brName').style.visibility="visible";
		  			  document.getElementById('brName').innerHTML="&nbsp;Please select Branch Name.";

		  			document.getElementsByName("BranchName1")[0].value="";
		  			document.getElementsByName("BranchName1")[0].focus();
		  		return false;
		  		}
		  		else
		  		{
		  			document.getElementById('brName').innerHTML="";
		  		}

		 
		  return true;
	}
	//trading name

	if(document.searchForm.bs[1].checked==true)	
	{
		
		var trname = document.getElementsByName("TradingName")[0].value;   
	 
		if(trname==0)
		{
			document.getElementById('trName').style.visibility="visible";
			  document.getElementById('trName').innerHTML="&nbsp;Please enter Trading Name.";
		
			document.getElementsByName("TradingName")[0].value="";
			document.getElementsByName("TradingName")[0].focus();
			return false;
		}
		else
		{
			document.getElementById('trName').innerHTML="&nbsp;Please enter Trading name.";
		}

		if(	!ischarinbag(document.getElementsByName("TradingName")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789- _/"))

		{

			  document.getElementById('trName').style.visibility="visible";
			  document.getElementById('trName').innerHTML="&nbsp;Only alphabets,numbers and _ / - are allowed.";
			  

			
			document.getElementsByName("TradingName")[0].value="";
			
			document.getElementsByName("TradingName")[0].focus();
			return false;

		}
			else
			{
				document.getElementById('trName').innerHTML="";
			}

		if(	ischarinbag(document.getElementsByName("TradingName")[0].value,"0123456789- _/"))

		{

			  document.getElementById('trName').style.visibility="visible";
			  document.getElementById('trName').innerHTML="&nbsp;Trading Name cannot contain only numbers.";
			  

			
			document.getElementsByName("TradingName")[0].value="";
			
			document.getElementsByName("TradingName")[0].focus();
			return false;

		}
			else
			{
				document.getElementById('trName').innerHTML="";
			}
	 
	  	


	  		if(document.getElementsByName("BranchName2")[0].value=="")
	  		{
	  		
	  			document.getElementById('tbrName').style.visibility="visible";
	  			  document.getElementById('tbrName').innerHTML="&nbsp;Please select Branch Name.";

	  			document.getElementsByName("BranchName2")[0].value=""
	  			document.getElementsByName("BranchName2")[0].focus();
	  		return false;
	  		}
	  		else
	  		{
	  			document.getElementById('tbrName').innerHTML="";
	  		}
	  	
	  	 	return true;
	

	}

		//branch trading name

		
	

		
		//account number


	if(document.searchForm.bs[2].checked==true)	
	{	
		
		var acNo = document.getElementsByName("AccountNumber")[0].value; 


		if(acNo==0)
		{
			document.getElementById('acNum').style.visibility="visible";
			  document.getElementById('acNum').innerHTML="&nbsp;Please enter Account Number.";
		
			document.getElementsByName("AccountNumber")[0].value="";
			document.getElementsByName("AccountNumber")[0].focus();
		
				return false;
		
		}
		else
		{
			document.getElementById('acNum').innerHTML="";
		}
		
		if(!ischarinbag(document.getElementsByName("AccountNumber")[0].value,"0123456789"))
		{
			document.getElementById('acNum').style.visibility="visible";
			document.getElementById("acNum").innerHTML="Only numbers are allowed."; 
			document.getElementsByName("AccountNumber")[0].focus();
			document.getElementsByName("AccountNumber")[0].value="";
			return false;
		}

		else
		{
			 document.getElementById('acNum').innerHTML="";
		}
		 if(document.getElementsByName("AccountNumber")[0].value.length!=14)
		{

		document.getElementById('acNum').style.visibility="visible";
		document.getElementById("acNum").innerHTML="Account Number must be of 14 digits."; 
		document.getElementById("acNum").innerHTML="Account Number must be of 14 digits."; 
		document.getElementsByName("AccountNumber")[0].focus();
		document.getElementsByName("AccountNumber")[0].value=""; 
		return false;
		}
			else
			{
				 document.getElementById('acNum').innerHTML="";
			}
		 if (document.getElementsByName("AccountNumber")[0].value.charAt(0)=="0")
		{
			document.getElementById('acNum').style.visibility="visible";
			document.getElementById("acNum").innerHTML="Account Number should not start with 0(zero)"; 
			document.getElementsByName("AccountNumber")[0].focus();
			document.getElementsByName("AccountNumber")[0].value="";
			return false;
		}
		
			else
			{
				 document.getElementById('acNum').innerHTML="";
			}
	
		return true;
		
	}
	else
	{
			
		document.getElementById('acNum').innerHTML="";
	}
	



}


</script>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Search Customer</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>

 

<body >

<script>
function BusinessTradingName()
{
	document.forms["searchForm"]["bn"].disabled=false;
	document.forms["searchForm"]["tn"].disabled=false;
	document.forms["searchForm"]["BN"].disabled=true;
	document.forms["searchForm"]["TN"].disabled=true;
	 document.getElementsByName("BranchName2")[0].value=""
			document.getElementsByName("BusinessName")[0].value="";
			document.getElementsByName("BranchName1")[0].value="";
			document.getElementsByName("AccountNumber")[0].value="";
			document.getElementsByName("TradingName")[0].value="";
	return 1;
}
function BranchTradingName()
{
document.forms["searchForm"]["BN"].disabled=false;
document.forms["searchForm"]["TN"].disabled=false;
document.forms["searchForm"]["bn"].disabled=true;
document.forms["searchForm"]["tn"].disabled=true;
document.getElementsByName("BranchName2")[0].value=""
	document.getElementsByName("BusinessName")[0].value="";
	document.getElementsByName("BranchName1")[0].value="";
	document.getElementsByName("AccountNumber")[0].value="";
	document.getElementsByName("TradingName")[0].value="";
return 2;

}

function AccountNumberOn()
{
	document.forms["searchForm"]["AN"].disabled=false;
	document.forms["searchForm"]["BN"].disabled=true;
	document.forms["searchForm"]["TN"].disabled=true;
	document.forms["searchForm"]["bn"].disabled=true;
	document.forms["searchForm"]["tn"].disabled=true;
	 document.getElementsByName("BranchName2")[0].value=""
			document.getElementsByName("BusinessName")[0].value="";
			document.getElementsByName("BranchName1")[0].value="";
			document.getElementsByName("AccountNumber")[0].value="";
			document.getElementsByName("TradingName")[0].value="";
	
	return true;
}


function validateForm()
{

	var a=document.forms["searchForm"]["bn"].value;
	var b=document.forms["searchForm"]["tn"].value;
	var c=document.forms["searchForm"]["BN"].value;
	var d=document.forms["searchForm"]["TN"].value;
	var e=document.forms["searchForm"]["AN"].value;
	
if(document.searchForm.bs[0].checked==true && document.searchForm.bs[1].checked==false && document.searchForm.bs[2].checked==false)
{
	if(a=="" || a==null ||b==""|| b==null)
	  {
	  alert("Please Enter Details");
	  return false;
	  }
}
if(document.searchForm.bs[0].checked==false && document.searchForm.bs[1].checked==true && document.searchForm.bs[2].checked==false )
{
		if(c==""||c==null||d==""||d==null){
		alert("Please Enter Details");
		return false;}
}
if(document.searchForm.bs[0].checked==false && document.searchForm.bs[1].checked==false && document.searchForm.bs[2].checked==true )
{
	if(e==""||e==null){
	alert("Please Enter Account Number Details");
	return false;}
}

if(document.searchForm.bs[0].checked==false && document.searchForm.bs[1].checked==false && document.searchForm.bs[2].checked==false)
{   alert("Please Enter Details");
	return false;
}
}
</script>
 
 
<%

System.out.println(session.getAttribute("LoggedUser"));
ArrayList<Branch> branchList = new ArrayList<Branch>();

branchList = (ArrayList<Branch>)request.getAttribute("branchList");
String msg=null;

if(request.getAttribute("msg")!=null)
{
msg=request.getAttribute("msg").toString();

}


%>
<jsp:include page="../jsp/layout/Header.jsp" />

	<!-- Start Header -->
	<!-- Start Main Content -->

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn" style="width: 240px";ccc>
			<h3 class="leftbox">
			 <%String adminMenu=(String)session.getAttribute("adminMenu"); %>
			<%if(adminMenu!=null){ %>
<%=adminMenu %>
<%} else{ %>Quick Links<%} %></h3>
			<ul class="leftbox borderedlist">
			
			<%
			if(session.getAttribute("designation").toString().equals("HELPDESK EMPLOYEE"))
			{
			%>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList3" title="Generate Ticket">Create Helpdesk Ticket</a></li>
			
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/Tickets.jsp" title="View Tickets">View Tickets</a></li>

				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList7" title="Customer Details">Customer Details</a></li>
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/SearchAccount.jsp" title="Account Details">Account Details</a></li>
	
				
			<%
			}
			%>	
		
			<%
			if(session.getAttribute("designation").toString().equals("RELATIONSHIP MANAGER"))
			{
			%> 
		<li id="lft"><a  href="/NexusBankingGroup/GetCustServlet?action=getBranchList0" title="Change Account Title">
		 <%String heSearchMenu1=(String)session.getAttribute("heSearchMenu1"); %>
			<%if(heSearchMenu1!=null){ %>
<%=heSearchMenu1 %>
<%} else{ %>Change Account Title<%} %></a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList2" title="Switch To New Product">
				<%String heSearchMenu2=(String)session.getAttribute("heSearchMenu2"); %>
			<%if(heSearchMenu2!=null){ %>
<%=heSearchMenu2 %>
<%} else{ %>
				Switch to New Product<%} %></a></li>
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList4" title="Update Business Customer Address">
				<%String heSearchMenu3=(String)session.getAttribute("heSearchMenu3"); %>
			<%if(heSearchMenu3!=null){ %>
<%=heSearchMenu3 %>
<%} else{ %>Update Business Customer Address<%} %></a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList5" title="Update Business Customer Contact">
			 	<%String heSearchMenu4=(String)session.getAttribute("heSearchMenu4"); %>
			<%if(heSearchMenu4!=null){ %>
<%=heSearchMenu4 %>
<%} else{ %>Update Business Customer Contact<%} %></a></li>
			 	<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList6" title="Account Party Management">
			 	<%String heSearchMenu5=(String)session.getAttribute("heSearchMenu5"); %>
			<%if(heSearchMenu5!=null){ %>
<%=heSearchMenu5 %>
<%} else{ %>Account Party Management<%} %></a></li>
		
				<li id="lft"><a href="/NexusBankingGroup/GetCustServlet?action=getBranchList1" title="Close Account">
				<%String heSearchMenu6=(String)session.getAttribute("heSearchMenu6"); %>
			<%if(heSearchMenu6!=null){ %>
<%=heSearchMenu6 %>
<%} else{ %>Close Account<%} %></a></li>
					
			<%
			}
			%>	
				
				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->

<form  name="searchForm"  action="/NexusBankingGroup/GetCustServlet"  > 
<input type="hidden" name="action" value="searchCustomerBy"></input>
 
<input type="hidden" name="pageNumber" value="1"></input>

<center><font size="5pt" color="black" align="center">
 <%String searchHead=(String)session.getAttribute("searchHead"); %>
			<%if(searchHead!=null){ %>
<%=searchHead %>
<%} else{ %>Search Business Customer<%} %></font></center>

<%
if(msg!=null)
{

%>
<center><font size="3pt" color=#8A3E08 align="center"><%=msg %></font></center>

<%
}
%> 

 
<table id="gradient-style" align="center"  width="650px" > 
<br>
<tr>
<td colspan="3" align="left"><font color="black">
 <%String fieldMsg=(String)session.getAttribute("fieldMsg"); %>
			<%if(fieldMsg!=null){ %>
<%=fieldMsg %>
<%} else{ %>Fields marked with <%} %><font color="red"><sup>*</sup> </font>
<%String fieldCntd=(String)session.getAttribute("fieldCntd"); %>
			<%if(fieldCntd!=null){ %>
<%=fieldCntd %>
<%} else{ %>are mandatory.<%} %></font></td>
</tr>

<tr>
<tr><td colspan="3">
<label style="visibility:hidden; color:red; font-size:12px;" id="radioCheck"></label>
</td></tr>

<tr>
<td colspan="3" align="left">
<input type="radio" name="bs" value="2" onclick="return BusinessTradingName();"/><font size="2pt"><b>
<%String searchBrBusn=(String)session.getAttribute("searchBrBusn"); %>
			<%if(searchBrBusn!=null){ %>
<%=searchBrBusn %>
<%} else{ %>By Business Name and Branch Name <%} %></b></font>
</td>
</tr>

<tr>
<td  align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%String heBusnName=(String)session.getAttribute("heBusnName"); %>
			<%if(heBusnName!=null){ %>
<%=heBusnName %>
<%} else{ %>Business Name<%} %><font color="red"><sup>*</sup>&nbsp;&nbsp;&nbsp;</font></td>
<td width="30%"><input id=bn type="text" name="BusinessName" disabled="disabled" 
title="Please enter the Business name."/></td>
<td width="30%"><label style="visibility:hidden; color:red; font-size:12px;" id="bsName"></label></td>
</tr>
    
<tr>
<td align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%String heBranchName=(String)session.getAttribute("heBranchName"); %>
			<%if(heBranchName!=null){ %>
<%=heBranchName %>
<%} else{ %>Branch Name<%} %><font color="red"><sup>*</sup>&nbsp;&nbsp;&nbsp;</font></td>

<%if(branchList!=null){ %>
<td width="30%">
<select name = "BranchName1" id=tn title="Please select a Branch." disabled="disabled" > 
<option value="">----Select----</option>
<% for(Branch b:branchList){ %>
<option value = "<%=b.getBranch_name()%>" ><%=b.getBranch_name()%></option>
<%} %>
</select></td>
<td width="30%">
 <label style="visibility:hidden; color:red; font-size:12px;" id="brName"></label></td>
<%}%>
<%if(branchList==null){ %>
<td width="30%"><input id="tn" type="text" name="BranchName"  disabled="disabled" 
 title="Please select Branch."/></td>
<td width="30%">
<label style="visibility:hidden; color:red; font-size:12px;" id="brName"></label>
</td>
<%} %>
</tr>
 
</tr>

<tr><td colspan="3" align="center">OR</td></tr>
<tr>
<td colspan="3" align="left">
<input type="radio" name="bs" value="2" onclick="return BranchTradingName();"><b>
<%String searchBrTrade=(String)session.getAttribute("searchBrTrade"); %>
			<%if(searchBrTrade!=null){ %>
<%=searchBrTrade %>
<%} else{ %>By Branch Name and Trading Name<%} %></b> 
</input>


</td>
</tr>
<tr>
<td align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%String heTradeName=(String)session.getAttribute("heTradeName"); %>
			<%if(heTradeName!=null){ %>
<%=heTradeName %>
<%} else{ %>Trading Name<%} %><font color="red"><sup>*</sup>&nbsp;&nbsp;&nbsp;</font></td>
<td width="30%"><input id=BN type="text" name="TradingName" disabled="disabled"
title="Please enter the Trading Name." ></input></td>
<td width="30%"><label style="visibility:hidden; color:red; font-size:12px;" id="trName"></label>
</td>
</tr>
   
<tr>
<td align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% heBranchName=(String)session.getAttribute("heBranchName"); %>
			<%if(heBranchName!=null){ %>
<%=heBranchName %>
<%} else{ %>Branch Name<%} %><font color="red">*&nbsp;&nbsp;&nbsp;</font></td>

<%if(branchList!=null){ %>
<td width="30%">
<select name = "BranchName2" id=TN  disabled="disabled" 
title="Please select a Branch."> 
<option value="">----Select----</option>
<% for(Branch b:branchList){ %>
<option value = "<%=b.getBranch_name()%>" ><%=b.getBranch_name()%></option>
<%} %>
</select></td>
<td width="30%">
<label style="visibility:hidden; color:red; font-size:12px;" id="tbrName"></label>
</td>
<%}%>
<%if(branchList==null){ %>
<td width="30%"><input id=TN type="text" name="BranchName"  disabled="disabled"
title="Please select a Branch."></input></td>
<td width="30%">
<label style="visibility:hidden; color:red; font-size:12px;" id="tbrName"></label>
</td>
<%} %>
</tr>
 
 <tr><td colspan="3" align="center">OR</td></tr>

<tr>
<td  colspan="3" align="left">
<input type="radio" name="bs"  onclick="return AccountNumberOn();"><b>
<%String searchAccNo=(String)session.getAttribute("searchAccNo"); %>
			<%if(searchAccNo!=null){ %>
<%=searchAccNo %>
<%} else{ %>By Account Number<%} %></b></input>
</td>
</tr>
<tr>
<td align="left" width="40%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%String heAccNo=(String)session.getAttribute("heAccNo"); %>
			<%if(heAccNo!=null){ %>
<%=heAccNo %>
<%} else{ %>Account Number<%} %><font color="red">*&nbsp;&nbsp;&nbsp;</font></td>
<td width="30%"><input id=AN type="text" name="AccountNumber" disabled="disabled" title="Please enter a 14 digit Account number" ></input></td>
<td width="30%">
<label style="visibility:hidden; color:red; font-size:12px;" id="acNum"></label></td>
</tr>
<tr>

</tr>



</table>

<hr/>
<hr/>
<br>
   <p align="center"> 
 
    <input type="submit" style="background-color:black;margin-left:170px;color:white" onclick="return validateSearchBy()" value=<%String submitButton=(String)session.getAttribute("submitButton"); %>
			<%if(submitButton!=null){ %>
<%=submitButton %>
<%} else{ %>"Search"<%} %>  />
    <input type="reset" style="background-color:black;margin-left:20px;color:white" value="Reset" onclick="return validateReset();"></input>
 
   
      
    </p>
    </br>
	

</form>
   	
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
