function myfun()
{  
	
	/*document.getElementById("ename").disabled=true;

	document.getElementById("eid").disabled=true;
	document.getElementById("ename").value="";*/
	
	var post=document.forms["f1"]["designation"].value;
	var grp=document.forms["f1"]["chbox"].value;
	
	if(post==0)
	{
		document.getElementById("common").checked=false;
		document.getElementById("product").checked=false;
		document.getElementById("maintenance").checked=false;
		document.getElementById("hdesk").checked=false;
		document.getElementById("common").disabled=true;
		document.getElementById("product").disabled=true;
		document.getElementById("maintenance").disabled=true;
		document.getElementById("hdesk").disabled=true;
	}
	else
	if(post=="ADMINISTRATOR")
	{
		document.getElementById("common").checked=false;
		document.getElementById("product").checked=false;
		document.getElementById("maintenance").checked=false;
		document.getElementById("hdesk").checked=false;
		document.getElementById("common").disabled=true;
		document.getElementById("product").disabled=false;
		document.getElementById("maintenance").disabled=false;
		document.getElementById("hdesk").disabled=true;
	}
	else
		if(post=="BACKOFFICE EMPLOYEE")
		{
			document.getElementById("common").checked=false;
			document.getElementById("product").checked=false;
			document.getElementById("maintenance").checked=false;
			document.getElementById("hdesk").checked=false;
			document.getElementById("common").disabled=true;
			document.getElementById("product").disabled=true;
			document.getElementById("maintenance").disabled=false;
			document.getElementById("hdesk").disabled=true;
		}
		else
			if(post=="COMMERCIAL ACCOUNT OPENER")
			{
				document.getElementById("common").checked=false;
				document.getElementById("product").checked=false;
				document.getElementById("maintenance").checked=false;
				document.getElementById("hdesk").checked=false;
				document.getElementById("common").disabled=false;
				document.getElementById("product").disabled=false;
				document.getElementById("maintenance").disabled=true;
				document.getElementById("hdesk").disabled=true;
			}
			else
				if(post=="HELPDESK EMPLOYEE")
				{
					document.getElementById("common").checked=false;
					document.getElementById("product").checked=false;
					document.getElementById("maintenance").checked=false;
					document.getElementById("hdesk").checked=false;
					document.getElementById("common").disabled=true;
					document.getElementById("product").disabled=true;
					document.getElementById("maintenance").disabled=true;
					document.getElementById("hdesk").disabled=false;
				}
				else
					if(post=="RELATIONSHIP MANAGER")
					{
						document.getElementById("common").checked=false;
						document.getElementById("product").checked=false;
						document.getElementById("maintenance").checked=false;
						document.getElementById("hdesk").checked=false;
						document.getElementById("common").disabled=true;
						document.getElementById("product").disabled=true;
						document.getElementById("maintenance").disabled=false;
						document.getElementById("hdesk").disabled=true;
					}
 
} 

function my_fun()
{    
	/*document.getElementById("ename").disabled=false;

	document.getElementById("eid").disabled=false;*/
 
} 

function validateFName()
{
	//alert("Please enter a Name");
	
	var name=document.forms["f1"]["fname"].value;
	var seq=/^[A-Za-z][A-Za-z@$&0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var symbolseq=/^[ @$&#!^*()?]+$/;
	var check=document.getElementById("checkName");
    check.innerHTML  = "";
    if(name==null || name=="")
	{
      //alert("Please enter a Name");
	  check.innerHTML = "Please enter First Name";
	  return false;
	}
    else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter first name using alphabets";
		return false;
    }
    else if (name.length>20||name.length<2)
	{
		check.innerHTML="Please enter a name between 2 to 20 characters";
		return false;
	}
    else if(!(name.match(seq)))
    {
    	check.innerHTML = "Please enter first name using alphabets";
		return false;
    }
    else if(!(name.match(randomseq)))
    {
    	check.innerHTML = "Please enter valid first Name ";
  	  return false;
        }
    else if(name.match(symbolseq))
    {
    	check.innerHTML = "Please enter first name using alphabets";
  	  return false;
        }
    var i=0;
    while(i<name.length)
    {
    	if(name.charAt(i)==" ")
    	{
    		check.innerHTML = "Please enter first name without space";
    		return false;
    	}
    	i++;
    }

  // else if(isNaN(name))
    //{
   /* else if((name.match(seq))|| name.match(numseq))
    {
    		check.innerHTML = "Please enter First Name using alphabets only";
    		return false;
    }
    */

    	/*else
    	{
    		check.innerHTML = "Please enter First Name using alphabets only";
    		return false;
    	}*/
   /* else if(name.match(numseq))
    {
    		check.innerHTML = "Please enter First Name starting with alphabets only";
    		return false;
    }*/
    //}
   
    return true;
}
//validate last name
function validateLName()
{
	var name=document.forms["f1"]["lname"].value;
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	var seq = /^[A-Za-z][A-Za-z@$&0-9\s]+$/;
	check=document.getElementById("LastName");
    check.innerHTML  = "";
    if(name==null || name=="")
	{
	  check.innerHTML = "Please enter Last Name";
	  return false;
	}
    else if(!(name.match(randomseq)))
    {
    	check.innerHTML = "Please enter alphabets for last name";
		return false;
    }
    
    else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter alphabets for last name";
		return false;
    }
   
	  /*else if(name.match(numseq))
	  {
		check.innerHTML = "Please enter Last Name starting with alphabets only";
		return false;
	  }*/
	
    else if(name.length>20||name.length<2)
	{
		check.innerHTML="Please enter last name having number of characters between 2 to 20";
		return false;
	}
    else if(!(name.match(randomseq)))
    {
    	check.innerHTML = "Please enter valid Last Name ";
  	  return false;
        }
   return true;
   
}

//validate date of birth
function validateDateOfBirth()
{
	var birthYear=document.forms["f1"]["dob"].value;
	check=document.getElementById("BirthDate");
    check.innerHTML  = "";
    var birthDate=new Date(birthYear);
	var curDate=new Date();
	var seq= /^[\/0-9\s]+$/;
	//var bYear=birthYear.substring(0,2);
	//alert(bYear);
   
    if(birthYear==null||birthYear=="")
    {
	    check.innerHTML = "Please select date of birth";
		return false;
   }
    else if(!(birthYear.match(seq)))
    {
    	check.innerHTML = "Please enter a valid date";
		return false;
    }
     else if(birthDate>=curDate)
	{
		check.innerHTML=" Please select a past date for date of birth";
		return false;
	}
     else if(birthDate<curDate)
     {
		    	   var year=birthDate.getFullYear();
		    	   var month=birthDate.getMonth()+1;
		    	   var date=birthDate.getDate();
		    	  
		    	   var cur_year=curDate.getFullYear();
		    	   var cur_month=curDate.getMonth()+1;
		    	   var cur_date=curDate.getDate();
		    	   
		    	   year_diff=cur_year-year;
		    	   month_diff=cur_month-month;
		    	   date_diff=cur_date-date;
		    	   
		    	   if(year_diff<18)
		    	   {
		    		   check.innerHTML="Employee should be atleast 18 years of age";
		    		   return false;
		    	   }
		    	   else
		    		   if(year_diff>60)
		    		   {
		    			   check.innerHTML="Employee should be less than 60 years of age";
			    		   return false;
		    		   }
		    	   else if(year_diff>18 && year_diff<60)
		    	   {
		    		   return true;
		    	   }
		    	   else if(year_diff==18)
		    	   {
		    		   if(month_diff<0)
		    		   {
		    			   check.innerHTML="Employee should be atleast 18 years of age";
		    			   return false;
		    		   }
		    		   else if(month_diff==0)
		    		   {
		    			   if(date_diff<0)
		    			   {
		    				   check.innerHTML="Employee should be atleast 18 years of age";
		    				   return false;
		    			   }
		    			   else
		    			   {
		    				//   check.innerHTML="Employee shoul be atleast 18 years of age";
		    				   return true;
		    			   }
		    		   }
		    		   else
		    		   {
		    			   return true;
		    		   }
		    		   
		    			   
		    	   }
		    	   else if(year_diff==60)
		    	   {
		    		   
		    		   if(month_diff<0)
		    		   {
		    			   check.innerHTML="Employee should be less than 60 years of age";
		    			   return false;
		    		   }
		    		   else if(month_diff==0)
		    		   {
		    			   if(date_diff<0)
		    			   {
		    				   check.innerHTML="Employee should be less than 60 years of age";
		    				   return false;
		    			   }
		    			   else
		    			   {
		    				//   check.innerHTML="Employee shoul be atleast 18 years of age";
		    				   return true;
		    			   }
		    		   }
		    		   else
		    		   {
		    			   return true;
		    		   }
		    		   
		    	   }
		    	 
		}
   
    return true;
}


//Validate Age of the employee
function validateAgeOfEmployee()
{
	alert("xlkhcfklasd");
	var birthYear=document.forms["f1"]["dob"].value;
	check=document.getElementById("BirthDate");
	check.innerHTML="";
	birthYear=new Date(birthYear);
	var curDate=new Date();
	if(birthYear>curDate)
	{
		check.innerHTML=" Please select a past date for date of birth";
		return false;
	}
	return true;
}





//Designation Validation
function validateDesignation()
{
	
	var post=document.forms["f1"]["designation"].value;
	check=document.getElementById("Dsgn");
    check.innerHTML  = "";
    /*document.getElementById("common").disabled=true;
	document.getElementById("product").disabled=true;
	document.getElementById("maintenance").disabled=true;
	document.getElementById("hdesk").disabled=true;*/
    if(post==0)
    {
    	check.innerHTML ="Please select a role";
		return false;
    }
    //var n=document.getElementById("branchName").value;
    return true;
}




//for contact number
function validateNumber()
{
	//alert("in number");
	var num=document.forms["f1"]["contactNo"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	check=document.getElementById("Cnum");
    check.innerHTML  = "";
   /* if(isNaN(x)||x.indexOf(" ")!=-1)
    {
       alert("Enter numeric value");
       return false; 
    }
*/
   if(num==null || num=="")
	{
	  check.innerHTML = "Please enter contact number";
	  return false;
	}
    else if(isNaN(num))
    {
    	check.innerHTML = "Please enter digits only";
    	  return false;
    }
    else if(num==" ")
    {
    	check.innerHTML = "Contact number should not start with space";
  	  return false;
    }
    else if(num == 0)
    {
    	check.innerHTML = "Please enter digits between 6 and 12";
    	  return false;
    }
    else if(num.length<6 || num.length>12)
    {
    	check.innerHTML = "Please enter digits between 6 and 12";
  	  return false;
    }
  
   /* else if(num.match(seq)|| num.match(numseq) || num.match(randomseq))
    {
      check.innerHTML = "Please enter Contact Number using numbers";
	  return false;
    }*/
   /* else if(num.match(numseq) || num.match(seq))
    {
    	check.innerHTML = "Please enter Contact Number using numbers";
  	  return false;
    }*/
   return true;
}


function validateEmail()
{
	var eid=document.forms["f1"]["email"].value;
	check=document.getElementById("EId");
    check.innerHTML  = "";
   /* var seq = /^[A-Za-z][@A-Za-z.A-Za-z\s]+$/;
    if((eid.match(seq))== false)
    {
    	check.innerHTML = "Please select valid email id using @ and . symbol";
		return false;
    }*/
  /*  var atpos=eid.indexOf("@");
    var dotpos=eid.lastIndexOf(".");
    alert("@ pos"+atpos);
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=eid.length)
      {
    	alert("@ pos"+atpos);
    	check.innerHTML = "Please select valid email id";
        return false;
      }*/
    
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;   
    if(eid.match(mailformat))   
    {   
     return true;   
    }   
    else  
    {   
    	check.innerHTML = "Please select valid email id";
  
    return false;   
    }   

    
    
    
    
    
}

function validateBranch()
{
	var post=document.forms["f1"]["branch"].value;
	check=document.getElementById("BId");
    check.innerHTML  = "";
    if(post == 0)
    {
    	 check.innerHTML = "Please select branch name";
    	 document.getElementById("common").disabled=true;
 		document.getElementById("product").disabled=true;
 		document.getElementById("maintenance").disabled=true;
 		document.getElementById("hdesk").disabled=true;
 		return false;
    }
    return true;
}
function validateDateOfJoin()
{
	//alert("in doj");
	//alert("birthYear");
	var dateOfJoin=document.forms["f1"]["datejoin"].value;
	//alert(dateOfJoin);
	var seq= /^[\/0-9\s]+$/;
	var check=document.getElementById("joindate");
    check.innerHTML  = "";
    var JoinDate=new Date(dateOfJoin);
    //alert(JoinDate);
	var curDate=new Date();
  /*  var year=JoinDate.getFullYear();
    //alert(year);
	   var month=JoinDate.getMonth()+1;
	   var date=JoinDate.getDate();
	  //alert(year+" "+month+" "+date);
	   var cur_year=curDate.getFullYear();
	   var cur_month=curDate.getMonth()+1;
	   var cur_date=curDate.getDate();
   */
    
    /*
   var year = birthYear.subString(0,4);
   //alert(year);
   var num = new Number(year);
   //var numYear = new Number(year);
   //alert(year);
   logger.info(year);
   var d = new Date();
   var currYear =d.getFullYear();
   //alert(currYear);
   var diff = currYear - numYear;
   alert("birthYear");
   */
   if(dateOfJoin==null||dateOfJoin=="")
   {
	    check.innerHTML = "Please select date of joining";
		return false;
   }
   else if(!(dateOfJoin.match(seq)))
   {
   	check.innerHTML = "Please enter a valid date";
		return false;
   }
  /*else if(JoinDate< curDate)
   {
	   check.innerHTML = "Please select future date";
		return false;
   }*/
   return true;
   
}


function validateGroup()
{
	/*var radios=new Array();
	
    radios[0] = document.getElementsByName("chbox1");
    //alert(radios[0]);
    radios[1] = document.getElementsByName("chbox2");
    //alert(radios[1]);
    radios[2] = document.getElementsByName("chbox3");
    //alert(radios[2]);
    radios[3] = document.getElementsByName("chbox4");
    //alert(radios[3]);*/
    var check=document.getElementById("ChGrp");
    check.innerHTML  = "";
     if(document.f1.chbox[0].checked == false && document.f1.chbox[1].checked == false && document.f1.chbox[2].checked == false && document.f1.chbox[3].checked == false)
     {
    	 check.innerHTML = "Please select group";
		 return false; 
     }
     else
     {
    	 return true;
     }
	}

function validateForm()
{
	var birthYear=document.forms["f1"]["dob"].value;
	check=document.getElementById("BirthDate");
    var birthDate=new Date(birthYear);
	var curDate=new Date();
	
	if(validateFName()==false)
	{
		document.f1.fname.focus();
		return false;
	}
	
	else if(validateLName()==false)
	{
		document.f1.lname.focus();
		return false;
	}
	
	/*else if(birthDate>curDate)
	{
    	//alert("dsklksdfjglsdflgjdfl");
		check.innerHTML=" Please select a past date for date of birth xxx";
		return false;
	}*/
	else if(validateDateOfBirth() == false)
	{
		document.f1.dob.focus();
		return false;
	}
	
	else if(validateDesignation()==false)
	{
		document.f1.designation.focus();
		return false;
	}
	else if(validateBranch()==false)
	{
		document.f1.branch.focus();
		return false;
	}
	else if(validateDateOfJoin() == false)
	{
		document.f1.datejoin.focus();
		return false;
	}
	/*else if(validateDOJvalue() == false)
	{
		document.f1.datejoin.focus();
		return false;
	}*/
	
	else if(validateNumber()==false)
	{
		document.f1.contactNo.focus();
		return false;
	}
	else if (validateEmail()==false)
	{
		document.f1.email.focus();
		return false;
	}
	
	else if(validateGroup() == false)
	{
		document.f1.chbox[0].focus();
		return false;
		
	}
	
	return true;
}

function validateForm1()
{
	
	if(validateLName()==false)
	{
		document.f1.lname.focus();
		return false;
	}
	
	/*else if(birthDate>curDate)
	{
    	//alert("dsklksdfjglsdflgjdfl");
		check.innerHTML=" Please select a past date for date of birth xxx";
		return false;
	}*/
	
	
	else if(validateDesignation()==false)
	{
		document.f1.designation.focus();
		return false;
	}
	else if(validateBranch()==false)
	{
		document.f1.branch.focus();
		return false;
	}
	
	
	else if(validateNumber()==false)
	{
		document.f1.contactNo.focus();
		return false;
	}
	else if (validateEmail()==false)
	{
		document.f1.email.focus();
		return false;
	}
	
	else if(validateGroup() == false)
	{
		document.f1.chbox[0].focus();
		return false;
		
	}
	
	return true;
}

function validateLeavedate()
{
	var dateOfLeaving=document.forms["f1"]["dateOfLeaving"].value;
	var seq= /^[\/0-9\s]+$/;
	check=document.getElementById("leavingdate");
    check.innerHTML  = "";
    var dateLeaving=new Date(dateOfLeaving);
    var currdate=new Date();
   if(dateOfLeaving==null||dateOfLeaving=="")
   {
	    check.innerHTML = "Please select date of leaving";
		return false;
   }
   else if(!(dateOfLeaving.match(seq)))
   {
   	    check.innerHTML = "Please enter a valid date";
		return false;
   }
   else if(dateLeaving<currdate)
   {

	    check.innerHTML = "Please enter a future date";
		return false;

   }
   return true;
}
function validateReason()
{
	check=document.getElementById("reason");
    check.innerHTML  = "";
  if(document.getElementById("txt").value==null || document.getElementById("txt").value=="")
  {
	  check.innerHTML = "Please select reason of leaving";
		return false;
  }
  return true;

} 
function validateDeactivateForm()
{
	//alert("in form");
      if(validateLeavedate() == false)
      {
    	  document.f1.dateOfLeaving.focus();
  		return false;
      }
      else if(validateReason() == false)
      {
    	  document.f1.reasonOfLeaving.focus();
    		return false;
      }
      //document.f1.submit;
     // alert("returning true");
      return true;
}

	/*else
	{
		alert("Your Product is Successfully added");
		return true;
	}*/
