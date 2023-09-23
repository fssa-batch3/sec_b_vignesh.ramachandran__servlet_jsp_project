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
import in.fssa.srcatering.model.Dish;
import in.fssa.srcatering.model.QuantityUnit;
import in.fssa.srcatering.service.DishService;

/**
 * Servlet implementation class CreateDish
 */
@WebServlet("/dish/create")
public class CreateDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Dish dish = new Dish();
		DishService dishService = new DishService();
		PrintWriter out = response.getWriter();
		
		Integer menuId = Integer.parseInt(request.getParameter("menuId"));
		Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String name = request.getParameter("dish_name");
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		Integer price = Integer.parseInt(request.getParameter("price"));
		QuantityUnit quantityUnit =QuantityUnit.valueOf(request.getParameter("quantity_unit"));
		
		dish.setMenuId(menuId);
		dish.setCategoryId(categoryId);
		dish.setDishName(name);
		dish.setQuantity(quantity);
		dish.setDishPrice(price);
		dish.setQuantityUnit(quantityUnit);
		
		try {
			dishService.createDish(dish);
			
			String redirectURL = request.getContextPath() + "/dish/new";
	        String alertMessage = "Dish created successfully!";
	        
	        // Using JavaScript to display an alert
	        out.println("<script>alert('" + alertMessage + "');window.location.href='" + redirectURL + "';</script>");

		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
			
//			String redirectURL = request.getContextPath() + "/dish/new";
//			out.println("<script>alert('"+ e.getMessage() +"');window.location.href='" + redirectURL +"';</script>");
		} 
		
	}

}
