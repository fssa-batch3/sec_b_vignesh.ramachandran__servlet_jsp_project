<%@page import="in.fssa.srcatering.service.UserService"%>
<%@page import="in.fssa.srcatering.service.CartService"%>
<%@page import="in.fssa.srcatering.service.MenuService"%>
<%@page import="in.fssa.srcatering.model.User"%>
<%@page import="java.util.HashSet"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
HttpSession sessionHeader = request.getSession();
String loggedUser = (String) sessionHeader.getAttribute("loggedUser");

UserService userService1 = new UserService();

int cartCount = 0;

if(loggedUser != null){
	User user = userService1.findByEmail(loggedUser);
	
	CartService cartService1 = new CartService();
	cartCount = cartService1.getCartCountByUserId(user.getId());
}

Set<Menu> menuList1 = new HashSet<>();
MenuService menuService1 = new MenuService();
menuList1 = menuService1.getAllActiveMenus();

%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/header.css">

<header>
	<div class="icon-left">
		<img src="https://iili.io/J93qiue.png" alt="Company Logo" class="logo" />
		<h1>SR</h1>
		<div>
			<p>Catering</p>
		</div>
	</div>

	<ul class="navigation" id="sidenav">

		<li><a href="<%=request.getContextPath()%>/index"
			class="navigation-link">HOME</a></li>
		<li class="dropdown"><span class="navigation-link">MENU</span>
			<div class="dropdown-content">
				<div>
					<%
					for (Menu menu : menuList1) {
					%>
					<a href="<%=request.getContextPath()%>/categories?menuId=<%=menu.getId()%>"><%=menu.getMenuName()%></a>
					<%
					}
					%>
				</div>

			</div></li>
		<li><a href="<%=request.getContextPath()%>/events" class="navigation-link">EVENTS</a></li>
		<li><a href="<%=request.getContextPath()%>/about_us" class="navigation-link">ABOUT US</a></li>
		<li><a href="<%=request.getContextPath()%>/contact_us" class="navigation-link">CONTACT US</a></li>
		
		<% if (loggedUser != null) {%>
			<div class="cartu">
				<li><a href="<%=request.getContextPath()%>/mycart" class="navigation-link">MY CART</a></li> 
				
				<%if(cartCount > 0){ %>
					<span class="cart_qty"><%=cartCount %></span>
				<%} %>
			</div>
		<%} %>
		
	</ul>

	<%
	if (loggedUser == null) {
	%>
	<div class="dropdown_profile">
		<a href="<%=request.getContextPath()%>/user/login">
			<button class="btn login" type="submit" id="login">Login</button>
		</a>
	</div>
	<%
	} else if (loggedUser.equals("vignesh@gmail.com")) {
	%>
	<div class="dropdown_profile">
		<img src="https://iili.io/J93Coqx.png" alt="profile image" />
		<div class="dropdown_profile-content">
			<div>
				<a href="<%=request.getContextPath()%>/user/details">My Profile</a> <a href="">Catering
					Orders</a> <a href="<%=request.getContextPath()%>/admin_forms.jsp">Admin Forms</a>
			</div>
		</div>
	</div>
	<%
	} else if (loggedUser.equals("vignesh@gmail.com") == false) {
	%>
	<div class="dropdown_profile">
		<img src="https://iili.io/J93Coqx.png" alt="profile image" />
		<div class="dropdown_profile-content">
			<div>
				<a href="<%=request.getContextPath()%>/user/details">My Profile</a> 
				<a href="<%=request.getContextPath()%>/orders">MyOrders</a>
			</div>
		</div>
	</div>

	<%
	}
	%>

</header>

