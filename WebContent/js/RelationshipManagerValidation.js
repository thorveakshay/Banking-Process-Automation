
function validation(rmsize)
{
	
	var x=document.getElementById("checkid");
	var count=0;
	var mid;
	if(rmsize==1)
	{
		
		if(document.f1.check.checked==false)
		{
			alert("Please select rel manager");
			return false;
		}
		else
		{
			mid=document.f1.check.value;
			
		
		}
	}
	else{
		for(i=0;i<rmsize;i++)
		{
			
			if(document.f1.check[i].checked==false)
			{
			
			count++;
		
			}
			if(document.f1.check[i].checked==true)
			{
			mid=document.f1.check[i].value;
				
			}
		}
	
		if(count==rmsize)
		{
		
			alert("Please select Relationship Manager");
			return false;
		}
		
	}
	return mid;
}



