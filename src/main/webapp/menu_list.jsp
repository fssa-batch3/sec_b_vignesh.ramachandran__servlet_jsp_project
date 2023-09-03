<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MenuList</title>
<style>
.menu-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: space-between;
	margin: 20px auto;
	max-width: 1200px;
}

.menu-item {
	background-color: #f5f5f5;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	width: calc(33.33% - 20px); /* Adjust as needed for responsiveness */
	box-sizing: border-box;
}

.menu-item h1 {
	font-size: 1.5rem;
	margin-bottom: 10px;
}

.menu-item img {
	width:300px;
	height: 300px;
	margin-bottom: 10px;
}

.menu-item p {
	font-size: 1rem;
	color: #555;
}
button {
	padding:5px 10px;
	color:white;
	background-color:green;
	border-radius:10px;
}
</style>
</head>
<body>

	<%
	Set<Menu> menuList = new TreeSet<Menu>();
	%>
	<%
	menuList = (Set<Menu>) request.getAttribute("menuList");
	%>


	<div class="menu-container">
		<%
		for (Menu menu : menuList) {
		%>
		<div class="menu-item">
			<h1><%=menu.getMenuName()%></h1>
			<img alt="" src="<%=menu.getImage()%>">
			<p><%=menu.getDescription()%></p>
			
			<a href="menu/edit?menuId=<%=menu.getId() %>">
				<button type="submit">Update</button>
			</a>
			
			<a href="categories?menuId=<%=menu.getId()%>">
				<button type="submit">View Category</button>
			</a>
			
		</div>
		<%
		}
		%>
	</div>


</body>
</html>