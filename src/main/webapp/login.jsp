<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
	span{
		color:red;
	}
</style>
</head>
<body>
	<h2 class="name_login">
		Log In
	</h2>

	<%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<span>" + errorMessage + "</span>");
	}
	%>

	<form action="login" method="post">



		<label for="email">Email ID: </label> 
		<input type="email" name="email"
			required> 
		<label for="password">Password: </label> 
		<input
			type="password" name="password" required>


		<button class="btn_login" type="submit">Log in</button>

		<p>
			New to Website? <a href="user/new">Create an account</a>
		</p>
	</form>

</body>
</html>