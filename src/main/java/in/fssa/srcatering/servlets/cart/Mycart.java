package in.fssa.srcatering.servlets.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.Cart;
import in.fssa.srcatering.model.Category;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.CartService;
import in.fssa.srcatering.service.CategoryDishService;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.MenuService;
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class Mycart
 */
@WebServlet("/mycart")
public class Mycart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");

		if (loggedUser != null) {

			UserService userService = new UserService();
			CartService cartService = new CartService();
			User user = new User();
			List<Cart> cartList = new ArrayList<>();

			try {
				user = userService.findByEmail(loggedUser);
			} catch (Exception e) {
				Logger.error(e);
			}

			int userId = user.getId();

			try {
				cartList = cartService.getAllCartsByUserId(userId);
			} catch (Exception e) {
				Logger.error(e);
			}

			MenuService menuService = new MenuService();
			Menu menu = new Menu();
			CategoryService categoryService = new CategoryService();
			Category category = new Category();

			List<String> menuNames = new ArrayList<>();
			List<String> categoryNames = new ArrayList<>();

			for (Cart cart : cartList) {
				menu = null;
				category = null;

				try {
					menu = menuService.findByMenuId(cart.getMenuId());
					category = categoryService.getCategoryByMenuIdAndCategoryId(cart.getMenuId(), cart.getCategoryId());
				} catch (Exception e) {
					Logger.error(e);
					
					String errorMessage = e.getMessage();
					if (errorMessage != null && !errorMessage.isEmpty()) {
						out.println("<script>alert('" + errorMessage + "');</script>");
						out.println("<script>window.history.back()</script>");
					}
				}

				menuNames.add(menu.getMenuName());
				categoryNames.add(category.getCategoryName());
			}

			request.setAttribute("menuNames", menuNames);
			request.setAttribute("categoryNames", categoryNames);
			request.setAttribute("cartList", cartList);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/mycart.jsp");
			dispatcher.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		CartService cartService = new CartService();

		String formName = request.getParameter("formName");

		if ("cartUpdate".equals(formName)) {

			int cartId = Integer.parseInt(request.getParameter("cartId"));
			String deliveryDate = request.getParameter("deliveryDate");
			int noOfGuest = Integer.parseInt(request.getParameter("noOfGuest"));

			LocalDate deliveryDate1 = LocalDate.parse(deliveryDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));

			try {
				cartService.updateCart(noOfGuest, deliveryDate1, cartId);

				out.println("<script>window.location.href='" + request.getContextPath() + "/mycart';</script>");

			} catch (Exception e) {
				Logger.error(e);
			}

		} else if ("cartRemove".equals(formName)) {

			int cartId = Integer.parseInt(request.getParameter("cartId"));

			try {
				cartService.deleteCart(cartId);

				out.println("<script>alert('Menu removed from the cart');</script>");
				out.println("<script>window.location.href='" + request.getContextPath() + "/mycart';</script>");

			} catch (Exception e) {
				Logger.error(e);
			}
		}

	}

}
