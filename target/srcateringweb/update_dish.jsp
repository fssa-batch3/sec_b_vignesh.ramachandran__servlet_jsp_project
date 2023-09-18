<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.fssa.srcatering.model.Dish"%>
<%@page import="java.util.Arrays"%>
<%@page import="in.fssa.srcatering.model.QuantityUnit"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="java.util.List"%>
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
	href="<%=request.getContextPath()%>/assets/css/admin/dishes_remove.css">

<title>Update Dish</title>
<style>
.delete {
	color: red;
}
</style>
</head>
<body>

	<%@include file="/header.jsp"%>

	<%
	Menu menu = (Menu) request.getAttribute("menu");
	Category category = (Category) request.getAttribute("category");
	%>


	<%
	Set<Menu> menuList = (Set<Menu>) request.getAttribute("menuList");
	Set<Category> categoryList = (Set<Category>) request.getAttribute("categoryList");
	%>

	<main>

		<section>

			<%
			if (menuList != null && categoryList != null) {
			%>

			<form class="content"
				action="edit?menuId=<%=request.getParameter("menuId")%>&categoryId=<%=request.getParameter("categoryId")%>"
				method="get">

				<h2>DISHES UPDATE</h2>

				<div class="menu-type">
					<label>Select Menu</label> <select class="menulist" name="menuId"
						id="menuName" required>
						<option value="">Select</option>
						<%
						for (Menu obj : menuList) {
						%>
						<option value="<%=obj.getId()%>">
							<%=obj.getMenuName()%>
						</option>
						<%
						}
						%>
					</select>
				</div>

				<div class="category-type">
					<label>Select Category</label> <select class="categorylist"
						name="categoryId" id="categorySelect" required>
						<option value="">Select</option>
						<%
						for (Category obj : categoryList) {
						%>
						<option value="<%=obj.getId()%>"><%=obj.getCategoryName()%></option>
						<%
						}
						%>
					</select>
				</div>

				<div class="show_dishes">
					<h2>Dishes</h2>
					<button class="btn show2" type="submit">Show Dishes</button>
				</div>
			</form>

			<%
			} else {
			%>

			<%
			Menu menu1 = (Menu) request.getAttribute("menu");
			Category category1 = (Category) request.getAttribute("category");
			%>


			<form class="content"
				action="update?menuId=<%=menu.getId()%>&categoryId=<%=category.getId()%>"
				method="post">


				<div class="menu-type">
					<label>Select Menu</label> <select class="menulist"
						name="menu_name" id="menuName">
						<option value=""><%=menu.getMenuName()%></option>
					</select>
				</div>

				<div class="category-type">
					<label>Select Category</label> <select class="categorylist"
						name="categoryId" id="categorySelect">
						<option value=""><%=category.getCategoryName()%></option>
					</select>
				</div>
					
				<div id="input_group">
                        <div class="heading">
                            <p>Dish name</p>
                            <p>Quantity</p>
                            <p>Quantity unit</p>
                            <p>Price</p>
                            <p>Status</p>
                        </div>

                    </div>

					<%
					Set<Dish> dishList = (Set<Dish>) request.getAttribute("dishList");

					if (dishList != null) {
						for (Dish dish : dishList) {
					%>


				<div class="field">
					<input type="checkbox" name="selectedDishes"
						value="<%=dish.getId()%>">

					<input type="text" name="dish_name_<%=dish.getId()%>"
							value="<%=dish.getDishName()%>" readonly>
							
					<input type="number" name="quantity_<%=dish.getId()%>"
							value="<%=dish.getQuantity()%>" required>
							
					<select name="quantity_unit_<%=dish.getId()%>" required>
								<%
								if (dish.getQuantityUnit().name().equals("NOS")) {
								%>
								<option value="NOS">NOS</option>
								<option value="GRAMS">GRAMS</option>
								<%
								} else {
								%>
								<option value="GRAMS">GRAMS</option>
								<option value="NOS">NOS</option>
								<%
								}
								%>
					</select>
					
					<input type="number" name="price_<%=dish.getId()%>"
							value="<%=dish.getDishPrice()%>" required>
					
					<select name="status_<%=dish.getId()%>" required>

								<%
								if (dish.getStatus() == 1) {
								%>
								<option value="1">True</option>
								<option value="0">False</option>
								<%
								} else {
								%>
								<option value="0">False</option>
								<option value="1">True</option>
								<%
								}
								%>
						</select>
							
				</div>
				
				<%} %>
			<%} %>







				<%-- <table border="1">

					<tr>
						<th>Checkbox</th>
						<th>Dish name</th>
						<th>Quantity</th>
						<th>Quantity Unit</th>
						<th>Price</th>
						<th>Status</th>
					</tr>

					<%
					Set<Dish> dishList = (Set<Dish>) request.getAttribute("dishList");

					if (dishList != null) {
						for (Dish dish : dishList) {
					%>

					<tr>
						<td><input type="checkbox" name="selectedDishes"
							value="<%=dish.getId()%>"></td>

						<td><input type="text" name="dish_name_<%=dish.getId()%>"
							value="<%=dish.getDishName()%>" readonly></td>
						<td><input type="number" name="quantity_<%=dish.getId()%>"
							value="<%=dish.getQuantity()%>" required></td>

						<td><select name="quantity_unit_<%=dish.getId()%>" required>
								<%
								if (dish.getQuantityUnit().name().equals("NOS")) {
								%>
								<option value="NOS">NOS</option>
								<option value="GRAMS">GRAMS</option>
								<%
								} else {
								%>
								<option value="GRAMS">GRAMS</option>
								<option value="NOS">NOS</option>
								<%
								}
								%>
						</select></td>

						<td><input type="number" name="price_<%=dish.getId()%>"
							value="<%=dish.getDishPrice()%>" required></td>
						<td><select name="status_<%=dish.getId()%>" required>

								<%
								if (dish.getStatus() == 1) {
								%>
								<option value="1">True</option>
								<option value="0">False</option>
								<%
								} else {
								%>
								<option value="0">False</option>
								<option value="1">True</option>
								<%
								}
								%>
						</select></td>
					</tr>
					<%
					}
					%>
				</table>--%>
				<span>* Click the checkbox, change the details and press the
					Update button.*</span> 

					<div class="buttons_div">
                        <button class="btn save" type="submit">Update</button>
                    </div>

			</form>

			<%
			}
			%>

		</section>


	</main>





</body>
</html>