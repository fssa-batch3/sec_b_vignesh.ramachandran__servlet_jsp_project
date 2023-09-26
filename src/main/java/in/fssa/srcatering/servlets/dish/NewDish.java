package in.fssa.srcatering.servlets.dish;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.model.Category;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.model.QuantityUnit;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.MenuService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class NewDish
 */
@WebServlet("/dish/new")
public class NewDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		MenuService menuService = new MenuService();
		Set<Menu> menuList = new TreeSet<Menu>();
		
		CategoryService categoryService = new CategoryService();
		Set<Category> categoryList = new TreeSet<Category>();
		
		QuantityUnit[] quantityUnit = QuantityUnit.values();
		
		try {
			menuList =  menuService.getAllMenus();
			categoryList = categoryService.getAllCategories();
			
			request.setAttribute("menuList", menuList);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("quantityUnit", quantityUnit);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/add_dish.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			Logger.error(e);
			
			out.println("<script>alert('"+e.getMessage()+"');</script>");
			out.println("<script>window.history.back();</script>");
		}
	
		
	}



}
