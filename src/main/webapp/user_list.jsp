
<%@page import="java.util.ArrayList"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="in.fssa.srcatering.service.MenuService"%>
<%@page import="in.fssa.srcatering.model.User"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.srcatering.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UserList</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

h1 {
	color: red;
	text-align: center;
	margin-top: 20px;
}

table {
	border-collapse: collapse;
	width: 80%;
	margin: 20px auto;
	background-color: #ffffff;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 10px;
	text-align: center;
}

th {
	background-color: #f0f0f0;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #e0e0e0;
}

.view {
	background-color: green;
}

.delete {
	background-color: red;
}

.update {
	background-color: yellow;
}
</style>
</head>
<body>

	<h1>List of Users</h1>
	
	<%List<User> userList = new ArrayList<User>();
	userList = (List<User>) request.getAttribute("userList"); 
	%>


	
	<table border="1">
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Phone Number</th>
			<th>Password</th>
			<th>View</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<%
		for (User user1 : userList) {
		%>
		<tr>
			<td><%=user1.getName()%></td>
			<td><%=user1.getEmail()%></td>
			<td><%=user1.getPhoneNumber()%></td>
			<td><%=user1.getPassword()%></td>
			<td>
				<a href="users/details?userId=<%= user1.getId()%>">
					<button class="view" type="submit">View</button>
				</a>
				
			</td>
			<td>
				<a href="user/edit?userId=<%= user1.getId()%>">
					<button class="update" type="submit">Update</button>
				</a>
			</td>
			<td>
				<a href="user/delete?userId=<%= user1.getId()%>">
					<button class="delete" type="submit">Delete</button>
				</a>
			</td>
		</tr>
		<%
		}
		%>
	</table>



</body>
</html>
