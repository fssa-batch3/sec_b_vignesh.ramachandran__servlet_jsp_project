<%@page import="java.util.HashSet"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="java.util.Set"%>
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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/admin/category_add.css">
<title>Create Category</title>
</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	Set<Menu> menuList = new HashSet<Menu>();
	menuList = (Set<Menu>) request.getAttribute("menuList");
	%>



	<main>
		<section>
			<form action="create" method="post" class="form_id">
				<h2>Category in the Add</h2>

				<%
				String error = (String) request.getAttribute("errorMessage");

				if (error != null) {
					out.println("<p>" + error + "</p>");
				}
				%>


				<div class="select_menu">
					<h3>Select Menu</h3>

					<select name="menuId" id="menuName" class="menulist" required>
						<option value="">Select</option>
						<%
						for (Menu obj : menuList) {
						%>
						<option value="<%=obj.getId()%>"><%=obj.getMenuName()%></option>
						<%
						}
						%>

					</select>
				</div>

				<div class="input_group">
					<input type="text" class="category_name" placeholder="Eg: Ordinary"
						name="category_name" id="categoryName" pattern="^[a-zA-Z\s]+$"
						title="Enter alphabets only" required> <input type="url"
						class="category_image" name="category_image"
						placeholder="Enter Image URL" id="categoryImage"
						pattern="https?://.+" title="It should be URL.eg:http, https"
						required>
				</div>
				<button type="submit" class="btn_submit">Create</button>
			</form>
		</section>

	</main>


</body>
</html>