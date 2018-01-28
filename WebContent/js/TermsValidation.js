function termsValidation()
{
	var x=document.getElementById('termscheck');
	
	if(!(x.checked))
	{
		alert("Please accept Terms and Conditions for successfull Account creation");
		return false;
	}
	return true;
}