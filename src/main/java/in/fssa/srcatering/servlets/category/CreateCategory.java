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
import in.fssa.srcatering.service.CategoryService;

/**
 * Servlet implementation class CreateCategory
 */
@WebServlet("/category/create")
public class CreateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		Category category = new Category();
		CategoryService categoryService = new CategoryService();
		
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		String categoryName = request.getParameter("category_name");
		String categoryImage = request.getParameter("category_image");
		
		category.setCategoryName(categoryName);
		category.setImage(categoryImage);
		category.setMenu_id(menuId);
		
		try {
			categoryService.createCategory(category);
			
			String redirectURL = request.getContextPath() + "/category/new";
	        String alertMessage = "Category created successfully!";
	        
	        // Using JavaScript to display an alert
	        out.println("<script>alert('" + alertMessage + "');window.location.href='" + redirectURL + "';</script>");
			
		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");

//			String redirectURL = request.getContextPath() + "/category/new";
//			out.println("<script>alert('"+ e.getMessage() +"');window.location.href='" + redirectURL +"';</script>");
		}
		
	}

}
