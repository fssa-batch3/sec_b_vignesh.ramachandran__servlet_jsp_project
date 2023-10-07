<%@page import="in.fssa.srcatering.model.AddressBook"%>
<%@page import="in.fssa.srcatering.model.Cart"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.fssa.srcatering.model.Category"%>
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
	
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/normalize.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/order_form.css">
	
<title>Order All</title>
</head>
<body>

	<%@include file="/header.jsp" %>
	
	<%	List<Cart> cartList = new ArrayList<>();
		List<Menu> menuList = new ArrayList<>();
		List<Category> categoryList = new ArrayList<>();
		List<Integer> noOfGuestList = new ArrayList<>();
		List<Integer> priceList = new ArrayList<>();
		List<LocalDate> deliveryDateList = new ArrayList<>();

		AddressBook address = (AddressBook) request.getAttribute("address");
		menuList = (List<Menu>) request.getAttribute("menuList");
		categoryList = (List<Category>) request.getAttribute("categoryList");
		noOfGuestList = (List<Integer>) request.getAttribute("noOfGuestList");
		priceList = (List<Integer>) request.getAttribute("priceList");
		deliveryDateList = (List<LocalDate>) request.getAttribute("deliveryDateList");
		cartList = (List<Cart>) request.getAttribute("cartList");
	%>
	
	
	
	<!-- main starts -->

	<main>
		<!-- order form starts -->
		<section class="my-order">
		
			<form action="all" method="post" class="my-order_form" id="placeOrder">
				<div class="details">
					<div id="address_event">
					<h2>CATERING ORDER</h2>
					<h3>Personal Details</h3>

					<div class="event">
						<label>Event Name:</label> <input type="text" name="eventName" id="eventName" placeholder="Enter event name"
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
							
							<span>Choose your default address to deliver your delicious food</span>
							
							<a href="<%=request.getContextPath()%>/user/address?orderAll="+true>
								<input type="hidden" name="page" value="orderpage">
								<button type="button" class="btn changeAdd">Change Address</button>
							</a>

                        <%} else { %>

							<a href="<%=request.getContextPath()%>/user/address?orderAll="+true>
								<input type="hidden" name="page" value="orderpage">
								<button type="button" class="btn changeAdd">Create Address</button>
							</a>

                        <%} %>

					</div>

					<button type="submit" class="btn submit">Order</button>
					</div>

				</div>

				<aside>
					<div class="order_details">
						<h2>
							<span>ORDER</span> DETAILS
						</h2>
						
						<%
							int count = 0;
						
							for(int i=0; i<cartList.size(); i++){ 
								Menu menu = menuList.get(i);
								Category category = categoryList.get(i);
								Integer price = priceList.get(i);
								Integer noOfGuest = noOfGuestList.get(i);
								LocalDate deliveryDate = deliveryDateList.get(i);
								
								count++;
						%>
							<div class="seperation">
								<h2>
									<span><%=category.getCategoryName()%></span>
									<%=menu.getMenuName()%>
								</h2>
								<!-- menuId and categoryId -->
								<input type="hidden" name="menuId<%=count %>" value="<%=menu.getId()%>">
								<input type="hidden" name="categoryId<%=count %>" value="<%=category.getId()%>">
								<input type="hidden" name="cartCount" value="<%=cartList.size()%>">
								
								<div>
									<label for="noOfGuest">No.Of.Guest:</label> 
									<%-- <p name="noOfGuest" id="noOfGuest"<%=count %>"><%=noOfGuest%></p> --%>
									<input type="number" id="noOfGuest" class="number" name="noOfGuest<%=count %>"
										min="50" max="1500" value="<%=noOfGuest%>" readonly>
								</div>
								
								<div>
								
									<label>Menu Price: </label> 
									<input type="number" id="price" value="<%=price%>" readonly>
									
								</div>
								
								<div>
									
									<label>Total Price: </label> 
									<input type="number" id="total_price" class="total_price" value="<%=noOfGuest * price%>" readonly>
								
								</div>
								
								<div>
								
									<label for="dateOfDelivery">Delivery Date: </label>
									 <input type="date" id="date" class="date" name="deliveryDate<%=count %>"
										value="<%=deliveryDate%>" readonly>
									
								</div>
								<p class="ensure">*Please check the Delivery date and No.of.guest. If you want to edit go to My cart</p>
							</div>
						<%} %>
						<div class="last">
							<label>Total Cost of the Order</label>
							<input class="price" id="totalCost" name="totalCost" value="" readonly>
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
		const inputDelivery = document.querySelectorAll("input[type='date']");
		
		inputDelivery.forEach(function (change){
			
			change.addEventListener("change", function() {
				
				const parent = this.closest(".seperation");
				const date = parent.querySelector("#date").value;
		
				if (date < min_date) {
					alert("Delivery date should be atleast 7 days from now");
					window.location.reload();
				} else if (date > max_date) {
					alert("Delivery date should be within 2 months from now");
					window.location.reload();
				}
		
			});
			
		});
		
		
		/* total cost of the order function */
		
		// Calculate the total price
		function calculateTotal() {
			
		    var priceInputs = document.getElementsByClassName("total_price");
		    var total = 0;
		
		   	for (var i = 0; i < priceInputs.length; i++) {
		        total += parseInt(priceInputs[i].value);
		    }
		
		    document.getElementById("totalCost").value = total;
		}
		
		calculateTotal();
		
		
		
		

		// noOfGuest validation and alert
		
		const inputGuest = document.querySelectorAll("input[name='noOfGuest']");
		const orderButton = document.querySelector(".btn.submit");
		
		inputGuest.forEach(function (update){
			
			update.addEventListener("change", function(event) {
				
				event.preventDefault();
				
				const parent = this.closest(".seperation");
				const price = parent.querySelector("#price").value;	
				const guest = parent.querySelector("#noOfGuest").value;

				if (guest < 50) {
					alert("NoOfGuest cannot be less than 50");
					window.location.reload();
				} else if (guest > 1500) {
					alert("NoOfGuest cannot be greater than 1500");
					window.location.reload();
				} else {
					
					localStorage.removeItem("no_of_guest");
					
					localStorage.setItem("no_of_guest", JSON.stringify(guest));
					
					const total_cost = parent.querySelector("#total_price");
					const no_of_guest_changed = JSON.parse(localStorage.getItem("no_of_guest")) || "";
					guest.value = no_of_guest_changed;
					
					total_cost.value = price * no_of_guest_changed;
					calculateTotal();
				}

			});
			
		});
		
		
		
		// order button
		const orderBtn = document.querySelector(".submit");
		
		orderBtn.addEventListener("click", function(event){
			
			const eventName = document.querySelector("#eventName").value;
			
			if(eventName.trim() == ""){
				alert("Enter Event Name");
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