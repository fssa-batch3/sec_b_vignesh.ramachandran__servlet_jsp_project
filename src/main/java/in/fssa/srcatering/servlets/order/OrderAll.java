package in.fssa.srcatering.servlets.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.AddressBook;
import in.fssa.srcatering.model.Cart;
import in.fssa.srcatering.model.Category;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.model.Order;
import in.fssa.srcatering.model.OrderProduct;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.AddressBookService;
import in.fssa.srcatering.service.CartService;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.MenuService;
import in.fssa.srcatering.service.OrderProductService;
import in.fssa.srcatering.service.OrderService;
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.validator.OrderProductValidator;

/**
 * Servlet implementation class OrderAll
 */
@WebServlet("/order/all")
public class OrderAll extends HttpServlet {
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
				
				out.println("<script>alert('"+ e.getMessage() +"');</script>");
				out.println("<script>window.history.back();</script>");
			}
		}

		AddressBook address = null;

		try {
			address = new AddressBookService().getDefaultAddressByUserId(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
		}

		CartService cartService = new CartService();
		List<Cart> cartList = new ArrayList<>();

		try {
			cartList = cartService.getAllCartsByUserId(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
		}

		List<Menu> menuList = new ArrayList<>();
		List<Category> categoryList = new ArrayList<>();
		List<Integer> noOfGuestList = new ArrayList<>();
		List<Integer> priceList = new ArrayList<>();
		List<LocalDate> deliveryDateList = new ArrayList<>();

		for (Cart cart : cartList) {
			Menu menu = null;
			Category category = null;

			try {

				menu = new MenuService().findByMenuId(cart.getMenuId());
				category = new CategoryService().getCategoryByMenuIdAndCategoryId(cart.getMenuId(),
						cart.getCategoryId());
				int price = new CategoryService().getTotalPriceOfTheCategoryByMenuIdAndCategoryId(cart.getMenuId(),
						cart.getCategoryId());

				menuList.add(menu);
				categoryList.add(category);
				priceList.add(price);
				noOfGuestList.add(cart.getNoOfGuest());
				deliveryDateList.add(cart.getDeliveryDate());

				request.setAttribute("menuList", menuList);
				request.setAttribute("categoryList", categoryList);
				request.setAttribute("noOfGuestList", noOfGuestList);
				request.setAttribute("priceList", priceList);
				request.setAttribute("deliveryDateList", deliveryDateList);
				request.setAttribute(loggedUser, noOfGuestList);
				request.setAttribute("address", address);

			} catch (Exception e) {
				e.printStackTrace();
				
				out.println("<script>alert('"+ e.getMessage() +"');</script>");
				out.println("<script>window.history.back();</script>");
			}
		}

		request.setAttribute("cartList", cartList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/orderall_form.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");

		UserService userService = new UserService();
		User user = null;
		AddressBookService addressBookService = new AddressBookService();
		AddressBook addressBook = null;

		if (loggedUser != null) {

			try {
				user = userService.findByEmail(loggedUser);
				addressBook = addressBookService.getDefaultAddressByUserId(user.getId());
			} catch (Exception e) {
				e.printStackTrace();
				
				out.println("<script>alert('"+ e.getMessage() +"');</script>");
				out.println("<script>window.history.back();</script>");
			}

			List<Integer> menuIdList = new ArrayList<>();
			List<Integer> categoryIdList = new ArrayList<>();
			List<Integer> noOfGuestList = new ArrayList<>();
			List<LocalDate> deliveryDateList = new ArrayList<>();

			int cartCount = Integer.parseInt(request.getParameter("cartCount"));

			for (int i = 1; i <= cartCount; i++) {

				int menuId = Integer.parseInt(request.getParameter("menuId" + i));
				int categoryId = Integer.parseInt(request.getParameter("categoryId" + i));

				int noOfGuest = Integer.parseInt(request.getParameter("noOfGuest" + i));
				String delivery = request.getParameter("deliveryDate" + i);
				LocalDate deliveryDate = LocalDate.parse(delivery);

				menuIdList.add(menuId);
				categoryIdList.add(categoryId);
				noOfGuestList.add(noOfGuest);
				deliveryDateList.add(deliveryDate);

			}

			String eventName = request.getParameter("eventName");
			int totalCost = Integer.parseInt(request.getParameter("totalCost"));

			OrderService orderService = new OrderService();
			OrderProductService orderProductService = new OrderProductService();

			Order order = new Order();
			order.setUserId(user.getId());
			order.setAddressId(addressBook.getId());
			order.setEventName(eventName);
			order.setTotalCost(totalCost);

			int orderId = 0;

			try {
				orderId = orderService.createOrder(order);
			} catch (Exception e) {
				e.printStackTrace();
				
				out.println("<script>alert('"+ e.getMessage() +"');</script>");
				out.println("<script>window.history.back();</script>");
			}

			for (int i = 0; i < cartCount; i++) {

				int menuId = menuIdList.get(i);
				int categoryId = categoryIdList.get(i);
				int noOfGuest = noOfGuestList.get(i);
				LocalDate deliveryDate = deliveryDateList.get(i);

				OrderProduct orderProduct = null;
				orderProduct = new OrderProduct();

				orderProduct.setMenuId(menuId);
				orderProduct.setCategoryId(categoryId);
				orderProduct.setNoOfGuest(noOfGuest);
				orderProduct.setDeliveryDate(deliveryDate);

				try {

					orderProductService.createOrderProduct(orderId, orderProduct);

				} catch (Exception e) {
					e.printStackTrace();
					
					out.println("<script>alert('"+ e.getMessage() +"');</script>");
					out.println("<script>window.history.back();</script>");
				}

			}

			try {

				new CartService().deleteAllCart();

				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"Order placed Successfully\");");
				out.println("window.location.href='" + request.getContextPath() + "/orders';");
				out.println("</script>");

			} catch (Exception e) {
				e.printStackTrace();
				
				out.println("<script>alert('"+ e.getMessage() +"');</script>");
				out.println("<script>window.history.back();</script>");
			}

		}

	}

}
