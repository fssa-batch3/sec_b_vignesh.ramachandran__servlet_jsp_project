<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="add_dish" method="post">
		<h2>Dish Add</h2>
		<label>Select Menu</label>
		<select name="menuId" required>
			<option value="">Select</option>
			<option value="1"> Breakfast </option>
		</select> <br>
		
		<label>Select Category</label>
		<select name="categoryId" required>
			<option value="">Select</option>
			<option value="1"> Ordinary </option>
			<option value="2"> Special </option>
			<option value="3"> VIP </option>
		</select> <br>
		
		<label for="dish_name">Dish name:</label>
		<input type="text" name="dish_name" required> <br>
		
		<label for="quantity">Quantity</label>
		<input type="number" name="quantity" required> <br>
		
		<label for="price">Price</label>
		<input type="number" name="price" required> <br>
		
		<label>Select QuantityUnit</label>
		<select name="quantity_unit" required>
			<option value="">Select</option>
			<option value="NOS"> NOS </option>
			<option value="GRAMS"> GRAMS </option>
		</select> <br>
		
		<button type="submit">Create</button>
		
	</form>


</body>
</html>