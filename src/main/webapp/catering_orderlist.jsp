<%@page import="in.fssa.srcatering.model.AddressBook"%>
<%@page import="in.fssa.srcatering.service.AddressBookService"%>
<%@page import="in.fssa.srcatering.model.Order"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="in.fssa.srcatering.model.CaterApproval"%>
<%@page import="in.fssa.srcatering.service.DishService"%>
<%@page import="in.fssa.srcatering.model.Dish"%>
<%@page import="in.fssa.srcatering.service.DishPriceService"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.srcatering.model.OrderStatus"%>
<%@page import="in.fssa.srcatering.service.CategoryService"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.fssa.srcatering.model.OrderProduct"%>
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
	href="<%=request.getContextPath()%>/assets/css/normalize.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/order_details.css">

<title>Catering Orders</title>
</head>
<body>
	<%@include file="/header.jsp"%>

	<%
	List<OrderProduct> allOrderProducts = new ArrayList<>();
	allOrderProducts = (List<OrderProduct>) request.getAttribute("allOrderProducts");
	
	List<Order> orderList = new ArrayList<>();
	orderList = (List<Order>) request.getAttribute("orderList");
	
	AddressBook address = null;
	String eventName = null;
	%>

	<main>

		<div class="ingredient-image">
			<h2>Catering Orders</h2>
		</div>

		<section class="my-orders">
		
			<div class="radio-input">
				<div class="radio-input">
					<input type="radio" id="value-1" name="value-radio" value="All">
                    <label for="value-1" class="not_deli btn_toggle">All Orders</label>
                    <input type="radio" id="value-2" name="value-radio" value="<%=OrderStatus.NOT_DELIVERED%>">
                    <label for="value-2" class="not_deli btn_toggle">Not Delivered</label>
                    <input type="radio" id="value-3" name="value-radio" value="<%=OrderStatus.DELIVERED%>">
                    <label for="value-3" class="deli btn_toggle">Delivered</label>
                    <input type="radio" id="value-4" name="value-radio" value="<%=OrderStatus.CANCELLED%>">
                    <label for="value-4" class="cancelled btn_toggle">Cancelled</label>
                    <input type="radio" id="value-5" name="value-radio" value="<%=CaterApproval.PENDING%>">
                    <label for="value-5" class="pending btn_toggle">Pending</label>
                    <input type="radio" id="value-6" name="value-radio" value="<%=CaterApproval.REJECTED%>">
                    <label for="value-6" class="rejected btn_toggle">Rejected</label>
                </div>
			</div>

			<%
			int count = 0;
			for (OrderProduct orderProduct : allOrderProducts) {
				count++;

				Menu menu = new MenuService().findByMenuId(orderProduct.getMenuId());
				Category category = new CategoryService().getCategoryByMenuIdAndCategoryId(orderProduct.getMenuId(),
				orderProduct.getCategoryId());
				List<Integer> priceIds = new ArrayList<>();
			%>

			<div class="orders" style="display: block;">
				<div class="my-orders_list">
					<div class="head_order">
						<p class="order_id">
							Order Id:
							<%=orderProduct.getOrderId()%>
						</p>
						
						<%for(Order order: orderList){ 
							
							address = null;
							eventName = null;
							
							if(orderProduct.getOrderId() == order.getId()){
								
								address = new AddressBookService().getAddressByAddressId(order.getAddressId());
								
								eventName = order.getEventName();
						
								DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm:ss a");
								String formattedDateTime = order.getOrderDate().format(formatter);
						%>
							<p class="order_date">
								Order Date :
								<%=formattedDateTime %>
							</p>
							
							<%break;
							}
							%>
						
						<%} %>

						<%
						if (orderProduct.getCaterApproval() == CaterApproval.PENDING
								&& orderProduct.getOrderStatus() != OrderStatus.CANCELLED) {
						%>

						<p id="order_status" style="color: var(--text-color)">
							Cater Approval :
							<%=orderProduct.getCaterApproval()%></p>

						<%
						} else if (orderProduct.getCaterApproval() == CaterApproval.APPROVED
								&& orderProduct.getOrderStatus() != OrderStatus.CANCELLED) {
						%>

						<%
						if (orderProduct.getOrderStatus() == OrderStatus.NOT_DELIVERED) {
						%>
						<p id="order_status" style="color: var(--text-color)">Order Status : <%=orderProduct.getOrderStatus()%></p>
						<%
						}
						%>

						<%
						if (orderProduct.getOrderStatus() == OrderStatus.DELIVERED) {
						%>
						<p id="order_status" style="color: var(--thickgreen-color)">Order Status : <%=orderProduct.getOrderStatus()%></p>
						<%
						}
						%>

						<%
						if (orderProduct.getOrderStatus() == OrderStatus.CANCELLED) {
						%>
						<p id="order_status" style="color: var(--second-color)">Order Status : <%=orderProduct.getOrderStatus()%></p>
						<%
						}
						%>

						<%
						} else if (orderProduct.getCaterApproval() == CaterApproval.REJECTED) {
						%>

						<p id="order_status" style="color: var(--second-color)">
							Cater Approval :
							<%=orderProduct.getCaterApproval()%></p>

						<%
						} else if (orderProduct.getOrderStatus() == OrderStatus.CANCELLED) {
						%>

						<p id="order_status" style="color: var(--second-color)">Order Status : <%=orderProduct.getOrderStatus()%></p>

						<%
						}
						%>

					</div>
					
					<%if(address != null){ %>
					
						<div class="address_div">
							<h2>Delivery Address</h2>
							<p>Event Name: <%=eventName %></p>
							<p>
								<%=address.getName() + ", " + address.getEmail() + ", " + address.getPhoneNumber() + ", "%><br>
								<%=address.getDoorNo() + ", "%>
								<%=address.getStreetName() + ", "%>
								<%=address.getCity() + ", "%>
								<%=address.getSubLocality() + ", "%>
								<%=address.getDistrict() + " -"%>
								<%=address.getPincode()%>
							</p>
						</div>
					
					<%} %>

					<div class="my_order_text">

						<div class="menuImage">
							<img src="<%=category.getImage()%>">
						</div>

						<div class="subject">
							<h2><%=category.getCategoryName()%>
								<%=menu.getMenuName()%></h2>
							<button class="btn view">View Dishes</button>

							<%
							if (orderProduct.getCaterApproval() == CaterApproval.PENDING
									&& orderProduct.getOrderStatus() != OrderStatus.CANCELLED) {
							%>


							<div class="approval">
							
								<form action="cateringorders" method="post">
									<input type="hidden" name="formName" value="reject"> <input
										type="hidden" name="rejectReason" id="rejectReason" value="">
									<input type="hidden" name="orderId"
										value="<%=orderProduct.getOrderId()%>"> <input
										type="hidden" name="menuId"
										value="<%=orderProduct.getMenuId()%>"> <input
										type="hidden" name="categoryId"
										value="<%=orderProduct.getCategoryId()%>">
									<button class="btn reject" id="reject" type="submit">Reject</button>
								</form>

								<form action=cateringorders method="post">
									<input type="hidden" name="formName" value="approve"> <input
										type="hidden" name="orderId"
										value="<%=orderProduct.getOrderId()%>"> <input
										type="hidden" name="menuId"
										value="<%=orderProduct.getMenuId()%>"> <input
										type="hidden" name="categoryId"
										value="<%=orderProduct.getCategoryId()%>">
									<button class="btn approve" id="approve" type="submit">Approve</button>
								</form>

							</div>

							<%
							} else if (orderProduct.getCaterApproval() == CaterApproval.APPROVED
									&& orderProduct.getOrderStatus() != OrderStatus.CANCELLED) {
							%>

								<%
								if (orderProduct.getOrderStatus() == OrderStatus.NOT_DELIVERED) {

								%>

								<div class="approval">
			
									<form action="cateringorders" method="post" id="cancelOrder">
									
										<input type="hidden" name="formName"
											value="cancel">
										<input type="hidden" name="orderId"
											value="<%=orderProduct.getOrderId()%>">
										<input
											type="hidden" name="menuId"
											value="<%=orderProduct.getMenuId()%>"> 
										<input
											type="hidden" name="categoryId"
											value="<%=orderProduct.getCategoryId()%>"> 
										<input
											type="hidden" name="cancelReason" id="cancelReason"
											value="<%=count%>">
											
										<button type="submit" class="btn cancel"
											value="<%=orderProduct.getOrderId()%>">Cancel Order
										</button>
											
									</form>
		
		
									<form action="cateringorders" method="post" id="deliverOrder">
									
										<input type="hidden" name="formName"
											value="deliver">
										<input type="hidden" name="orderId"
											value="<%=orderProduct.getOrderId()%>"> 
										<input
											type="hidden" name="menuId"
											value="<%=orderProduct.getMenuId()%>">
										<input
											type="hidden" name="categoryId"
											value="<%=orderProduct.getCategoryId()%>">
											
										<button type="submit" class="btn approve"
											value="<%=orderProduct.getOrderId()%>">Delivered
										</button>
											
									</form>
								
								</div>
	
								<%
								}
								%>

							<%
							} else if (orderProduct.getCaterApproval() == CaterApproval.REJECTED) {
							%>

							<div class="reason">
								Reject Reason : <p><%=orderProduct.getRejectReason()%></p>
							</div>

							<%
							}
							%>


							<%
							if (orderProduct.getOrderStatus() == OrderStatus.CANCELLED) {
							%>

							<div class="reason">
								Cancel Reason :
								<p><%=orderProduct.getCancelReason()%></p>
							</div>

							<%
							}
							%>
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

	</main>

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
		
		
		// reject order
		const rejectBtn = document.querySelectorAll("#reject");
		
		rejectBtn.forEach((rejectOrder) => {
			rejectOrder.addEventListener("click", function(){
				
				const parent = this.closest(".subject");
				const id = parent.querySelector(".reject").value;
				
				const confirmation = confirm("Are you sure you want to reject this order?");
				
				if (!confirmation) {
			        event.preventDefault();
			    } else {
			    	const reason = prompt("Enter the reason", "");
			    	if (reason == null || reason.trim() === "") {
			    		event.preventDefault();
					} else {
						const rejectReason = parent.querySelector("#rejectReason");
						rejectReason.value = reason;
					}
			    }
				
			});
		});
		
		
		
		document.addEventListener("DOMContentLoaded", function() {
			  // Get all radio inputs
			  const radioInputs = document.querySelectorAll('input[type="radio"][name="value-radio"]');
			  
			  // Add event listeners to radio inputs
			  radioInputs.forEach(function(input) {
			    input.addEventListener("change", function() {
			      // Get the selected value
			      const selectedValue = this.value; 
			      
			      // Loop through all orders and hide/show them based on the selected value
			      const orders = document.querySelectorAll('.orders');
			      
			      orders.forEach(function(order) {
			    	  
			        const orderStatus = order.querySelector('#order_status').textContent.replace("Order Status :","").trim();
			        
			        const caterStatus = order.querySelector('#order_status').textContent.replace("Cater Approval :","").trim();
			        
			        if (selectedValue === orderStatus) {
			          order.style.display = "block";
			        }else if (selectedValue === caterStatus){
			        	order.style.display = "block";
			        }else if (selectedValue === "All"){
			        	order.style.display = "block";
			        }else {
			        	console.log("coming catering orders");
			          order.style.display = "none";
			        }
			      });
			    });
			  });
		});
		
	</script>






</body>
</html>