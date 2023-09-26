<%@page import="in.fssa.srcatering.model.Review"%>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
	List<Integer> menuIds = (List<Integer>) request.getAttribute("menuIds");
	List<Integer> categoryIds = (List<Integer>) request.getAttribute("categoryIds");
	List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
	
	request.setAttribute("dishList", dishList);
	request.setAttribute("menu", menu);
	request.setAttribute("category", category);
	
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

					<%
					if (loggedUser != null) {
					%>

						<form action="cart/create" method="post">
	
							<input type="hidden" name="menuId" value="<%=menu.getId()%>">
							<input type="hidden" name="categoryId"
								value="<%=category.getId()%>">
							<input type="hidden" name="totalPrice"
								value="<%=totalPrice%>">
								
							
							<%if(menuIds.contains(menu.getId()) && categoryIds.contains(category.getId())){ %>

									<button class="go_to_cart">
										Go to Cart
										<i class='bx bxs-cart' style='color:#0f0f0f'  ></i>
									</button>

							<%} else { %>
							
								<button class="add_to_cart" type="submit">
									Add to Cart
								</button>
							
							<%} %>
							
						</form>
	
						<a
							href="order/create?menuId=<%=menu.getId()%>&categoryId=<%=category.getId()%>">
							<button type="submit" class="buy_now">Buy Now</button>
						</a>
						

					<%
					} else {
					%>

						<button class="add_to_cart" type="submit"
							onclick="showLoginAlert()">
							Add to Cart 
						</button>
	
						<button class="buy_now" onclick="showLoginAlert()">Buy Now</button>
					
					<%
					}
					%>

				</div>
				
				<div class="about">
				
				<%if(menu.getId() == 1){ %>
				
					<div>
					
						<h2>Food brings us all together, nothing bonds us like it</h2>
						<p>Morning Breakfast is the most energetic food in any event or function. It is our pleasure to
                                serve the tasty food and our Ordinary Breakfast
                                Service cost is moderate. Our menu includes traditional breakfast items like Idly, Ghee
                                Pongal, Vada, Poori Masala, Idiyappam, Sambar,
                                Dry Fruit Kesari, Coffee, Coconut Chutney and etc. We also aim to be
                                environmentallyfriendly, recycling or composting our waste, using
                                local suppliers and cleaning our kitchen with professional cleaning products.
                        </p>
					
					</div>
				<%} else if (menu.getId() == 2){ %>
					
					<div>
					
						<h2>There is no love sincerer than the love of food</h2>
						<p>In any function everyone wants meals to be perfect and tasty. We have professional chef to cook variety of 
                                dishes hygienically and tasty. We are quality conscious and only genuine provisions will be used. Our menu includes 
                                variety of lunch menus like Rava Kesari, Boiled Rice, Sambar, Rasam, Moor Kuzhambu, kootu, Poriyal, Pappad, Pickle, 
                                Buttermilk, Medu Vada, Payasam and etc. We provides best lunch catering service and different lunch menu as per clients taste.
                        </p>
					
					</div>
				
				<%} else if (menu.getId() == 3){%>
				
					<div>
					
						<h2>Evening Tea and Snacks is the best refreshment</h2>
						<p>Everyone want a break for few minutes after a long work and evening is the best time to feel relaxed and have a cup of hot drinks & snacks. We also aim 
                                to be environmentally friendly, recycling or composting our waste, using local suppliers and cleaning our kitchen with professional cleaning products. 
                                SR Catering issues different kinds of snacks, cool drinks, beverages and hot drinks and providing service in Kumbakonam and Tamil Nadu.
                        </p>
					
					</div>
				
				<%} else if (menu.getId() == 4){ %>
					
					<div>
					
						<h2>Pull up a chair. Take a taste. Come join us. Life is so endlessly delicious</h2>
						<p>We seek to impress your guests with our flavours and best culinary skills, our professionals can cater to your orders - be it vegetarian buffet, 
                    			non-vegetarian. Our menu includes Mini Idly, Parotta with Chops, Biryani, Sweet, Idiyapam, Bonda, Coffee, Special Chutney, Sambar, Coconut Chutney,
                    			Onion Raitha and etc. Our SR Catering make it as a best budgetary and tastiest dinner menu & a leading budget dinner service provider.
						</p>
					
					</div>
				
				<%} %>
				
				</div>
				
				<%if(reviewList != null){ 
					for(Review review : reviewList){
					
					User user = new UserService().findByUserId(review.getUserId());
				%>
					<div class="rating">
					
						<div class="rev_user">
							<div class="user_pic">
								<img src="<%=request.getContextPath() %>/assets/img/profile.png" alt="profile_image">
								<h2><%=user.getName() %></h2>
							</div>
							<div class="star-widget" id="star-widget-<%= review.getId() %>">
								
								<input type="radio" name="rate" id="rate-1" value="1"> 
								<label for="rate-1" class="fa fa-star"></label>
											
								<input type="radio" name="rate" id="rate-2" value="2"> 
								<label for="rate-2" class="fa fa-star"></label> 
									
								<input type="radio" name="rate" id="rate-3" value="3"> 
								<label for="rate-3" class="fa fa-star"></label> 
											
								<input type="radio" name="rate" id="rate-4" value="4"> 
								<label for="rate-4" class="fa fa-star"></label> 
								 		
								<input type="radio" name="rate" id="rate-5" value="5"> 
								<label for="rate-5" class="fa fa-star"></label> 
							
							</div>
							<p class="revFeedback"><%=review.getFeedback() %></p>
							
							<script>
								var starWidget = document.querySelector("#star-widget-<%= review.getId() %>");
								var star = <%= review.getStar() %>;
								var radioButtons = starWidget.querySelectorAll("input[type='radio']");
								for (var i = 0; i < star; i++) {
									radioButtons[i].checked = true;
								}
								var labels = starWidget.querySelectorAll("label");
								for (var i = 0; i < star; i++) {
									labels[i].style.color = "#fd4";
								}
							</script>						
						</div>
					
					</div>
					<%} %>
				<%} %>
				
				
				
				<%-- <% String errorMessage = (String) request.getAttribute("errorMessage");
				   if (errorMessage != null && !errorMessage.isEmpty()) { %>
				   <div id="error_message" style="color: red;"><%= errorMessage %></div>
				<% } %> --%>
				

			</div>
		</section>
		
		
		<%
			Set<Category> categoryList = new CategoryService().getAllActiveCategoriesByMenuId(menu.getId());
			if(categoryList.size() > 1){ 
		%>
		<section class="related-menu">
			<h2 class="related-menu_heading">Related <span><%=menu.getMenuName() %> Menu </span></h2>
			
			<div class="related-menu_content">
			
			<%
				for(Category categoryRelated : categoryList){
					if(categoryRelated.getId() != category.getId()){
			%>
				<div class="related-menu1">	
					<img src="<%=categoryRelated.getImage()%>">
					<a href="<%=request.getContextPath()%>/dishes?menuId=<%=menu.getId() %>&categoryId=<%=categoryRelated.getId()%>">
						<h2>
							<span><%=categoryRelated.getCategoryName() %></span> <%=menu.getMenuName() %>
						</h2>
					</a>
				
				</div>
				<%} %>
			<%} %>
		<%} %>
			
			</div>
		
		</section>

	</main>
	
	<%@include file="/footer.jsp" %>

	<script>
	
		function showLoginAlert() {
			alert("Please login to add items to your cart.");
		}
		
		/* if(document.getElementById("error_message")){
			let value = document.getElementById("error_message").innerText;
			alert(value);
		}; */
		
		let errorMessage = localStorage.getItem("errorMessage");
		
		if(errorMessage != null){
			alert(errorMessage);
			localStorage.removeItem("errorMessage");
		}
		
		
		const gotoCartBtn = document.querySelector(".go_to_cart");
		
		gotoCartBtn.addEventListener("click", function(event){
			
			event.preventDefault();
			window.location.href="<%=request.getContextPath()%>/mycart";
			
		});

	</script>



</body>
</html>