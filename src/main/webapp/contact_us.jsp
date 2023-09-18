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
	href="<%=request.getContextPath()%>/assets/css/contact_us.css">

<title>Contact Us</title>
</head>
<body>

	<%@include file="/header.jsp"%>


	<main>
		<div class="ingredient-image">
			<h2>Contact Us</h2>
		</div>
		<!-- contact us starts -->
		<section class="contact-us">
			<div class="contact-us_content">

				<img
					src="<%=request.getContextPath()%>/assets/img/Contact us/food.jpg"
					alt="breakfast image">

				<div class="contact-us_info">
					<h2>Contact Info</h2>
					<div class="dummy">
						<h3>ADDRESS</h3>
						<p>No.108, Mahamahamtank Main Road, Kumbakonam - 612001.</p>
					</div>
					<div class="dummy">
						<h3>PHONE</h3>
						<p>6379370482</p>
						<p>8608664596</p>
					</div>
					<div class="dummy">
						<a href="">
							<p>info.srcatering@gmail.com</p>
						</a>
					</div>
				</div>

				<div class="contact-us_message">
					<h2>Write a Message/Enquiry</h2>
					<form class="contact-us_form" id="form_id">
						<div>
							<input type="text" placeholder="Name" id="name"
								pattern="^[a-zA-Z\s]+$" title="Enter alphabets only"
								required="true"> <input type="text" placeholder="Mobile"
								id="phone_number" title="Enter 10 number only" required="true">
							<div class="error"></div>
						</div>
						<div>
							<input type="email" placeholder="Email" id="email"
								pattern="^([a-z]+[a-z0-9_+\-\. ]*[a-z0-9]+)@(gmail|fssa|yahoo|hotmail|outlook)\.(freshworks.com|com|net|org|edu|in)$"
								required="true"> <input type="text" placeholder="City"
								id="city" pattern="^[a-zA-Z\s]+$" title="Enter alphabets only"
								required="true">
						</div>
						<textarea type="text" placeholder="Message" id="message"
							required="true"></textarea>
						<button type="submit">SEND MESSAGE</button>
					</form>
				</div>

			</div>
		</section>
		<!-- contact us ends -->
	</main>



</body>
</html>