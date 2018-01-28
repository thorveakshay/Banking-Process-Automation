function validfunc1()
{
	if(validBname()==false)
	{
		document.registerForm.businessName.focus();
		return false;
	}
	else if(validateTname()==false)
	{
		document.registerForm.tradingName.focus();
		return false;
	}
	else if(validatebusinessType()==false)
	{
		document.registerForm.businessType.focus();
		return false;
	}
	else if(validateBranch()==false)
	{	
		document.registerForm.branchName.focus();
		return false;
	}
	else if(validateStartUp()==false)
	{
		document.registerForm.isStartUpBusiness[0].focus();
		return false;
	}
	else if(validateTurnover()==false)
	{	
		document.registerForm.expectedAnnualTurnover.focus();
		return false;
	}
	else if(businessCapital()==false)
	{	
		document.registerForm.bCapital.focus();
		return false;
	}
	else if(numberEmployees()==false)
	{
		document.registerForm.noOfEmployees.focus();
		return false;
	}
	else if(validateStatus()==false)
	{
		document.registerForm.businessStatus[0].focus();
		return false;
	}
	
	else if(validateCoreCountry()==false)
	{	
		document.registerForm.countryRegistration.focus();
		return false;
	}
	
}

function validBname()
{

	//FOR BUSINESS NAME
	var x=document.forms["registerForm"]["businessName"].value;
	var bname=/^[!@#$%&^*)(_+-]+$/;
	var check=document.getElementById("checkBN");
	var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
	check.innerHTML  = "";
	var flag=0;
	
	if(x=="" || x==null || x.length>160)
	  {
		 check.innerHTML ="Please enter Business Name";
	     return false;
	  }
	
	else if(x.match(bname))
		 {
		 check.innerHTML ="Please enter some alphabets in the Business name";
		 return false;
		 }
	
		 
	
	else if(x.charAt(0)==" ")
	{
   	 check.innerHTML ="Please enter a character in first place";
   	 return false; 
	}
	else if(!isNaN(x))
		{
       	 check.innerHTML ="Please enter some alphabets in the Business Name";
       	 return false; 
		}
	

/*	for(var i=0;i<=x.length();i++)
	{
		if(x.charAt(i)==" ")
		{
			count++;
		}
	}
	if(count==x.length())
	{
		check.innerHTML ="Business name can not be spaces only";
	}
	
	*/
	return true;
	        
}	

function validateTname()
{
	//FOR TRADING NAME
	//alert("Inside Tname");
	var x=document.forms["registerForm"]["tradingName"].value;
	var bname=/^[!@#$%&^*)(_+-]+$/;
	var check=document.getElementById("checkTN");	
	  check.innerHTML  = "";
	  
	if(x=="" || x==null)
	  {
		 check.innerHTML ="Please enter Trading Name";
	  return false;
	  }
	else if(x.charAt(0)==" ")
	{
   	 check.innerHTML ="Please enter a character in first place";
   	 return false; 
	}
	else if(!isNaN(x))
	{
   	 check.innerHTML ="Please enter some aplhabets in Trading name";
   	 return false; 
	}
	else if(x.match(bname))
	{
		 check.innerHTML ="Please enter some aplhabets in Trading name";
		 return false;
			
	}
		return true;
}
function validatebusinessType()
{
	//Business type
	var n=document.getElementById("businessType").value;
	var check=document.getElementById("checkBT");	
	  check.innerHTML  = "";
	
	if(n==0)
	  {
		 check.innerHTML ="Please enter Business Type";
	  return false;
	  }
return true;
}

function validateBranch()
{
	//FOR Branch NAME
	var n=document.getElementById("branchName").value;
	var check=document.getElementById("checkBRN");	
	  check.innerHTML  = "";
	
	if(n==0)
	  {
	   check.innerHTML ="Please enter Bank Branch Name";
	  return false;
	  }
	  return true;
}

function validateStartUp()
{
	var check=document.getElementById("checkStart");	
	  check.innerHTML  = "";
	
	if(document.registerForm.isStartUpBusiness[1].checked==false && document.registerForm.isStartUpBusiness[0].checked==false )
	{
		check.innerHTML ="Please enter Start-up Details";
	  return false;
	}
	return true;
}

function validateStatus()
{	var check=document.getElementById("checkBSS");	
	  check.innerHTML  = "";
	
	if(document.registerForm.businessStatus[1].checked==false && document.registerForm.businessStatus[0].checked==false &&document.registerForm.businessStatus[2].checked==false )
	{
		check.innerHTML ="Please enter Business Status";
	  return false;
	}
	return true;
}
function validateTurnover()
{

	//TURNOVER
	var x=document.forms["registerForm"]["expectedAnnualTurnover"].value;
	var check=document.getElementById("checkEAT");	
	  check.innerHTML  = "";
	
	if (x==null || x=="")
	{
	check.innerHTML ="Please enter Expected Annual Turnover";
	return false;
	}
	if(isNaN(x)|| x.indexOf(" ")!=-1)
	{
		check.innerHTML ="Please enter numeric value for TurnOver";
		return false; 
	}
	if(x<2 || x>30)
	{
		 check.innerHTML ="Please enter value between 2 and 30 million pounds";
	return false;
	}
	return true;
}

function businessCapital()
{
	//Business capital
	
	var x=document.forms["registerForm"]["bCapital"].value;
	var check=document.getElementById("checkBC");	
	  check.innerHTML  = "";
	  	
		if (x==null || x=="")
		{
			 check.innerHTML ="Please enter Total Business Capital";
			return false;
		}		
	        if(isNaN(x)|| x.indexOf(" ")!=-1)
			{
	        	 check.innerHTML ="Please enter numeric value for Business Capital";
	        	 return false; 
		}
	        if(x<1 || x>999)
	    	{
	    		 check.innerHTML ="Please enter value between 1 and 999 million pounds";
	    	return false;
	    	}
	return true;
}

function numberEmployees()
{
	var x=document.forms["registerForm"]["noOfEmployees"].value;
	var check=document.getElementById("checkEN");	
	  check.innerHTML  = "";
	  	
		if (x==null || x=="")
		{
			 check.innerHTML ="Please enter number of Employees";
			return false;
		}		
	        if(isNaN(x)|| x.indexOf(" ")!=-1)
			{
	        	 check.innerHTML ="Please enter numeric value for Number of Employees";
	        	 return false; 
			}
	        if(x<5)
	    	{
	    		 check.innerHTML ="Please enter for number of employees";
	    	return false;
	    	}
	return true;
}

function validateCoreCountry()
{
	//alert("In country");
	var n=document.getElementById("countryRegistration").value;
	var check=document.getElementById("checkCore");	
	  check.innerHTML  = "";
	
	if(n==0)
	  {
	   check.innerHTML ="Please select Country of Registration";
	  return false;
	  }
	  return true;
}

function validatestartUp1()
{
	document.getElementById("regDate").disabled=false;
	document.getElementById("estDate").disabled=true;	
	document.registerForm.registrationDate.value="";
	document.getElementById("eImage").style.display="none";
	document.getElementById("rImage").style.display="inline";
	document.getElementById("error_dor").innerHTML="";
	document.getElementById("error_doe").innerHTML="";
	var dateOfReg=document.registerForm.registrationDate.value;
	//var dateOfReg=document.forms["registerForm"]["registrationDate"].value;
	var check=document.getElementById("error_dor");
	if(dateOfReg==""){
		document.getElementById("error_dor").innerHTML="Please enter date of registration";
		return false;
	}else{
		document.getElementById("error_dor").innerHTML="";
	return true;	
	}
	
	return true;
}

function validatestartUp2()
{
	document.getElementById("estDate").disabled=false;	
	document.getElementById("regDate").disabled=true;
	document.registerForm.establismentDate.value="";
	document.getElementById("rImage").style.display="none";
	document.getElementById("eImage").style.display="inline";
	document.getElementById("error_dor").innerHTML="";
	document.getElementById("error_doe").innerHTML="";
	var dateOfEstab=document.registerForm.establismentDate.value;
	if(dateOfEstab==""){
		document.getElementById("error_doe").innerHTML="Please enter date of establishment";
		return false;
	}else{
		document.getElementById("error_doe").innerHTML="";
	return true;	
	}
	
	return true;
}

function validateRDate()
{	
	var dateOfReg=document.forms["registerForm"]["registrationDate"].value;
	var check=document.getElementById("error_dor");
	dateOfReg=new Date(dateOfReg);
	var curDate=new Date();
	check.innerHTML ="";
	  if(dateOfReg<curDate)
	  	{
			check.innerHTML=" Please select a future date";
			return false;
		}
	return true;		
	
}
function validateEDate()
{
	var dateOfEstab=document.forms["registerForm"]["establismentDate"].value;
	var check=document.getElementById("error_doe");
	dateOfEstab=new Date(dateOfEstab);
	var curDate=new Date();
	check.innerHTML ="";
	  if(dateOfEstab>curDate)
	  	{
			check.innerHTML=" Please select a past date";
			return false;
		}
	return true;		
	
}

/*function validateDate(){
	var isStartup=document.getElementById("isStart").checked;
	var dateOfReg=document.registerForm.registrationDate.value;
	var dateOfEstab=document.registerForm.establismentDate.value;
	if(isStartup==true){
		
		if(dateOfReg==""){
			document.getElementById("error_dor").innerHTML="Please enter date of registration";
			return false;
		}else{
			
			document.getElementById("error_dor").innerHTML="";
			return true;
		}
		
	}else{
		if(dateOfEstab==""){
			document.getElementById("error_doe").innerHTML="Please enter date of establishment";
			return false;
		}else{
			document.getElementById("error_doe").innerHTML="";
		return true;	
		}
		
	}
	
	
}
*/


function validfunc2()
{
	if(validateIndustrySector()==false)
	{
		document.registerForm.industrySector.focus();
		return false;
	}
	if(validateActivity()==false)
	{
		document.registerForm.mainActivity.focus();
		return false;
	}
	if(validatePreciseActivity()==false)
	{
		document.registerForm.preciseActivity.focus();
		return false;
	}
	if(validateFundRequirement()==false)
	{
		document.registerForm.requireFunding[0].focus();
		return false;
	}
	if(validateFund()==false)
	{
		document.registerForm.fundAmount.focus();
		return false;
	}
	if(validateGoods()==false)
	{
		document.registerForm.goods[0].focus();
		return false;
	}
	if(validateGroupFranchise()==false)
	{
		document.registerForm.groupFranchise[0].focus();
		return false;
	}
}

function validateIndustrySector()
{
	var x=document.forms["registerForm"]["industrySector"].value;
	var seq=/^[A-Za-z][A-Za-z@$&0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	var check=document.getElementById("checkSector");
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
    check.innerHTML  = "";
    if(x==null || x=="")
	{
      //alert("Please enter a Name");
	  check.innerHTML = "Please enter Industry sector";
	  return false;
	}
    else if(x.charAt(0)==" ")
	{
	   	 check.innerHTML ="Industry Sector cannot start with blank character";
	   	 return false; 
		}
    else if(!(isNaN(x)))
    {
    	check.innerHTML = "Please enter Industry sector using alphabets only";
		return false;
    }
    else if(!(x.match(randomseq)))
    {
    	check.innerHTML = "Please use alphabets only ";
  	  return false;
        }
    return true;
	}
function validateActivity()
{

	var x=document.forms["registerForm"]["mainActivity"].value;
	var seq=/^[A-Za-z][A-Za-z@$&0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	var check=document.getElementById("checkActivity");
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
    check.innerHTML  = "";
    if(x==null || x=="")
	{
      //alert("Please enter a Name");
	  check.innerHTML = "Please enter Main Activity";
	  return false;
	}
    else if(x.charAt(0)==" ")
	{
   	 check.innerHTML ="Main Activity cannot start with blank character";
   	 return false; 
	}
    else if(!(isNaN(x)))
    {
    	check.innerHTML = "Please enter Main Activity using alphabets only";
		return false;
    }
    else if(!(x.match(randomseq)))
    {
    	check.innerHTML = "Please use alphabets only ";
  	  return false;
        }
    return true;
	}
function validatePreciseActivity()
{

	var x=document.forms["registerForm"]["preciseActivity"].value;
	var seq=/^[A-Za-z][A-Za-z@$&0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	var check=document.getElementById("checkPreciseActivity");
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
    check.innerHTML  = "";
    if(x==null || x=="")
	{
      //alert("Please enter a Name");
	  check.innerHTML = "Please enter Precise Activity";
	  return false;
	}
    else if(x.charAt(0)==" ")
	{
   	 check.innerHTML ="Precise Activity cannot start with blank character";
   	 return false; 
	}
    else if(!(isNaN(x)))
    {
    	check.innerHTML = "Please enter Precise Activity using alphabets only";
		return false;
    }
    else if(!(x.match(randomseq)))
    {
    	check.innerHTML = "Please enter Precise Activity using alphabets only";
  	  return false;
        }
    return true;
    
	}
function validateFundRequirement()
{
	    var check=document.getElementById("checkRadio");	
		  check.innerHTML  = "";
		
		if(document.registerForm.requireFunding[0].checked==false && document.registerForm.requireFunding[1].checked==false )
		{
			check.innerHTML ="Please select whether you require funding";
		  return false;
		}
		
		return true;
}


function validateFund()
{

	
	var x=document.forms["registerForm"]["fundAmount"].value;
	var seq=/^[A-Za-z][A-Za-z@$&0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	var symbolSeq = /^[[@$&#!^*()?]+$/;
	var check=document.getElementById("checkFund");
    check.innerHTML  = "";
    if(document.registerForm.requireFunding[1].checked==true)
    {
		return true;
    }
    else if(x==null || x=="")
	{
     	  check.innerHTML = "Please enter required amount";
	  return false;
	}
    else if(isNaN(x))
    {
    	check.innerHTML = "Please enter numeric value for fund required";
		return false;
    }
    else if(x.match(symbolSeq))
    {
    	check.innerHTML = "Please enter numeric value for fund required";
		return false;
        
        }
    if(x<1 || x>999)
	{
		 check.innerHTML ="Please enter value between 1 and 999 million pounds";
	return false;
	}
    return true;
	}


function validateFundingFieldYes()
{
	document.getElementById("funField").disabled=false;		
	return true;
}

function validateFundingFieldNo()
{
	document.getElementById("funField").disabled=true;		
	return true;
}


function validateGoods()
{
	

	    var check=document.getElementById("checkGoods");	
		  check.innerHTML  = "";
		
		if(document.registerForm.goods[1].checked==false && document.registerForm.goods[0].checked==false )
		{
			check.innerHTML ="Please select whether you export/import goods?";
		  return false;
		}
		return true;
}



function validateGroupFranchise()
{

	    var check=document.getElementById("checkGF");	
		  check.innerHTML  = "";
		
		if(document.registerForm.groupFranchise[1].checked==false && document.registerForm.groupFranchise[0].checked==false )
		{
			check.innerHTML ="Please select whether you export/import goods?";
		  return false;
		}
		return true;
 }


function validfunc3()
{
	if(validateBuildingNo()==false)
	{
		document.registerForm.buildingNumber.focus();
		return false;
	}
	else if(validateName()==false)
	{
		document.registerForm.buildingName.focus();
		return false;
	}
	else if(validateStreet()==false)
	{
		document.registerForm.streetName.focus();
		return false;
	}
	else if(validateTown()==false)
	{	
		document.registerForm.townName.focus();
		return false;
	}
	else if(validateCity()==false)
	{	
		document.registerForm.cityName.focus();
		return false;
	}
	else if(validatePostalNo()==false)
	{	
		document.registerForm.postalCode.focus();
		return false;
	}
	else if(validateCountry()==false)
	{	
		document.registerForm.country.focus();
		return false;
	}
	else if(validateSameAdd()==false)
	{
		document.registerForm.sameAddress[0].focus();
		return false;
	}
	
}


function validateBuildingNo()
{
	var num=document.forms["registerForm"]["buildingNumber"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z0-9][A-Za-z0-9\s]+$/;
	var numseq=/^[@$&#!^*()?]+$/;
	check=document.getElementById("checkNum");
    check.innerHTML  = "";
 
   if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Building Number";
	  return false;
	}
    else if(num.length>15)
    {
    	check.innerHTML = "Please enter Building Number with less than 15 characters";
  	  return false;
    }
    else if(num.charAt(0)==" ")
	{
   	 check.innerHTML ="Building number cannot start with blank character";
   	 return false; 
	}
    else if(!(num.match(randomseq)))
    {
    	check.innerHTML = "Please use alphabets or numbers only ";
  	  return false;
        }
       return true;
       
    
}
function validateName()
{
	var name=document.forms["registerForm"]["buildingName"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	//var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9]+$/;
	check=document.getElementById("checkName");
    check.innerHTML  = "";
 

    if(name.length==0)
    {
    	return true;
    }
    else if(name.length<2 || name.length>20)
  {
    	check.innerHTML = "Please enter Building Name with less than 20 characters ";
  	    return false;
    }

    else if(!name.match(seq) && name!=null&& name!="")
    {
    	check.innerHTML = "Please enter Building Name containing only alphabets";
  	  return false;
        }
    else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter Building Name containing only alphabets";
    	  return false;
    }
    else if(!name.match(seq)&& name!=null && name!="")
    {
    	check.innerHTML = "Please enter Building Name";
  	  return false;
    }
 return true;
	}

function validateStreet()
{
	var name=document.forms["registerForm"]["streetName"].value;   
   var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z0-9][A-Za-z0-9\s]+$/;
	var numseq=/^[@$&#!^*()?]+$/;
	check=document.getElementById("checkStreet");
   check.innerHTML  = "";

  if(name==null || name=="")
	{
	  check.innerHTML = "Please enter Street name";
	  return false;
	}
   else if(name.length<2 || name.length>20)
   {
   	check.innerHTML = "Please enter Building Name between 2 and 20 characters";
 	  return false;
   }
   else if(name.charAt(0)==" ")
	{
  	 check.innerHTML ="Street name cannot start with blank character";
  	 return false; 
	}
   else if(!(name.match(randomseq)))
   {
   	check.innerHTML = "Please use alphabets or numbers only ";
 	  return false;
       }
      return true;
      
   
	}
function validateTown()
{
	var name=document.forms["registerForm"]["townName"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9]+$/;
	check=document.getElementById("checkTown");
    check.innerHTML  = "";
 
   if(name==null || name=="")
	{
	  check.innerHTML = "Please enter Town name";
	  return false;
	}
   else if(name.length<2 || name.length>20)
   {
   	check.innerHTML = "Please enter Building Name between 2 and 20 characters ";
 	  return false;
   }
   else if(name.charAt(0)==" ")
	{
  	 check.innerHTML ="Town name cannot start with blank character";
  	 return false; 
	}
   else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter Town name using alphabets only";
    	  return false;
    }
    else if(!(name.match(randomseq)))
    {
    	check.innerHTML = "Please enter Town name using alphabets only";
  	  return false;
        }
    else if(name.match(numseq))
    {
    	check.innerHTML = "Please enter Town name using alphabets only";
  	  return false;
        }
   
   return true;
	}
function validateCity()
{
	var name=document.forms["registerForm"]["cityName"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9]+$/;
	check=document.getElementById("checkCity");
    check.innerHTML  = "";
 
   if(name==null || name=="")
	{
	  check.innerHTML = "Please enter City name";
	  return false;
	}
   else if(name.charAt(0)==" ")
	{
 	 check.innerHTML ="City name cannot start with blank character";
 	 return false; 
	}
   else if(name.length<3 || name.length>20)
   {
   	check.innerHTML = "Please enter City Name between 3 and 20 characters ";
 	  return false;
   }
   
   else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter City name using alphabets only";
    	  return false;
    }
    else if(!(name.match(randomseq)))
    {
    	check.innerHTML = "Please enter City name using alphabets only";
  	  return false;
        }
    else if(name.match(numseq))
    {
    	check.innerHTML = "Please enter City name using alphabets only";
  	  return false;
        }
 
   return true;
	}
function validatePostalNo()
{
	var num=document.forms["registerForm"]["postalCode"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?]+$/;
	check=document.getElementById("checkPostal");
    check.innerHTML  = "";
 
   if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Postal Code";
	  return false;
	}  
   else if(num.charAt(0)==" ")
	{
 	 check.innerHTML ="Postal number cannot start with blank character";
 	 return false; 
	}
   return true;
}

function validateCountry()
{
	var n=document.getElementById("country").value;
	var check=document.getElementById("checkCountry");	
	  check.innerHTML  = "";
	
	if(n==0)
	  {
	   check.innerHTML ="Please select Country of Registration";
	  return false;
	  }
	  return true;
	}

function validateSameAdd()
{
	 var check=document.getElementById("checkAddr");	
	  check.innerHTML  = "";
	
	if(document.registerForm.sameAddress[1].checked==false && document.registerForm.sameAddress[0].checked==false )
	{
		check.innerHTML = "Please select address details" ;
	  return false;
	}
	return true;
}

function validfunc5()
{
	if(mvalidateBuildingNo()==false)
	{
		document.registerForm.mbuildingNumber.focus();
		return false;
	}
	else if(mvalidateName()==false)
	{
		document.registerForm.mbuildingName.focus();
		return false;
	}
	else if(mvalidateStreet()==false)
	{
		document.registerForm.mstreetName.focus();
		return false;
	}
	else if(mvalidateTown()==false)
	{	
		document.registerForm.mtownName.focus();
		return false;
	}
	else if(mvalidateCity()==false)
	{	
		document.registerForm.mcityName.focus();
		return false;
	}
	else if(mvalidatePostalNo()==false)
	{	
		document.registerForm.mpostalCode.focus();
		return false;
	}
	else if(mvalidateCountry()==false)
	{	
		document.registerForm.mcountry.focus();
		return false;
	}
	
}



function mvalidateBuildingNo()
{
	var num=document.forms["registerForm"]["mbuildingNumber"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z0-9][A-Za-z0-9\s]+$/;
	var numseq=/^[@$&#!^*()?]+$/;
	check=document.getElementById("mcheckNum");
    check.innerHTML  = "";
 
   if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Building Number";
	  return false;
	}
   else if(num.charAt(0)==" ")
	{
  	 check.innerHTML ="Building number cannot start with blank character";
  	 return false; 
	}
    else if(num.length>10)
    {
    	check.innerHTML = "Please enter Building Number with less than 10 characters";
  	  return false;
    }
    else if(!(num.match(randomseq)))
    {
    	check.innerHTML = "Please use alphabets or numbers only ";
  	  return false;
        }
    
       return true;
}
function mvalidateName()
{
	var name=document.forms["registerForm"]["mbuildingName"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	//var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9]+$/;
	check=document.getElementById("mcheckName");
    check.innerHTML  = "";

    if(name.length==0)
    {
    	return true;
    }
    else if(name.length<2 || name.length>20)
  {
    	check.innerHTML = "Please enter Building Name with less than 20 characters ";
  	    return false;
    }

    else if(!name.match(seq) && name!=null&& name!="")
    {
    	check.innerHTML = "Please enter Building Name containing only alphabets";
  	  return false;
        }
    else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter Building Name containing only alphabets";
    	  return false;
    }
    else if(!name.match(seq)&& name!=null && name!="")
    {
    	check.innerHTML = "Please enter Building Name";
  	  return false;
    }
 return true;
	}
function mvalidateStreet()
{
	var name=document.forms["registerForm"]["mstreetName"].value;
	 var seq=/^[A-Za-z][A-Za-z\s]+$/;
		var randomseq =/^[A-Za-z0-9][A-Za-z0-9\s]+$/;
		var numseq=/^[@$&#!^*()?]+$/;
		check=document.getElementById("mcheckStreet");
	   check.innerHTML  = "";

	  if(name==null || name=="")
		{
		  check.innerHTML = "Please enter Street name";
		  return false;
		}
	   else if(name.length<2 || name.length>20)
	   {
	   	check.innerHTML = "Please enter Building Name between 2 and 20 characters";
	 	  return false;
	   }
	   else if(name.charAt(0)==" ")
		{
	  	 check.innerHTML ="Street name cannot start with blank character";
	  	 return false; 
		}
	   else if(!(name.match(randomseq)))
	   {
	   	check.innerHTML = "Please use alphabets or numbers only ";
	 	  return false;
	       }
	      return true;
	}
function mvalidateTown()
{
	var name=document.forms["registerForm"]["mtownName"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9]+$/;
	check=document.getElementById("mcheckTown");
    check.innerHTML  = "";
 
   if(name==null || name=="")
	{
	  check.innerHTML = "Please enter Town name";
	  return false;
	}
   else if(name.length<2 || name.length>20)
   {
   	check.innerHTML = "Please enter Building Name between 2 and 20 characters ";
 	  return false;
   }
   else if(name.charAt(0)==" ")
	{
  	 check.innerHTML ="Town name cannot start with blank character";
  	 return false; 
	}
   else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter Town name using alphabets only";
    	  return false;
    }
    else if(!(name.match(randomseq)))
    {
    	check.innerHTML = "Please enter Town name using alphabets only";
  	  return false;
        }
    else if(name.match(numseq))
    {
    	check.innerHTML = "Please enter Town name using alphabets only";
  	  return false;
        }
   return true;
	}

function mvalidateCity()
{
	var name=document.forms["registerForm"]["mcityName"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9]+$/;
	check=document.getElementById("mcheckCity");
    check.innerHTML  = "";
 
   if(name==null || name=="")
	{
	  check.innerHTML = "Please enter City name";
	  return false;
	}
   else if(name.charAt(0)==" ")
	{
 	 check.innerHTML ="City name cannot start with blank character";
 	 return false; 
	}
   else if(name.length<3 || name.length>20)
   {
   	check.innerHTML = "Please enter City name between 3 and 20 characters ";
 	  return false;
   }
   else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter City name";
    	  return false;
    }
    else if(!(name.match(randomseq)))
    {
    	check.innerHTML = "Please enter City name ";
  	  return false;
        }
    else if(name.match(numseq))
    {
    	check.innerHTML = "Please enter City name";
  	  return false;
        }
   return true;
}
function mvalidatePostalNo()
{
	var num=document.forms["registerForm"]["mpostalCode"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?]+$/;
	check=document.getElementById("mcheckPostal");
    check.innerHTML  = "";
 
   if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Postal Code";
	  return false;
	}
   else if(num.charAt(0)==" ")
	{
  	 check.innerHTML ="Postal number cannot start with blank character";
  	 return false; 
	}
   return true;
	}
function mvalidateCountry()
{
	var n=document.getElementById("mcountry").value;
	var check=document.getElementById("mcheckCountry");	
	  check.innerHTML  = "";
	
	if(n==0)
	  {
	   check.innerHTML ="Please select Country of Registration";
	  return false;
	  }
	  return true;
	
	}


function validfunc4()
{
	if(cvalidateBuildingNo()==false)
	{
		document.registerForm.cbuildingNumber.focus();
		return false;
	}
	else if(cvalidateName()==false)
	{
		document.registerForm.cbuildingName.focus();
		return false;
	}
	else if(cvalidateStreet()==false)
	{
		document.registerForm.cstreetName.focus();
		return false;
	}
	else if(cvalidateTown()==false)
	{	
		document.registerForm.ctownName.focus();
		return false;
	}
	else if(cvalidateCity()==false)
	{	
		document.registerForm.ccityName.focus();
		return false;
	}
	else if(cvalidatePostalNo()==false)
	{	
		document.registerForm.cpostalCode.focus();
		return false;
	}
	else if(cvalidateCountry()==false)
	{	
		document.registerForm.ccountry.focus();
		return false;
	}
	else if(validateSameAdd1()==false)
	{
		document.registerForm.sameAddress1[0].focus();
		return false;
	}
}


function cvalidateBuildingNo()
{
	var num=document.forms["registerForm"]["cbuildingNumber"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z0-9][A-Za-z0-9\s]+$/;
	var numseq=/^[@$&#!^*()?]+$/;
	check=document.getElementById("ccheckNum");
    check.innerHTML  = "";
 
   if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Building Number";
	  return false;
	}
   else if(num.charAt(0)==" ")
	{
  	 check.innerHTML ="Building number cannot start with blank character";
  	 return false; 
	}
    else if(num.length>10)
    {
    	check.innerHTML = "Please enter Building Number with less than 10 characters";
  	  return false;
    }
    else if(!(num.match(randomseq)))
    {
    	check.innerHTML = "Please use alphabets or numbers only ";
  	  return false;
        }
    
       return true;
}
function cvalidateName()
{
	var name=document.forms["registerForm"]["cbuildingName"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	//var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9]+$/;
	check=document.getElementById("ccheckName");
    check.innerHTML  = "";

    if(name.length==0)
    {
    	return true;
    }
    else if(name.length<2 || name.length>20)
  {
    	check.innerHTML = "Please enter Building Name with less than 20 characters ";
  	    return false;
    }

    else if(!name.match(seq) && name!=null&& name!="")
    {
    	check.innerHTML = "Please enter Building Name containing only alphabets";
  	  return false;
        }
    else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter Building Name containing only alphabets";
    	  return false;
    }
    else if(!name.match(seq)&& name!=null && name!="")
    {
    	check.innerHTML = "Please enter Building Name";
  	  return false;
    }
 return true;
	}
function cvalidateStreet()
{
	var name=document.forms["registerForm"]["cstreetName"].value;
	 var seq=/^[A-Za-z][A-Za-z\s]+$/;
		var randomseq =/^[A-Za-z0-9][A-Za-z0-9\s]+$/;
		var numseq=/^[@$&#!^*()?]+$/;
		check=document.getElementById("ccheckStreet");
	   check.innerHTML  = "";

	  if(name==null || name=="")
		{
		  check.innerHTML = "Please enter Street name";
		  return false;
		}
	   else if(name.length<2 || name.length>20)
	   {
	   	check.innerHTML = "Please enter Building Name between 2 and 20 characters";
	 	  return false;
	   }
	   else if(name.charAt(0)==" ")
		{
	  	 check.innerHTML ="Street name cannot start with blank character";
	  	 return false; 
		}
	   else if(!(name.match(randomseq)))
	   {
	   	check.innerHTML = "Please use alphabets or numbers only ";
	 	  return false;
	       }
	      return true;
}


function cvalidateTown()
{
	var name=document.forms["registerForm"]["ctownName"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9]+$/;
	check=document.getElementById("ccheckTown");
    check.innerHTML  = "";
 
   if(name==null || name=="")
	{
	  check.innerHTML = "Please enter Town name";
	  return false;
	}
   else if(name.length<2 || name.length>20)
   {
   	check.innerHTML = "Please enter Building Name between 2 and 20 characters ";
 	  return false;
   }
   else if(name.charAt(0)==" ")
	{
  	 check.innerHTML ="Town name cannot start with blank character";
  	 return false; 
	}
   else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter Town name using alphabets only";
    	  return false;
    }
    else if(!(name.match(randomseq)))
    {
    	check.innerHTML = "Please enter Town name using alphabets only";
  	  return false;
        }
    else if(name.match(numseq))
    {
    	check.innerHTML = "Please enter Town name using alphabets only";
  	  return false;
        }
   return true;
	}
function cvalidateCity()
{
	var name=document.forms["registerForm"]["ccityName"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z\s]+$/;
	var numseq=/^[@$&#!^*()?0-9]+$/;
	check=document.getElementById("ccheckCity");
    check.innerHTML  = "";
 
   if(name==null || name=="")
	{
	  check.innerHTML = "Please enter City name";
	  return false;
	}
   else if(name.charAt(0)==" ")
	{
 	 check.innerHTML ="City name cannot start with blank character";
 	 return false; 
	}
   else if(name.length<3 || name.length>20)
   {
   	check.innerHTML = "Please enter Building Name between 3 and 20 characters ";
 	  return false;
   }
   else if(!(isNaN(name)))
    {
    	check.innerHTML = "Please enter City name using alphabets only";
    	  return false;
    }
    else if(!(name.match(randomseq)))
    {
    	check.innerHTML = "Please enter City name using alphabets only";
  	  return false;
        }
    else if(name.match(numseq))
    {
    	check.innerHTML = "Please enter City name using alphabets only";
  	  return false;
        }
   
   return true;
	}
function cvalidatePostalNo()
{
	var num=document.forms["registerForm"]["cpostalCode"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?]+$/;
	check=document.getElementById("ccheckPostal");
    check.innerHTML  = "";
 
   if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Postal Code";
	  return false;
	}
   else if(name.charAt(0)==" ")
	{
  	 check.innerHTML ="Postal number cannot start with blank character";
  	 return false; 
	}
   return true;
	}
function cvalidateCountry()
{
	
	var n=document.getElementById("ccountry").value;
	var check=document.getElementById("ccheckCountry");	
	  check.innerHTML  = "";
	
	if(n==0)
	  {
	   check.innerHTML ="Please select Country of Registration";
	  return false;
	  }
	  return true;
	}
function validateSameAdd1()
{
	 var check=document.getElementById("checkAddr1");	
	  check.innerHTML  = "";
	
	if(document.registerForm.sameAddress1[1].checked==false && document.registerForm.sameAddress1[0].checked==false )
	{
		check.innerHTML = "Please select address details" ;
	  return false;
	}
	return true;
}



function validfunc6()
{
	if(validateNumber1()==false)
	{
		document.registerForm.w_areaCode.focus();
		return false;
	}
	if(validateNumber2()==false)
	{
		document.registerForm.w_countryCode.focus();
		return false;
	}
	if(validateNumber()==false)
	{
		document.registerForm.phone_no.focus();
		return false;
	}
	if(validateNumber1F()==false)
	{
		document.registerForm.f_areaCode.focus();
		return false;
	}
	if(validateNumber2F()==false)
	{
		document.registerForm.f_countryCode.focus();
		return false;
	}
	if(validateFNumber()==false)
	{
		document.registerForm.fax_no.focus();
		return false;
	}
	if(validateEmailId()==false)
	{
		document.registerForm.emailId.focus();
		return false;
	}
	if(validateIdProof()==false)
	{
		document.registerForm.idProof.focus();
		return false;
	}
	else if(validateIDField()==false)
	{
		document.registerForm.file_uploading1.focus();
		return false;
	}
	else if(validateAddProof()==false)
	{
		document.registerForm.addProof.focus();
		return false;
	}
	else if(validateAddressField()==false)
	{	
		document.registerForm.file_uploading2.focus();
		return false;
	}
}


function validateIdProof()
{
	var n=document.getElementById("idProof").value;
	var check=document.getElementById("checkID");	
	  check.innerHTML  = "";
	
	if(n==0)
	  {
		 check.innerHTML ="Please select Id proof";
	  return false;
	  }
return true;
}

function validateAddProof()
{
	var n=document.getElementById("addProof").value;
	var check=document.getElementById("checkAdd");	
	  check.innerHTML  = "";
	
	if(n==0)
	  {
		 check.innerHTML ="Please select Address Proof";
	  return false;
	  }
return true;
}

function validateIDField()
{
	var x=document.forms["registerForm"]["file_uploading1"].value;
	var check=document.getElementById("filename1");	
	  check.innerHTML  = "";
	
	if (x==null || x=="")
	{
		 check.innerHTML  = "Please upload Id Proof";
	return false;
	}
	else if(x.match(/jpg$/)||x.match(/jpeg$/))
	{
		return true;
	}
	else
	{
	 check.innerHTML  = "Please upload .jpg,.jpeg format only";
	return false;
	}
}

function validateAddressField()
{
	var x=document.forms["registerForm"]["file_uploading2"].value;
	var check=document.getElementById("filename2");	
	  check.innerHTML  = "";
	
	  if (x==null || x=="")
		{
			 check.innerHTML  = "Please upload Id Proof";
		return false;
		}
		else if(x.match(/jpg$/)||x.match(/jpeg$/))
		{
			return true;
		}	
		else
		{
		 check.innerHTML  = "Please upload .jpg,.jpeg format only";
		return false;
		}
}

function validateEmailId()
{
	var eid=document.forms["registerForm"]["emailId"].value;
	check=document.getElementById("EId");
    check.innerHTML  = "";
    
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
   /* var atpos=eid.indexOf("@");
    var dotpos=eid.lastIndexOf(".");
    if(eid.indexOf(" ")!=-1)
	{
  	 check.innerHTML ="Email id cannot start with blank character";
  	 return false; 
	}
    else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=eid.length)
      {
    	check.innerHTML = "Please select valid email id";
        return false;
      }
    return true;*/
}
function validateNumber()
{
	var num=document.forms["registerForm"]["phone_no"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	check=document.getElementById("cnt");
    check.innerHTML  = "";
    if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Phone Number";
	  return false;
	}
    else if(num.length<7 || num.length>7)
    {
    	check.innerHTML = "Please enter 7 digits Phone Number";
  	  return false;
    }
    else if(isNaN(num) || num.indexOf(" ")!=-1)
    {
    	check.innerHTML = "Please enter Phone Number using numbers only";
    	  return false;
    }
   return true;
}

function validateNumber1()
{
	var num=document.forms["registerForm"]["w_areaCode"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	check=document.getElementById("cnt");
    check.innerHTML  = "";
    if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Area code";
	  return false;
	}
    
    else if(num.length<2 || num.length>3)
    {
    	check.innerHTML = "Please enter Area Code of 2 or 3 digits";
  	  return false;
    }
    else if(isNaN(num))
    {
    	check.innerHTML = "Please enter Area code using numbers only";
    	  return false;
    }
   return true;
}

function validateNumber2()
{
	var num=document.forms["registerForm"]["w_countryCode"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	check=document.getElementById("cnt");
    check.innerHTML  = "";
    if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Country code";
	  return false;
	}
  
    else if(num.length<2 || num.length>2)
    {
    	check.innerHTML = "Please enter 2 digits Country code";
  	  return false;
    }
    else if(isNaN(num) || num.indexOf(" ")!=-1)
    {
    	check.innerHTML = "Please enter country code using numbers only";
    	  return false;
    }
   return true;
}

function validateFNumber()
{
	var num=document.forms["registerForm"]["fax_no"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	check=document.getElementById("cntf");
    check.innerHTML  = "";
    if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Fax Number";
	  return false;
	}
    else if(num.length<5 || num.length>12)
    {
    	check.innerHTML = "Please enter 7 digits Fax Number";
  	  return false;
    }
    else if(isNaN(num) || num.indexOf(" ")!=-1)
    {
    	check.innerHTML = "Please enter Fax Number using numbers only";
    	  return false;
    }
   return true;
}

function validateNumber1F()
{
	var num=document.forms["registerForm"]["f_areaCode"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	check=document.getElementById("cntf");
    check.innerHTML  = "";
    if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Area code";
	  return false;
	}
    else if(num.length<2 || num.length>3)
    {
    	check.innerHTML = "Please enter 2 or 3 digits for Area code";
  	  return false;
    }
    else if(isNaN(num) || num.indexOf(" ")!=-1)
    {
    	check.innerHTML = "Please enter Area code using numbers only";
    	  return false;
    }
   return true;
}

function validateNumber2F()
{
	var num=document.forms["registerForm"]["f_countryCode"].value;
	var seq=/^[A-Za-z][A-Za-z\s]+$/;
	var randomseq =/^[A-Za-z][A-Za-z@$&#!^*()?0-9\s]+$/;
	var numseq=/^[@$&#!^*()?0-9][A-Za-z@$&0-9\s]+$/;
	check=document.getElementById("cntf");
    check.innerHTML  = "";
    if(num==null || num=="")
	{
	  check.innerHTML = "Please enter Country code";
	  return false;
	}
    else if(num.length<2 || num.length>2)
    {
    	check.innerHTML = "Please enter 2 digits Country code";
  	  return false;
    }
    else if(isNaN(num) || num.indexOf(" ")!=-1)
    {
    	check.innerHTML = "Please enter country code using numbers only";
    	  return false;
    }
   return true;
}

