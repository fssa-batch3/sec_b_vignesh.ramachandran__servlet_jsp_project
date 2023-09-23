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
	
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/about_us.css">

<title>About Us</title>
</head>
<body>

	<%@include file="/header.jsp"%>


	<main>
		<!-- about us starts -->
		<section class="about-catering">
			<div class="ingredient-image">
				<h2>About Us</h2>
			</div>
			<div class="about-catering_content">
				<div class="about-catering_text">
					<h2>Catering service / Competative Cateres</h2>
					<p>As a catering service provider, we have many years of
						experience; we make best arrangement to ease our customers and
						their guests. SR Catering Service provides all kind of catering
						services for events at a lower cost with the assurance of best
						quality than other caterers and catering services.</p>
				</div>
				<img src="<%=request.getContextPath()%>/assets/img/About us/desert.jpg"
					alt="desert-food image">
			</div>
			<div class="about-catering_underpara">
				<p>SR Catering Service is a Caterers; Specialized in Catering
					Services includes Engagement, Marriage & Wedding Catering Services,
					all kind of Party and Corporate Events in Kumbakonam.</p>
			</div>
		</section>

		<section class="about-us">
			<div class="about-us_heading">
				<h2>
					About <span>SR Catering</span>
				</h2>
			</div>
			<div class="about-us_qualities">
				<div class="qualities_us">
					<img src="<%=request.getContextPath()%>/assets/img/About us/emoji.png" alt="imoji-icon">
					<h3>Who We Are ?</h3>
					<p>With years of experience, the changing tastes options to
						provide a delicious and exciting selection of catering packages to
						our clients.</p>
				</div>
				<div class="qualities_us">
					<img src="<%=request.getContextPath()%>/assets/img/About us/pin.png" alt="imoji-icon">
					<h3>What We Do ?</h3>
					<p>We provide food for events in several ways like (traditional
						banana leaf) sit down and buffet as you wish the food to be
						served.</p>
				</div>
				<div class="qualities_us">
					<img src="<%=request.getContextPath()%>/assets/img/About us/target.png" alt="imoji-icon">
					<h3>Our Mission</h3>
					<p>To provide all kind of catering services for personal &
						corporate events at a lower cost with the assurance of best
						quality and prompt service.</p>
				</div>
				<div class="qualities_us">
					<img src="<%=request.getContextPath()%>/assets/img/About us/bulb.png" alt="imoji-icon">
					<h3>Our Vision</h3>
					<p>To become a NO 1 catering service provider in Kumbakonam, by
						means of professionalism and reliability in catering service.</p>
				</div>
			</div>
		</section>
		<!-- about us ends -->
	</main>
	
	<%@include file="/footer.jsp" %>

</body>
</html>