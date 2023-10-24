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
import in.fssa.srcatering.util.Logger;

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
		category.setMenuId(menuId);
		category.setId(categoryId);
		category.setImage(image);
		category.setCategoryName(category_name);
		
		try {
			categoryService.updateCategory(category);
			
			String redirectURL = request.getContextPath() + "/category/edit";
	        String alertMessage = "Category updated successfully!";
	        
	        // Using JavaScript to display an alert
	        out.println("<script>alert('" + alertMessage + "');window.location.href='" + redirectURL + "';</script>");

		} catch (Exception e) {
			Logger.error(e);
			out.println("<script>alert('" + e.getMessage() + "');</script>");
			out.println("<script>window.history.back()</script>");
			
//			String redirectURL = request.getContextPath() + "/category/edit";
//			out.println("<script>alert('"+ e.getMessage() +"');window.location.href='" + redirectURL +"';</script>");
		} 

	}

}
