<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%><html
	xmlns="http://www.w3.org/1999/xhtml">
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



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Add Account Party</title>
<link href="<%=request.getContextPath() %>/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/stylesheets/tablecss.css"
	rel="stylesheet" type="text/css" />
</head>
<body>

<jsp:include page="../jsp/layout/Header.jsp" />
<!-- Start Header -->

<!-- Start Main Content -->
<div id="main" class="container"><!-- left column (products and features) -->
<div id="leftcolumn">
<h3 class="leftbox">Quick Links</h3>

<%
String npId=null;
ArrayList<Branch> blist=new ArrayList<Branch>(); 

blist=(ArrayList<Branch>)session.getAttribute("blist");

if(request.getAttribute("npId")!=null)
{
	  npId=request.getAttribute("npId").toString();
	session.setAttribute("npId",npId);

	blist=(ArrayList<Branch>)session.getAttribute("blist");
	
}
%> <script type="text/javascript"> 

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
/*
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
    if ((year < 1000) || (year > 3000)) { 
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

*/
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
	}
	else
		{
		 document.getElementById('selectTitle').innerHTML="";
		}

		//title ends

	var fname = document.getElementsByName("fname")[0].value;   
	 
	  if(fname==0)
	 {
		  document.getElementById('selectName').style.visibility="visible";
		  document.getElementById('selectName').innerHTML="&nbsp;Please enter the First Name.";
	
		document.getElementsByName("fname")[0].value="";
		document.getElementsByName("fname")[0].focus();
		return false;
	 }
	  var lenfn=fname.length;
	  var i=0; 
	 
	  if(!ischarinbag(document.getElementsByName("fname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ '"))
		{
				document.getElementById('selectName').style.visibility="visible";
				document.getElementById("selectName").innerHTML="&nbsp;Please enter only alphabets."; 
				document.getElementsByName("fname")[0].focus();
				document.getElementsByName("fname")[0].value="";
		return false;
				}
		 else
		 {
			 document.getElementById('selectName').innerHTML="";
		 }// fname ends


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
		  if(!ischarinbag(document.getElementsByName("lname")[0].value,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ '"))
			{
					document.getElementById('selectLname').style.visibility="visible";
					document.getElementById("selectLname").innerHTML="&nbsp;Please enter only alphabets."; 
					document.getElementsByName("lname")[0].focus();
					document.getElementsByName("lname")[0].value="";
			return false;
					}
			 else
			 {
				 document.getElementById('selectLname').innerHTML="";
			 }//last name ends



		//  var myDate = document.getElementById("txtdob").value; 
			    // check date and print message 
 
			//    if (isDate(myDate)) { 
			  //  	document.getElementById('checkDOB').innerHTML="";
			   // } 
			  /*  else { 
 
			    if (isDate(myDate)) { 
			    	document.getElementById('checkDOB').innerHTML="";
			    } 
			   /* else { 
 
			    	document.getElementById('checkDOB').style.visibility="visible";
					  document.getElementById('checkDOB').innerHTML="&nbsp;Please enter date in dd/mm/yyyy format";
					  document.getElementById("txtdob").focus();
					  return false;
			    }*/
			    
 
			/*    var dob=new Date(myDate.substr(0,4),myDate.substr(5,2),myDate.substr(8,2));
 
			    var dob=new Date(myDate.substr(0,4),myDate.substr(5,2)-1,myDate.substr(8,2));
  
		
			var curdate=new Date();
			curdate.setFullYear(curdate.getFullYear()-18);
			var curdate1=new Date();
			curdate1.setFullYear(curdate1.getFullYear()-65);
			if(curdate<dob)
			 {
				  document.getElementById('checkDOB').style.visibility="visible";
				  document.getElementById('checkDOB').innerHTML="&nbsp;Please check the date. Age should be more than 18 years.";
				  document.getElementById("txtdob").focus();
				  return false;
			 }else if(curdate1>dob){
				 document.getElementById('checkDOB').style.visibility="visible";
				  document.getElementById('checkDOB').innerHTML="&nbsp;Please check the date. Age should be less than 65 years.";
				  document.getElementById("txtdob").focus();
				  return false;
			 }
			 curdate.setFullYear((curdate.getFullYear()-47));
			  if(curdate>dob){
				 document.getElementById('checkDOB').style.visibility="visible";
				  document.getElementById('checkDOB').innerHTML="&nbsp;Please check the date. Age should be less than 65 years.";
				  document.getElementById("txtdob").focus();
				  return false;
				 }
			 else{ 
			    	document.getElementById('checkDOB').innerHTML="";
			    } 
  */
 
if(document.getElementById("txtdob").value=="")
{

	document.getElementById('checkDOB').style.visibility="visible";
	  document.getElementById('checkDOB').innerHTML="&nbsp;Please select date.";
	  document.getElementById("txtdob").focus();
	  document.getElementById("txtdob").value="";
 
	  return false;
	
}
  
else
{
	document.getElementById("txtdob").focus();
	  document.getElementById("checkDOB").value="";
	  
}

if(document.getElementsByName("relationship")[0].value=="")
{

	document.getElementById('selectRel').style.visibility="visible";
	  document.getElementById('selectRel').innerHTML="&nbsp;Please select the type of Relationship.";

	document.getElementsByName("relationship")[0].focus();
return false;
}
else
{
	 document.getElementById('selectRel').innerHTML="";
}

// relationship ends

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
	document.getElementById('KeyPartyCheck').innerHTML="&nbsp;Please select one of the options.";
	

	
	return false;
}	//is key party ends
	
else
{
	document.getElementById('KeyPartyCheck').innerHTML="";	
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
	document.getElementById('isAccount').innerHTML="&nbsp;Please select one of the options.";
	
	//alert("u r wrong");
	
	return false;
}	//account exists end
else
{
	document.getElementById('isAccount').innerHTML="";
}



	 

if(document.getElementById("hasAccountYes").checked==true)
{
var  branch= document.getElementById("branch").value;   


if(document.getElementsByName("branch")[0].value=="")
{

document.getElementById('selectBr').style.visibility="visible";
document.getElementById('selectBr').innerHTML="&nbsp;Please select the Branch.";

document.getElementsByName("branch")[0].focus();
return false;
}
else
{
document.getElementById('selectBr').innerHTML="";
}


if(document.getElementById("accNo").value=="" || document.getElementById("accNo").value==0)		  	
{
document.getElementById('selectAcc').style.visibility="visible";
document.getElementById('selectAcc').innerHTML="&nbsp;Please enter a 14 digit account number.";
document.getElementById("accNo").focus();
return false;

}
else
{
document.getElementById("selectAcc").innerHTML="";

}

if(!ischarinbag(document.getElementsByName("accNo")[0].value,"0123456789"))
{
document.getElementById('selectAcc').style.visibility="visible";
document.getElementById("selectAcc").innerHTML="&nbsp;Please enter only numbers."; 
document.getElementsByName("accNo")[0].focus();
document.getElementsByName("accNo")[0].value="";
return false;
}

else
{
  document.getElementById('selectAcc').innerHTML="";
}

	


if(document.getElementById("accNo").value.length!=14)
{
document.getElementById('selectAcc').style.visibility="visible";
document.getElementById("selectAcc").innerHTML="&nbsp;Please enter a 14 digit account number.";
document.getElementById("accNo").focus();
document.getElementById("accNo").value="";
return false;
}

else
{
document.getElementById("selectAcc").innerHTML="";
}
//date




//date	

}



//alert("my value");


  
var myDate = document.getElementById("txtdob").value; 


			//check date and print message 
		 
		  
		    
		    var dob=new Date(myDate.substr(0,4),myDate.substr(5,2),myDate.substr(8,2));

		var curdate=new Date();
		curdate.setFullYear(curdate.getFullYear()-18);
		if(curdate<dob)
		 {
			 document.getElementById('checkDOB').style.visibility="visible";
			  document.getElementById('checkDOB').innerHTML="&nbsp;Please check the date. Age should be more than 18 years.";
			  document.getElementById("txtdob").focus();
			  document.getElementById("txtdob").value="";
			
			  return false;
		 }
		else
		{
			document.getElementById("txtdob").focus();
			document.getElementById('checkDOB').innerHTML="";
	    } 
	  
		 curdate.setFullYear((curdate.getFullYear()-47));
		  if(curdate>dob)
			  {
			 document.getElementById('checkDOB').style.visibility="visible";
			  document.getElementById('checkDOB').innerHTML="&nbsp;Please check the date. Age should be less than 65 years.";
			  document.getElementById("txtdob").focus();
			  document.getElementById("txtdob").value="";
			  return false;
			 }
		 else{ 
		    	document.getElementById('checkDOB').innerHTML="";
		    	return true;
		    } 



			
		
			
return true;

}


//calender



var calendarWindow = null;
var calendarColors = new Array();
calendarColors['bgColor'] = '#BDC5D0';
calendarColors['borderColor'] = '#333366';
calendarColors['headerBgColor'] = '#143464';
calendarColors['headerColor'] = '#FFFFFF';
calendarColors['dateBgColor'] = '#8493A8';
calendarColors['dateColor'] = '#004080';
calendarColors['dateHoverBgColor'] = '#FFFFFF';
calendarColors['dateHoverColor'] = '#8493A8';
var calendarMonths = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
var calendarWeekdays = new Array('Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun');
var calendarUseToday = true;
var calendarFormat = 'y/m/d';
var calendarStartMonday = true;
var calendarScreenX = 100; // either 'auto' or numeric
var calendarScreenY = 50; // either 'auto' or numeric

function getCalendar(in_dateField) 
{
    if (calendarWindow && !calendarWindow.closed) {
       // alert('Calendar window already open.  Attempting focus...');
        try {
            calendarWindow.focus();
        }
        catch(e) {}
        
        return false;
    }

    var cal_width = 415;
    var cal_height = 310;

    // IE needs less space to make this thing
    if ((document.all) && (navigator.userAgent.indexOf("Konqueror") == -1)) {
        cal_width = 410;
    }
 

    calendarTarget = in_dateField;
    calendarWindow = window.open('<%=request.getContextPath()%>/jsp/calender.jsp', 'dateSelectorPopup','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=0,dependent=no,width='+cal_width+',height='+cal_height + (calendarScreenX != 'auto' ? ',screenX=' + calendarScreenX : '') + (calendarScreenY != 'auto' ? ',screenY=' + calendarScreenY : ''));

    return false;
}
function killCalendar() 
{
    if (calendarWindow && !calendarWindow.closed) {
        calendarWindow.close();
    }
}

</script>
<ul class="leftbox borderedlist">
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=addAccountParty"><font
		size="2pt">Add Account Party</font></a></li>
	<li><a
		href="<%=request.getContextPath() %>/AccountPartyManagementMainServlet?action=viewAccountParty&&pageNumber=1"><font
		size="2pt">View Account Party</font></a></li>

</ul>

</div>
<!-- main content area -->
<div id="center" style="margin-left: 50px;">
<div class="article_wrapper">
<center><font color="black" size="5pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Add Account Party</font></center>
<br />
<center><span style="font-size: 18px"></span></center>
<br />
<form name="myForm"
	action="<%=request.getContextPath() %>/AccountPartyManagementMainServlet"
	method="post"><input type="hidden" name="action"
	value="accountPartyDetails1"></input> <input type="hidden" name="npId"
	value="<%=npId %>"></input>

<table id="gradient-style" align="center" width="600px"
	style="font-size: 2pt; margin-left: 0px;">
	<tr>
		<tr>
			<td colspan="2"><font color="blue" size="2pt">Fields with
			<font color="red"><sup>*</sup> </font>mark are mandatory.</font></td>
		</tr>
		<td><b>Title</b><font color="red"><sup>*</sup></font></td>
		<td><select name="title" id="title"
			title="Please select a Title.">
			<option>Select</option>
			<option value="Mr.">Mr</option>
			<option value="Mrs.">Mrs</option>
			<option value="Miss.">Miss</option>

		</select> <label style="visibility: hidden; color: red; font-size: 12px;"
			id="selectTitle"></label></td>
	</tr>
	<tr>
		<td width="40%"><b>First Name</b><font color="red"><sup>*</sup></font></td>
		<td width="60%"><input name="fname" type="text" id="txtfname"
			size="30"
			title="Please enter the First name. Space and ' is allowed." /> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			id="selectName"></label></td>
	</tr>
	<tr>
		<td><b>Middle Name</b></td>
		<td><input name="mname" type="text" id="txtmname" size="30" /></td>
	</tr>
	<tr>
		<td><b>Last Name</b><font color="red"><sup>*</sup></font></td>
		<td><input name="lname" type="text" id="txtlname" size="30"
			title="Please enter the Last name. Space and ' is allowed." /> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			id="selectLname"></label></td>
	</tr>




	<tr>

		<td><b>Date of Birth</b><font color="red"><sup>*</sup></font></td>
		<td><input  name="dob" type="text" id="txtdob"
			size="15" title="Please select Date of Birth" /> <a id="dob"
			href="#" onclick="return getCalendar(document.myForm.dob);"><img
			id="dobimage"
			src="<%=request.getContextPath() %>/images/calendar.png"
			style="border: 0" /></a> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			id="checkDOB"></label></td>


	</tr>
	<tr>
		<td><b>Relationship with Business</b><font color="red"><sup>*</sup></font></td>
		<td><select name="relationship" id="relationship"
			title="Please select the type of Relationship.">
			<option selected="selected">Select</option>
			<option value="Director">Director</option>
			<option value="Trustee">Trustee</option>
			<option value="Owner">Owner</option>
			<option value="Partner">Partner</option>
		</select><label style="visibility: hidden; color: red; font-size: 12px;"
			id="selectRel"></label></td>
	</tr>



	<tr>
		<td><b>Is a key Party ?</b><font color="red"><sup>*</sup></font></td>
		<td><label> <input type="radio" name="keyParty"
			value="yes" id="keyPartyYes" /> Yes</label> <br />
		<label> <input type="radio" name="keyParty" value="no"
			id="keyPartyNo" /> No</label> <label
			style="visibility: hidden; color: red; font-size: 12px;"
			id="KeyPartyCheck"></label></td>
	</tr>
	<td><b>Do you have account in this Bank ?<font color="red">*</font></b></td>
	<td><label> <input type="radio" name="hasAccount"
		value="yes" id="hasAccountYes" onclick="enableAcc()" /> Yes</label> <br />
	<label> <input type="radio" name="hasAccount" value="no"
		id="hasAccountNo" onclick="disableAcc()" /> No</label> <label
		style="visibility: hidden; color: red; font-size: 12px;"
		id="isAccount"></label></td>

	<tr>
		<td colspan="2" align="right"><label
			style="visibility: hidden; color: red; font-size: 12px;"
			id="KeyPartyCheck"></label></td>
	</tr>

	<tr>
		<td><b>Personal Account Details<br />
		(if account already exists):</b></td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><b>Branch Name</b><label
			style="visibility: hidden; color: red; font-size: 11px;"
			id="branchLabel"></label></td>

		<td width="30%"><select name="branch" id="branch"
			disabled="disabled" title="Please select the Branch.">
			<option value="">----Select----</option>
			<% for(Branch b:blist){ %>
			<option value="<%=b.getBranch_id()%>"><%=b.getBranch_name()%></option>
			<%} %>
		</select><label style="visibility: hidden; color: red; font-size: 11px;"
			id="selectBr"></label></td>

	</tr>
	<tr>
		<td><b>Account Number</b><label
			style="visibility: hidden; color: red; font-size: 11px;"
			id="accNoLabel"></label></td>
		<td><input name="accNo" type="text" id="accNo" size="30" value=""
			disabled="disabled" title="Please enter a 14 digit Account number." />
		<label style="visibility: hidden; color: red; font-size: 11px;"
			id="selectAcc"></label></td>
	</tr>
</table>
<table align="center">
	<tr>
		<td align="center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="button"
			style="background-color: black; margin-top: 20px; color: white"
			id="button" onclick="return formValidation()"
			value="Save and Continue" /> <input type="reset" name="button2"
			style="background-color: black; margin-top: 20px; color: white"
			id="button2" value="Reset" /></td>
	</tr>
</table>
</form>

</div>
<hr />
</div>
<!-- product sales boxes --></div>
<!-- Start Bottom Information -->

<jsp:include page="../jsp/layout/Footer.jsp" />
</body>
</html>
