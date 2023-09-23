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
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class UpdateDish
 */
@WebServlet("/dish/update")
public class UpdateDish extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DishService dishService = new DishService();

		PrintWriter out = response.getWriter();

		String[] selectedDishIds = request.getParameterValues("selectedDishes");

		if (selectedDishIds == null) {

			out.println("<script>alert('select the checkbox to update');</script>");
			out.println("<script>window.history.back();</script>");
		}

		Dish dish = null;

		if (selectedDishIds != null) {
			boolean flag = true;
			for (String dishId : selectedDishIds) {

				int id = Integer.parseInt(dishId);
				String dishName = request.getParameter("dish_name_" + dishId);
				int quantity = Integer.parseInt(request.getParameter("quantity_" + dishId));
				int price = Integer.parseInt(request.getParameter("price_" + dishId));
				int menuId = Integer.parseInt(request.getParameter("menuId"));
				int categoryId = Integer.parseInt(request.getParameter("categoryId"));

				String quantityUnitString = request.getParameter("quantity_unit_" + dishId);
				QuantityUnit quantityUnit = QuantityUnit.valueOf(quantityUnitString);
				int status = Integer.parseInt(request.getParameter("status_" + dishId));

				dish = new Dish();

				dish.setId(id);
				dish.setDishName(dishName);
				dish.setQuantity(quantity);
				dish.setQuantityUnit(quantityUnit);
				dish.setDishPrice(price);
				dish.setMenuId(menuId);
				dish.setCategoryId(categoryId);
				dish.setStatus(status);

				try {

					dishService.updateDish(dish);
					dish = null;

				} catch (Exception e) {
					flag = false;
					Logger.error(e);

					out.println("<script>alert('" + e.getMessage() + "');</script>");
					out.println("<script>window.history.back();</script>");

//					String redirectURL = request.getContextPath() + "/dish/edit";
//					out.println("<script>alert('"+ e.getMessage() +"');window.location.href='" + redirectURL +"';</script>");
				}
			}

			if (flag) {
				String redirectURL = request.getContextPath() + "/dish/edit";
				String alertMessage = "Dish updated successfully!";

				// Using JavaScript to display an alert
				out.println(
						"<script>alert('" + alertMessage + "');window.location.href='" + redirectURL + "';</script>");
			}
		}

	}

}
