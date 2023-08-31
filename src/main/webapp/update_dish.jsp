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
<title>Insert title here</title>
</head>
<body>
	<%
	List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
	List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
	QuantityUnit[] quantityUnitArray = (QuantityUnit[]) request.getAttribute("quantityUnit");
	List<QuantityUnit> quantityUnitList = Arrays.asList(quantityUnitArray);
	
	%>
	
		<form action="edit?menuId=<%=request.getParameter("menuId")%>&categoryId=<%=request.getParameter("categoryId") %>" method="get">
			<h2>Dish Update</h2>
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
			<button type="submit">Get Dishes</button>
		</form>
		
		<br> 
		
		<form action="">
		
		<table border="1">
			<tr>
				<th>Status</th>
				<th>Dish name</th>
				<th>Quantity</th>
				<th>Quantity Unit</th>
				<th>Price</th>
			</tr>
			<% List<Dish> dishList = (List<Dish>) request.getAttribute("dishList");
			   
			   if(dishList != null){
			   		for(Dish dish : dishList){
			%>
			   
			<tr>
				<td>
					<select name="status" required>
						<option value="1">True</option>
						<option value="0">False</option>
					</select>
				</td>
				<td>
					<input type="text" name="dish_name" value="<%=dish.getDishName() %>" readonly>
				</td>
				<td>
					<input type="number" name="quantity" value="<%=dish.getQuantity() %>" required>
				</td>
				<td>
					<select name="quantity_unit" required>
						<option value="NOS">NOS</option>
						<option value="GRAMS">GRAMS</option>
					</select>
				</td>
				<td>
					<input type="number" name="price" value="<%=dish.getDishPrice() %>" required>
				</td>
				
				
			</tr>
			<%} %>
			
			
			
		</table>

		<button type="submit">Update</button>
		<%} %>
		</form>

</body>
</html>