<%@page import="in.fssa.srcatering.service.UserService"%>
<%@page import="in.fssa.srcatering.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 300px;
	margin: auto;
	text-align: center;
}

.title {
	color: grey;
	font-size: 18px;
}

button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
}

a {
	text-decoration: none;
	font-size: 22px;
	color: black;
}

button:hover, a:hover {
	opacity: 0.7;
}
</style>
</head>
<body>

	<% UserService userService = new UserService(); %>

	<% User user = (User)request.getAttribute("userDetails");%>



	<div class="card">
		<img src="https://www.w3schools.com/w3images/team2.jpg" alt="John" style="width: 100%">
		<h1><%= user.getName() %></h1>
		<p class="title"><%= user.getEmail() %></p>
		<p><%=user.getPhoneNumber() %></p>
		
		<p>
			<button>Contact</button>
		</p>
	</div>



</body>
</html>