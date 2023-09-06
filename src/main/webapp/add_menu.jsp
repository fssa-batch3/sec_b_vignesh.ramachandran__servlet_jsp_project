<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&
    family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&family=Kurale&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

<link rel="stylesheet" href="../styles/menu_add.css">
<title>Menu add</title>
</head>
<body>

	<%@ include file="/header.jsp" %>

	<main>
		<section>
			<form action="create" method="post" id="form_id">
				<h2>MENU-ADD</h2>
				<div class="heading">
					<h2>Create New Menu</h2>
					
				</div>

				<div class="input_group">
					<input type="text" class="menuname" name="menu_name"
						placeholder="Eg: Breakfast Menu" id="menuName"
						pattern="^[a-zA-Z\s]+$" title="Enter alphabets only"
						required> 
					<input type="url" class="menuimage" name="menu_image"
						placeholder="Enter Image URL" id="menuImage" pattern="https?://.+"
						title="It should be URL.eg:http, https" required> 
					<input
						name="description" class="menuabout" name="description"
						placeholder="Enter Menu Description" id="menuAbout"
						pattern="^(?!\s)[a-zA-Z\s\W]+$" required>
				</div>

				<button class="btn_submit" type="submit">Create</button>

				</div>
			</form>
		</section>
	</main>




<!-- 	<form action="create" method="post">
		<h2>MENU-ADD</h2>
		<div class="heading">
			<h2>Create New Menu</h2>

		</div>

		<div class="input_group">
			<label>Menu Name</label> <input type="text" name="menu_name" required>
			<label>Menu Image </label> <input type="text" name="menu_image"
				required> <label>Description</label> <input type="text"
				name="description" required>
		</div>

		<button class="btn_submit" type="submit">Create</button>
	</form> -->


</body>
</html>