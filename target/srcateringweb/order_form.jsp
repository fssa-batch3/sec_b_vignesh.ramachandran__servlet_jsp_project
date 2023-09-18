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
	%>

	<!-- main starts -->

	<main>
		<!-- order form starts -->
		<section class="my-order">
			<form action="" method="post" class="my-order_form" id="placeOrder">
				<div class="details">
					<h2>CATERING ORDER</h2>
					<h3>Personal Details</h3>


					<!-- Cart Content -->
					<div class="cart_content" role="form">
						<div class="cart_text">
							<h3>
								<span>SR's</span>
								<%=category.getCategoryName()%>
								<%=menu.getMenuName()%>
							</h3>
							<input type="hidden" name="menuId" value="<%=menu.getId() %>">
							<input type="hidden" name="categoryId" value="<%=category.getId()%>">
						</div>

						<div class="change">
							<a
								href="<%=request.getContextPath()%>/dishes?menuId=<%=menu.getId()%>&categoryId=<%=category.getId()%>">
								<button type="button" class="btn view">View</button>
							</a>
						</div>

						<div class="cart_end">

							<div class="inside">

								<label>Menu Price: <input type="number" id="price"
									value="<%=price%>" readonly>
								</label> <label for="dateOfDelivery">Delivery Date: <input
									type="date" id="date" class="date" name="deliveryDate"
									value="<%=deliveryDate%>" required>
								</label> <label for="noOfGuest">No.Of.Guest: <input
									type="number" id="noOfGuest" class="number" name="noOfGuest"
									min="50" max="1500" value="50" required>
								</label> <span>* No.of.guest should be minimum 50 and maximum
									1500</span>

								<button type="submit" style="display: none" class="btn update">Update</button>

							</div>

							<label>Total Cost: Rs.
								<p class="price" id="totalCost" name="totalCost"></p>
							</label>


							<p class="ensure">Please check the Delivery date and
								No.of.guest before order</p>
						</div>
					</div>


					<div class="event">
						<label>Event Name:</label> <input type="text" name="eventName"
							pattern="^[a-zA-Z\s]+$" required>
					</div>

					<div class="address">
						<label>DELIVERY ADDRESS: </label>
						<textarea type="text" id="address"
							placeholder="Enter your delivery address" rows="6" cols="50"
							readonly>
                                <%=address.getName() + ", " + address.getEmail() + ", " + address.getPhoneNumber() + ", " + address.getDoorNo()
									+ ", " + address.getStreetName() + ", " + address.getSubLocality() + ", " + address.getCity() + ", "
									+ address.getDistrict() + ", " + address.getState() + ", " + address.getPincode()%>
                        </textarea>
                                
                        <a href="<%=request.getContextPath() %>/user/address?page=orderpage">
                        	<button type="button" class="btn changeAdd">Change Address</button>
                        </a>       
						
					</div>

					<button type="submit" class="btn submit">Order</button>

				</div>

				<aside>
					<div class="order_details">
						<h2>
							<span>ORDER</span> DETAILS
						</h2>
					</div>
				</aside>
			</form>
		</section>
		<!-- order form ends -->
	</main>
	<!-- main ends -->

	<script>
	
		const price = document.getElementById("price").value;
		const no_of_guest = document.getElementById("noOfGuest").value;
	
		const total_cost = document.getElementById("totalCost");
		total_cost.innerText = price * no_of_guest;
	
		const inputGuest = document.querySelector("input[name='noOfGuest']");

		inputGuest.addEventListener("change", function() {

			const price = document.getElementById("price").value;
			const no_of_guest = document.getElementById("noOfGuest").value;

			const total_cost = document.getElementById("totalCost");
			total_cost.innerText = price * no_of_guest;
			
			const guest = document.querySelector("#noOfGuest").value;
			
			if(guest < 50){
				alert("NoOfGuest cannot be less than 50");
				window.location.reload();
			} else if (guest > 1500){
				alert("NoOfGuest cannot be greater than 1500");
				window.location.reload();
			}

		});
		
		
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
		  const day = date.getDate().toString().padStart(2, '0');;
		  return year+"-"+month+"-"+day;
		}
		
		
		// Calculate the date 2 months from now
		const twoMonthsLater = new Date(currentDate);
		twoMonthsLater.setMonth(currentDate.getMonth() + 2);

		// Format the date as "YYYY-MM-DD" (assuming you want this format)
		const max_date = formatDateMax(twoMonthsLater);

		function formatDateMax(date) {
		  const year = date.getFullYear();
		  const month = (date.getMonth() + 1).toString().padStart(2, '0');
		  const day = date.getDate().toString().padStart(2, '0');;
		  return year+"-"+month+"-"+day;
		}
		
		// alert for delivery date
		const inputDelivery = document.querySelector("input[type='date']");
		
		inputDelivery.addEventListener("change", function () {
	    	
			const date = document.querySelector("#date").value;

		   	if (date < min_date) {
		   	  alert("Delivery date should be atleast 7 days from now");
		      window.location.reload();
		    } else if(date > max_date) {
		    	alert("Delivery date should be within 2 months from now");
		      window.location.reload();
		    } 

		}); 
		
	</script>


</body>
</html>