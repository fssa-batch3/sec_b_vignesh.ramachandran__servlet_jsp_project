package in.fssa.srcatering.servlets.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
import in.fssa.srcatering.model.Order;
import in.fssa.srcatering.model.OrderProduct;
import in.fssa.srcatering.model.OrderStatus;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.CategoryService;
import in.fssa.srcatering.service.MenuService;
import in.fssa.srcatering.service.OrderProductService;
import in.fssa.srcatering.service.OrderService;
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class OrderList
 */
@WebServlet("/orders")
public class OrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		

		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");

		UserService userService = new UserService();
		User user = null;
		OrderService orderService = new OrderService();
		List<Order> orderList = new ArrayList<>();
		MenuService menuService = new MenuService();
		CategoryService categoryService = new CategoryService();
		OrderProductService orderProductService = new OrderProductService();

		if (loggedUser != null) {

			try {
				user = userService.findByEmail(loggedUser);
				orderList = orderService.getAllOrdersByUserId(user.getId());
			} catch (Exception e) {
				Logger.error(e);
			}

			for (Order order : orderList) {

				Set<OrderProduct> orderProductList = new HashSet<>();

				try {
					orderProductList = new OrderProductService().getAllOrderProductsByOrderId(order.getId());
				} catch (Exception e) {
					Logger.error(e);
				}

				for (OrderProduct orderProduct : orderProductList) {

					LocalDate today = LocalDate.now();

					if (orderProduct.getOrderStatus() == OrderStatus.NOT_DELIVERED
							&& orderProduct.getDeliveryDate() == today) {

						try {
							orderProductService.updateOrderStatusAndCancelDate(OrderStatus.DELIVERED,
									orderProduct.getOrderId(), orderProduct.getMenuId(), orderProduct.getCategoryId(),null);
						} catch (Exception e) {
							Logger.error(e);
						}

					}

				}

			}

			request.setAttribute("loggedUser", loggedUser);
			request.setAttribute("orderList", orderList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/order_list.jsp");
			dispatcher.forward(request, response);
		}
	}


}
