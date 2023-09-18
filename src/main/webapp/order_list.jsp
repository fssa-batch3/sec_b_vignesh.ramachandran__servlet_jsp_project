<%@page import="java.util.Map"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="in.fssa.srcatering.service.DishPriceService"%>
<%@page import="in.fssa.srcatering.model.OrderStatus"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@page import="in.fssa.srcatering.service.CategoryService"%>
<%@page import="in.fssa.srcatering.model.OrderProduct"%>
<%@page import="in.fssa.srcatering.service.OrderProductService"%>
<%@page import="in.fssa.srcatering.model.Order"%>
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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/normalize.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/my_orders.css">
<title>My Orders</title>
</head>
<body>

	<%@include file="/header.jsp"%>

	<%
	String userEmail = (String) request.getAttribute("loggedUser");
	List<Order> orderList = new ArrayList<>();
	orderList = (List<Order>) request.getAttribute("orderList");

	OrderProductService orderProductService = new OrderProductService();
	
	Menu menu = null;
	Category category = null;
	%>


	<%
	for (Order order : orderList) {
	%>

	<div class="orders">

		<div class="my_orders_list">
		
			<div class="order_info">
				<p class="order_id">
					Order ID :
					<%=order.getId()%>
				</p>
				<%
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy hh:mm:ss a");
					String formattedDateTime = order.getOrderDate().format(formatter);
			    %>
				<p>
					Order Date :
					<%=formattedDateTime %>
				</p>
			</div>


			<%
			
			Set<Map.Entry<Integer, Integer>> menuIdCategoryIdMap = orderProductService.getOrderedMenuIdAndCategoryIdByOrderId(order.getId());

			Set<OrderProduct> orderProductList = new HashSet<>();

			for (Map.Entry<Integer, Integer> entry : menuIdCategoryIdMap) {
				
			    int menuId = entry.getKey();
			    int categoryId = entry.getValue();

			    // Call your orderProductService method to get the relevant data
			   OrderProduct orderProduct = orderProductService.getOrderProductByOrderIdAndMenuIdAndCategoryId(order.getId(), menuId, categoryId);

			   orderProductList.add(orderProduct);
			}
			
			/* Set<OrderProduct> orderProductList = new HashSet<>();
			orderProductList = orderProductService.getAllOrderProductsByOrderId(order.getId()); */
			%>	

			<%
			for (OrderProduct orderProducts : orderProductList) {

				menu = new MenuService().findByMenuId(orderProducts.getMenuId());
				category = new CategoryService().getCategoryByMenuIdAndCategoryId(orderProducts.getMenuId(),orderProducts.getCategoryId());
				
				List<Integer> priceIds = new ArrayList<>();
			%>

				<div class="order_menu">
	
					<p><%=category.getCategoryName()%> <%=menu.getMenuName()%></p>
	
					<%
					if (orderProducts.getOrderStatus() == OrderStatus.NOT_DELIVERED) {
					%>
					<span class="ordMenSta" style="color: var(--text-color);"> (<%=orderProducts.getOrderStatus()%>)
					</span>
					<%
					}
					%>
	
					<%
					if (orderProducts.getOrderStatus() == OrderStatus.DELIVERED) {
					%>
					<span class="ordMenSta" style="color: var(--thickgreen-color);">
						<%=orderProducts.getOrderStatus()%>
					</span>
					<%
					}
					%>
	
					<%
					if (orderProducts.getOrderStatus() == OrderStatus.CANCELLED) {
					%>
					<span class="ordMenSta" style="color: var(--second-color);">
						<%=orderProducts.getOrderStatus()%>
					</span>
					<%
					}
					%>
					
					<%
					for (Integer priceId : orderProducts.getDishIdPriceIdMap().values()) {
						priceIds.add(priceId);
					}
					System.out.println(orderProducts);
					%>
					
					<%int sum = 0;
					sum = new DishPriceService().getTotalPriceByPriceId(priceIds); 
						int noOfGuest = orderProducts.getNoOfGuest();%>
					
					<p><%=sum * noOfGuest %></p>
	
				</div>
			<%
			}
			%>
			
			

			<div class="order_price">
				<h2>Total Price : </h2>
				<p><%=order.getTotalCost()%></p>
				
			</div>
			
			<p class="order_by">Ordered By : <%=userEmail %></p>
			<form action="<%=request.getContextPath() %>/order/details" method="get">

				<%
					List<Integer> menuIds = new ArrayList<>();
					List<Integer> categoryIds = new ArrayList<>();
					
					for (OrderProduct orderProducts : orderProductList) { 
						menuIds.add(orderProducts.getMenuId());
						categoryIds.add(orderProducts.getCategoryId());
					} %>
				
				<input type="hidden" name="orderId" value="<%=order.getId()%>">
				<input type="hidden" name="menuIds" value="<%=menuIds%>">
				<input type="hidden" name="categoryIds" value="<%=categoryIds%>">
				<button type="submit" class="btnView">View Details</button>
				
			</form>
			
		</div>

	</div>

	<%
	}
	%>


	<script>
		
		document.addEventListener("DOMContentLoaded", function() {
			// Check if the 'no_of_guest' item exists in localStorage
			if (localStorage.getItem("no_of_guest") !== null) {
				// Remove the 'no_of_guest' item from localStorage
				localStorage.removeItem("no_of_guest");
				
			}
		});
	</script>

</body>
</html>