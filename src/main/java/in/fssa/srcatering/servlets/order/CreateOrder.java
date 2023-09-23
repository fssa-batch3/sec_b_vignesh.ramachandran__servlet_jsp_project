package in.fssa.srcatering.servlets.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

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
 * Servlet implementation class CreateOrder
 */
@WebServlet("/order/create")
public class CreateOrder extends HttpServlet {
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

		AddressBookService addressBookService = new AddressBookService();
		AddressBook addressBook = null;

		if (user != null) {

			try {
				addressBook = addressBookService.getDefaultAddressByUserId(user.getId());
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		String cart_id = request.getParameter("cartId");
		int menuId;
		int categoryId;
		Cart cart = null;

		if (cart_id != null) {

			int cartId = Integer.parseInt(cart_id);

			CartService cartService = new CartService();
			cart = new Cart();

			try {
				cart = cartService.getCartByCartId(cartId);
			} catch (Exception e) {
				e.printStackTrace();
				
				out.println("<script>alert('"+ e.getMessage() +"');</script>");
				out.println("<script>window.history.back();</script>");
			}

			menuId = cart.getMenuId();
			categoryId = cart.getCategoryId();

		} else {

			menuId = Integer.parseInt(request.getParameter("menuId"));
			categoryId = Integer.parseInt(request.getParameter("categoryId"));

		}

		MenuService menuService = new MenuService();
		CategoryService categoryService = new CategoryService();
//			AddressBookService addressBookService = new AddressBookService();

		int price = -1;

		try {

			Menu menu = menuService.findByMenuId(menuId);
			Category category = categoryService.getCategoryByMenuIdAndCategoryId(menuId, categoryId);
			price = categoryService.getTotalPriceOfTheCategoryByMenuIdAndCategoryId(menuId, categoryId);
			AddressBook address = addressBookService.getDefaultAddressByUserId(user.getId());

			if (cart != null) {

				request.setAttribute("noOfGuestCart", cart.getNoOfGuest() + "");
				request.setAttribute("deliveryDate", cart.getDeliveryDate());
				request.setAttribute("cartId", cart_id);

			} else {

				LocalDate deliveryDate = LocalDate.now().plusDays(7);
				request.setAttribute("deliveryDate", deliveryDate);
			}

			request.setAttribute("menu", menu);
			request.setAttribute("category", category);
			request.setAttribute("price", price);
			request.setAttribute("address", address);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/order_form.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
		}

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

			int menuId = Integer.parseInt(request.getParameter("menuId"));
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));

			int noOfGuest = Integer.parseInt(request.getParameter("noOfGuest"));
			String eventName = request.getParameter("eventName");
			int totalCost = Integer.parseInt(request.getParameter("totalCost"));

			String delivery = request.getParameter("deliveryDate");
			LocalDate deliveryDate = LocalDate.parse(delivery);

			Order order = new Order();
			order.setUserId(user.getId());
			order.setAddressId(addressBook.getId());
			order.setEventName(eventName);
			order.setTotalCost(totalCost);

			OrderProduct orderProduct = new OrderProduct();
			orderProduct.setMenuId(menuId);
			orderProduct.setCategoryId(categoryId);
			orderProduct.setNoOfGuest(noOfGuest);
			orderProduct.setDeliveryDate(deliveryDate);

			OrderService orderService = new OrderService();
			OrderProductService orderProductService = new OrderProductService();

			try {

				int orderId = orderService.createOrder(order);

				orderProductService.createOrderProduct(orderId, orderProduct);

				String cartId = request.getParameter("cartId");

				if (cartId != null) {
					new CartService().deleteCart(Integer.parseInt(cartId));
				}

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
