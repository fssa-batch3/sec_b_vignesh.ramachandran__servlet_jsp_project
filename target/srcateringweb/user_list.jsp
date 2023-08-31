<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="in.fssa.srcatering.service.MenuService"%>
<%@page import="in.fssa.srcatering.model.User"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.srcatering.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>
</head>
<body>

<h1>List of Users</h1>

<% UserService userService = new UserService(); %>
<% List<User> userList = userService.getAllUsers(); %>

<table border="1">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Password</th>
    </tr>
    <% for(User user: userList){ %>
        <tr>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPhoneNumber() %></td>
            <td><%= user.getPassword() %></td>
        </tr>
    <% } %>
</table>

<% MenuService menuService = new MenuService();%>
<% List<Menu> menuList = menuService.getAllMenus(); %>




    <% for(Menu menu: menuList){ %>
        <h2><%= menu.getMenuName() %></h2>
        <img alt="" src="<%= menu.getImage()%>">
        
    <% } %>


</body>
</html>
