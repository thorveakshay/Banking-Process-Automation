function validateTitle()
{
	if(document.getElementById("title").Value=="")
	{
		document.getElementById("checkTitle").innerHTML="Please select a title";
		return false;
	}
}