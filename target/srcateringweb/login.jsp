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
	
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/profile/login.css">
<title>Login</title>

</head>
<body>

	<%@ include file="/header.jsp"%>

	<!-- main starts -->
	<main>
		<!-- login form starts -->
		<section>
			<form class="login_page" action="login" method="post">
				<img src="https://iili.io/J93qiue.png" alt="company logo">
				<h2 class="name_login">
					<span>Log</span> In
				</h2>

				<label>Email ID: </label> <input type="email" name="email"
					for="email" placeholder="Enter your email" class="input_box"
					id="email"
					pattern="^([a-z]+[a-z0-9_+\-\. ]*[a-z0-9]+)@(gmail|fssa|yahoo|hotmail|outlook)\.(freshworks.com|com|net|org|edu|in)$"
					required> <label>Password: </label> <input type="password"
					name="password" placeholder="Enter your password" class="input_box"
					id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Must contain at least one number, one uppercase, lowercase and one symbol, and must have 8 characters"
					required="true">
				<div id="pattern">
					<span class="number_pass">Must contain at least one number,</span>
					<span class="upper_pass">one uppercase,</span> <span
						class="lower_pass">one lowercase,</span> <span class="symbol_pass">one
						symbol,</span> <span class="char_pass">and must have 8 characters</span>
				</div>
				<div class="visible_pass">
					<input type="checkbox" id="show"> <label>Show
						password</label>
				</div>

				<div class="for_button">
					<button class="btn_login" type="submit">Log in</button>
				</div>
				<p>
					New to Website? <a href="new">Create an account</a>
				</p>
			</form>
		</section>
		<!-- login form ends -->
	</main>

	<%-- Check for the presence of the errorMessage attribute --%>
	<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	if (errorMessage != null) {
	%>
	<script type="text/javascript">
    	alert('<%=errorMessage%>');
	</script>
	<%
	}
	%>
	<!-- Your login page content here -->


	<script type="text/javascript">
     // show password
        const Password = document.querySelector("#password");
        const Checkbox = document.querySelector("#show");

        Checkbox.addEventListener("click", () => {
          const type =
            Password.getAttribute("type") === "password" ? "text" : "password";
          Password.setAttribute("type", type);
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