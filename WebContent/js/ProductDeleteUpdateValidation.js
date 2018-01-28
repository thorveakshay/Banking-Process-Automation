function checkid()
{
	
		var check_id=document.forms["ProductsAdd"]["ProductId"].value;
		var x=document.getElementById("pid");
		x.innerHTML="";
		if (check_id==null || check_id=="")
		{
  		x.innerHTML="Please enter product id";
 		return false; 		
		}
		else if(check_id.length!=4)
		{ x.innerHTML="Product Id must be 4 digit number";
		return false;
		}	
		var numbers = /^[1-9]+$/;
		var num=/^[1-9][0-9]+$/;
		if(check_id.match(numbers)||check_id.match(num))
		{
	    }
		else
		{
		x.innerHTML="Product id contains only numbers";
 		return false;
		}
			
	return true;
	
}
function checkname()
{


var check_name=document.forms["ProductsAdd"]["ProductName"].value;
	var name=/^[a-zA-Z][0-9a-zA-Z\s,&']+$/;
	var x=document.getElementById("pname");
	x.innerHTML="";
	
	if(check_name.charAt(0)>=0&&check_name.charAt(0)<=9)
	{
		x.innerHTML="Start the Product name with a letter only";
		return false;
	}	
	if(check_name.indexOf(",,")>0||check_name.indexOf("&&")>0||check_name.indexOf("''")>0)
	{
	x.innerHTML="Consecutive special characters are not allowed";
	return false;
	}

		if (check_name==null || check_name=="")
		{
		
  		x.innerHTML="Please enter product name";
		return false;
		}
			
		if(check_name.length<5)
			{
			x.innerHTML="Product name must contain more than 5 characters";
			return false;
 			}
		if(check_name.length>50)
		{
		x.innerHTML="Product name must contain less than 50 characters";
		return false;
			}
		if(check_name.match(name))
			{
			}
		else
		{x.innerHTML="Product name should contain letters,numbers and {,'&} characters only";
		return false;
 		
 		
		}
return true;
}
function checkaccount()
{
	var check_ct=document.forms["ProductsAdd"]["AccountType"].value;
	var x=document.getElementById("account");
	x.innerHTML="";
	
	if(check_ct=="selectat")
	{
	x.innerHTML="Please select account type";
	return false;
	}
	else
	{
	return true;
	}
}

function checkcustomer()
{
		
		var check_ct=document.forms["ProductsAdd"]["BusinessType"].value;
		var x=document.getElementById("customer");
		x.innerHTML="";
		
		if(check_ct=="selectct")
		{
		x.innerHTML="Please select customer type";
		return false;
		}
		else
		{
		return true;
		}
}
function checkdate()
{

	
	var check_date = document.forms["ProductsAdd"]["bar"].value;
	
	
	var x=document.getElementById("datevalid");
	x.innerHTML="";
	check_date= new Date(check_date);		
	var current_date= new Date();
	
	 if(check_date=="NaN")
	 {
		 x.innerHTML="Please select date";
		
			return false;
	 }
	 else if(check_date<current_date)
	{
		 x.innerHTML="Please select future date";
			return false;
	}
	 return true;
}
function checkstatus()
{
var x=document.getElementById("pstatus");
		x.innerHTML="";

if(document.ProductsAdd.Status[0].checked==false&&document.ProductsAdd.Status[1].checked==false)
	{
		x.innerHTML="Please select status";
  		return false;
 		
	}
return true;
}
function Valid()
{
		if(checkid()==false)
		{
		document.ProductsAdd.ProductId.focus();
		return false;
	
		}
		if(checkname()==false)
		{
		document.ProductsAdd.ProductName.focus();
		return false;
		}
		if(checkaccount()==false)
		{
			document.ProductsAdd.AccountType.focus();
			return false;
				
		}	
		if(checkcustomer()==false)
		{
		document.ProductsAdd.BusinessType.focus();
		return false;
		
		}
		if(checkdate()==false)
		{
		document.ProductsAdd.bar.focus();
		return false;
		
		}
		if(checkstatus()==false)
		{
		document.ProductsAdd.Status[0].focus();
		return false;
	
		}
		else
		{
			return true;
		}
}
function resetdata()
{
	var id=document.getElementById("pid");
	id.innerHTML="";
	var name=document.getElementById("pname");
	name.innerHTML="";
	var account=document.getElementById("account");
	account.innerHTML="";
	var customer=document.getElementById("customer");
	customer.innerHTML="";
	var date=document.getElementById("datevalid");
	date.innerHTML="";
	var status=document.getElementById("pstatus");
	status.innerHTML="";
}