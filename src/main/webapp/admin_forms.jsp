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

<link rel="stylesheet" href="./styles/admin_form.css">
<title>Admin Forms</title>
</head>
<body>

	<%@ include file="/header.jsp"%>

	<main>
		<section>

			<div class="content">

				<h2>
					<span>ADMIN</span> FORMS
				</h2>

				<div class="form_link">
					<p>Menu-add</p>
					<a href="menu/new"> <i class="bx bx-chevrons-right"></i>
					</a>
				</div>

				<div class="form_link">
					<p>Menu-update</p>
					<a href="menu/edit"> <i
						class="bx bx-chevrons-right"></i>
					</a>
				</div>

				<div class="form_link">
					<p>Category-add</p>
					<a href="category/new"> <i class="bx bx-chevrons-right"></i>
					</a>
				</div>
				
				<div class="form_link">
					<p>Category-update</p>
					<a href="category/edit"> <i class="bx bx-chevrons-right"></i>
					</a>
				</div>

				<div class="form_link">
					<p>Dish-add</p>
					<a href="dish/new"> <i class="bx bx-chevrons-right"></i>
					</a>
				</div>

				<div class="form_link">
					<p>Dish-update</p>
					<a href="dish/edit"> <i class="bx bx-chevrons-right"></i>
					</a>
				</div>

			</div>

		</section>
	</main>

</body>
</html>