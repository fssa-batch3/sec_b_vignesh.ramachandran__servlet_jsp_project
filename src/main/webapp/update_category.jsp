<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Category</title>
</head>
<body>

	<%	Menu menu = (Menu) request.getAttribute("menu");
		Category category = (Category) request.getAttribute("category"); 
	%>
	
	<h1>Update Category</h1>
	<form action="update?menuId=<%=menu.getId()%>&categoryId=<%=category.getId() %>" method="post">
		<label>Menu Name</label>
		<input type="text" name="menu_name" value="<%=menu.getMenuName() %>" readonly>
		<label>Category Name</label>
		<input type="text" name="category_name" value="<%=category.getCategoryName() %>" readonly>
		<label>Image</label>
		<input type="text" name="category_image" value="<%=category.getImage() %>" required>
		<button type="submit">Save</button>
	</form>
	

</body>
</html>