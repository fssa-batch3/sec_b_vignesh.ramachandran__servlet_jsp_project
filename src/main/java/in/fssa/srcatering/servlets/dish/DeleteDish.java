package in.fssa.srcatering.servlets.dish;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.service.DishService;

/**
 * Servlet implementation class DeleteDish
 */
@WebServlet("/dish/delete")
public class DeleteDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		int dishId = -1;
		
		String[] selectedDishIds = request.getParameterValues("selectedDishes");
		
		if(selectedDishIds == null) {
			out.println("Select Checkbox");
		}
		
		if (selectedDishIds != null) {
			
			dishId = Integer.parseInt(request.getParameter("selectedDishes"));
			System.out.println(dishId);
			
			DishService dishService = new DishService();
			
			try {
				dishService.deleteDish(menuId, categoryId, dishId);
				
				response.sendRedirect(request.getContextPath()+"/dish/remove?menuId="+menuId+"&categoryId="+categoryId);

			} catch (Exception e) {
				e.printStackTrace();
//				out.println(e.getMessage());
				out.println("<script>alert('"+e.getMessage()+"');</script>");
				out.println("<script>window.history.back();</script>");
			}
			
			
		}

	}



}
