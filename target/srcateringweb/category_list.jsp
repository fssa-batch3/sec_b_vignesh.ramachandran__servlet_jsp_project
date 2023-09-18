<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="java.util.TreeSet"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&
    family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&family=Kurale&display=swap"
            rel="stylesheet">

        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/menu/category.css">
        
<title>Categories</title>

</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	Set<Category> categoryList = new TreeSet<>();
	Menu menu = (Menu) request.getAttribute("menu");
	categoryList = (Set<Category>) request.getAttribute("categoryList");
	List<Integer> categoryPrice = (List<Integer>) request.getAttribute("categoryPrice");
	%>
	
		

	<main>
		
		<div class="ingredient-image">
                <h2><%=menu.getMenuName() %> Menu</h2>
        </div>
        <section class="menu-list">
			<div class="menu-list_types">
			
				<%-- <%for (Category category : categoryList) {%> --%>
				
				<% List<Category> categoryListAsList = new ArrayList<>(categoryList);
				for (int i = 0; i < categoryListAsList.size(); i++) {
                Category category = categoryListAsList.get(i);
                int price = categoryPrice.get(i);%>
                
				<div class="menu-list_1">
					<img class="dish" src="<%=category.getImage() %>" alt="<%=category.getCategoryName()%>" />
					<div>
		                <h2><%=category.getCategoryName() %></h2>
		               <p>Rs.<%=price %>/plate</p> 
		                <%-- <a href="category/edit?menuId=<%=category.getMenu_id()%>&categoryId=<%=category.getId()%>">
							<button class="view-button" type="submit">Update</button>
						</a> --%>
		                <a href="dishes?menuId=<%=menu.getId()%>&categoryId=<%=category.getId()%>">
		                	<button class="view-button">View</button>
		                </a>
	                </div>
				</div>
				<%} %>
		    </div>
		</section>
	
	</main>
	
	


</body>
</html>