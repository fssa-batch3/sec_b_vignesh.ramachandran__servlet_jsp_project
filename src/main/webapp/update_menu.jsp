<%@page import="in.fssa.srcatering.model.Menu"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

	<%Menu menu = null;
	  menu = (Menu) request.getAttribute("menuDetails");
	  %>

	<form action="update?menuId=<%=menu.getId()%>" method="post">
		<h2>MENU-Update</h2>
		<div class="heading">
		
			<h2>Update New Menu</h2>

		</div>

		<div class="input_group">
			<label>Menu Name</label> <input type="text" name="menu_name" value="<%=menu.getMenuName() %>" readonly>
			<label>Menu Image </label> <input type="text" name="menu_image" value="<%=menu.getImage() %>" required> 
			<label>Description</label> <input type="text" value="<%=menu.getDescription() %>" name="description" required>
		</div>

		<button class="btn_submit" type="submit">Update</button>
	</form>
	
</body>
</html>