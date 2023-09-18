<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
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
	
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/admin/menu_remove.css">
<title>Menu Update</title>

</head>
<body>

	<%@include file="/header.jsp" %>

	<%
	Set<Menu> menuList = new TreeSet<>();
	menuList = (Set<Menu>) request.getAttribute("menuList");
	%>
	
	<%
	Menu menu = null;
	menu = (Menu) request.getAttribute("menuDetails");
	%>


	<main>
		<section>
			<%
			if (menuList != null) {
			%>
			<form class="remove_form" id="change" action="edit?menuId=<%=request.getParameter("menuId")%>">

				<h2>UPDATE-MENU</h2>
				<div class="select_menu">
					<h3>Select Menu</h3>
					<select name="menuId" id="menuName" class="menulist">
						<option value="">Select</option>
						<%
						for (Menu menu1 : menuList) {
						%>
						<option value="<%=menu1.getId()%>"><%=menu1.getMenuName()%></option>
						<%
						}
						%>

					</select>
					<button class="btn show" type="submit">Show Details</button>
				</div>

			</form>
			<%
			} else {
			%>

			<form class="remove_form" action="update?menuId=<%=menu.getId()%>" method="post">
			
				<h2>UPDATE-MENU</h2>
				<div class="select_menu">
					<h3>Select Menu</h3>
					<select name="menuId" id="menuName" class="menulist">
						<option value="<%=menu.getId()%>"><%=menu.getMenuName()%></option>
					</select>
				</div>
				
			
				<div class="menu_details">
					<input type="text" name="menu_name" class="menu_name" id="menuNameGet"
						pattern="^[a-zA-Z\s]+$" title="Enter alphabets only" value="<%=menu.getMenuName()%>"
						readonly> 
					<input type="url" name="menu_image" class="menu_image" value="<%=menu.getImage()%>"
						id="menuImageGet" pattern="https?://.+"
						title="It should be URL.eg:http, https" required> 
					<input value="<%=menu.getDescription()%>"
						type="text" name="description" name="description" class="menu_description" id="menuAboutGet"
						pattern="^(?!\s)[a-zA-Z\s\W]+$" required>
				</div>

				<button class="btn save" type="submit" >Save</button>
			</form>
			<%
			}
			%>
		</section>

	</main>


</body>
</html>