<%@page import="in.fssa.srcatering.model.Cart"%>
<%@page import="java.util.ArrayList"%>
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
	href="<%=request.getContextPath()%>/assets/css/my_cart.css">

<title>MyCart</title>
</head>
<body>

	<%@include file="/header.jsp"%>

	<%
	List<Cart> cartList = new ArrayList<>();
	List<String> menuNames = new ArrayList<>();
	List<String> categoryNames = new ArrayList<>();

	cartList = (List<Cart>) request.getAttribute("cartList");
	menuNames = (List<String>) request.getAttribute("menuNames");
	categoryNames = (List<String>) request.getAttribute("categoryNames");
	%>

	<main>
		<div class="ingredient-image">
			<h2>My Cart</h2>
		</div>
		<!-- my cart details starts -->
		<section class="section">
			<div class="cart">

				<%
				for (int i = 0; i < cartList.size(); i++) {
					Cart cart = cartList.get(i);
					String menuName = menuNames.get(i);
					String categoryName = categoryNames.get(i);
				%>

				<!-- Cart Content -->
				<div class="cart_content" role="form">
					<div class="cart_text">
						<h3>
							<span>SR's</span>
							<%=categoryName%>
							<%=menuName%></h3>
					</div>

					<div class="change">
						<a
							href="<%=request.getContextPath()%>/dishes?menuId=<%=cart.getMenuId()%>&categoryId=<%=cart.getCategoryId()%>">
							<button type="submit" class="btn view">View</button>
						</a>
					</div>

					<div class="cart_end">
						<div >
						
							<form class="inside" action="mycart" method="post">
								
								<input type="hidden" name="formName" value="cartUpdate">
							
								<input type="hidden" name="cartId" value="<%=cart.getId() %>">
								<label for="dateOfDelivery">Delivery Date: 
								    <input type="date" id="date" class="date" name="deliveryDate"  value="<%=cart.getDeliveryDate()%>" required>
								</label> 
								
								<label for="noOfGuest">No.Of.Guest: 
								    <input type="number" class="number" name="noOfGuest"  min="50" value="<%=cart.getNoOfGuest()%>" required>
								</label> 
								
								<span>* No.of.guest should be minimum 50 and maximum 1500</span>
								
								<button type="submit" style="display:none" class="btn update">Update</button>
							
							</form>

						</div>
						<p class="price">
							Rs.<%=cart.getNoOfGuest() * cart.getPrice()%></p>
							
							
						<div class="btn_cart">
							
							<form action="order/create" method="post">
								<input type="hidden" name="formName" value="order">
							
								<input type="hidden" value="<%=cart.getId() %>" name="cartId">
								
								<button class="btn order" type="submit">ORDER</button>
							</form>
							

							<form action="mycart" method="post">
								<input type="hidden" name="formName" value="cartRemove">
								<input type="hidden" name="cartId" value="<%=cart.getId()%>">
								<button class="btn remove" type="submit" type="button">REMOVE</button>
							</form>

						</div>
						<p class="ensure">Please check the Delivery date and
							No.of.guest before order</p>
					</div>
				</div>

				<%
				}
				%>

			</div>
			<div class="summary">
				<div class="sum_content">
					<h2>
						<span> ORDER</span> SUMMARY
					</h2>
					<div class="sum_name">
						<h3>
							Menu Nam<span>e</span>
						</h3>
						<h3>
							Dat<span>e</span>
						</h3>
						<h3>
							Pric<span>e</span>
						</h3>
					</div>

					<%
					for (int i = 0; i < cartList.size(); i++) {
						Cart cart = cartList.get(i);
						String menuName = menuNames.get(i);
						String categoryName = categoryNames.get(i);
					%>
					<div class="sum_details">
						<p><%=categoryName%>
							<%=menuName%></p>
						<p><%=cart.getDeliveryDate()%></p>
						<p><%=cart.getNoOfGuest() * cart.getPrice()%></p>
					</div>
					<%
					}
					%>

					<%
					int totalSum = 0;
					for (Cart cart : cartList) {
						totalSum += cart.getNoOfGuest() * cart.getPrice();
					}
					%>
					<div class="sum_end">
						<p>Total Price</p>
						<p><%=totalSum%></p>
					</div>
				</div>

				<div class="cart_orderall">
					<a href=""> 
						<button type="submit" class="btn orderall">ORDER ALL (2)</button>
					</a>
				</div>

			</div>

		</section>
	</main>


	<script>
		
	const inputDelivery = document.querySelectorAll("input[type='date']");
		
		inputDelivery.forEach(function (upDate) {
	    	upDate.addEventListener("input", function () {
		
				const parent = this.closest(".inside");
				const updateBtn = parent.querySelector(".update");
				
				updateBtn.removeAttribute("style");
				
     		});
		});
		
 	const inputGuest = document.querySelectorAll("input[name='noOfGuest']");
		
		inputGuest.forEach(function (upDate) {
			upDate.addEventListener("input", function(){
				
				const parent_div = this.closest(".inside");
				const updateBtn = parent_div.querySelector(".update");
				
				updateBtn.removeAttribute("style");
				
			});
		});
	
	</script>


</body>
</html>