<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="in.fssa.srcatering.model.OrderStatus"%>
<%@page import="in.fssa.srcatering.model.Dish"%>
<%@page import="in.fssa.srcatering.service.DishService"%>
<%@page import="in.fssa.srcatering.service.DishPriceService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@page import="in.fssa.srcatering.service.CategoryService"%>
<%@page import="in.fssa.srcatering.model.OrderProduct"%>
<%@page import="in.fssa.srcatering.model.AddressBook"%>
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
	href="<%=request.getContextPath()%>/assets/css/normalize.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/order_details.css">
<title>Order Details</title>
</head>
<body>

	<%@include file="/header.jsp"%>

	<% 
	AddressBook address = (AddressBook) request.getAttribute("address");
	Set<OrderProduct> orderProductList = new HashSet<>();
	orderProductList = (Set<OrderProduct>) request.getAttribute("orderProductList");
	%>

	<section class="my-orders">
	
		<%if(address != null){ %>
	
			<div class="address_div">
				<h2>Delivery Address</h2>
				<p>
					<%=address.getName() + ", " + address.getEmail() + ", " + address.getPhoneNumber() + ", "%><br>
					<%=address.getDoorNo() + ", "%><br>
					<%=address.getStreetName() + ", "%><br>
					<%=address.getCity() + ", "%><br>
					<%=address.getSubLocality() + ", "%><br>
					<%=address.getDistrict() + " -"%>
					<%=address.getPincode()%>
				</p>
			</div>
			
		<%} %>

		<%int count = 0;
		for (OrderProduct orderProduct : orderProductList) {
			count++;
			
			Menu menu = new MenuService().findByMenuId(orderProduct.getMenuId());
			Category category = new CategoryService().getCategoryByMenuIdAndCategoryId(orderProduct.getMenuId(),
			orderProduct.getCategoryId());
			List<Integer> priceIds = new ArrayList<>();
		%>
		<div class="orders">
			<div class="my-orders_list">
				<div class="head_order">
					<p class="order_id">
						Order Id:
						<%=orderProduct.getOrderId()%></p>

					<%
					if (orderProduct.getOrderStatus() == OrderStatus.NOT_DELIVERED) {
					%>
					<p id="order_status" style="color: var(--text-color)"><%=orderProduct.getOrderStatus()%></p>
					<%
					}
					%>

					<%
					if (orderProduct.getOrderStatus() == OrderStatus.DELIVERED) {
					%>
					<p id="order_status" style="color: var(--thickgreen-color)"><%=orderProduct.getOrderStatus()%></p>
					<%
					}
					%>

					<%
					if (orderProduct.getOrderStatus() == OrderStatus.CANCELLED) {
					%>
					<p id="order_status" style="color: var(--second-color)"><%=orderProduct.getOrderStatus()%></p>
					<%
					}
					%>


				</div>
				<div class="my_order_text">

					<div class="menuImage">
						<img src="<%=category.getImage()%>">
					</div>

					<div class="subject">
						<h2><%=category.getCategoryName()%>
							<%=menu.getMenuName()%></h2>
						<button class="btn view">View Dishes</button>

						<%
						if (orderProduct.getOrderStatus() == OrderStatus.NOT_DELIVERED) {

							LocalDate oneDayBefore = LocalDate.now().minusDays(1);

							LocalDate twoDaysBefore = orderProduct.getDeliveryDate().minusDays(2);
						%>

							<%
							if (LocalDate.now().isBefore(twoDaysBefore)) {
							%>
	
							<form action="details" method="post" id="cancelOrder">
								<input type="hidden" name="orderId"
									value="<%=orderProduct.getOrderId()%>"> 
								<input
									type="hidden" name="menuId"
									value="<%=orderProduct.getMenuId()%>"> 
								<input
									type="hidden" name="categoryId"
									value="<%=orderProduct.getCategoryId()%>">
								<input
									type="hidden" name="cancelReason"
									id="cancelReason" value="<%=count %>">
								<button type="submit" class="btn cancel" value="<%=orderProduct.getOrderId()%>">Cancel Order</button>
							</form>
	
	
							<%
							}
							%>
	
							<%
							if (oneDayBefore == orderProduct.getDeliveryDate()) {
							%>
	
							<p class="arr_status">Arriving Tomorrow</p>
	
							<%
							}
							%>

						<%
						}
						%>
						
						<%if(orderProduct.getOrderStatus() == OrderStatus.CANCELLED){ %>
							  
							<div class="reason">Cancel Reason :
								<p><%=orderProduct.getCancelReason() %></p>
							</div>
							
							
							
						<%} %>

						<!-- cancel button -->
						<%-- <%if(orderProduct.getOrderStatus() == OrderStatus.CANCELLED){ %>
							<button class="btn cancel">Cancel Order</button>
						<% }%> --%>
					</div>

					<div class="field">

						<div>
							<label>Delivery Date:</label> <input type="date"
								value="<%=orderProduct.getDeliveryDate()%>" readonly>
						</div>

						<div>
							<label>No.of.Guest:</label> <input type="number"
								value="<%=orderProduct.getNoOfGuest()%>" readonly>
						</div>

						<%
						for (Integer priceId : orderProduct.getDishIdPriceIdMap().values()) {
							priceIds.add(priceId);
						}
						%>

						<%
						int sum = 0;
						sum = new DishPriceService().getTotalPriceByPriceId(priceIds);
						int noOfGuest = orderProduct.getNoOfGuest();
						%>
						<div>
							<label>TotalCost:</label> <input type="number"
								value="<%=sum * noOfGuest%>" readonly>
						</div>

					</div>

					<!-- hidden dishes -->
					<div class="dropdown_menu-type-content animate" id="show">
						<i class="bx bx-x-circle" id="closeDish"></i>
						<ul class="dishes">

							<%
							List<Integer> dishIds = new ArrayList<>();
							for (Integer dishId : orderProduct.getDishIdPriceIdMap().keySet()) {
								dishIds.add(dishId);
							}
							%>

							<%
							List<Dish> dishList = new ArrayList<>();
							for (Integer id : dishIds) {
								Dish dish = new DishService().getDishByDishId(id);
								dishList.add(dish);
							}
							%>

							<%
							for (Dish dish : dishList) {
							%>
							<li><%=dish.getDishName() + "-" + dish.getQuantity() + "-" + dish.getQuantityUnit() + "-" + dish.getDishPrice()%>
							</li>

							<%
							}
							%>
						</ul>
					</div>

				</div>
			</div>

		</div>
		<%
		}
		%>

	</section>

	<script>
	
		document.addEventListener("DOMContentLoaded", function() {
			// Check if the 'no_of_guest' item exists in localStorage
			if (localStorage.getItem("cancel_reason") !== null) {
				// Remove the 'no_of_guest' item from localStorage
				localStorage.removeItem("cancel_reason");
				
			}
		});

	
		// view dish
		const viewBtn = document.querySelectorAll(".view");
		viewBtn.forEach((showDishes) => {
		  showDishes.addEventListener("click", function empty() {
	
		    const parent = this.closest(".my-orders_list");
	
		    const div_dish = parent.querySelector("#show");
		    div_dish.setAttribute("style", "display:block");

		    const div_back_1 = parent.querySelector(".head_order");
		    div_back_1.style.opacity = "0.5";
	
		    const div_back = parent.querySelector(".field");
		    div_back.style.opacity = "0.2";
		  });
		});
		
		
		
		// close dish
		const closeBtn = document.querySelectorAll("#closeDish");
		closeBtn.forEach((close_dish) => {
		  close_dish.addEventListener("click", function empty() {
		    const parent = this.closest(".my-orders_list");
		    const div_dish = parent.querySelector(".dropdown_menu-type-content");
		    div_dish.removeAttribute("style");

		    const div_back_1 = parent.querySelector(".head_order");
		    div_back_1.removeAttribute("style");

		    const div_back = parent.querySelector(".field");
		    div_back.removeAttribute("style");
		  });
		});
		
		
		
		// cancel order
		const cancelBtn = document.querySelectorAll("#cancelOrder");
		cancelBtn.forEach((cancelOrder) => {
			cancelOrder.addEventListener("submit", function (event){
				
				const parent = this.closest(".subject");
				const value = parent.querySelector(".cancel").value;
				
				const confirmation = confirm("Are you sure you want to cancel this order?");
			    
			    if (!confirmation) {
			        event.preventDefault();
			    } else {
			    	const reason = prompt("Enter the reason", "");
			    	if (reason == null || reason.trim() === "") {
			    		event.preventDefault();
					} else {
						/* const cancelValue = document.getElementById("cancelReason"); */
						const cancelValue = parent.querySelector("#cancelReason");
						cancelValue.value = reason;
					}
			    }
				
			});
		});
		
	</script>

</body>
</html>