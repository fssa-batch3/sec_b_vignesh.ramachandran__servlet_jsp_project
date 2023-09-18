<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="in.fssa.srcatering.model.Category"%>
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
	
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/admin/category_remove.css">
	
<title>Update Category</title>
</head>
<body>

	<%@include file="/header.jsp" %>

	<%
	Set<Menu> menuList = new TreeSet<>();
	menuList = (Set<Menu>) request.getAttribute("menuList");
	Set<Category> categoryList = new TreeSet<>();
	categoryList = (Set<Category>) request.getAttribute("categoryList");
	%>


	<%
	Menu menu = (Menu) request.getAttribute("menu");
	Category category = (Category) request.getAttribute("category");
	%>



	<main>
		<section>

			<%
			if (menuList != null && categoryList != null) {
			%>

			<form
				action="edit?menuId=<%=request.getAttribute("menuId")%>&categoryId=<%=request.getAttribute("categoryId")%>"
				id="change">
				<h2>Category Update</h2>

				<div class="select_menu">
					<h3>Select Menu</h3>
					<select name="menuId" id="menuName" class="menulist" required>
						<option value="">Select</option>
						<%
						for (Menu menu1 : menuList) {
						%>
						<option value="<%=menu1.getId()%>"><%=menu1.getMenuName()%></option>
						<%
						}
						%>

					</select>
				</div>

				<div class="select_category">
					<h3>Select Category</h3>
					<select name="categoryId" id="categoryName" class="categorylist"
						required>
						<option value="">Select</option>
						<%
						for (Category category1 : categoryList) {
						%>
						<option value="<%=category1.getId()%>"><%=category1.getCategoryName()%></option>
						<%
						}
						%>

					</select>
					<button class="btn show2" type="submit">Show Details</button>
				</div>

			</form>

			<%
			} else {
			%>


			<form
				action="update?menuId=<%=menu.getId()%>&categoryId=<%=category.getId()%>"
				method="post">
				<h2>Category Update</h2>
				<div class="select_menu">
					<h3>Select Menu</h3>
					<select name="menu_name" id="menuName" class="menulist" required>
						<option value="<%=menu.getMenuName()%>"><%=menu.getMenuName()%></option>
					</select>
				</div>

				<div class="select_category">
					<h3>Select Category</h3>
					<select name="category_name" id="categoryName" class="categorylist"
						required>
						<option value="<%=category.getCategoryName()%>"><%=category.getCategoryName()%></option>
					</select>
				</div>

				<div class="category_details">
					<input type="url" name="category_image" value="<%=category.getImage() %>"
						class="category_image" id="categoryImageGet"
						pattern="https?://.+" title="It should be URL.eg:http, https"
						required>
				</div>

				<button type="submit" class="btn save">Save</button>

			</form>

			<%
			}
			%>
		</section>

	</main>




	<%-- <h1>Update Category</h1>
	<form
		action="update?menuId=<%=menu.getId()%>&categoryId=<%=category.getId()%>"
		method="post">
		<label>Menu Name</label> <input type="text" name="menu_name"
			value="<%=menu.getMenuName()%>" readonly> <label>Category
			Name</label> <input type="text" name="category_name"
			value="<%=category.getCategoryName()%>" readonly> <label>Image</label>
		<input type="text" name="category_image"
			value="<%=category.getImage()%>" required>
		<button type="submit">Save</button>
	</form> --%>


</body>
</html>