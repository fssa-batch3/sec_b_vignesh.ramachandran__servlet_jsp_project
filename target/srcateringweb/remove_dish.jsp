<%@page import="in.fssa.srcatering.model.Dish"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Dish</title>
</head>
<body>

	<%@include file="/header.jsp" %>

	<%
	List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
	List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
	%>
	<h2>Dish Update</h2>
	
	<%if(menuList != null && categoryList != null) {  %>
	
	<form
		action="remove?menuId=<%=request.getParameter("menuId")%>&categoryId=<%=request.getParameter("categoryId")%>"
		method="get">
		
		
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
		</select>
		<button type="submit">Get Dishes</button>
	</form>
	
	<%} else { %> 
	
		<%Menu menu = (Menu) request.getAttribute("menu"); 
		  Category category = (Category) request.getAttribute("category");
		%>

	<form action="delete" method="post">
	
		<label>Select Menu</label> 
		<select name="menuId" id="menuName"
			required>
			<option value="<%=menu.getId()%>"><%=menu.getMenuName() %></option>
		</select> 
		<br> 
		<label>Select Category</label> 
		<select name="categoryId"
			id="categorySelect" required>
			<option value="<%=category.getId()%>"><%=category.getCategoryName() %></option>
		</select>

		<table border="1">
			<tr>
				<th>Checkbox</th>
				<th>Dish name</th>
				<th>Quantity</th>
				<th>Quantity Unit</th>
				<th>Price</th>
				<th>Delete</th>
			</tr>
			<%
			List<Dish> dishList = (List<Dish>) request.getAttribute("dishList");

			if (dishList != null) {
				for (Dish dish : dishList) {
			%>

			<tr>
				<td>
					<input type="checkbox" name="selectedDishes" value="<%=dish.getId()%>">
				</td>
				
				<td><input type="text" name="dish_name_<%= dish.getId() %>"
					value="<%=dish.getDishName()%>" readonly></td>
				<td><input type="number" name="quantity_<%= dish.getId() %>"
					value="<%=dish.getQuantity()%>" readonly></td>
					
				<td>
				<select name="quantity_unit_<%= dish.getId() %>" readonly>
					<%if(dish.getQuantityUnit().name().equals("NOS")){ %>
						<option value="NOS">NOS</option>
						<option value="GRAMS">GRAMS</option>
					<%} else { %>
						<option value="GRAMS">GRAMS</option>
						<option value="NOS">NOS</option>
					<%} %>
				</select>
				</td>
				
				<td><input type="number" name="price_<%= dish.getId() %>"
					value="<%=dish.getDishPrice()%>" readonly>
				</td>
				<td>
					<button class="delete" type="submit">Delete</button>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<span>* You can delete one dish at a time. click the checkbox and press Delete button.*</span>

		<%
		}
		%>
	</form>
	<%} %> 

</body>
</html>