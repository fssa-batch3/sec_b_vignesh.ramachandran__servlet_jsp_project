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
<title>Login</title>
<style>
* {
	padding: 0;
	margin: 0;
	text-decoration: none;
}

:root {
	--bg-color: #ffffff;
	--second-color: #f54300;
	--thickgreen-color: #4b814b;
	--text-color: #130849;
	--other-color: #ebeef7;
	--p-font: 1.2rem;
	--h2-font: 1.5rem;
	--big-font: 2rem;
	--name-font: 3rem;
	--heading-fontfamily: 'Kurale', serif;
	--parah-fontfamily: 'Josefin Sans', sans-serif;
}

span {
	color: var(--second-color);
}

/* main {
    background-image: url("../../img/main\ food\ image.jpg");
    background-repeat: no-repeat;
    background-size: cover;
} */
section {
	margin: 2% 0;
	display: flex;
	justify-content: center;
}

.name_login {
	text-align: center;
	font-family: var(--heading-fontfamily);
	font-size: var(--big-font);
	color: var(--text-color);
	padding: 2rem 0;
}

.login_page {
	display: grid;
	max-width: 25rem;
	border-radius: 3.125rem;
	padding: 2rem;
	background-color: var(--other-color);
	box-shadow: rgba(0, 0, 0, 0.25) 0px 25px 50px -12px;
}

.login_page img {
	width: 40%;
	margin: auto;
}

.login_page label {
	color: var(--text-color);
	font-family: var(--parah-fontfamily);
	font-size: var(--h2-font);
	padding: 1rem;
}

.input_box {
	border: 1px solid var(--text-color);
	border-radius: 1rem;
	padding: 1rem;
	font-family: var(--parah-fontfamily);
	font-size: 1rem;
}
/* .input_box::placeholder {
    font-family: var(--parah-fontfamily);
    font-size: 1rem;
    color: var(--bg-color);
}
input:focus{
    background-color: var(--text-color);
    color: var(--bg-color);
    font-family: var(--p-font);
    font-size: 1rem;
} */
#pattern {
	padding: .4rem 0;
	text-align: center;
	font-size: .9rem;
	font-weight: bold;
	font-family: var(--parah-fontfamily);
}

.visible_pass {
	padding-top: 2rem;
}

.visible_pass label {
	font-size: var(--p-font);
}

.forget_pass {
	font-family: var(--parah-fontfamily);
	font-size: var(--p-font);
	color: blue;
	padding-bottom: 1rem;
	text-align: center;
}

.forget_pass:hover {
	transition: .2s;
	color: var(--second-color);
}

.for_button {
	padding: 2rem 0;
	text-align: center;
}

.btn_login {
	position: relative;
	padding: .5rem 1rem;
	font-family: var(--parah-fontfamily);
	font-size: var(--p-font);
	border-radius: 1.25rem;
	font-weight: bolder;
	border: 3px ridge #149CEA;
	outline: none;
	background-color: transparent;
	color: var(--text-color);
	transition: 1s;
}

.btn_login::after {
	content: "";
	position: absolute;
	top: -10px;
	left: 4%;
	width: 93%;
	height: 40%;
	background-color: var(--other-color);
	transition: 0.5s;
	transform-origin: center;
}

.btn_login::before {
	content: "";
	transform-origin: center;
	position: absolute;
	top: 80%;
	left: 3%;
	width: 95%;
	height: 40%;
	background-color: var(--other-color);
	transition: 0.5s;
}

.btn_login:hover::before, .btn_login:hover::after {
	transform: scale(0)
}

.btn_login:hover {
	box-shadow: inset 0px 0px 25px #1479EA;
}

.login_page p {
	font-family: var(--parah-fontfamily);
	font-size: var(--p-font);
	color: var(--text-color);
	text-align: center;
}

.login_page p a {
	color: blue;
}

.login_page p a:hover {
	transition: .2s;
	color: var(--second-color);
}

footer {
	background-color: var(--other-color);
}

.footer-details {
	height: 16%;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;
	padding: 1.25rem 3.125rem;
	font-size: var(--p-font);
}

.footer-links {
	padding: 1rem;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	width: 12.5rem;
}

.footer-links a {
	padding: .5rem;
}

.footer-details p {
	padding: 1rem;
	font-size: var(--p-font);
	font-family: var(--parah-fontfamily);
}

.footer-links a img {
	width: 3.125rem;
}

@media screen and (max-width:800px) {
	html {
		font-size: 12px;
	}
	.footer-details {
		flex-direction: column;
	}
}

@media screen and (max-width:460px) {
	html {
		font-size: 10px;
	}
}
</style>
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