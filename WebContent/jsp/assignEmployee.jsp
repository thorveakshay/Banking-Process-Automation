<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.training.model.*"%>

<%@page import="java.util.ArrayList"%>

<%@page import="com.training.model.*"%>
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
String designation=session.getAttribute("designation").toString();

if(!designation.equals("ADMINISTRATOR"))
{
	%>
<Script>
window.location="<%=request.getContextPath()%>/jsp/error.jsp";
</Script>
<% 
}
%>
<script type="text/javascript">



function home(){

window.location="<%=request.getContextPath()%>/jsp/AdminHome.jsp";

}


function checkEmpSelection()
{
	 var emp = document.getElementsByName("empId")[0].value;   
	 var lenEmp=emp.length;
			if(document.getElementsByName("empId")[0].value=="")
			{
			
				document.getElementById('selectEmp').style.visibility="visible";
				  document.getElementById('selectEmp').innerHTML="&nbsp;Please select an Employee.";
			
				document.getElementsByName("empId")[0].focus();
			return false;
			}
			var op= confirm("Are you sure you want to proceed ?");
			if(op==true)
			{
				alert("Employee assigned successfully");
				return true;
			}
			else
				return false;
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Assign Employee</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />

<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css" rel="stylesheet" type="text/css" />
</head>

<%Ticket tick = new Ticket();
PersonalParty pp = new PersonalParty();
NonPersonalCustomer npc = new NonPersonalCustomer();
 tick = (Ticket)request.getAttribute("ticket"); 
 pp=(PersonalParty)request.getAttribute("personalParty");
 npc = (NonPersonalCustomer)request.getAttribute("nonPersonalParty");
 ArrayList<Employee> empList=new ArrayList<Employee>();
 empList=(ArrayList<Employee>)request.getAttribute("empList");
 
  %>


<body >
 

<jsp:include page="../jsp/layout/Header.jsp" />
   
	<!-- Start Header -->
	<!-- Start Main Content -->
		

<div id="main" class="container">
		<!-- left column (products and features) -->
	<div id="leftcolumn">
			<h3 class="leftbox">
			
			<%String adminMenu=(String)session.getAttribute("adminMenu"); %>
			<%if(adminMenu!=null){ %>
			<%=adminMenu %>
			<%} else{ %>
   
			Quick Links<%} %></h3>
			<ul class="leftbox borderedlist">
				
				<li id="lft"><a href="<%=request.getContextPath() %>/jsp/UnassignedTickets.jsp" title="Change Account Title">
				
				<%String adminLink1=(String)session.getAttribute("adminLink1"); %>
			<%if(adminLink1!=null){ %>
			<%=adminLink1 %>
			<%} else{ %>
				
				Unassigned Tickets<%} %></a></li>
		 		<li id="lft" style="height:150px"></li>

				
			</ul>
			
			<hr />
		</div>
	
		<!-- main content area -->
		 



<form  name="assignEmployeeForm" method="post"   action="/NexusBankingGroup/AssignTicketServlet?action=assignEmployee"> 
 
<center><font size="5pt" color= black >

<%String assignemp=(String)session.getAttribute("assignemp"); %>
			<%if(assignemp!=null){ %>
			<%=assignemp %>
			<%} else{ %>

Assign Employee<%} %></font></center>
 
<br>
<input type="hidden" name="tikid" value="<%=tick.getId() %>"/>
<table id="gradient-style" align="center" style="margin-left: 100px; font-size:2pt;" width="600px">
<tr>
	<td><font size="2pt"><b>
	<% String ticketId=(String)session.getAttribute("ticketId"); %>
			<%if(ticketId!=null){ %>
			<%=ticketId %>
			<%} else{ %>
	
	Ticket Id<%} %></b></font></td>
     	<td><font size="2pt"><%=tick.getId() %></font></td>
</tr>
<tr>
	<td><font size="2pt"><b>
	<% String ticketTitle=(String)session.getAttribute("ticketTitle"); %>
			<%if(ticketTitle!=null){ %>
			<%=ticketTitle %>
			<%} else{ %>
	
	Ticket Title<%} %></b></font></td>
	<td><font size="2pt"><%=tick.getTitle() %></font></td>
</tr>

<tr>
<td><font size="2pt"><b>
	
						<% String ticketPriority=(String)session.getAttribute("ticketPriority"); %>
			<%if(ticketPriority!=null){ %>
			<%=ticketPriority %>
<%} else{ %>
	
Ticket Priority<%} %></b></font></td>
<td>
<font size="2pt">
 <%=tick.getPriorityId()%></font>
</td>
</tr>


<tr>
	<td><font size="2pt"><b>
	<% String bcId=(String)session.getAttribute("bcId"); %>
			<%if(bcId!=null){ %>
			<%=bcId %>
			<%} else{ %>
	
	Business Customer ID<%} %></b></font></td>
	<td><font size="2pt"><%=tick.getNpId() %></font></td>
</tr>
<tr>
<td><font size="2pt"><b>
<% String bcName=(String)session.getAttribute("bcName"); %>
			<%if(bcName!=null){ %>
			<%=bcName %>
			<%} else{ %>
Business Name<%} %></b></font></td>
<td> <font size="2pt"><%=npc.getBusinessName() %></font>
</td>
</tr>



<tr>
	<td width=200><font size="2pt"><b>
	<% String apName=(String)session.getAttribute("apName"); %>
			<%if(apName!=null){ %>
			<%=apName%>
			<%} else{ %>
	Account Party Name<%} %></b></font></td>
	<td><font size="2pt"><%=pp.getTitle()+""+pp.getFirstName()+" "+pp.getSurName() %></font></td>
</tr>

<tr>
<td width=200><font size="2pt"><b>
<% String apId=(String)session.getAttribute("apId"); %>
			<%if(apId!=null){ %>
			<%=apId %>
			<%} else{ %>

Account Party Id<%} %></b></font></td>
	<td><font size="2pt"><%=pp.getPartyId() %></font></td>

</tr>

<tr>
<td><font size="2pt"><b>
<% String selectEmp=(String)session.getAttribute("selectEmp"); %>
			<%if(selectEmp!=null){ %>
			<%=selectEmp %>
			<%} else{ %>

Select Employee<%} %></b></font></td>

<td ><select name="empId" id="empId" title=
<% String empmsg=(String)session.getAttribute("empmsg"); %>
			<%if(empmsg!=null){ %>
			<%=empmsg%>
			<%} else{ %>
"Please select an Employee.Employee Id is given in brackets."<%} %>>

<option value="">Please Select</option>
<%for(Employee emp:empList) 
 {%>


<option value="<%=emp.getId()+"#"+emp.getfName()+" "+emp.getlName()%>"> 
<%=emp.getfName()+" "+emp.getlName()+" ( "+emp.getId()+" )" %></option>



<%}%>

</select>

<label style="visibility:hidden; color:red; font-size:12px;" id="selectEmp"></label>


</td>
</tr>
 </table>
 <table align="center" style="margin-left: 150px">
<tr>
<td colspan="3">

 <input type="submit" style="background-color:black;  color:white" onclick="return checkEmpSelection()" value=<% String submitButton=(String)session.getAttribute("submitButton"); %>
			<%if(submitButton!=null){ %>
			<%=submitButton%>
			<%} else{ %>"Submit"<%} %>></input> 
 &nbsp;&nbsp;&nbsp;&nbsp;
 <input type="button"  style="background-color:black;margin-top:20px;  color:white" onclick="return home()" value=<% String cancelButton=(String)session.getAttribute("cancelButton"); %>
			<%if(cancelButton!=null){ %>
			<%=cancelButton%>
			<%} else{ %>"Cancel"<%} %> ></input>

</td>


</tr>
 
</table>

<hr/>
<hr/>
<br>
   <p align="center">
   
 

   
    </p>
    <br>
	
		 
	<!-- Start Footer -->
		</div>
<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
