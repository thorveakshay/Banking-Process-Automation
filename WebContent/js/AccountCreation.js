function validate()
{
	if(document.forms["f1"]["ProductIntention"].options[0].selected==true)
	{
		alert("Please select Product Intention");
		return false;
	}
if(document.forms["f1"]["BranchName"].options[0].selected==true)
{
	alert("Please select Branch name");
	return false;
}

}

function validateProduct()
{
	if(document.forms["formSelectProduct"]["chooseProduct"].options[0].selected==true)
	{
		alert("Please select Product");
		return false;
	}
}