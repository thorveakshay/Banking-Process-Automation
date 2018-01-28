function checkRadioButton()
{
	var option=document.getElementsByName("select");
	var check=-1;

	for(var i=0;i<option.length;i++)
	{
		if(option[i].checked==true)
			check=i;
	}
	if(check==-1)
	{
		alert("Please Select an option");
		return false;
	}

}