<%@page import="java.util.HashSet"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Category</title>
</head>
<body>

	<% Set<Menu> menuList = new HashSet<Menu>();
	   menuList = (Set<Menu>) request.getAttribute("menuList");
	%>

	<h1>Create Category</h1>
	<form action="create" method="post">
	
		<label>Select Menu</label>
		<Select name="menuId" required>
			<option value="">Select</option>
			<%for(Menu obj: menuList) { %>
			<option value="<%=obj.getId()%>"><%=obj.getMenuName()%></option>
			<%} %>
		</Select>
	
		<label>Category Name</label>
		<input type="text" name="category_name">
		
		<label>Category Image</label>
		<input type="text" name="category_image">
		
		<button>Submit</button>
	
	</form>


</body>
</html>