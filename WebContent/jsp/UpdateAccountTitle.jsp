<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="../jsp/layout/Header.jsp" />
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.training.model.*"%>
<%@page import="java.util.ArrayList"%>
<head>
<script type="text/javascript">

function checkReset()
{
	document.getElementById('selectAcc').innerHTML="";
	
	 document.getElementById('f1').reset();
}


function checkAccount()
{
	var accNo = document.getElementsByName("getAccNo")[0].value;   
	 var lena=accNo.length;
			if(document.getElementsByName("getAccNo")[0].value=="")
			{
			
				document.getElementById('selectAcc').style.visibility="visible";
				  document.getElementById('selectAcc').innerHTML="&nbsp;Please select an Account.";
			
				document.getElementsByName("getAccNo")[0].focus();
			return false;
			}
			else
			{
				  document.getElementById('selectAcc').innerHTML="";
			}
	
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Account Title Ticket Details</title>
<link href="<%=request.getContextPath()%>/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />



</head>
<%Ticket tick = new Ticket();
 
NonPersonalCustomer npc = new NonPersonalCustomer();
 tick = (Ticket)request.getAttribute("ticket"); 
 String msg = "No active accounts found !";
 npc = (NonPersonalCustomer)request.getAttribute("nonPersonalParty");

 ArrayList<Account> aclist=(ArrayList<Account>)request.getAttribute("accountlist");
 %>
<body>
	<!-- Start Header -->
	
	 
<!-- Start Main Content -->



<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn" style="width: 240px">
			<h3 class="leftbox">Quick Links</h3>
			<ul class="leftbox borderedlist">
				
				
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/AssignedTickets.jsp" title="Assigned Tickets">Assigned Tickets</a></li>
				 
				
			</ul>
			
			<hr />
		</div>
		
		<!-- main content area -->
		<div style="margin-top:0px;margin-left:200px;font-family:verdana;">
		 <center><font size="5pt" color=black align="center">Ticket Details
		  </font></center>
		  <br/>
</div>
<div class="maincontent" >
				 <form name="f1" action="/NexusBankingGroup/AmendorSwitchProductServlet">
<center>
<%if(aclist.size()==0){ %>
<h3><font color="red" size="4pt"><%=msg %></font></h3><br>
<%}%>

</center>
  <hr>
 
<input type="hidden" name="action" value="accno"/>
<input type="hidden" name="tikId" value="<%=tick.getId() %>"/>

<input type="hidden" name="idno" value="<%=tick.getNpId() %>"/>

<table id="gradient-style" align="center" style="margin-left: 200px" width="650px" >	

<tr>

	<td width="40%"><font size="2pt"><b>Ticket Id</b></font></td>
    <td><font size="2pt"><%=tick.getId() %></font></td>

	
</tr>
<tr>

	<td><font size="2pt"><b>Title</b></font></td>
	<td><font size="2pt"><%=tick.getTitle() %></font></td>

	

</tr>
<tr>

	<td><font size="2pt"><b>Business Customer Id</b></font></td>
	<td><font size="2pt"><%=tick.getNpId() %></font></td>


</tr>
<tr>

<td><font size="2pt"><b>Business Name</b></font></td>
<td><font size="2pt"><%=npc.getBusinessName()%></font></td>

</tr>

<tr>

<td><font size="2pt"><b>Branch</b></font></td>
<td><font size="2pt"><%=npc.getBankBranch() %></font>

</tr>
 <tr>

<td><font size="2pt"><b>Description</b></font></td>
<td><font size="2pt"><textarea rows="4" cols="35" readonly="readonly" name="ticketdesc"><%=tick.getSummary()%> </textarea></font></td>	


</tr>

<tr>

 <td><font size="2pt"><b>Select Account no. <font color="red">*&nbsp;&nbsp;&nbsp;</font></b></font></td>

 
 

<%if(aclist.size()!=0){ %>
<td><select name="getAccNo" id="getAccNo" title="Please select an account number.">


<option value="">Please Select</option>
<%for(Account accp:aclist) 
 {%>
<option value="<%=accp.getAccno()%>"> 
<%=accp.getAcctitle()+" ( "+accp.getAccno()+" )" %></option>
 
<%} %>
</select></font> <label style="visibility:hidden; color:red; font-size:12px;" id="selectAcc"></label></td><%}%>

</select>
<label style="visibility:hidden; color:red; font-size:12px;" id="selectAcc"></label>
</td>


 


<%if(aclist.size()==0){ %>
<td ><font size="2pt"><select name="getAccNo" id="getAccNo" disabled="disabled">


<option value="">Please Select</option>
<%for(Account accp:aclist) 
 {%>
<option value="<%=accp.getAccno()%>"> 
<%=accp.getAcctitle()+" ( "+accp.getAccno()+" )" %></option>

<%}%>

</select> </font></td><%}%>

</select>
<label style="visibility:hidden; color:red; font-size:12px;" id="selectAcc"></label>
</td>
 



</tr>
</table>
</hr>

 <br></br>
<div style="font: 150%/ 2.2em Lucida Grande, Tahoma, Verdana, Arial, Helvetica,sans-serif;margin-left:470px;">


<%if(aclist.size()==0){ %>
<input type="submit" onclick="return checkAccount()" style="background-color:black;  color:white" value="Proceed" disabled="disabled"/>
<input type="reset" style="background-color:black;  color:white" onclick="return checkReset()" value="Reset" disabled="disabled"/>
<%} %>

<%if(aclist.size()!=0){ %>
<input type="submit" style="background-color:black;  color:white" onclick="return checkAccount()" value="Proceed"/>
<input type="reset" style="background-color:black;  color:white" onclick="return checkReset()" value="Reset"/>
<%} %>


<!-- how to provide the suitable action for Cancel Button
<input type="submit" value="Cancel"/>		 -->
</div>
	</form>	
</div>	
</div>



 			<hr />
	
	
	<!-- Start Footer -->
	<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
