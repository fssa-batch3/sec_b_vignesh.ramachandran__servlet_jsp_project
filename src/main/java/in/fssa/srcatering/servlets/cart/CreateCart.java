package in.fssa.srcatering.servlets.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.Cart;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.CartService;
import in.fssa.srcatering.service.CategoryDishService;
import in.fssa.srcatering.service.UserService;

/**
 * Servlet implementation class CreateCart
 */
@WebServlet("/cart/create")
public class CreateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");

		CartService cartService = new CartService();
		UserService userService = new UserService();
		User user = null;

		if (loggedUser != null) {
			try {
				user = userService.findByEmail(loggedUser);
			} catch (ValidationException | ServiceException e) {
				e.printStackTrace();
			}
		}

		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));

		Cart cart = new Cart();
		cart.setMenuId(menuId);
		cart.setCategoryId(categoryId);
		cart.setNoOfGuest(50);
		cart.setUserId(user.getId());

		LocalDate futureDate = LocalDate.now().plusDays(7);
		cart.setDeliveryDate(futureDate);

		try {
			cartService.createAddtoCart(cart);
			out.println("<script>alert('Menu added to the cart');</script>");
		    out.println("<script>window.location.href='" + request.getContextPath() + "/mycart';</script>");
			
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
			e.getMessage();
		}


	}

}
