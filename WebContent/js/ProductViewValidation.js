
function activateFirst()
{
	document.forms["ProductSearch"]["productId"].disabled=false;	
	document.forms["ProductSearch"]["productName"].disabled=true;

	
}

function activateSecond()
{

	document.forms["ProductSearch"]["productId"].disabled=true;	
	document.forms["ProductSearch"]["productName"].disabled=false;

}

function checkoption()
{
	
	var x=document.getElementById("pid");
		x.innerHTML="";

	if(document.ProductSearch.searchOption[0].checked==false&&ProductSearch.searchOption[1].checked==false)
	{
		x.innerHTML="*Please select one option";
  		return false;
 		
	}
return true;
}


function checkid()
{
	
		var check_id=document.forms["ProductSearch"]["productId"].value;
		var x=document.getElementById("pid");
		x.innerHTML="";
		if (check_id==null || check_id=="")
		{
  		x.innerHTML="*Please enter product id";
 		return false; 		
		}
		else if(check_id.length!=4)
		{ x.innerHTML="*Product Id must be 4 digit number";
		return false;
		}	
		var numbers = /^[1-9]+$/;
		var num=/^[1-9][0-9]+$/;
		if(check_id.match(numbers)||check_id.match(num))
		{
	    }
		else
		{
		x.innerHTML="* Product id contains only numbers";
 		return false;
		}
			
	return true;
	
}
function checkname()
{


		var check_name=document.forms["ProductSearch"]["productName"].value;;
		var name=/^[a-zA-Z][0-9a-zA-Z\s]+$/;
		var x=document.getElementById("pname");
		x.innerHTML="";
		
		if (check_name==null || check_name=="")
		{
		
  		x.innerHTML="*Please enter product name";
		return false;
		}
			
		if(check_name.length>50||check_name.length<5)
			{
			x.innerHTML="*Please enter product name between 5 to 50 characters";
			return false;
 			}
		if(check_name.match(name))
			{
			}
		else
		{
			x.innerHTML=	"*Please enter valid product name";
			return false;
 		
		}
return true;
}


function Validation()
{
		
		if(checkoption()==false)
		{
			return false;
		}	
		else if(checkoption()==true)
		{
			if(document.ProductSearch.searchOption[0].checked==true)
			{
				if(checkid()==false)
				{
			document.ProductSearch.productId.focus();
			return false;
				}
			}
			else if(document.ProductSearch.searchOption[1].checked==true)
			{
				if(checkname()==false)
				{return false;
				}
			}	
		}
		return true;
		
}	
function resetdata()
{
	var id=document.getElementById("pid");
	id.innerHTML="";
	var name=document.getElementById("pname");
	name.innerHTML="";
	
}
