package in.fssa.srcatering.servlets.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
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
import in.fssa.srcatering.model.Dish;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.CartService;
import in.fssa.srcatering.service.CategoryDishService;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.DishService;
import in.fssa.srcatering.service.MenuService;
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

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
		
		
		// for exception handling
		Set<Dish> dishList = new HashSet<>();
		Set<Menu> menuList = new HashSet<>();
		DishService dishService = new DishService();
		MenuService menuService = new MenuService();
		CategoryService categoryService = new CategoryService();
		Menu menu = null;
		Category category = null;
		int totalPrice = 0;

		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");

		CartService cartService = new CartService();
		UserService userService = new UserService();
		User user = null;

		if (loggedUser != null) {
			try {
				user = userService.findByEmail(loggedUser);
			} catch (Exception e) {
				Logger.error(e);
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
			
			/* for exception handling */
			
//			menu = menuService.findByMenuId(menuId);
//			menuList = menuService.getAllMenus();
//			category = categoryService.getCategoryByMenuIdAndCategoryId(menuId, categoryId);
//
//			dishList = dishService.getAllActiveDishesByMenuIdAndCategoryId(menuId, categoryId);
//
//			totalPrice = categoryService.getTotalPriceOfTheCategoryByMenuIdAndCategoryId(menuId, categoryId);
			
			// create cart
			cartService.createAddtoCart(cart);
			out.println("<script>alert('Menu added to the cart');</script>");
		    out.println("<script>window.location.href='" + request.getContextPath() + "/mycart';</script>");
			
		} catch (Exception e) {
			
			Logger.error(e);
			
			String errorMessage = e.getMessage();
			response.getWriter().print("<script>localStorage.setItem('errorMessage', '" + errorMessage + "');</script>");
			out.println("<script>location.href='" + request.getHeader("Referer") + "';</script>");
			
//			response.sendRedirect(request.getHeader("Referer"));
//	        return;
			
//			response.setContentType("text/html;charset=UTF-8");
//			out.println("<script>alert('Your alert message here');</script>");
//			out.println("<script>location.href='" + request.getHeader("Referer") + "';</script>");

			
//			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            response.getWriter().write(e.getMessage());
			
			
		}

	}

}
