<%@page import="java.util.Set"%>
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

<link rel="stylesheet" href="../styles/dish_add.css">

<title>Dish add</title>

</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	Set<Menu> menuListNew = (Set<Menu>) request.getAttribute("menuList");
	Set<Category> categoryList = (Set<Category>) request.getAttribute("categoryList");
	QuantityUnit[] quantityUnitArray = (QuantityUnit[]) request.getAttribute("quantityUnit");
	List<QuantityUnit> quantityUnitList = Arrays.asList(quantityUnitArray);
	%>


	<main>
		<form action="create" method="post" id="getData">
			<h2>DISHES - ADD</h2>

			<div class="menu-type">
				<label>Select Menu</label> <select name="menuId" class="menulist"
					id="menuName" required>
					<option value="">Select</option>
					<%
					for (Menu obj : menuListNew) {
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
					name="categoryId" id="categoryName" required>
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

			<label for="dish_name">Dish name:</label> <input type="text"
				name="dish_name" required> <br> <label for="quantity">Quantity</label>
			<input type="number" name="quantity" required> <br> <label
				for="price">Price</label> <input type="number" name="price" required>
			<br> <label>Select QuantityUnit</label> <select
				name="quantity_unit" required>
				<option value="">Select</option>
				<%
				for (QuantityUnit obj : quantityUnitList) {
				%>
				<option value="<%=obj.name()%>"><%=obj.name()%></option>

				<%
				}
				%>
			</select>
			<button type="submit" class="btn_submit" id="submit">Create</button>
		</form>

	</main>



	<%-- <form action="create" method="post">
		<h2>Dish Add</h2>
		<label>Select Menu</label> <select name="menuId" id="menuName"
			required>
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
		</select> <br> <label>Select Category</label> <select name="categoryId"
			id="categorySelect" required>
			<option value="">Select</option>
			<%
			for (Category obj : categoryList) {
			%>
			<option value="<%=obj.getId()%>"><%=obj.getCategoryName()%></option>
			<%
			}
			%>
		</select> <br> <label for="dish_name">Dish name:</label> <input
			type="text" name="dish_name" required> <br> <label
			for="quantity">Quantity</label> <input type="number" name="quantity"
			required> <br> <label for="price">Price</label> <input
			type="number" name="price" required> <br> <label>Select
			QuantityUnit</label> <select name="quantity_unit" required>
			<option value="">Select</option>
			<%
			for (QuantityUnit obj : quantityUnitList) {
			%>
			<option value="<%=obj.name()%>"><%=obj.name()%></option>

			<%
			}
			%>
		</select> <br>

		<button type="submit">Create</button>

	</form> --%>

	<!-- 	<script>
		function menuTypeFind(){
			console.log("methohd kku varuthu")
			const menuType = document.getElementById("menuName").value;
			if(menuType != ""){
				fetch("categories?menuId=" + encodeURIComponent(menuType))
                .then(response => response.json())
                .then(categories => {
                    const categorySelect = document.getElementById("categorySelect");
                   /*  categorySelect.innerHTML = ""; // Clear existing options */
                    categories.forEach(category => {
                        const option = document.createElement("option");
                        option.value = category.id;
                        option.textContent = category.name;
                        categorySelect.appendChild(option);
                    });
                })
                .catch(error => {
                    console.error("Error fetching categories:", error);
                });
			}
		}
	</script> -->


</body>
</html>