<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.srcatering.model.AddressBook"%>
<%@page import="in.fssa.srcatering.model.Category"%>
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
	
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/normalize.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/order_form.css">

<title>Order Form</title>

</head>
<body>

	<%@include file="/header.jsp"%>

	<%
	Menu menu = (Menu) request.getAttribute("menu");
	Category category = (Category) request.getAttribute("category");
	int price = (Integer) request.getAttribute("price");
	AddressBook address = (AddressBook) request.getAttribute("address");
	
	LocalDate deliveryDate = (LocalDate) request.getAttribute("deliveryDate");
	
	// from cart
	String guestCart = (String) request.getAttribute("noOfGuestCart");
	String cartId = (String) request.getAttribute("cartId");
	%>

	<!-- main starts -->

	<main>
		<!-- order form starts -->
		<section class="my-order">
		
			<form action="create" method="post" class="my-order_form" id="placeOrder">
				<div class="details">
					<h2>CATERING ORDER</h2>
					<h3>Personal Details</h3>

					<div class="event">
						<label>Event Name:</label> <input type="text" name="eventName" id="eventName" title="Enter alphabets only"
							pattern="^[a-zA-Z\s]+$" required>
					</div>

					<div class="address">
						<label>DELIVERY ADDRESS: </label>
						
						<%if(address != null){ %>
						
							<div id="address">
								<%=address.getName() + ", " + address.getEmail() + ", " + address.getPhoneNumber() + ", " + address.getDoorNo()
										+ ", " + address.getStreetName() + ", " + address.getSubLocality() + ", " + address.getCity() + ", "
										+ address.getDistrict() + ", " + address.getState() + ", " + address.getPincode()%>
							</div>
							
							<p class="ensure">Choose your default address to deliver your delicious food</p>
							
							<%if(cartId != null){ %>
                        
	                        	<a href="<%=request.getContextPath()%>/user/address?cartId=<%=cartId%>">
									<input type="hidden" name="page" value="orderpage">
									<button type="button" class="btn changeAdd">Change Address</button>
								</a>
                        	
	                        <%} else { %>
	
								<a href="<%=request.getContextPath()%>/user/address?menuId=<%=menu.getId()%>&categoryId=<%=category.getId()%>">
									<input type="hidden" name="page" value="orderpage">
									<button type="button" class="btn changeAdd">Change Address</button>
								</a>
							
							<%} %>

                        <%} else { %>

                        	<%if(cartId != null){ %>
                        
	                        	<a href="<%=request.getContextPath()%>/user/address?cartId=<%=cartId%>">
									<input type="hidden" name="page" value="orderpage">
									<button type="button" class="btn changeAdd">Create Address</button>
								</a>
                        	
	                        <%} else { %>
	
								<a href="<%=request.getContextPath()%>/user/address?menuId=<%=menu.getId()%>&categoryId=<%=category.getId()%>">
									<input type="hidden" name="page" value="orderpage">
									<button type="button" class="btn changeAdd">Create Address</button>
								</a>
							
							<%} %>

                        <%} %>

					</div>

					<button type="submit" class="btn submit">Order</button>

				</div>

				<aside>
					<div class="order_details">
						<h2>
							<span>ORDER</span> DETAILS
						</h2>
						<div class="seperation">
							<h2>
								<%=category.getCategoryName()%>
								<%=menu.getMenuName()%>
							</h2>
							<!-- menuId and categoryId -->
							<input type="hidden" name="menuId" value="<%=menu.getId()%>">
							<input type="hidden" name="categoryId" value="<%=category.getId()%>">
							<div>
								<% if(cartId != null){%>
								
									<input type="hidden" name="cartId" value="<%=cartId %>">
									
									<label for="noOfGuest">No.Of.Guest:</label> 
									 <input
										type="number" id="noOfGuest" class="number" name="noOfGuest"
										min="50" max="1500" value="<%=Integer.parseInt(guestCart)%>" required>

								<%} else { %>
								
									<label for="noOfGuest">No.Of.Guest:</label> 
									 <input
										type="number" id="noOfGuest" class="number" name="noOfGuest"
										min="50" max="1500" value="50" required>

								<%} %>
							</div>
							
							<div>
							
								<label>Menu Price: </label> 
								<p>Rs.<input type="number" id="price" value="<%=price%>" readonly></p>
								
							</div>
							<div>
							
								<label for="dateOfDelivery">Delivery Date: </label>
								 <input type="date" id="date" class="date" name="deliveryDate"
									value="<%=deliveryDate%>" required>
								
							</div>
							<span class="guest_message">* No.of.guest should be minimum 50 and maximum 1500</span>
							<p class="ensure">*Please check the Delivery date and No.of.guest.</p>
						</div>
						<div class="last">
							<label>Total Cost</label>
							<p>Rs.<input class="price" id="totalCost" name="totalCost" value="" readonly></p>
						</div>
					</div>
				</aside>
			</form>
		</section>
		<!-- order form ends -->
	</main>
	<!-- main ends -->
	
	<%@include file="/footer2.jsp" %>

	<script>
	
		document.addEventListener("DOMContentLoaded", function() {
			// Check if the 'no_of_guest' item exists in localStorage
			if (localStorage.getItem("no_of_guest") !== null) {
				// Remove the 'no_of_guest' item from localStorage
				localStorage.removeItem("no_of_guest");
				
			}
		});
		
		/* noOfGuest validation and alert */
		
		// local storage
		const price = document.getElementById("price").value;
		const no_of_guest2 = document.getElementById("noOfGuest");
		
			<%if(guestCart != null){%>
			
				const no_of_guest_local = JSON.parse(localStorage.getItem("no_of_guest")) || "<%=Integer.parseInt(guestCart)%>";
			
				no_of_guest2.value = no_of_guest_local;
				
			<%} else {%>
			
				const no_of_guest_local = JSON.parse(localStorage.getItem("no_of_guest")) || "50";
			
				no_of_guest2.value = no_of_guest_local;
			
			<%}%>
		
		const total_cost = document.getElementById("totalCost");
		
		total_cost.value = price * no_of_guest2.value;	

		
		// noOfGuest alert and localstorage save function
		
		const inputGuest = document.querySelector("input[name='noOfGuest']");
		const orderButton = document.querySelector(".btn.submit");
		
		inputGuest.addEventListener("change", function() {
			
			const price = document.getElementById("price").value;
			const no_of_guest = document.getElementById("noOfGuest").value;
			
			const guest = document.querySelector("#noOfGuest").value;

			if (guest < 50) {
				alert("NoOfGuest cannot be less than 50");
				/* window.location.reload(); */
			} else if (guest > 1500) {
				alert("NoOfGuest cannot be greater than 1500");
				/* window.location.reload(); */
			} else {
				
				localStorage.setItem("no_of_guest", JSON.stringify(no_of_guest));
				
				const total_cost = document.getElementById("totalCost");
				const no_of_guest_changed = JSON.parse(localStorage.getItem("no_of_guest")) || "";
				no_of_guest.value = no_of_guest_changed;
				
				total_cost.value = price * no_of_guest_changed;
			}

		});
		

		/* delivery date alert and validation */
		
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
		const inputDelivery = document.querySelector("input[type='date']");

		inputDelivery.addEventListener("change", function() {

			const date = document.querySelector("#date").value;

			if (date < min_date) {
				alert("Delivery date should be atleast 7 days from now");
				window.location.reload();
			} else if (date > max_date) {
				alert("Delivery date should be within 2 months from now");
				window.location.reload();
			}

		});
		
		
		// order button
		const orderBtn = document.querySelector(".submit");
		
		orderBtn.addEventListener("click", function(event){
				
			 	const date = document.querySelector("#date").value;
				const guest = document.querySelector("#noOfGuest").value;
				const eventName = document.querySelector("#eventName").value;
				
				if(eventName.trim() == ""){
					alert("Enter Event Name");
					event.preventDefault();
				}

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
				
				if(!document.getElementById("address")){
					alert("Create Address to order Menu");
					event.preventDefault();
				}
		});
		
		
		// order button submission alert
		document.getElementById("placeOrder").addEventListener("submit", function(event) {
		    const confirmation = confirm("Are you sure you want to submit this order?");
		    
		    if (!confirmation) {
		        event.preventDefault();
		    }
		});


	</script>


</body>
</html>