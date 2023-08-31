<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<form action="create" method="post">
		<h2>MENU-ADD</h2>
		<div class="heading">
			<h2>Create New Menu</h2>

		</div>

		<div class="input_group">
			<label>Menu Name</label>
			<input type="text" name ="menu_name" required>
			<label>Menu Image </label>
			<input type="text" name="menu_image" required>
			<label>Description</label> 
			<input type="text" name="description" required>
		</div>

		<button class="btn_submit" type="submit">Create</button>
	</form>
	

</body>
</html>