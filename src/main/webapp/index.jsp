<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
	
<link rel="stylesheet" href="./styles/index.css">

<title>index</title>



</head>
<body>
	<%@ include file="/header.jsp"%>
	
	<%Set<Menu> menuList = (Set<Menu>) request.getAttribute("menuList"); %>  

	<section class="allmenu-list">
		<div class="name">
			<h1>
				<span>SR</span> Catering
			</h1>
		</div>

		<div class="mainmenu-list">
			<%
			for (Menu menu : menuList) {
			%>
			<div class="lists">
				<img src="<%=menu.getImage()%>" alt="<%=menu.getMenuName()%>">
				<div class="lists-text">
					<h2>
						<span><%=menu.getMenuName()%></span> Menu
					</h2>
					<p><%=menu.getDescription()%></p>
					<a href="categories?menuId=<%=menu.getId()%>">View Category</a>
					<%-- <a href="menu/edit?menuId=<%=menu.getId()%>">Update</a> --%>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</section>


</body>
</html>
