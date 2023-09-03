package in.fssa.srcatering.servlets.category;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class EditCategory
 */
@WebServlet("/category/edit")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		CategoryService categoryService = new CategoryService();
		MenuService menuService = new MenuService();
		Category category = null;
		Menu menu = null;
		
		try {
			menu = menuService.findByMenuId(menuId);
			category = categoryService.getCategoryByMenuIdAndCategoryId(menuId, categoryId);
			
			request.setAttribute("menu", menu);
			request.setAttribute("category", category);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_category.jsp");
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
