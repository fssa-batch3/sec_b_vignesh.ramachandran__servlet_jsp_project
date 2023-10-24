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
	

<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/profile/login.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/notify.css">

<script src="<%=request.getContextPath()%>/assets/JS/notify.js"> </script>

<title>Login</title>

</head>
<body>
	
	<%@ include file="/header.jsp"%>

	<!-- main starts -->
	<main>
	
		
		<!-- login form starts -->
		<section>
			<form class="login_page" id="form" action="login" method="post" >
				<img src="https://iili.io/J93qiue.png" alt="company logo">
				<h2 class="name_login">
					<span>Log</span> In
				</h2>

				<label for="email">Email ID: </label> <input type="email" name="email"
					for="email" placeholder="Enter your email" class="input_box"
					id="email"
					pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
					required> 
				<label for="password">Password: </label> <input type="password"
					name="password" placeholder="Enter your password" class="input_box"
					id="password" required="true">
				
				<div class="visible_pass">
					<input type="checkbox" id="show"> <label>Show
						password</label>
				</div>
				
				

				<div class="for_button">
					<button id="sub" class="btn_login" type="submit">Log in</button>
				</div>
				<p>
					New to Website? <a href="new">Create an account</a>
				</p>
			</form>
		</section>
		<%
				String errorMessage = (String) request.getAttribute("errorMessage");
		
				if (errorMessage != null) {
				%>
					<script>
						Notify.error(
							`<%=errorMessage%>
							`);
					</script>
				<%
				}
				%>
		<!-- login form ends -->
	</main>


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
      
        </script>


</body>
</html>