<!DOCTYPE html>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="java.util.Set"%>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/style.css">

<title>index</title>

</head>
<body>
	<%@ include file="/header.jsp"%>

	<%
	Set<Menu> menuList = (Set<Menu>) request.getAttribute("menuList");
	%>

	<main>

		<div class="image_slider">
			<div class="slide_image">
				<img
					src="https://b.zmtcdn.com/data/dish_photos/015/227d8c2ff600f91503cf49108b7d9015.jpg"
					alt="">
			</div>
			<div class="slide_image">
				<img
					src="https://b.zmtcdn.com/data/dish_photos/eb9/160aa67bad2b96a5c7b681358758feb9.jpg"
					alt="">
			</div>
			<div class="slide_image">
				<img
					src="https://b.zmtcdn.com/data/dish_photos/a97/02e417992eadc71ba9650b10fc4d9a97.jpg"
					alt="">
			</div>
			<div class="slide_image">
				<img
					src="https://b.zmtcdn.com/data/dish_photos/717/2ba31dcfdb0db5aca8083b7f8662c717.jpg"
					alt="">
			</div>
			<div class="slide_image">
				<img
					src="https://b.zmtcdn.com/data/dish_photos/6b7/1c5a969c81cb08db73a4d7f28e3526b7.jpg"
					alt="">
			</div>
			<!-- Next and previous buttons -->
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
				onclick="plusSlides(1)">&#10095;</a>
		</div>

		<!-- The dots/circles -->
		<div class="spin_roller">
			<div style="text-align: center">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span> <span class="dot"
					onclick="currentSlide(4)"></span> <span class="dot"
					onclick="currentSlide(5)"></span>
			</div>
		</div>



		<section class="allmenu-list">
			<div class="name">
				<h1>
					<span>SR</span> Catering
				</h1>
			</div>

			<div class="mainmenu-list">
				<%
				for (Menu menu : menuList) {
				%>
				<div class="lists">
					<img src="<%=menu.getImage()%>" alt="<%=menu.getMenuName()%>">
					<div class="lists-text">
						<h2>
							<span><%=menu.getMenuName()%></span> Menu
						</h2>
						<p><%=menu.getDescription()%></p>
						<a href="categories?menuId=<%=menu.getId()%>">View Category</a>
						<%-- <a href="menu/edit?menuId=<%=menu.getId()%>">Update</a> --%>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</section>









		<!-- Why choose us starts -->

		<section class="why-choose-us">
			<div class="why-choose-us-text">
				<h2>
					<span>WHY</span> CHOOSE US
				</h2>
				<p>We are a divine brand that specializes in providing
					specialized Food Catering services. Our foods are well-prepared.
					Customers praise the taste, nutritional value, and affordability of
					the food.</p>
			</div>
			<div class="why-we">
				<div class="why-we-option">
					<img src="./assets/img/why choose us icon.png" alt="spoon icon">
					<div class="why-we-option-text">
						<h3>Quality Food Items</h3>
						<p>We provide food with good nutrition and its original
							quality and flavour.</p>
					</div>
				</div>

				<div class="why-we-option">
					<img src="./assets/img/why choose us icon.png" alt="spoon icon">
					<div class="why-we-option-text">
						<h3>Professional Chefs</h3>
						<p>Food items are the most important aspect of any occasion or
							gathering, and you can have tasty food just by hiring a
							professional chef.</p>
					</div>
				</div>

				<div class="why-we-option">
					<img src="./assets/img/why choose us icon.png" alt="spoon icon">
					<div class="why-we-option-text">
						<h3>Budget-Friendly</h3>
						<p>A greater part of the food supplier provides cooking
							packages adapted to your budgets.</p>
					</div>
				</div>

				<div class="why-we-option">
					<img src="./assets/img/why choose us icon.png" alt="spoon icon">
					<div class="why-we-option-text">
						<h3>Belief</h3>
						<p>We are dedicated to delivering great catering services to
							our clients.</p>
					</div>
				</div>
				<div class="why-we-option">
					<img src="./assets/img/why choose us icon.png" alt="spoon icon">
					<div class="why-we-option-text">
						<h3>Delivery On Time</h3>
						<p>One of the most important aspects of a Caterer-Customer
							relationship and timely delivery of ordered food.</p>
					</div>
				</div>
				<div class="why-we-option">
					<img src="./assets/img/why choose us icon.png" alt="spoon icon">
					<div class="why-we-option-text">
						<h3>Event Planning</h3>
						<p>Whatever the occasion, our specialized catering team is
							ready to assist you in making your event a success.</p>
					</div>
				</div>
			</div>
		</section>
		<!-- why choose us ends -->

		<!-- why our service starts -->

		<section class="our-service">
			<div class="our-service-content">
				<div class="our-service-text">
					<h2>
						<span>Why</span> Our Catering Service
					</h2>
					<p>We provide all varieties of food to private and corporate
						clients with a range of tasty, stylish, friendly and professional
						catering services. We have a highly skilled team of professionals
						who will be highly intended to offer an orderly service inside the
						scheduled span of your energy. Our catering service provides
						catering for all occasions whether you are organizing a cocktail
						party for a corporate or charity event, a small intimate dinner
						party at home, or a full-scale wedding reception.</p>
				</div>
				<img src="./assets/img/Catering.gif" alt="food image"
					class="our-service-img">
			</div>
		</section>
		<!-- why our service ends -->

		<!-- how it works starts -->

		<section class="how-it-works">
			<h2>
				<span>How</span> It Works
			</h2>
			<div class="how-it-works_content">

				<div class="how-it-works_text">
					<img src="./assets/img/how is works.jpg" alt="online order image">
					<h3>Order your-Food</h3>
					<div class="disappear">
						<p>The best food, the best service, attention to detail, and
							any extra arrangements you have ordered for your special event.</p>
					</div>
				</div>

				<div class="how-it-works_text">
					<img src="./assets/img/food making.jpg" alt="food preparing image">
					<h3>Food-Preparation</h3>
					<div class="disappear">
						<p>We also have skilled chefs on staff who can prepare a
							various varieties based on our customers preferences.</p>
					</div>
				</div>
				<div class="how-it-works_text">
					<img src="./assets/img/food deliver.jpg" alt="food delivery image">
					<h3>Delivery on--time</h3>
					<div class="disappear">
						<p>One of the most important aspects of a Caterer-Customer
							relationship is the timely delivery of ordered food.</p>
					</div>
				</div>
			</div>
		</section>
		<!-- how it works ends -->



	</main>

	<script>
	// animation
	let slideIndex = 0;
	let timeoutID;
	let isTransitioning = false;
	function showSlides(n = 1) {
	  let i;
	  const slides = document.getElementsByClassName("slide_image");
	  const dots = document.getElementsByClassName("dot");
	  slideIndex += n;
	  if (slideIndex > slides.length) {
	    slideIndex = 1;
	  }
	  if (slideIndex < 1) {
	    slideIndex = slides.length;
	  }
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex - 1].style.display = "block";
	  dots[slideIndex - 1].className += " active";
	  isTransitioning = false;
	  timeoutID = setTimeout(showSlides, 2500); // Change slide every 2.5 seconds
	}

	showSlides();

	function plusSlides(n) {
	  if (!isTransitioning) {
	    isTransitioning = true;
	    clearTimeout(timeoutID); // Cancel any scheduled transitions
	    showSlides(n);
	  }
	}

	function minusSlides(n) {
	  if (!isTransitioning) {
	    isTransitioning = true;
	    clearTimeout(timeoutID); // Cancel any scheduled transitions
	    showSlides(n);
	  }
	}

	function currentSlide(n) {
	  if (!isTransitioning) {
	    isTransitioning = true;
	    clearTimeout(timeoutID); // Cancel any scheduled transitions
	    showSlides(n - slideIndex);
	  }
	}
	</script>


</body>
</html>
