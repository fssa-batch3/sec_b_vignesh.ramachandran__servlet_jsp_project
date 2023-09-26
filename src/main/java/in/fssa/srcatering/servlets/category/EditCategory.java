package in.fssa.srcatering.servlets.category;

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
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.Category;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.MenuService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class EditCategory
 */
@WebServlet("/category/edit")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		CategoryService categoryService = new CategoryService();
		MenuService menuService = new MenuService();

		Set<Menu> menuList = new TreeSet<>();
		Set<Category> categoryList = new TreeSet<>();

		String menu_id = request.getParameter("menuId");
		String category_id = request.getParameter("categoryId");

		if (menu_id == null || category_id == null) {

			try {

				menuList = menuService.getAllMenus();
				categoryList = categoryService.getAllCategories();

				request.setAttribute("menuList", menuList);
				request.setAttribute("categoryList", categoryList);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/update_category.jsp");
				dispatcher.forward(request, response);

			} catch (Exception e) {
				Logger.error(e);
				out.println(e.getMessage());
			}

		} else {

			int menuId = Integer.parseInt(menu_id);
			int categoryId = Integer.parseInt(category_id);

			Category category = null;
			Menu menu = null;

			try {
				menu = menuService.findByMenuId(menuId);
				category = categoryService.getCategoryByMenuIdAndCategoryId(menuId, categoryId);

				request.setAttribute("menu", menu);
				request.setAttribute("category", category);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/update_category.jsp");
				dispatcher.forward(request, response);

			} catch (Exception e) {
				Logger.error(e);
				
				out.println("<script>alert('"+ e.getMessage() +"');</script>");
				out.println("<script>window.history.back();</script>");
			} 

		}

	}

}
