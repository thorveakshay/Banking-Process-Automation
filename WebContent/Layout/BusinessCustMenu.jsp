<html>
<head>
<script>
function navigateconfirm(){
var choice=confirm("All entered details will be lost.Do you want to proceed ?");
if (choice==true)
{
return true;
	}
else{
	return false;
}
}
</script>
</head>



			<div id="leftcolumn">
			<h3 class="leftbox">Business Customer Management</h3>
			<ul class="leftbox borderedlist">
					<li><a href="/NexusBankingGroup/CustomerManagementServlet?action=add" title="Register" onclick="return navigateconfirm();">Register New Customer</a></li>
				<li><a href="/NexusBankingGroup/CustomerManagementServlet?action=SearchCust" title="Search" onclick="return navigateconfirm();">Search Business Customer</a></li>
				<li><a
		href="/NexusBankingGroup/CustomerManagementServlet?action=SearchCust" title="Manage Account Party" onclick="return navigateconfirm();">Manage Account Party</a></li>
			</ul>
			
			<hr />
	</div>
	
	</html>