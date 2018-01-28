<!-- left column (products and features) -->
		<div id="leftcolumn">
			<h3 class="leftbox">
		<%String ProMngmnt=(String)session.getAttribute("ProMngmnt"); %><%if(ProMngmnt!=null) %><%=ProMngmnt %><%else { %>
		Product Management<%} %></h3>
		<ul class="leftbox borderedlist"> 
			<li><a href="/NexusBankingGroup/ProductServlet?action=addProduct" title="Add Product">
			<%String addProduct=(String)session.getAttribute("addProduct"); %><%if(addProduct!=null) %><%=addProduct %><%else { %>Add Product<%} %></a></li>
				<li><a href="/NexusBankingGroup/ProductServlet?action=uploadProduct" title="Upload Product">
				<%String upldPro=(String)session.getAttribute("upldPro"); %><%if(upldPro!=null) %><%=upldPro %><%else { %>Upload Product(s)<%} %></a></li>
				<li><a href="/NexusBankingGroup/ProductServlet?action=viewProduct" title="View Product">
				<%String viewPro=(String)session.getAttribute("viewPro"); %><%if(viewPro!=null) %><%=viewPro %><%else { %>View Product(s)<%} %></a></li>  
				</ul>
			</div>