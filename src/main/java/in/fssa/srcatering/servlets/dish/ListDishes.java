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
 * Servlet implementation class GetDishes
 */
@WebServlet("/getdishes")
public class ListDishes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		Integer menuId = Integer.parseInt(request.getParameter("menuId"));
		Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));

		DishService dishService = new DishService();
		try {
			dishService.findAllDishesByMenuIdAndCategoryId(menuId, categoryId);
			
		} catch (ValidationException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		} catch (ServiceException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}
	}

}
