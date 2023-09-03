package in.fssa.srcatering.servlets.category;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class UpdateCategory
 */
@WebServlet("/category/update")
public class UpdateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		CategoryService categoryService = new CategoryService();
		
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String category_name = request.getParameter("category_name");
		String image = request.getParameter("category_image");
		
		Category category = new Category();
		category.setMenu_id(menuId);
		category.setId(categoryId);
		category.setImage(image);
		category.setCategoryName(category_name);
		
		try {
			categoryService.updateCategory(category);
			response.sendRedirect(request.getContextPath()+"/categories?menuId="+menuId);
		} catch (ValidationException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		} catch (ServiceException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}
		
		
		
	}

}
