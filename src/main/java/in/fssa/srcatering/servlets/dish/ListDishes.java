package in.fssa.srcatering.servlets.dish;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.Category;
import in.fssa.srcatering.model.Dish;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.DishService;
import in.fssa.srcatering.service.MenuService;

/**
 * Servlet implementation class ListDishes
 */
@WebServlet("/dishes")
public class ListDishes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		DishService dishService = new DishService();
		MenuService menuService = new MenuService();
		CategoryService categoryService = new CategoryService();
		
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		Set<Dish> dishList = new HashSet<>();
		Set<Menu> menuList = new HashSet<>();
		
		try {
			Menu menu = menuService.findByMenuId(menuId);
			menuList = menuService.getAllMenus();
			Category category = categoryService.getCategoryByMenuIdAndCategoryId(menuId, categoryId);
			
			dishList = dishService.getAllActiveDishesByMenuIdAndCategoryId(menuId, categoryId);
			
			request.setAttribute("dishList", dishList);
			request.setAttribute("menu", menu);
			request.setAttribute("menuList", menuList);
			request.setAttribute("category", category);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/dish_list.jsp");
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
