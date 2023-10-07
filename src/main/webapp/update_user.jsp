<%@page import="in.fssa.srcatering.model.User"%>
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
	href="<%=request.getContextPath()%>/assets/css/profile/profile_page.css">


<title>Update</title>
</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	User user1 = null;
	user1 = (User) request.getAttribute("userDetails");
	%>


	<!-- main starts -->
	<main>
		<!-- profile starts -->
		<section class="profile">

			<div class="form">
				<div class="top">
					<h2 class="heading">
						<span>Edit</span> Profile
					</h2>

				</div>

				<form action="update?userId=<%=user1.getId()%>" method="post"
					class="profile_form">

					<div>
						<label for="name">Name :</label> <input type="text" name="name"
							id="name" value="<%=user1.getName()%>" pattern="^[a-zA-Z\s]+$"
							title="Enter alphabets only" required>
					</div>
					<div>
						<label for="email">Email :</label> <input type="email"
							name="email" id="email" value="<%=user1.getEmail()%>" readonly>
					</div>
					<div>
						<label for="number">Phone Number :</label> <input type="number"
							name="phone_number" id="phone_number"
							value="<%=user1.getPhoneNumber()%>" readonly>
					</div>
					<div>
						<label for="password">Password :</label> <input type="text"
							name="password" id="password"
							value="********"
							readonly>
					</div>

					<!-- <div>
						<label for="address">Address :</label>
						<textarea type="text" name="address" id="address" rows="3"
							cols="27" required="true" readonly></textarea>
					</div> -->


					<div id="div_AddBtn">
						<button type="submit" class="save btn">Save</button>
						<!-- <button class="btn addbtn">Address Book</button> -->
					</div>


				</form>
			</div>
		</section>
		<!-- profile ends -->
	</main>
	
	<!-- main ends -->
	
	
	<script>
	
		const formClass = document.querySelector(".profile_form");
		
		formClass.addEventListener("submit", function(event){
			
			const name = document.getElementById("name").value;
			const password = document.getElementById("password").value;
			
			if(name.trim() == ""){
				alert("Name Cannot be empty");
				event.preventDefault();
			}
			
			if(password.trim() == ""){
				alert("Password Cannot be empty");
				event.preventDefault();
			}
			
			
		});
		
		
		// password pattern recognization
        const password = document.getElementById("password");

        const number_pass = document.querySelector(".number_pass");
        const upper_pass = document.querySelector(".upper_pass");
        const lower_pass = document.querySelector(".lower_pass");
        const symbol_pass = document.querySelector(".symbol_pass");
        const char_pass = document.querySelector(".char_pass");

        password.addEventListener("input", () => {
          const password_value = password.value;

          // check upper case
          const has_upper = /[A-Z]/.test(password_value);
          if (has_upper == true) {
            upper_pass.style.color = "green";
          } else {
            upper_pass.style.color = "var(--second-color)";
          }

          // check lower case
          const has_lower = /[a-z]/.test(password_value);
          if (has_lower == true) {
            lower_pass.style.color = "green";
          } else {
            lower_pass.style.color = "var(--second-color)";
          }

          // check number
          const has_symbol = /[!@#$%^&*_=+-]/.test(password_value);
          if (has_symbol == true) {
            symbol_pass.style.color = "green";
          } else {
            symbol_pass.style.color = "var(--second-color)";
          }

          // check char
          const has_number = /\d/.test(password_value);
          if (has_number == true) {
            number_pass.style.color = "green";
          } else {
            number_pass.style.color = "var(--second-color)";
          }

          // check length
          const char_length = password_value.length == 8;
          if (char_length == true) {
            char_pass.style.color = "green";
          } else {
            char_pass.style.color = "var(--second-color)";
          }
        });
		
	
	</script>


</body>
</html>