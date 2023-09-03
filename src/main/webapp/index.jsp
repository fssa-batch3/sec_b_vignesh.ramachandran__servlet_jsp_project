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

<title>index</title>
<style>
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
.image_slider {
    /* max-width: 1400px; */
    position: relative;
    display: flex;
    justify-content: center;
}
.slide_image {
    display: none;
    padding: 1rem 0;
}
.slide_image img{
    height:80vh;
    width: 93vw;
}
/* Next & previous buttons */
.prev, .next {
    cursor: pointer;
    position: absolute;
    top: 50%;
    /* width: auto; */
    margin-top: -22px;
    padding: 16px;
    color: white;
    font-weight: bold;
    font-size: 18px;
    transition: 0.6s ease;
    border-radius: 0 3px 3px 0;
    user-select: none;
  }
  /* Position the "next and prev button" to the right */
.prev {
    left: 6%;
    border-radius: 3px 0 0 3px;
}
.next {
    right: 6%;
    border-radius: 3px 0 0 3px;
  }


  /* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
    background-color: rgba(0,0,0,0.8);
  }

.spin_roller {
    padding: 0 0 1rem 0;
}

  /* The dots/bullets/indicators */
.dot {
    cursor: pointer;
    height: 15px;
    width: 15px;
    margin: 0 2px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
  }
  
  .active, .dot:hover {
    background-color: #717171;
  }
/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

.food-image{
    background-image: url("../img/MadeDifferent_v2.gif");
    background-repeat: no-repeat;
    background-size: cover;
    height: 90vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
.food-image p {
    color: var(--bg-color);
    font-size: var(--name-font);
    font-weight: bold;
    font-family: var(--parah-fontfamily);
}
.food-image a button {
    padding: .9375rem 1.25rem;
    margin-top: 1.875rem;
    color: var(--text-color);
    font-size: var(--h2-font);
    font-weight: bold;
    background-color:var(--bg-color) ;
    border: transparent;
    font-family: var(--parah-fontfamily); 
}
.food-image a button:hover {
    color: var(--second-color);
    border-right: 5px solid var(--second-color);
    border-left:5px solid var(--second-color);
    
}

.allmenu-list {
    padding: 3.125rem 0;
    height: auto;
}
.name {
    text-align: center;
}
.name h1 {
    font-size: var(--name-font);
    color: var(--text-color);
    font-family: var(--heading-fontfamily);
}
.mainmenu-list {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
    gap: 2rem;
    padding: 1.25rem;
}
.lists {
    display: grid;
    grid-template-columns: auto auto;
}
.lists img {
    object-fit: fill;
    min-width: 9.375rem;
    width: 9.375rem;
    height: 12.5rem;
    padding: .625rem;
    border: 2px solid var(--text-color);
    transition: all .3s ease;
}
.lists img:hover {
    transform: scale(1.1);
}
.lists-text {
    display: grid;
    align-content: center;
    padding: 0 1.25rem;
    gap:.6rem;
}
.lists-text h2{
    font-size: var(--h2-font);
    color: var(--text-color);
    font-family: var(--heading-fontfamily);
}
.lists-text p {
    padding: 1.25rem 0 0 0;
    font-size: var(--p-font);
    font-family: var(--parah-fontfamily);
    text-align: justify;
    text-indent: 2rem;
}
.lists-text a {
    width: 9.25rem;
    font-size: var(--p-font);
    color: blue;
    font-family: var(--parah-fontfamily);
}
.lists-text a:hover {
    transition: .2s;
    color: var(--second-color);
}
</style>


</head>
<body>
	<%@ include file="/header.jsp"%>
	<%-- <%Set<Menu> menuList1 = (Set<Menu>) request.getAttribute("menuList"); %>  --%>

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
					<a href="menu/edit?menuId=<%=menu.getId()%>">Update</a>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</section>


</body>
</html>
