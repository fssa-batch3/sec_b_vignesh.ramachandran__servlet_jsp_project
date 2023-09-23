package in.fssa.srcatering.servlets.dish;

import java.io.IOException;
import java.io.PrintWriter;
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
import in.fssa.srcatering.model.Dish;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.CartService;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.DishService;
import in.fssa.srcatering.service.MenuService;
import in.fssa.srcatering.service.UserService;

/**
 * Servlet implementation class ListDishes
 */
@WebServlet("/dishes")
public class ListDishes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");
		
		UserService userService = new UserService();
		User user = null;
		
		if (loggedUser != null) {
			try {
				user = userService.findByEmail(loggedUser);
			} catch (Exception e) {
				e.printStackTrace();
				
			}
		}
		
		DishService dishService = new DishService();
		MenuService menuService = new MenuService();
		CategoryService categoryService = new CategoryService();
		CartService cartService = new CartService();

		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));

		Set<Dish> dishList = new HashSet<>();
		Set<Menu> menuList = new HashSet<>();
		List<Integer> menuIds = new ArrayList<>();
		List<Integer> categoryIds = new ArrayList<>();
	
		try {
			
			Menu menu = menuService.findByMenuId(menuId);
			menuList = menuService.getAllMenus();
			Category category = categoryService.getCategoryByMenuIdAndCategoryId(menuId, categoryId);

			dishList = dishService.getAllActiveDishesByMenuIdAndCategoryId(menuId, categoryId);

			int totalPrice = categoryService.getTotalPriceOfTheCategoryByMenuIdAndCategoryId(menuId, categoryId);
			
			List<Cart> cartList = cartService.getAllCartsByUserId(user.getId());
			
			for(Cart cart: cartList) {
				menuIds.add(cart.getMenuId());
				categoryIds.add(cart.getCategoryId());
			}
			
			request.setAttribute("dishList", dishList);
			request.setAttribute("menu", menu);
			request.setAttribute("menuList", menuList);
			request.setAttribute("category", category);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("menuIds", menuIds);
			request.setAttribute("categoryIds", categoryIds);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/dish_list.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();

			out.println("<script>alert('"+e.getMessage()+"');</script>");
			out.println("<script>window.history.back();</script>");
			
		}

	}

}
