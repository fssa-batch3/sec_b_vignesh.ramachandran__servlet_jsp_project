<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@page import="in.fssa.srcatering.model.Dish"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        
<title>Dishes</title>
<style>
* {
    padding: 0;
    margin: 0;
    text-decoration: none;

}

:root {
    --bg-color: #ffffff;
    --second-color: #f54300;
    --thickgreen-color: #4b814b;
    --text-color: #130849;
    --other-color: #ebeef7;
    --normal-font: 1rem;
    --p-font: 1.2rem;
    --h2-font: 1.5rem;
    --big-font: 2rem;
    --name-font: 3rem;
    --heading-fontfamily: 'Kurale', serif;
    --parah-fontfamily: 'Josefin Sans', sans-serif;
}

span {
    color: var(--second-color);
}

.ingredient-image {
    background-image: url(https://iili.io/J93Qf0x.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    height: 18.75rem;
    padding: .625rem 0;
}

.ingredient-image h2 {
    color: var(--bg-color);
    font-size: var(--big-font);
    font-family: var(--heading-fontfamily);
    text-align: center;
}

.about img {
    width: 18.75rem;
    height: 18.75rem;
    border-radius: .625rem;
    box-shadow: 0 .5rem 1.25rem black;
}

.content h3 {
    margin: 0 15%;
    font-family: var(--heading-fontfamily);
    font-size: var(--big-font);
    color: var(--text-color);
    text-align: center;
    padding: 1.25rem;
}

.dishes {
    background-image: url(https://iili.io/J93pTXI.jpg);
    background-repeat: no-repeat;
    background-position: center;
    background-size:auto 900px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));
    justify-items: center;
    padding: 1rem;
    gap: 1rem;
}

.dishes li {
    width: 13rem;
    text-align: center;
    display: grid;
    align-items: center;
    padding: .7rem;
    border: transparent;
    font-family: var(--parah-fontfamily);
    font-size: .9rem;
    color: var(--text-color);
    background-color: #f18e70;
    font-weight: bolder;
    border-radius: .625rem;
    /* text-transform: uppercase; */
    box-shadow: .4rem .5rem .8rem rgb(61, 59, 59);
}

.content a {
	padding-top: 1rem;
	display:flex;
	justify-content:center;
}

.content a button{
	padding: 10px 15px;
	color: white;
	background: var(--second-color);
	font-family: var(--parah-fontfamily);
	font-size: var(--p-font);
	border:none;
	border-radius: 12px;	
}

</style>
</head>
<body>

	<%@ include file="/header.jsp"%>
	
	<%Set<Dish> dishList = new HashSet<>(); 
		dishList = (Set<Dish>) request.getAttribute("dishList");
		Menu menu = (Menu) request.getAttribute("menu");
		Category category = (Category) request.getAttribute("category");
	%>
	
	<main>
	
		<div class="ingredient-image">
                <h2><%=menu.getMenuName() %> Menu</h2>
		</div>
		
		 <section class="category">
			<div class="content">
				<h3><span>SR</span>'s <%=category.getCategoryName() %> <%=menu.getMenuName() %></h3>
				<ul class="dishes">
					<%for(Dish dish : dishList){ %>
						<li><%=dish.getDishName() %> - <%=dish.getQuantity() %><%=dish.getQuantityUnit() %> - <%=dish.getDishPrice() %></li>
					<%} %>
					
				</ul>
				<%-- <a href="dish/edit?menuId=<%=menu.getId()%>&categoryId=<%=category.getId()%>">
					<button type="submit">Edit Dish</button>
				</a> --%>
			</div>
		</section>
	
	</main>	
	

</body>
</html>