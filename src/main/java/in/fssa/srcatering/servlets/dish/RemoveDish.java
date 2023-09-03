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
 * Servlet implementation class RemoveDish
 */
@WebServlet("/dish/remove")
public class RemoveDish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String menuId = request.getParameter("menuId");
		String categoryId = request.getParameter("categoryId");

		MenuService menuService = new MenuService();
		Set<Menu> menuList = new HashSet<Menu>();

		CategoryService categoryService = new CategoryService();
		Set<Category> categoryList = new HashSet<Category>();

		if (menuId == null && categoryId == null) {

			try {
				menuList = menuService.getAllActiveMenus();
				categoryList = categoryService.getAllCategories();

				request.setAttribute("menuList", menuList);
				request.setAttribute("categoryList", categoryList);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/remove_dish.jsp");
				dispatcher.forward(request, response);

			} catch (ServiceException e) {
				e.printStackTrace();
			}

		} else {
			PrintWriter out = response.getWriter();

			int menuId1 = Integer.parseInt(menuId);
			int categoryId1 = Integer.parseInt(categoryId);

			DishService dishService = new DishService();
			try {
				Set<Dish> dishList = dishService.getAllDishesByMenuIdAndCategoryId(menuId1, categoryId1);

				Menu menu = menuService.findByMenuId(menuId1);
				Category category = categoryService.getCategoryByMenuIdAndCategoryId(menuId1, categoryId1);

				request.setAttribute("menu", menu);
				request.setAttribute("category", category);
				request.setAttribute("dishList", dishList);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/remove_dish.jsp");
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

}
