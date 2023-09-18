<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="in.fssa.srcatering.model.Dish"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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

<title>Dishes</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/dishes/dishes.css">
</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	Set<Dish> dishList = new HashSet<>();
	dishList = (Set<Dish>) request.getAttribute("dishList");
	Menu menu = (Menu) request.getAttribute("menu");
	Category category = (Category) request.getAttribute("category");
	int totalPrice = (Integer) request.getAttribute("totalPrice");
	%>

	<main>

		<div class="ingredient-image">
			<h2><%=menu.getMenuName()%>
				Menu
			</h2>
		</div>

		<section class="category">
			<div class="content">
				<h3>
					<span>SR</span>'s
					<%=category.getCategoryName()%>
					<%=menu.getMenuName()%></h3>
				<ul class="dishes">
					<%
					for (Dish dish : dishList) {
					%>
					<li><%=dish.getDishName()%> - <%=dish.getQuantity()%><%=dish.getQuantityUnit()%>
						- <%=dish.getDishPrice()%></li>
					<%
					}
					%>

				</ul>

				<div class="nxt_page">
					<p>
						Rs.<%=totalPrice%>/plate
					</p>
					
					<%if(loggedUser != null){ %>
					
						<form action="cart/create" method="post" >
	
							<input type="hidden" name="menuId" value="<%=menu.getId()%>">
							<input type="hidden" name="categoryId" value="<%=category.getId()%>"> 
							
								<button class="add_to_cart" type="submit">Add to Cart
									<a> <img class="plus-image" src="https://iili.io/J9rMPBs.png" alt="plus image">
									</a>
								</button>
						</form>
						
						<a href="order/create?menuId=<%=menu.getId() %>&categoryId=<%=category.getId() %>">
							<button type="submit" class="buy_now" >Buy Now</button>
						</a>
					
					<%} else { %>
						
						<button class="add_to_cart" type="submit" onclick="showLoginAlert()">Add to Cart
								<a> <img class="plus-image" src="https://iili.io/J9rMPBs.png" alt="plus image">
								</a>
						</button>
						
						<button class="buy_now" onclick="showLoginAlert()">Buy Now</button>
						
					<%} %>

				</div>

			</div>
		</section>

	</main>
	
	<script>
	    function showLoginAlert() {
	        alert("Please login to add items to your cart.");
	        // You can also redirect to the login page here if needed
	        // window.location.href = "login.html";
	    }
	</script>
	


</body>
</html>