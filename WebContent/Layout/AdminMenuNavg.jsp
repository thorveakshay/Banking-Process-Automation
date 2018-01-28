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
<body>
<!-- left column (products and features) -->
		<div id="leftcolumn">
			<h3 class="leftbox">Employee Management</h3>
			<ul class="leftbox borderedlist">
					<li><a href="/NexusBankingGroup/EmployeeManageServlet?action=Register" onclick="return navigateconfirm();">Register Employee</a></li>
				<li><a href="/NexusBankingGroup/EmployeeManageServlet?action=ViewEmployees" onclick="return navigateconfirm();">View Employee</a></li>
				<li><a href="/NexusBankingGroup/EmployeeManageServlet?action=ViewEmployees" onclick="return navigateconfirm();">Search Employee</a></li>
				
			</ul>
		<!--	<h3 class="leftbox header_small">Features</h3>
			<div class="leftbox features">
				<p>This week we have our one of a kind sale. Pick your one of a kind plant from our great selection and combine that with a planter box for $5.99.</p>
				<p>Native plant seeds on sale!</p>
			</div>
-->			<hr />
		</div>
		</body>
		</html>