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
<title>Insert title here</title>
</head>
<body>

	<%
	Set<Menu> menuList = (Set<Menu>) request.getAttribute("menuList");
	Set<Category> categoryList = (Set<Category>) request.getAttribute("categoryList");
	QuantityUnit[] quantityUnitArray = (QuantityUnit[]) request.getAttribute("quantityUnit");
	List<QuantityUnit> quantityUnitList = Arrays.asList(quantityUnitArray);
	%>

	<form action="create" method="post">
		<h2>Dish Add</h2>
		<label>Select Menu</label> 
		<select name="menuId" id="menuName" required>
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
		</select> <br> 
		<label>Select Category</label> 
		<select name="categoryId" id="categorySelect" required>
			<option value="">Select</option>
			<% for(Category obj: categoryList){ %>
			<option value="<%=obj.getId() %>"><%=obj.getCategoryName() %></option>
			<%
			}
			%>
		</select> 
		<br> <label for="dish_name">Dish name:</label> <input
			type="text" name="dish_name" required> <br> <label
			for="quantity">Quantity</label> <input type="number" name="quantity"
			required> <br> <label for="price">Price</label> <input
			type="number" name="price" required> <br> <label>Select
			QuantityUnit</label> 
			
			<select name="quantity_unit" required>
			<option value="">Select</option>
			<% for(QuantityUnit obj : quantityUnitList) { %>
			<option value="<%=obj.name()%>"><%=obj.name()%></option>
			
			<%} %>
		</select> <br>

		<button type="submit">Create</button>

	</form>

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