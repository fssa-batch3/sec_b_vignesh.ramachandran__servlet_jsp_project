<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
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
	
	<%if(cartList.size() == 0){ %>
		
		<div class="cart_image">
			<img src="<%=request.getContextPath() %>/assets/img/empty_cart.gif" class="cart_empty_img">
			<p>Your <span>Cart</span> is empty !</p>
		</div>

	<%} else {%>

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
						<div>

							<form class="inside" action="mycart" method="post">

								<input type="hidden" name="formName" value="cartUpdate">

								<input type="hidden" name="cartId" value="<%=cart.getId()%>">
								<label for="dateOfDelivery">Delivery Date: <input
									type="date" id="date" class="date" name="deliveryDate"
									value="<%=cart.getDeliveryDate()%>" required>
								</label> <label for="noOfGuest">No.Of.Guest: <input
									type="number" class="number" name="noOfGuest" min="50"
									value="<%=cart.getNoOfGuest()%>" required>
								</label> <span>* No.of.guest should be minimum 50 and maximum
									1500</span>

								<button type="submit" style="display: none" class="btn update">Update</button>

							</form>

						</div>
						<p class="price">
							Rs.<%=cart.getNoOfGuest() * cart.getPrice()%></p>


						<div class="btn_cart">

							<a
								href="<%=request.getContextPath()%>/order/create?cartId=<%=cart.getId()%>">
								<button class="btn order" id="orderOne" type="submit">ORDER</button>
							</a>


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
			
				<div class="summary_div">
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
						<a href="<%=request.getContextPath()%>/order/all">
							<button type="submit" class="btn orderall">ORDER ALL (<%=cartList.size() %>)</button>
						</a>
					</div>
					
				</div>

			</div>

		</section>
	</main>
	
	
	
	<%@include file="/footer.jsp" %>


	<script>
	
		
		// Get the current date
		const currentDate = new Date();

		// Calculate the date 7 days from now
		const sevenDaysLater = new Date(currentDate);
		sevenDaysLater.setDate(currentDate.getDate() + 7);

		// Format the date as "YYYY-MM-DD" (assuming you want this format)
		const min_date = formatDate(sevenDaysLater);

		function formatDate(date) {
			const year = date.getFullYear();
			const month = (date.getMonth() + 1).toString().padStart(2, '0');
			const day = date.getDate().toString().padStart(2, '0');
			;
			return year + "-" + month + "-" + day;
		}

		// Calculate the date 2 months from now
		const twoMonthsLater = new Date(currentDate);
		twoMonthsLater.setMonth(currentDate.getMonth() + 2);

		// Format the date as "YYYY-MM-DD" (assuming you want this format)
		const max_date = formatDateMax(twoMonthsLater);

		function formatDateMax(date) {
			const year = date.getFullYear();
			const month = (date.getMonth() + 1).toString().padStart(2, '0');
			const day = date.getDate().toString().padStart(2, '0');
			;
			return year + "-" + month + "-" + day;
		}

		// alert for delivery date
		const inputDeliveryChange = document
				.querySelectorAll("input[type='date']");

		inputDeliveryChange.forEach(function(upDate) {
			upDate.addEventListener("change", function() {

				const parent = this.closest(".cart_end");
				const updateBtn = parent.querySelector(".update");
				const date = parent.querySelector("#date").value;
				const orderBtn = parent.querySelector("#orderOne");

				if (date < min_date) {
					alert("Delivery date should be atleast 7 days from now");
					window.location.reload();
				} else if (date > max_date) {
					alert("Delivery date should be within 2 months from now");
					window.location.reload();
				} else {
					updateBtn.removeAttribute("style");
					orderBtn.classList.remove("order");
					orderBtn.classList.add("disabled");
					orderBtn.disabled = true;
				}

			});

		});
		
		
		
		

 		// noOfGuest input button alert
		
		const inputGuest = document.querySelectorAll("input[name='noOfGuest']");

		inputGuest.forEach(function(upDate) {
			upDate.addEventListener("change", function(event) {
				
				event.preventDefault();

				const parent_div = this.closest(".cart_end");
				const updateBtn = parent_div.querySelector(".update");
				const guest = parent_div.querySelector(".number").value;
				const orderBtn = parent_div.querySelector("#orderOne");

				if (guest < 50) {
					alert("NoOfGuest cannot be less than 50");
					
				} else if (guest > 1500) {
					alert("NoOfGuest cannot be greater than 1500");
					
				} else {
					updateBtn.removeAttribute("style");
					orderBtn.classList.remove("order");
					orderBtn.classList.add("disabled");
					orderBtn.disabled = true;
				}

			});
		});
		
		
		
		// order button
		const orderBtn = document.querySelectorAll("#orderOne");
		
		orderBtn.forEach(function (order){
			order.addEventListener("click", function(event){
				
				const parent_div = this.closest(".cart_content");
				
			 	const date = parent_div.querySelector("#date").value;
				const guest = parent_div.querySelector(".number").value;

				if (guest < 50) {
					alert("NoOfGuest cannot be less than 50");
					event.preventDefault();
					
				} else if (guest > 1500) {
					alert("NoOfGuest cannot be greater than 1500");
					event.preventDefault();
				}
				
				if (date < min_date) {
					alert("Delivery date should be atleast 7 days from now");
					event.preventDefault();
				} else if (date > max_date) {
					alert("Delivery date should be within 2 months from now");
					event.preventDefault();
				}
				
			});
		});
		
		
		// orderAll button
		
		const orderAllBtn = document.querySelector(".orderall");
		
		orderAllBtn.addEventListener("click", function (){
			
			<%int count = 0;%>
			
			<%for(Cart cart: cartList){
				
				count++;
				
				LocalDate deliveryDate = cart.getDeliveryDate();
			
				LocalDate today = LocalDate.now();
				
				LocalDate twoMonthsLater = today.plusMonths(2);
				
				// getting no of Days
				long daysDifference = ChronoUnit.DAYS.between(today, deliveryDate);
				long monthsDifference = ChronoUnit.MONTHS.between(today, twoMonthsLater);
				
				if (daysDifference < 7) {%>
					alert("Delivery date should be atleast 7 days from now in the cart.no" + " " +<%=count%>);
					event.preventDefault();
				<%}
				
				if(monthsDifference > 60) {%>
					alert("Please ensure that the delivery date falls within a two-month period in the cart.no" + " " +<%=count%>);
					event.preventDefault();
				<%}
				
				if(cart.getNoOfGuest() < 50){%>
					alert("NoOfGuest cannot be less than 50" + " " +<%=count%>);
					event.preventDefault();
				<%}
				
				if(cart.getNoOfGuest() > 1500){%>
					alert("NoOfGuest cannot be greater than 1500"+ " " +<%=count%>);
					event.preventDefault();
				<%}%>

			<%}%>
					
		})
	</script>
	
	<%} %>


</body>
</html>