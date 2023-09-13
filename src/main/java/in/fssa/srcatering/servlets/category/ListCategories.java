package in.fssa.srcatering.servlets.category;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.Category;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.MenuService;

/**
 * Servlet implementation class ListCategories
 */
@WebServlet("/categories")
public class ListCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		
		CategoryService categoryService = new CategoryService();
		Set<Category> categoryList = new TreeSet<Category>();
		
		MenuService menuService = new MenuService();
		Set<Menu> menuList = new TreeSet<>();
		Menu menu = null;
		List<Integer> categoryPrice = new ArrayList<Integer>();
			
		try {
			menu = new Menu();
			menu = menuService.findByMenuId(menuId);
			categoryList = categoryService.getAllActiveCategoriesByMenuId(menuId);
			menuList = menuService.getAllMenus();
			
			for(Category category : categoryList) {
				int price = categoryService.getTotalPriceOfTheCategoryByMenuIdAndCategoryId(menuId, category.getId());
				categoryPrice.add(price);
			}
			
			request.setAttribute("menu", menu);
			request.setAttribute("menuList", menuList);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("categoryPrice", categoryPrice);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/category_list.jsp");
			dispatcher.forward(request, response);
			
		} catch (ValidationException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		} catch (ServiceException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}
		
	}


}
