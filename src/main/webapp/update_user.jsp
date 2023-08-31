<%@page import="in.fssa.srcatering.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update</title>
</head>
<body>


	<%
	User user = null;
	user = (User) request.getAttribute("userDetails");
	%>

	<form action="update?userId=<%=user.getId()%>" method="post">
	
		<label for="name">Name:</label> 
		<input type="text" value="<%=user.getName() %>" name="name" required> 
		
		<br>
		
		<label for="email">Email ID:</label> 
		<input type="email" value="<%=user.getEmail() %>" name="email" readonly> 
		
		<br>
		
		<label for="phone_number">Phone Number:</label> 
		<input type="text" value="<%=user.getPhoneNumber() %>" name="phone_number" readonly> 
		
		<br>
		
		<label>Password:</label> 
		<input type="password" value="<%=user.getPassword() %>" name="password" required> 
		
		<br>
		
		<button type="submit">Save</button>
		
	</form>

</body>
</html>