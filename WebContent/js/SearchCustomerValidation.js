function activateFirst()
{
	document.forms["searchForm"]["businessName"].disabled=false;	
	document.forms["searchForm"]["bBranch"].disabled=false;
	
	document.forms["searchForm"]["tradingName"].disabled=true;	
	document.forms["searchForm"]["tBranch"].disabled=true;
	document.forms["searchForm"]["tradingName"].value=" ";	
	document.forms["searchForm"]["tBranch"].options[0].selected=true;
	var x=document.getElementById("tb");
	x.innerHTML=" ";

	
	document.forms["searchForm"]["accountNo"].disabled=true;	
	document.forms["searchForm"]["accountNo"].value=" ";
	var y=document.getElementById("acno");
	y.innerHTML=" ";

}

function activateSecond()
{
	
	document.forms["searchForm"]["businessName"].disabled=true;	
	document.forms["searchForm"]["bBranch"].disabled=true;
	document.forms["searchForm"]["businessName"].value=" ";	
	document.forms["searchForm"]["bBranch"].options[0].selected=true;
	
	document.forms["searchForm"]["tradingName"].disabled=false;	
	document.forms["searchForm"]["tBranch"].disabled=false;
	var x=document.getElementById("bb");
	x.innerHTML=" ";
	
	
	document.forms["searchForm"]["accountNo"].disabled=true;	
	document.forms["searchForm"]["accountNo"].value=" ";
	var y=document.getElementById("acno");
	y.innerHTML=" ";
}

function activateThird()
{
	document.forms["searchForm"]["businessName"].disabled=true;	
	document.forms["searchForm"]["bBranch"].disabled=true;
	document.forms["searchForm"]["businessName"].value=" ";	
	document.forms["searchForm"]["bBranch"].options[0].selected=true;
	var x=document.getElementById("tb");
	x.innerHTML=" ";
	
	document.forms["searchForm"]["tradingName"].disabled=true;	
	document.forms["searchForm"]["tBranch"].disabled=true;
	document.forms["searchForm"]["tradingName"].value=" ";	
	document.forms["searchForm"]["tBranch"].options[0].selected=true;
	var x=document.getElementById("bb");
	x.innerHTML=" ";
	
	document.forms["searchForm"]["accountNo"].disabled=false;	
}

function checkBusinessName()
{
	var checkBname=document.forms["searchForm"]["businessName"].value;
	var x=document.getElementById("bb");
	
	x.innerHTML=" ";
	
	if(checkBname=="" || checkBname==" " || !(isNan(bname)))
	{
		x.innerHTML="Please enter business name";
		return false; 		
	}
	return true;
}
function checkBranch()
{
	
	var x=document.getElementById("bbranch");
	x.innerHTML=" ";
	//if(document.forms["searchForm"]["bBranch"].options[0].selected==true)
	if(document.getElementById("branchName").value =="select"){
		//alert("Please select a branch");
		x.innerHTML="Please select branch name";
		return false;
	}
	return true;
}

function checkTradingBranch()
{
	
	var x=document.getElementById("tbranch");
	x.innerHTML=" ";
	if(document.getElementById("branchName").value =="select"){
		x.innerHTML="Please select branch name";
		return false;
	}
	return true;
}

function checkTradingName()
{
	var checkTname=document.forms["searchForm"]["tradingName"].value;
	var x=document.getElementById("tb");
	
	x.innerHTML=" ";
	
	if(checkTname=="" || checkTname==" ")
	{
		x.innerHTML="Please enter trading name";
		return false; 		
	}
	return true;
}

function checkAccountNo() 
{
	var accountNo=document.forms["searchForm"]["accountNo"].value;
	var x=document.getElementById("acno");

	x.innerHTML=" ";
	
	var num=/^[1-9][0-9]+$/;
	if(accountNo.match(num))
	{
    }
	else
	{
		x.innerHTML="Please check the account number";
		return false; 
	}
	return true;
}

function validate()
{	
	
	var checkBname=document.forms["searchForm"]["businessName"].value;
	var checkTname=document.forms["searchForm"]["tradingName"].value;
	var acNo=document.forms["searchForm"]["accountNo"].value;
	
	if(checkRadioButton()==false)
	{
		alert("Please select an option");
		return false;
		
	}	
	/*else if(checkRadioButton()==true)
	{
		if(checkBname==" ")
	}*/
	if(checkRadioButton()==true)
	{
		if(document.searchForm.searchOption[0].checked==true)
		{
			var b=document.forms["searchForm"]["branchName"].value;
	
			/*if(checkBranch()==false)
			{
				 if(checkBusinessName()==false)
				 { return false;}
				return false;
			}*/
			if(checkBusinessName()==false)
			{
				return false;
			}
			else if(checkBranch()==false)
			 { return false;}
			else
				return true;
		}
		else if(document.searchForm.searchOption[1].checked==true)
		{if(checkTradingName()==false)
		{
			if(checkTradingBranch()==false)
			{ return false; }
			//document.forms["searchForm"]["tradingName"].focus();	
			return false;
		}
		}
		else if(document.searchForm.searchOption[2].checked==true)
		{if(checkAccountNo()==false)
		{
			document.forms["searchForm"]["accountNo"].focus();
			return false;
		}
		
		}
	}
	
	return true;
}


function checkRadioButton()
{
	var option=document.getElementsByName("searchOption");
	var check=-1;

	for(var i=0;i<option.length;i++)
	{
		if(option[i].checked==true)
		{
			check=i;
		}
	}
	if(check==-1)
	{
		return false;
	}
return true;
}

function resetFields()
{
	var x=document.getElementById("bb");
	x.innerHTML=" ";
	var y=document.getElementById("tb");
	y.innerHTML=" ";
	var z=document.getElementById("acno");
	z.innerHTML=" ";
	var a=document.getElementById("bbranch");
	a.innerHTML=" ";
	var b=document.getElementById("tbranch");
	b.innerHTML=" ";

	document.forms["searchForm"]["businessName"].disabled=true;	
	document.forms["searchForm"]["bBranch"].disabled=true;
	
	document.forms["searchForm"]["tradingName"].disabled=true;	
	document.forms["searchForm"]["tBranch"].disabled=true;
	
	document.forms["searchForm"]["accountNo"].disabled=true;	
	
	
}