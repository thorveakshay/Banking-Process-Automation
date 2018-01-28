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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<% Long npid=(Long)request.getAttribute("npid");
request.setAttribute("npid",npid);
%>

<script type="text/javascript">
function confirmLoad()
{
	return confirm("All the details of the form will be lost. Are you sure you want to navigate away from the page?");
}

function clearData()
{
document.getElementById("selectTitle").innerHTML = "";
document.getElementById("selectName").innerHTML = "";
document.getElementById("selectmName").innerHTML = "";
document.getElementById("selectLname").innerHTML = "";
document.getElementById("checkDOB").innerHTML = "";
document.getElementById("selectRel").innerHTML = "";
document.getElementById("isAccount").innerHTML="";
document.getElementById("KeyPartyCheck").innerHTML = "";
document.getElementById("selectBr").innerHTML = "";
document.getElementById("selectAcc").innerHTML = "";
}

function ischarinbag(string,bag)
{
 var i;

 for(i=0;i<string.length;i++)
 {
        var charval=string.charAt(i);
	if(bag.indexOf(charval)==-1)
	return 0;
 }
 return 1;
}	
function disableAcc()
{
	document.getElementById("branch").disabled=true;
	document.getElementById("accNo").disabled=true;
	document.getElementById("branch").value="";
	document.getElementById("accNo").value="";
	document.getElementById('branchLabel').innerHTML="";
	  
	  document.getElementById('accNoLabel').innerHTML="";
	
}
function enableAcc()
{
	document.getElementById("branch").disabled=false;
	document.getElementById("accNo").disabled=false;
	 document.getElementById('branchLabel').style.visibility="visible";
	  document.getElementById('branchLabel').innerHTML="*";
	  document.getElementById('accNoLabel').style.visibility="visible";
	  document.getElementById('accNoLabel').innerHTML="*";
}

function isDate(myDate) { 
	
    var objDate,  // date object initialized from the myDate string 
        mSeconds, // myDate in milliseconds 
        day,      // day 
        month,    // month 
        year;     // year 
    // date length should be 10 characters (no more no less) 
    if (myDate.length !== 10) { 
        return false; 
    } 
    // third and sixth character should be '/' 
    if (myDate.substring(2, 3) !== '/' || myDate.substring(5, 6) !== '/') { 
        return false; 
    } 
    // extract month, day and year from the myDate (expected format is mm/dd/yyyy) 
    // subtraction will cast variables to integer implicitly (needed 
    // for !== comparing) 
    day = myDate.substring(0, 2) - 0; // because months in JS start from 0 
    month = myDate.substring(3, 5) - 1; 
    year = myDate.substring(6, 10) - 0; 
    
    // test year range 
    if (year < 1000 || year > 3000) { 
        return false; 
    } 
    // convert myDate to milliseconds 
    mSeconds = (new Date(year, month, day)).getTime(); 
    // initialize Date() object from calculated milliseconds 
    objDate = new Date(); 
    objDate.setTime(mSeconds); 
    // compare input date and parts from Date() object 
    // if difference exists then date isn't valid 
    if (objDate.getFullYear() !== year || 
        objDate.getMonth() !== month || 
        objDate.getDate() !== day) { 
        return false; 
    } 
    // otherwise return true 
    return true; 
}



function formValidation()
{

	
	
		
	
	var fname = document.getElementsByName("fname")[0].value;   
	var lname = document.getElementsByName("lname")[0].value;   

	
	if(document.getElementsByName("title")[0].value=="")
	{
	
		document.getElementById('selectTitle').style.visibility="visible";
		  document.getElementById('selectTitle').innerHTML="&nbsp;Please select the title.";
	
		document.getElementsByName("title")[0].focus();
	return false;
	}//title ends

	else
	{
		document.getElementById('selectTitle').innerHTML="";
	}

	var fname = document.getElementsByName("fname")[0].value;   
	 
	  if(fname==0)
	 {
		  document.getElementById('selectName').style.visibility="visible";
		  document.getElementById('selectName').innerHTML="&nbsp;Please enter the First Name.";
	
		document.getElementsByName("fname")[0].value="";
		document.getElementsByName("fname")[0].focus();
		return false;
	 }
	  else
		{
		  document.getElementById('selectName').innerHTML="";
		}
if(	document.getElementsByName("fname")[0].value.length<2||document.getElementsByName("fname")[0].value.length>20)
{
	  document.getElementById('selectName').style.visibility="visible";
	  document.getElementById('selectName').innerHTML="Please enter a first name consisting of 2 to 20 characters.";

	document.getElementsByName("fname")[0].value="";
	document.getElementsByName("fname")[0].focus();
	return false;
}
else
{
  document.getElementById('selectName').innerHTML="";
}
		
	  var lenfn=fname.length;
	  var i=0; 
	 
	  while(lenfn!=0)
		{

		  var n1 = fname.charCodeAt(i);
	  

		  if(n1<65 || n1>122)
		  {
		
			  document.getElementById('selectName').style.visibility="visible";
			  document.getElementById('selectName').innerHTML="&nbsp;Please enter only alphabets.";
		

			
			document.getElementsByName("fname")[0].value="";
			
			document.getElementsByName("fname")[0].focus();
			return false;
			 
			
		}

	else
	{
		document.getElementById('selectName').innerHTML="";
	}

			
		
		if(n1>90&&n1<97)
		{

			 document.getElementById('selectName').style.visibility="visible";
			  document.getElementById('selectName').innerHTML="&nbsp;Please enter only alphabets.";
		
			document.getElementsByName("fname")[0].value="";
			
			document.getElementsByName("fname")[0].focus();
			return false;
			
			}

		else
		{
			document.getElementById('selectName').innerHTML="";
		}
	
	i++;
	lenfn--;
		}// fname ends
if(document.getElementsByName("mname")[0].value.length!=0)
{
		if(	document.getElementsByName("mname")[0].value.length<2||document.getElementsByName("mname")[0].value.length>20)
		{
			  document.getElementById('selectmName').style.visibility="visible";
			  document.getElementById('selectmName').innerHTML="Please enter a middle name consisting of 2 to 20 characters.";

			document.getElementsByName("mname")[0].value="";
			document.getElementsByName("mname")[0].focus();
			return false;
		}
		else
		{
		  document.getElementById('selectmName').innerHTML="";
		}
}
		var mname = document.getElementsByName("mname")[0].value;  
		 var lenfn=mname.length;
		  var i=0; 
		 
		  while(lenfn!=0)
			{

			  var n1 = mname.charCodeAt(i);
		  

			  if(n1<65 || n1>122)
			  {
			
				  document.getElementById('selectmName').style.visibility="visible";
				  document.getElementById('selectmName').innerHTML="&nbsp;Please enter only alphabets.";
			

				
				document.getElementsByName("mname")[0].value="";
				
				document.getElementsByName("mname")[0].focus();
				return false;
				 
				
			}

		else
		{
			  document.getElementById('selectmName').innerHTML="";
		}
			
			if(n1>90&&n1<97)
			{

				 document.getElementById('selectmName').style.visibility="visible";
				  document.getElementById('selectmName').innerHTML="&nbsp;Please enter only alphabets.";
			
				document.getElementsByName("mname")[0].value="";
				
				document.getElementsByName("mname")[0].focus();
				return false;
				
				}
			else
			{
				  document.getElementById('selectmName').innerHTML="";
			}
		
		i++;
		lenfn--;
			}
		 
		var lname = document.getElementsByName("lname")[0].value;   
		 
		  if(lname==0)
		 {
			  document.getElementById('selectLname').style.visibility="visible";
			  document.getElementById('selectLname').innerHTML="&nbsp;Please enter the Last Name.";
		
			document.getElementsByName("lname")[0].value="";
			document.getElementsByName("lname")[0].focus();
			return false;
		 }
		  else
			{
			  document.getElementById('selectLname').innerHTML="";
			}
		  var lenln=lname.length;
		  var j=0; 
		 
		  while(lenln!=0)
			{

			  var n2 = lname.charCodeAt(j);
		  

			  if(n2<65 || n2>122)
			  {
			
				  document.getElementById('selectLname').style.visibility="visible";
				  document.getElementById('selectLname').innerHTML="&nbsp;Please enter only alphabets.";
			

				
				document.getElementsByName("lname")[0].value="";
				
				document.getElementsByName("lname")[0].focus();
				return false;
				 
				
			}

		else
		{
			  document.getElementById('selectLname').innerHTML="";
		}
			if(n2>90&&n2<97)
			{

				 document.getElementById('selectLname').style.visibility="visible";
				  document.getElementById('selectLname').innerHTML="&nbsp;Please enter only alphabets.";
			
				document.getElementsByName("lname")[0].value="";
				
				document.getElementsByName("lname")[0].focus();
				return false;
				
				}
			else
			{
				  document.getElementById('selectLname').innerHTML="";
			}
			 if(	document.getElementsByName("lname")[0].value.length<2||document.getElementsByName("lname")[0].value.length>20)
				{
					  document.getElementById('selectLname').style.visibility="visible";
					  document.getElementById('selectLname').innerHTML="Please enter a last name consisting of 2 to 20 characters.";

					document.getElementsByName("lname")[0].value="";
					document.getElementsByName("lname")[0].focus();
					return false;
				}
				else
				{
				  document.getElementById('selectLname').innerHTML="";
				}
		
		j++;
		lenln--;
			}//last name ends

			  var myDate = document.getElementById("txtdob").value; 
			    // check date and print message 
			    if (isDate(myDate)) { 
			    	document.getElementById('checkDOB').innerHTML="";
			    } 
			    else { 
			    	document.getElementById('checkDOB').style.visibility="visible";
					  document.getElementById('checkDOB').innerHTML="&nbsp;Please enter date in dd/mm/yyyy format";
					  document.getElementById("txtdob").focus();
					  return false;
			    }
			    
			    var dob=new Date(myDate.substr(6),myDate.substr(3,2)-1,myDate.substr(0,2));
		
			var curdate=new Date();
			curdate.setFullYear(curdate.getFullYear()-18);
			if(curdate<dob)
			 {
				 document.getElementById('checkDOB').style.visibility="visible";
				  document.getElementById('checkDOB').innerHTML="&nbsp;Please check the date. Age should be more than 18 years.";
				  document.getElementById("txtdob").focus();
				  return false;
			 }
			 else{ 
			    	document.getElementById('checkDOB').innerHTML="";
			    } 
			 
				
		
			if(document.getElementsByName("relationship")[0].value=="")
			{
			
				document.getElementById('selectRel').style.visibility="visible";
				  document.getElementById('selectRel').innerHTML="&nbsp;Please select the type of Relationship.";
			
				document.getElementsByName("relationship")[0].focus();
			return false;
			}// relationship ends
			else
			{
				 document.getElementById('selectRel').innerHTML="";
			}



			var itemArray = document.getElementsByName("hasAccount");
			var f=0;

			//alert("len is "+listItemArray.length); 
				 for (var m=0; m<itemArray.length; m++) 
				 {
				  var item = itemArray[m];
				  if ( item.checked==true) 
				  {
					f=1;
					break;
				        //  return true;

				  }

				 }


				 //alert("flag value is : "+flag);
				 
			
			if(f==0)
			{
				document.getElementById('isAccount').style.visibility="visible";
				document.getElementById('isAccount').innerHTML="&nbsp;Please select any one option.";
				
				//alert("u r wrong");
				
				return false;
			}	//account exists end
			else
			{
				document.getElementById('isAccount').innerHTML="";
			}

			
		
			var key = document.getElementsByName("keyParty");
			var x=0;

				 for (var k=0; k<key.length; k++) 
				 {
					
				  var listItem = key[k];
				  if ( listItem.checked==true) 
				  {
					x=1;
					break;
				        //  return true;

				  }

				 }

		
			if(x==0)
			{
				document.getElementById('KeyPartyCheck').style.visibility="visible";
				document.getElementById('KeyPartyCheck').innerHTML="&nbsp;Please select any one option.";
				
				//alert("u r wrong");
				
				return false;
			}	//is key party ends
			else
			{
				document.getElementById('KeyPartyCheck').innerHTML="";
			}
				
			



if(document.getElementById("hasAccountYes").checked)
{
	var  branch= document.getElementById("branch").value;   
	 
	
	  var lenbr=branch.length;
	  var v=0; 
		 if(document.getElementById("branch").value==0 || document.getElementById("branch").value=="null")
		 {
			  document.getElementById("selectBr").style.visibility="visible";
			  document.getElementById("selectBr").innerHTML="&nbsp;Please enter the Branch ID.";
		
			  document.getElementById("branch").value="";
			  document.getElementById("branch").focus();
			return false;
		 }
		 else
			{
				document.getElementById('selectBr').innerHTML="";
			}
		 if (document.getElementById("branch").value.charAt(0)==" ")
		 	{
			 document.getElementById("selectBr").style.visibility="visible";
		 		document.getElementById("selectBr").innerHTML=" should not start with blank space"; 
		 		document.getElementById("branch").focus();
		 		document.getElementById("branch").value="";

		 		return false;
		 	}
		 else
			{
				document.getElementById('selectBr').innerHTML="";
			}

	var val=ischarinbag(document.getElementById("branch").value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ");

	if(val==0)
	{
			document.getElementById("selectBr").style.visibility="visible";
			document.getElementById("selectBr").innerHTML="Please enter alphanumeric data."; 
			document.getElementById("branch").focus();
			document.getElementById("branch").value="";
	return false;
			}
	else
	{
		document.getElementById('selectBr').innerHTML="";
	}
	
	if(document.getElementById("branch").value.length==0)
	{
		document.getElementById('selectBr').style.visibility="visible";
		document.getElementById('selectBr').innerHTML="&nbsp;Please enter a branch ID";
		document.getElementById("branch").focus();
		return false;
	}
	else
	{
		document.getElementById('selectBr').innerHTML="";
	}	
	
}
			  	

var val=ischarinbag(document.getElementById("accNo").value,"0123456789");

if(val==0)
{
	document.getElementById('selectAcc').style.visibility="visible";
	document.getElementById('selectAcc').innerHTML="&nbsp;Please enter valid account number consisting of only numbers";
	document.getElementById("accNo").focus();
	return false;
		}
else
{
	document.getElementById("selectAcc").innerHTML="";
}


if(document.getElementById("accNo").value.length==0&&document.getElementById("hasAccountYes").checked)
{
	document.getElementById('selectAcc').style.visibility="visible";
	document.getElementById('selectAcc').innerHTML="&nbsp;Please enter an Account Number";
	document.getElementById("accNo").focus();
	return false;
}
else
{
	document.getElementById('selectAcc').innerHTML="";
}	

if(document.getElementById("accNo").value.length<=8&&document.getElementById("hasAccountYes").checked)
{
	document.getElementById('selectAcc').style.visibility="visible";
	document.getElementById('selectAcc').innerHTML="&nbsp;Enter a valid Account Number.";
	document.getElementById("accNo").focus();
	return false;
}
else
{
	document.getElementById('selectAcc').innerHTML="";
}	
			  	


			
return true;

	
}


</script>
<style>
td{
	font-size:12px;
	padding:5px;
	}
	th{
	color: #8c8685;
	font-size:12px;
	background: #f1f0ef;

	}
	
	
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Nexus Banking Group</title>
<link href="<%=request.getContextPath() %>/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/Layout/Header.jsp"/>
<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
			
<%String acc_party=(String)request.getAttribute("acc_party"); %>
<h3 class="leftbox"><%if(acc_party!=null) {%><%=acc_party %><%} else {%>Account Party <%} %></h3>
<ul class="leftbox borderedlist">
			
	<li><a href="<%=request.getContextPath() %>/jsp/AccountOpenerHome.jsp" title="Home" onclick="return confirmLoad()">home</a></li>
		<li><a href="<%=request.getContextPath() %>/jsp/SearchBusinessCustomer.jsp" title="Search"  onclick="return confirmLoad()">Search Business Customer</a></li>
	
	<li><a	href="/NexusBankingGroup/AccountPartyManagementServlet?action=addAccountParty&&id=<%=session.getAttribute("npid") %>"  onclick="return confirmLoad()">Add
	Account Party</a></li>

	<li><a

		
		href="/NexusBankingGroup/AccountPartyManagementServlet?action=viewAccountParty&&id=<%=session.getAttribute("npid") %>"  onclick="return confirmLoad()">View
	Account Party</a></li>

</ul>

</div>
<!-- main content area -->
<div id="center" style="margin-left: 0px;">
<div class="article_wrapper">
<div  style="color:white;background-color: #5599a7; height: 35px;width: 800px">
<%String add=(String)request.getAttribute("add"); %>
						<p  style ="font-size:20px ; padding-left:10px;padding-top: 5px;padding-bottom:5px"><%if(add!=null) {%><%=add %><%}else { %> ADD ACCOUNT PARTY <%}%></p><br/>
				 	</div> 
<%String BASICDETAILS=(String)request.getAttribute("BASICDETAILS"); %>
<%String Title=(String)request.getAttribute("Title"); %>
<%String MR=(String)request.getAttribute("MR"); %>
<%String MISS=(String)request.getAttribute("MISS"); %>
<%String MRS=(String)request.getAttribute("MRS"); %>
<%String DOCTOR=(String)request.getAttribute("DOCTOR"); %>
<%String Mandatory=(String)request.getAttribute("Mandatory"); %>
<%String logout=(String)request.getAttribute("logout"); %>

<%String FIRSTNAME=(String)request.getAttribute("FirstName"); %>
<%String MIDDLENAME=(String)request.getAttribute("MiddleName"); %>
<%String LASTNAME=(String)request.getAttribute("LastName"); %>
<%String DateOfBirth=(String)request.getAttribute("DateOfBirth"); %>
<%String Bank=(String)request.getAttribute("Bank"); %>
<%String thisBank=(String)request.getAttribute("thisBank"); %>
<%String Party=(String)request.getAttribute("Party"); %>
<%String PersonalAccountDetails=(String)request.getAttribute("PersonalAccountDetails"); %>
<%String IF=(String)request.getAttribute("If"); %>
<%String branch=(String)request.getAttribute("Branch"); %>
<%String AccountNumber=(String)request.getAttribute("AccountNumber"); %>
<%String CONTINUE=(String)request.getAttribute("CONTINUE"); %>
<%String YES=(String)request.getAttribute("YES"); %>
<%String NO=(String)request.getAttribute("NO"); %>
<%String RESET=(String)request.getAttribute("RESET"); %>
<%String DIRECTOR=(String)request.getAttribute("DIRECTOR"); %>
<%String TRUSTEE=(String)request.getAttribute("TRUSTEE"); %>
<%String PARTNER=(String)request.getAttribute("PARTNER"); %>
<%String OWNER=(String)request.getAttribute("OWNER"); %>
<%String SELECT=(String)request.getAttribute("SELECT"); %>

<span style="font-size: 14px" ><%if(BASICDETAILS!=null) {%><%=BASICDETAILS %><%}else { %> Basic Details <%}%></span>
<form action="/NexusBankingGroup/AccountPartyManagementServlet" method="post"><input
	type="hidden" name="action" value="accountPartyDetails1"></input>
<table width="700px" border="0">


<tr>
			<td colspan="2" ><font color="red"><%if(Mandatory!=null) {%><%=Mandatory %><%} else {%>Fields marked with * are mandatory<%} %></font></td>
			</tr>
	<tr>
		<td width="35%"><%if(Title!=null) {%><%=Title %><%} else {%>Title <%} %><font color="red">*</font></td>
		<td width="30%"><select name="title" id="title">
			<option value=0 >  <%if(SELECT!=null) {%><%=SELECT%><%} else {%>Select<%} %></option>
			<option value="Mr."><%if(MR!=null) {%><%=MR%><%} else {%>Mr<%} %></option>
			<option value="Mrs."><%if(MRS!=null) {%><%=MRS%><%} else {%>Mrs <%} %></option>
			<option value="Miss."><%if(MISS!=null) {%><%=MISS%><%} else {%>Miss<%} %></option>
			<option value="Dr."><%if(DOCTOR!=null) {%><%=DOCTOR %><%} else {%>Dr <%} %>r</option>
		</select></td><td width="35%"><label style="visibility:hidden; color:red; font-size:11px;" id="selectTitle"></label></td>
	</tr>
	<tr>
		<td><%if(FIRSTNAME!=null) {%><%=FIRSTNAME%><%} else {%>First Name<%} %><font color="red">*</font></td>
		<td><input name="fname" type="text" id="txtfname" size="30" /></td>	<td><label style="visibility:hidden; color:red; font-size:11px;" id="selectName"></label></td>
	</tr>
	<tr>
		<td><%if(MIDDLENAME!=null) {%><%=MIDDLENAME%><%} else {%>Middle Name<%} %></td>
		<td><input name="mname" type="text" id="txtmname" size="30" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" id="selectmName"></label></td>
	</tr>
	<tr>
		<td><%if(LASTNAME!=null) {%><%=LASTNAME%><%} else {%>Last Name<%} %><font color="red">*</font></td>
		<td><input name="lname" type="text" id="txtlname" size="30" />
		</td><td><label style="visibility:hidden; color:red; font-size:11px;" id="selectLname"></label>
		</td>
	</tr>
	<tr>
		<td><%if(DateOfBirth!=null) {%><%=DateOfBirth%><%} else {%>Date of Birth (in DD/MM/YYYY)<%} %><font color="red">*</font></td>
		<td><input name="dob" type="text" id="txtdob" size="15" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" id="checkDOB"></label></td>
	</tr>
	<tr>
		<td><%if(Bank!=null) {%><%=Bank%><%} else {%>Relationship with Business<%} %><font color="red">*</font></td>
		<td><select name="relationship" id="relationship">
			<option selected="selected"><%if(SELECT!=null) {%><%=SELECT%><%} else {%>Select<%} %></option>
			<option value="Director"><%if(DIRECTOR!=null) {%><%=DIRECTOR%><%} else {%>Director<%} %></option>
			<option value="Trustee"><%if(TRUSTEE!=null) {%><%=TRUSTEE%><%} else {%>Trustee<%} %></option>
			<option value="Owner"><%if(OWNER!=null) {%><%=OWNER%><%} else {%>Owner<%} %></option>
			<option value="Partner"><%if(PARTNER!=null) {%><%=PARTNER%><%} else {%>Partner<%} %></option>
		</select>
		</td><td><label style="visibility:hidden; color:red; font-size:11px;" id="selectRel"></label>
		</td>
	</tr>
	<tr>
		<td><%if(thisBank!=null) {%><%=thisBank%><%} else {%>Do you have account in this Bank<%} %><font color="red">*</font></td>
		<td><label> <input type="radio" name="hasAccount"
			value="yes" id="hasAccountYes" onclick="enableAcc()" /> <%if(YES!=null) {%><%=YES%><%} else {%>Yes<%} %></label> <br />
		<label> <input type="radio" name="hasAccount" value="no"
			id="hasAccountNo" onclick="disableAcc()"/><%if(NO!=null) {%><%=NO%><%} else {%>No<%} %></label></td><td><label style="visibility:hidden; color:red; font-size:11px;" id="isAccount"></label> <br />
		</td>
	</tr>
	<tr>
		<td><%if(Party!=null) {%><%=Party%><%} else {%>Is a key Party<%} %><font color="red">*</font></td>
		<td><label> <input type="radio" name="keyParty"
			value="<%if(Party!=null) {%><%=Party%><%} else {%>Is a key Party<%} %>" id="keyPartyYes" /> <%if(YES!=null) {%><%=YES%><%} else {%>Yes<%} %></label> <br />
		<label> <input type="radio" name="keyParty" value="no"
			id="keyPartyNo" /> <%if(NO!=null) {%><%=NO%><%} else {%>No<%} %></label></td><td><label style="visibility:hidden; color:red; font-size:11px;" id="KeyPartyCheck"></label> <br />
		</td>
	</tr>
	<tr>
		<td><%if(PersonalAccountDetails!=null) {%><%=PersonalAccountDetails%><%} else {%>Personal Account Details<%} %><br />
		<%if(IF!=null) {%><%=IF%><%} else {%>(if account already exists)<%} %>:</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><%if(branch!=null) {%><%=branch%><%} else {%>Branch ID<%} %><label style="visibility:hidden; color:red; font-size:11px;" id="branchLabel"></label></td>
		<td><input name="branch" type="text" id="branch" size="30" value="" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" id="selectBr"></label></td>
	</tr>
	<tr>
		<td><%if(AccountNumber!=null) {%><%=AccountNumber%><%} else {%>Account Number<%} %><label style="visibility:hidden; color:red; font-size:11px;" id="accNoLabel"></label></td>
		<td><input name="accNo" type="text" id="accNo" size="30" value="" /></td><td><label style="visibility:hidden; color:red; font-size:11px;" id="selectAcc"></label></td>
	</tr>
	<tr>
		<td align="right"><input type="submit" class="button" name="button"
			style="margin-right: 15px; margin-top: 15px" id="button"
			value="<%if(CONTINUE!=null) {%><%=CONTINUE%><%} else {%>Continue<%} %>" onclick="return formValidation()" /></td>
		<td><input type="reset" class="button" name="button2"
			style="margin-left: 5px; margin-top: 15px" id="button2" value="<%if(RESET!=null) {%><%=RESET%><%} else {%>Reset<%} %>" onclick="return clearData()" /></td>
	</tr>
</table>
</form>

</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->

<!-- Start Footer -->


<jsp:include page="/Layout/Footer.jsp"/>



</body>
</html>
