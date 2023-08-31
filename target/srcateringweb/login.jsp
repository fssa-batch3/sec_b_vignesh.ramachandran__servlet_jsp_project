<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<h2 class="name_login">
		<span>Log</span> In
	</h2>

	<%
	String errorMessage = request.getParameter("errorMessage");
	if (errorMessage != null) {
		out.println("<p>" + errorMessage + "</p>");
	}
	%>

	<form action="login" method="post">



		<label for="email">Email ID: </label> <input type="email" name="email"
			required> <label for="password">Password: </label> <input
			type="password" name="password" required>


		<button class="btn_login" type="submit">Log in</button>

		<p>
			New to Website? <a href="add_user.jsp">Create an account</a>
		</p>
	</form>

</body>
</html>