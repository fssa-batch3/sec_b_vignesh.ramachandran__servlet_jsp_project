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
        
<title>Categories</title>
<style type="text/css">
* {
    padding: 0;
    margin: 0;
    text-decoration: none;
}
:root {
    --bg-color: #ffffff;
    --second-color: #f54300;
    --thickgreen-color:#4b814b;
    --text-color:#130849;
    --other-color:#ebeef7;
    --p-font:1.2rem;
    --h2-font:1.5rem;
    --big-font:2rem;  
    --name-font:3rem;
    --heading-fontfamily:'Kurale', serif;
    --parah-fontfamily:'Josefin Sans', sans-serif;
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

.menu-list_types {
    padding: 5rem 5rem;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
    gap: 2rem;
    align-items: center;
    justify-items: center;
}
.menu-list_1 {
    padding: 3.125rem 0;
}
.menu-list_1:hover {
    transform: scale(1.1);
    border-radius: 20px;
}
.dish {
    width: 18.75rem;
    height: 18.75rem;
    border-radius: .625rem;
    box-shadow: 0 .5rem 1.25rem black;
}
.menu-list_1 div {
    padding-top: 2rem;
    text-align: center;
}
.menu-list_1 div h2 {
    font-size: var(--big-font);
    font-family: var(--heading-fontfamily);
    color: var(--second-color);
    padding-bottom: 1rem;
}
.menu-list_1 div p {
    font-family: var(--parah-fontfamily);
    font-size: var(--h2-font);
    padding-bottom: 1rem;
}


.view-button {
    padding: .625rem 1.25rem;
    background-color: var(--text-color);
    color: var(--bg-color);
    font-size: var(--p-font);
    font-family: var(--parah-fontfamily);
    border-radius: 1.25rem;
    transition-timing-function: .2s;
    font-weight: bold;
}
.view-button:hover {
    background-color: var(--second-color);
    color: var(--bg-color);
    border: transparent;
}


footer {
    background-color: var(--other-color);
}
.footer-box {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));
    justify-items: center;
    gap: 2rem;
    padding:2rem 0;
    margin: 0 2rem;
    border-bottom: 2px solid var(--text-color);
}  
.footer-content {
    padding: 1rem;
}
.footer-content img {
    width: 12.5rem;
}
.footer-content p {
    font-size: var(--p-font);
    line-height: 1.875rem;
    color: var(--text-color);
    margin-left: 1.25rem;
    font-family: var(--parah-fontfamily);
    
}
.footer-content h3 {
    font-size: var(--h2-font);
    color: var(--text-color);
    padding: 1.25rem 0 0 .625rem;
    font-family: var(--heading-fontfamily);
    
}
.footer-content ul {
    line-height: 3.125rem;
    font-size: var(--p-font);
    padding-left: 1.25rem;
}
.footer-navigation{
    color: var(--text-color);
    font-family: var(--parah-fontfamily);
    font-weight: bold; 
}

.footer-navigation:hover {
    color: var(--second-color);
    transition: .2s;
    border-bottom: 1px dashed var(--text-color);
}
.footer-details {
    height: 16%;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    padding:1.25rem 3.125rem;
    font-size: var(--p-font);
}
.footer-links {
    padding: 1rem;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    width: 12.5rem;
}
.footer-links a {
    padding: .5rem;
}
.footer-details p {
    padding: 1rem;
    font-size: var(--p-font);
    font-family: var(--parah-fontfamily);
}
.footer-links a img {
    width: 3.125rem;
}

@media screen and (max-width:800px) {
    html {
        font-size: 12px;
    }
    .footer-details {
        flex-direction: column;
    }
}
@media screen and (max-width:460px){
    html {
        font-size: 10px;
    }
}

 </style>
</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	Set<Category> categoryList = new TreeSet<>();
	Menu menu = (Menu) request.getAttribute("menu");
	categoryList = (Set<Category>) request.getAttribute("categoryList");
	%>
	
		

	<main>
		
		<div class="ingredient-image">
                <h2><%=menu.getMenuName() %> Menu</h2>
        </div>
        <section class="menu-list">
			<div class="menu-list_types">
				<%for (Category category : categoryList) {%>
				<div class="menu-list_1">
					<img class="dish" src="<%=category.getImage() %>" alt="<%=category.getCategoryName()%>" />
					<div>
		                <h2><%=category.getCategoryName() %></h2>
		                <!-- <p>Rs.150/plate</p> -->
		                <a href="category/edit?menuId=<%=category.getMenu_id()%>&categoryId=<%=category.getId()%>">
							<button class="view-button" type="submit">Update</button>
						</a>
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