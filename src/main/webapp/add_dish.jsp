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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/admin/dishes_add.css">

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

			<div class="field">


				<div class="content">
					<label for="dish_name">Dish name:</label> <input type="text" placeholder="Enter Dish name"
						id="dishName" pattern="^[a-zA-Z -]+$" title="Enter alphabets only"
						name="dish_name" required>
				</div>

				<div class="content">
					<label for="quantity">Quantity</label> <input type="number" placeholder="Enter Dish quantity"
						name="quantity" id="dishQuantity" required>
				</div>

				<div class="content">
					<label for="price">Price</label> <input type="number" name="price" placeholder="Enter Dish price"
						id="dishPrice" required>
				</div>

				<div class="content">
					<label>Select QuantityUnit</label> <select name="quantity_unit"
						required>
						<option value="">Select</option>
						<%
						for (QuantityUnit obj : quantityUnitList) {
						%>
						<option value="<%=obj.name()%>"><%=obj.name()%></option>

						<%
						}
						%>
					</select>
				</div>

			</div>
			<div class="instructions">
				<p>* For NOS quantity should be less than 6 and greater than zero</p>
				<p>* For GRAMS quantity should be less than 501 and greater than 19</p>
			</div>
			
			<div class="buttons_div">
				<button type="submit" class="btn_submit" id="submit">Create</button>
				<button class="btn back" id="btn_back" type="button">Back</button>
			</div>
		</form>

	</main>


	<script>
		const formId = document.getElementById("getData");

		formId.addEventListener("submit", function(event) {

			const name = document.getElementById("dishName").value;
			const quantity = document.getElementById("dishQuantity").value;
			const price = document.getElementById("dishPrice").value;

			if (name.trim() == "") {
				alert("Dish Name cannot be empty");
				event.preventDefault();
			}
			
			const pattern = /^[a-zA-Z -]+$/;
		    if (!pattern.test(name)) {
		        alert("Enter alphabets only.");
		        event.preventDefault();
		    }

			if (quantity.trim() == "" || quantity <= 0) {
				alert("Dish quantity cannot be less than or equal to zero");
				event.preventDefault();
			}

			if (quantity > 500) {
				alert("Dish quantity cannot be greater than 500");
				event.preventDefault();
			}

			if (price.trim() == "" || price < 0) {
				alert("Dish price cannot be less than zero");
				event.preventDefault();
			}

			if (price > 100) {
				alert("Dish price cannot be greater than 100");
				event.preventDefault();
			}

		});
		
		const btnBack = document.getElementById("btn_back");
		
			btnBack.addEventListener("click", function(){
				
				window.history.back();
			
		});
		
	</script>




</body>
</html>