function validateSearch()
{
	var businessName=document.getElementsByName("BusinessName")[0].value;
	var branchName=document.getElementsByName("BranchName")[0].value;
	var tradingName=document.getElementsByName("TradingName")[0].value;
	var accountNumber=document.getElementsByName("AccountNumber")[0].value;
	var tbName=document.getElementsByName("TbName")[0].value;
	 
	var  len=businessName.length;
	var len1=branchName.length;
	var len2=tradingName.length; 
	var  len4=accountNumber.length;
	var  len5=tbName.length;
	
	
	
	if(len==0 && len1==0 && len2==0 && len4==0 && len5==0)
	{	
		alert("Please fill all the mandatory fields");
		return false;
	}
	//business name
	

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
	  var lenbs=bname.length;
	  var i=0; 
	 
	  while(lenbs!=0)
		{

		  var n1 = bname.charCodeAt(i);
	  

		  if(n1<65 || n1>122)
		  {
		
			  document.getElementById('bsName').style.visibility="visible";
			  document.getElementById('bsName').innerHTML="&nbsp;Please enter only alphabets.";
		

			
			document.getElementsByName("BusinessName")[0].value="";
			
			document.getElementsByName("BusinessName")[0].focus();
			return false;
			 
			
		}

	else
		
		if(n1>90&&n1<97)
		{

			 document.getElementById('bsName').style.visibility="visible";
			  document.getElementById('bsName').innerHTML="&nbsp;Please enter only alphabets.";
		
			document.getElementsByName("BusinessName")[0].value="";
			
			document.getElementsByName("BusinessName")[0].focus();
			return false;
			
			}


			
	i++;
	lenbs--;



		} //while loop ends

//branch name

	  var brName = document.getElementsByName("BranchName")[0].value;   
 
	  if(brName==0)
	  {
		  document.getElementById('brName').style.visibility="visible";
		  document.getElementById('brName').innerHTML="&nbsp;Please enter Branch Name.";
	
		  	//alert("Please Enter Valid Branch Name ");
		  	document.getElementsByName("BranchName")[0].value="";
		  	document.getElementsByName("BranchName")[0].focus();
		  	return false;
	  }
	  var lenbr=brName.length;
	  var m=0; 
 
	  while(lenbr!=0)
	  {

		  var n4 = brName.charCodeAt(m);
  

		  if(n4<65 || n4>122)
		  {
	
			  {
				  document.getElementById('brName').style.visibility="visible";
				  document.getElementById('brName').innerHTML="&nbsp;Please enter only alphabets.";
			
				 
			document.getElementsByName("BranchName")[0].value="";
		
			document.getElementsByName("BranchName")[0].focus();
			return false;
		 
			  }
		  }

		  else
	
			  if(n4>90&&n4<97)
			  {
				  document.getElementById('brName').style.visibility="visible";
				  document.getElementById('brName').innerHTML="&nbsp;Please enter only alphabets.";
			
				  //alert("Please Enter Branch Name in Letters ");
				  document.getElementsByName("BranchName")[0].value="";
		
				  document.getElementsByName("BranchName")[0].focus();
				  return false;
				  
			  }


		
		  m++;
		  lenbr--;
	  } 


}

//trading name

if(document.searchForm.bs[1].checked==true)	
{
	var trname = document.getElementsByName("TradingName")[0].value;   
 
	if(trname==0)
	{
		document.getElementById('trName').style.visibility="visible";
		  document.getElementById('trName').innerHTML="&nbsp;Please enter Trading name.";
	
		document.getElementsByName("TradingName")[0].value="";
		document.getElementsByName("TradingName")[0].focus();
		return false;
	}
	var lentr=trname.length;
	var p=0; 
 
	while(lentr!=0)
	{

		var n5 = trname.charCodeAt(p);
  

		if(n5<65 || n5>122)
		{
			{

				document.getElementById('trName').style.visibility="visible";
				  document.getElementById('trName').innerHTML="&nbsp;Please enter only alphabets.";
			
				document.getElementsByName("TradingName")[0].value="";
		
				document.getElementsByName("TradingName")[0].focus();
				return false;
		 
			}
		}

		else
	
			if(n5>90&&n5<97)
			{

				document.getElementById('trName').style.visibility="visible";
				  document.getElementById('trName').innerHTML="&nbsp;Please enter only alphabets.";
			
				document.getElementsByName("TradingName")[0].value="";
		
				document.getElementsByName("TradingName")[0].focus();
				return false;
	
			}

		p++;
		lentr--;



	} 





	//branch trading name

	var tbName = document.getElementsByName("TbName")[0].value;   

	if(tbName==0)
	{
		document.getElementById('tbrName').style.visibility="visible";
		  document.getElementById('tbrName').innerHTML="&nbsp;Please enter branch name.";
	
		document.getElementsByName("TbName")[0].value="";
		document.getElementsByName("TbName")[0].focus();
		return false;
	}
	var lentb=tbName.length;
	var j=0; 

	while(lentb!=0)
	{

		var n2 = tbName.charCodeAt(j);


		if(n2<65 || n2>122)
		{
	
			

			document.getElementById('tbrName').style.visibility="visible";
			  document.getElementById('tbrName').innerHTML="&nbsp;Please enter only alphabets .";
		
				document.getElementsByName("TbName")[0].value="";
		
				document.getElementsByName("TbName")[0].focus();
				return false;
		 
			
		}

		else
	
			if(n2>90 && n2<97)
			{

				document.getElementById('tbrName').style.visibility="visible";
				  document.getElementById('tbrName').innerHTML="&nbsp;Please enter only alphabets.";
			
				document.getElementsByName("TbName")[0].value="";
		
				document.getElementsByName("TbName")[0].focus();
				return false;
	
			}
		

		
		j++;
		lentb--;



	}

}	

	
	//account number


if(document.searchForm.bs[2].checked==true)	
{	
	var acNo = document.getElementsByName("AccountNumber")[0].value; 


	if(acNo==0)
	{
		document.getElementById('acNum').style.visibility="visible";
		  document.getElementById('acNum').innerHTML="&nbsp;Please enter account number.";
	
		document.getElementsByName("AccountNumber")[0].value="";
		document.getElementsByName("AccountNumber")[0].focus();
	
			return false;
	
	}
	var lenac=acNo.length;
	var k=0; 
 

	while(lenac!=0)
	{

		var n3 = acNo.charCodeAt(k);
 

		if(n3<48 || n3>57 && n3!=0)
		{
			document.getElementById('acNum').style.visibility="visible";
			  document.getElementById('acNum').innerHTML="&nbsp;Please enter only numbers.";
		
			document.getElementsByName("AccountNumber")[0].value="";
	
			document.getElementsByName("AccountNumber")[0].focus();
			return false;
			break;
		}
		k++;
		lenac--;



	}
}
return true;
}


//Validate CutomerSelection,,ciewBusinessCustomers

/*function Validate() {
    var radios = document.getElementsByName('IDType')

    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
        alert("Selected Value = " + radios[i].value);
        return true; // checked
    }
    };

    // not checked, show error
    document.getElementById('ValidationError').innerHTML = 'Error!!!';
    return false;
}

*/
function validateCustomerSelection()
{
	var radios=document.getElementByName('businessData');
	
	for(var i = 0; i < radios.length; i++)
	{
		 if (radios[i].checked) {
		        alert("Selected Value = " + radios[i].value);
		        return true; // checked
		    }
	}

		    // not checked, show error
	
	alert("check");
		    document.getElementById('ValidationError').innerHTML = 'Error!!!';
		    return false;
		
}


//AccountPartyList


//ticketTitle







/*	if(document.getElementById("accParty").value == "")
	   {
	      alert("Please select value"); // prompt user
	      document.getElementById("accParty").focus(); //set focus back to control
	      return false;
	   }

	return true;  */




 