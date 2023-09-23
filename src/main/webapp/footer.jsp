<%@page import="in.fssa.srcatering.service.CategoryService"%>
<%@page import="in.fssa.srcatering.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="in.fssa.srcatering.service.MenuService"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.srcatering.model.Menu"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/footer.css">
</head>

	<%
		Set<Menu> menuListFooter = new HashSet<>();
		MenuService menuServiceFooter = new MenuService();
		CategoryService categoryServiceFooter = new CategoryService();
		menuListFooter = menuServiceFooter.getAllActiveMenus(); 
	%>

	<footer>
        <div class="footer-box">
            <div class="footer-content">
                <img src="<%=request.getContextPath() %>/assets/img/main-logo.png" alt="Company Logo" />
                <p>
                    SR Catering service is a professional catering service provider located in Kumbakonam, catering both
                    personal and corporate orders.
                </p>
            </div>
            
            <%for(Menu menuFooter : menuListFooter){ 
            
            	Set<Category> categoryListFooter = new HashSet<>();
            	categoryListFooter = categoryServiceFooter.getAllActiveCategoriesByMenuId(menuFooter.getId());
            
            
            %>
            
            <div class="footer-content">
            	<h3>
            		<span><%=menuFooter.getMenuName() %></span> Menu
            	</h3>
            	<ul>
            		<%for(Category categoryFooter : categoryListFooter){ %>
	            		<li>
	            			<a class="footer-navigation" 
	            				href="<%=request.getContextPath()%>/dishes?menuId=<%=menuFooter.getId()%>&categoryId=<%=categoryFooter.getId()%>">
	            				<%=categoryFooter.getCategoryName() %> <%=menuFooter.getMenuName() %>
	            			</a>
	            		</li>
            		<%} %>
            	</ul>
            </div>
            <%} %>
            
        </div>
        <div class="footer-details">
            <p>Copyright © 2021 - 2023 SR Catering - Website Designed By <span>vicky</span></p>
            <p>(+91)9876543210</p>
            <div class="footer-links">
                <a href="https://www.instagram.com/vicky_sk_forever?r=nametag"> <img src="<%=request.getContextPath() %>/assets/img/instagram.jpg" alt="instagram" /> </a>
                <a href="https://www.facebook.com/profile.php?id=100011341742455"> <img src="<%=request.getContextPath() %>/assets/img/facebook.jpg" alt="facebook link" /> </a>
                <a href="https://twitter.com/SRVignesh06?t=zGFf0sZZJa_0oe8XfsLkOQ&s=08"> <img src="<%=request.getContextPath() %>/assets/img/twitter.png" alt="twitter link" /> </a>
            </div>
        </div>
    </footer>


