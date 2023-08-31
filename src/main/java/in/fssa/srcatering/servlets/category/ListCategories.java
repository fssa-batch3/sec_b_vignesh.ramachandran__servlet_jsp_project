package in.fssa.srcatering.servlets.category;

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
import in.fssa.srcatering.service.CategoryService;

/**
 * Servlet implementation class ListCategories
 */
@WebServlet("/dish/categories")
public class ListCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("varuthu  ");
		
		PrintWriter out = response.getWriter();
		
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		
		CategoryService categoryService = new CategoryService();
		Set<Category> categoryList = new HashSet<Category>();
		try {
			categoryList = categoryService.findCategoryByMenuId(menuId);
			System.out.println(categoryList);
			
			request.setAttribute("categoryList", categoryList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/add_dish.jsp");
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
