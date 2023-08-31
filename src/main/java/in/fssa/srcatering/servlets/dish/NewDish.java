package in.fssa.srcatering.servlets.dish;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

/**
 * Servlet implementation class NewDish
 */
@WebServlet("/dish/new")
public class NewDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		MenuService menuService = new MenuService();
		List<Menu> menuList = new ArrayList<Menu>();
		
		CategoryService categoryService = new CategoryService();
		List<Category> categoryList = new ArrayList<Category>();
		
		QuantityUnit[] quantityUnit = QuantityUnit.values();
		System.out.println(quantityUnit);
		
		try {
			menuList = menuService.getAllMenus();
			categoryList = categoryService.getAllCategories();
			
			request.setAttribute("menuList", menuList);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("quantityUnit", quantityUnit);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/add_dish.jsp");
			dispatcher.forward(request, response);
			
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	
		
	}



}
