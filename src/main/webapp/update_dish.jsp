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
<title>Update Dish</title>
<style>
.delete{
	color:red;
}
</style>
</head>
<body>


	<%Menu menu = (Menu) request.getAttribute("menu");
	Category category = (Category) request.getAttribute("category");
	%>
	
	<h2>Dish Update</h2>
	
	<form action="update?menuId=<%=menu.getId() %>&categoryId=<%=category.getId() %>" method="post">
	
		<label>Menu Name</label>
		<input type="text" name="menu_name" value="<%=menu.getMenuName()%>">
		
		<label>Category Name</label>
		<input type="text" name="category_name" value="<%=category.getCategoryName() %>">
		
		<table border="1">
		
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
				<td>
					<input type="checkbox" name="selectedDishes" value="<%=dish.getId()%>">
				</td>
				
				<td><input type="text" name="dish_name_<%= dish.getId() %>"
					value="<%=dish.getDishName()%>" readonly></td>
				<td><input type="number" name="quantity_<%= dish.getId() %>"
					value="<%=dish.getQuantity()%>" required></td>
					
				<td>
				<select name="quantity_unit_<%= dish.getId() %>" required>
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
					value="<%=dish.getDishPrice()%>" required>
				</td>
				<td>
					<select name="status_<%=dish.getId() %>" required>
						
						<% if(dish.getStatus() == 1){%>
							<option value="1">True</option>
							<option value="0">False</option>
						<% } else {%>
							<option value="0">False</option>
							<option value="1">True</option>
						<% } %>
					</select>
					
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<span>* Click the checkbox, change the details and press the Update button.*</span>

		<button type="submit" >Update</button>
		<%
		}
		%>
		
		
	</form>
	

	
<%-- 	<%
	Set<Menu> menuList = (Set<Menu>) request.getAttribute("menuList");
	Set<Category> categoryList = (Set<Category>) request.getAttribute("categoryList");
	%>
	<h2>Dish Update</h2>
	
	<%if(menuList != null && categoryList != null) {  %>
	
	<form
		action="edit?menuId=<%=request.getParameter("menuId")%>&categoryId=<%=request.getParameter("categoryId")%>"
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

	<form action="update" method="post">
	
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
					value="<%=dish.getQuantity()%>" required></td>
					
				<td>
				<select name="quantity_unit_<%= dish.getId() %>" required>
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
					value="<%=dish.getDishPrice()%>" required>
				</td>
				<td>
				
					<a href="dish/delete?dishId=<%=dish.getId()%>&<%=menu.getId()%>&<%=category.getId()%>">
						<button class="delete" type="submit">Delete</button>
					</a>
					
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<span>* Click the checkbox, change the details and press the Update button.*</span>

		<button type="submit" onchange=>Update</button>
		<%
		}
		%>
	</form>
	<%} %>  --%>
	


</body>
</html>