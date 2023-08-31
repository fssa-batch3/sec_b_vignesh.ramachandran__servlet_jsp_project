package in.fssa.srcatering.servlets.dish;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
import in.fssa.srcatering.model.QuantityUnit;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.DishService;
import in.fssa.srcatering.service.MenuService;

/**
 * Servlet implementation class EditDish
 */
@WebServlet("/dish/edit")
public class EditDish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String menuId = request.getParameter("menuId");
		String categoryId = request.getParameter("categoryId");
		
		System.out.println(menuId);

		if (menuId == null && categoryId == null) {

			MenuService menuService = new MenuService();
			List<Menu> menuList = new ArrayList<Menu>();

			CategoryService categoryService = new CategoryService();
			List<Category> categoryList = new ArrayList<Category>();

			QuantityUnit[] quantityUnit = QuantityUnit.values();

			try {
				menuList = menuService.getAllMenus();
				categoryList = categoryService.getAllCategories();

				request.setAttribute("menuList", menuList);
				request.setAttribute("categoryList", categoryList);
				request.setAttribute("quantityUnit", quantityUnit);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/update_dish.jsp");
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
				List<Dish> dishList = dishService.findAllDishesByMenuIdAndCategoryId(menuId1, categoryId1);
				
				request.setAttribute("dishList", dishList);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/update_dish.jsp");
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
