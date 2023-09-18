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
	href="<%=request.getContextPath()%>/assets/css/events/event_types.css">

<title><%=request.getAttribute("eventName")%></title>
</head>
<body>

	<%@include file="/header.jsp"%>

	<%
	String eventName = (String) request.getAttribute("eventName");
	%>
	
	<%Set<Menu> menuList = new HashSet<>();
			menuList = (Set<Menu>) request.getAttribute("menuList");%>

	<!-- main starts -->
	<main>

		<%
		if ("birthday".equals(eventName)) {
		%>

		<!-- function content starts -->
		<section class="function">
			<div class="ingredient-image">
				<h2>Birthday Party</h2>
			</div>
			<div class="function_content">
				<img
					src="<%=request.getContextPath()%>/assets/img/Events/birthday-2.jpg"
					alt="birthday function">
				<div class="function_text">
					<h3>Birthday Party is a combination of food and friends</h3>
					<p>Birthdays are always a terrific excuse to throw an event and
						it is a important day in everyone's life. Birthday parties can be
						a wonderful opportunity for relatives and buddies to get in
						concert and celebrate lifespan of a loved one. Our SR Catering
						team will enable you to commemorate this very special event with
						beautiful and tastiest food menus and our sincere work make us the
						best Birthday Party Catering Service Provider in Kumbakonam and
						Tamil Nadu.</p>
				</div>
			</div>
		</section>
		<!-- function content ends -->
		<%
		} else if ("puberty".equals(eventName)) {
		%>
		<!-- function content starts -->
		<section class="function">
			<div class="ingredient-image">
				<h2>Puberty Function</h2>
			</div>
			<div class="function_content">
				<img
					src="<%=request.getContextPath()%>/assets/img/Events/puberty-2.jpg"
					alt="puberty function">
				<div class="function_text">
					<h3>Pull up a chair. Take a taste. Come join us. Life is so
						endlessly delicious</h3>
					<p>There are many aspects to organizing an event as it needs
						attention to detail and perfect coordination that are the key in
						delivering a cost effective event. Yes Kumbakonam Catering Service
						is here to take care of your personal catering service and
						solution. Our team will help you to manage and execute all what
						you have planned and will get touch with you. We are the leading
						caterers in Kumbakonam and Tamil Nadu.</p>
				</div>
			</div>
		</section>
		<!-- function content ends -->

		<%
		} else if ("engagement".equals(eventName)) {
		%>

		<!-- function content starts -->
		<section class="function">
			<div class="ingredient-image">
				<h2>Engagement</h2>
			</div>
			<div class="function_content">
				<img src="<%=request.getContextPath()%>/assets/img/Events/engagement-2.jpg"
					alt="engagement">
				<div class="function_text">
					<h3>Function is a combination of food and friends</h3>
					<p>Betrothal or Engagement Event is a beginning function of a
						grand wedding marriage. Going Gourmet offers a variety of options
						to target your function. We are quality conscious and only genuine
						provisions will be used. Our style includes finger food, buffets,
						platters, and many other menu selections can all be tailored to
						your needs, ensuring we make your special day all that you've
						always dreamed it to be. We are the best caterers in Kumbakonam.</p>
				</div>
			</div>
		</section>
		<!-- function content ends -->

		<%
		} else if ("marriage".equals(eventName)) {
		%>

		<!-- function content starts -->
		<section class="function">
			<div class="ingredient-image">
				<h2>Marriage</h2>
			</div>
			<div class="function_content">
				<img src="<%=request.getContextPath()%>/assets/img/Events/marriage-2.jpg" alt="marriage">
				<div class="function_text">
					<h3>Function is a combination of food and friends</h3>
					<p>Kumbakonam Catering Service can be a complete wedding
						catering service and solution provider in Kumbakonam. On the
						wedding day, our experienced operations caterers will be taking
						charge to make sure that your event runs smoothly and guests
						experiences a great gathering. We organize delicious and tempting
						food for all wedding ceremonies; from wedding to receptions. We
						make this one of a kind event cherished for the years into the
						future. We are the best wedding caterers in Kumbakonam.</p>
				</div>
			</div>
		</section>
		<!-- function content ends -->

		<%
		} else if ("housewarming".equals(eventName)) {
		%>

		<!-- function content starts -->
		<section class="function">
			<div class="ingredient-image">
				<h2>HouseWarming Function</h2>
			</div>
			<div class="function_content">
				<img src="<%=request.getContextPath()%>/assets/img/Events/house warming-2.jpg"
					alt="housewarming function">
				<div class="function_text">
					<h3>Pull up a chair. Take a taste. Come join us. Life is so
						endlessly delicious</h3>
					<p>As we know house warming parties are spent with you closed
						one or with dear friends , so keeping the nostalgic tone we have
						been accepting a challenging prospect from wide range of customers
						and to our surprise we have passed the challenge with flying
						colours. Kumbakonam Catering Service allows clients to choose the
						best and tastes catering menu.</p>
				</div>
			</div>
		</section>
		<!-- function content ends -->



		<%
		} else if ("valaikappu".equals(eventName)) {
		%>

		<!-- function content starts -->
		<section class="function">
			<div class="ingredient-image">
				<h2>Valaikappu Function</h2>
			</div>
			<div class="function_content">
				<img src="<%=request.getContextPath()%>/assets/img/Events/valaikappu-2.jpg"
					alt="valaikappu function">
				<div class="function_text">
					<h3>There is no love sincerer than the love of food</h3>
					<p>Valaikappu Function or Baby Shower is a grand ceremony
						celebrated in South India. It is a typical celebration held by the
						Hindu, Muslim and Christian women in Tamil Nadu. It is an
						auspicious occasion celebrated to bless a pregnant woman,
						celebrate her fertility, and ensure a safe birth to baby.
						Generally, it is an event hosted by the pregnant woman's mother
						and fathers the third trimester of the pregnancy. Feed your guests
						with varieties of foods made by Kumbakonam Catering.</p>
				</div>
			</div>
		</section>
		<!-- function content ends -->

		<%
		} else if ("privateparty".equals(eventName)) {
		%>

		<!-- function content starts -->
		<section class="function">
			<div class="ingredient-image">
				<h2>Private Party</h2>
			</div>
			<div class="function_content">
				<img src="<%=request.getContextPath()%>/assets/img/Events/private party-2.jpg"
					alt="private party">
				<div class="function_text">
					<h3>Good Food Good Friends Good Times</h3>
					<p>Reward your staff and reflect the high standards of your
						company through the use of Party Wizard's delicious industria &
						corporate catering service in Kumbakonam. The quality of the food
						and beverages offered through our catering is incomparable, and we
						are dedicated to always ensuring your needs are adequately met.
						When you discuss your office catering options with one of our
						experienced team members, we'll work with you to help you decide
						the right package for your preferences and requirements.</p>
				</div>
			</div>
		</section>
		<!-- function content ends -->

		<%
		}
		%>


		<!-- menu lists starts -->

		<section class="bdy_menu">
			<div class="bdy_menu-content">
				<%for (Menu menu: menuList) {%>
					<div class="dropdown_menu">
						<a href="<%=request.getContextPath()%>/categories?menuId=<%=menu.getId()%>">
							<img src="<%= menu.getImage() %>" alt="<%= menu.getMenuName() %> menu">
							<h2><span><%= menu.getMenuName() %></span></h2>
						</a>
					</div>
				<%} %>
			
			</div>
		</section>

		<!-- menu lists ends -->
	</main>
	<!-- main ends -->


</body>
</html>