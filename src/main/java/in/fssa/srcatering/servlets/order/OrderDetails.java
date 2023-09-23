package in.fssa.srcatering.servlets.order;

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

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.AddressBook;
import in.fssa.srcatering.model.Order;
import in.fssa.srcatering.model.OrderProduct;
import in.fssa.srcatering.model.OrderStatus;
import in.fssa.srcatering.model.Review;
import in.fssa.srcatering.service.AddressBookService;
import in.fssa.srcatering.service.OrderProductService;
import in.fssa.srcatering.service.OrderService;
import in.fssa.srcatering.service.ReviewService;

/**
 * Servlet implementation class OrderDetails
 */
@WebServlet("/order/details")
public class OrderDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		int orderId = Integer.parseInt(request.getParameter("orderId"));

		OrderService orderService = new OrderService();
		Order order = new Order();

		try {
			order = orderService.getOrderByOrderId(orderId);
		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
		}

		AddressBookService addressBookService = new AddressBookService();
		AddressBook address = null;

		try {
			address = addressBookService.getAddressByAddressId(order.getAddressId());
		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
		}

		OrderProductService orderProductService = new OrderProductService();
		Set<OrderProduct> orderProductList = new HashSet<>();
		
		// converting string menuIds to List<Integer>
		
		String menuIds = request.getParameter("menuIds");
		String categoryIds = request.getParameter("categoryIds");
		
		String[] menuElements = menuIds.replaceAll("[\\[\\]]", "").split(",");
		String[] categoryElements = categoryIds.replaceAll("[\\[\\]]", "").split(",");
		
		List<Integer> menuIdList = new ArrayList<>();
		List<Integer> categoryIdList = new ArrayList<>();
		
		for (String element : menuElements) {
			menuIdList.add(Integer.parseInt(element.trim()));
        }
		
		for(String element: categoryElements) {
			categoryIdList.add(Integer.parseInt(element.trim()));
		}
		
		List<Review> reviewList = new ArrayList<>();
				

		try {
			
			for(int i=0; i<menuIdList.size(); i++) {
				
				int menuId = menuIdList.get(i);
				int categoryId = categoryIdList.get(i);
				
				OrderProduct orderProduct = null;
				
				orderProduct =  orderProductService.getOrderProductByOrderIdAndMenuIdAndCategoryId(order.getId(), menuId, categoryId);
				
				orderProductList.add(orderProduct);
				
				Review review = null;
				review = new ReviewService().getReviewByOrderIdAndMenuIdAndCategoryId(order.getId(), menuId, categoryId);
				reviewList.add(review);
			}

		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
		}

		request.setAttribute("address", address);
		request.setAttribute("orderProductList", orderProductList);
		request.setAttribute("reviewList", reviewList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/order_details.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));

		OrderProductService orderProductService = new OrderProductService();

		try {
			
			out.println("<script type=\"text/javascript\">");
			out.println("var cancelReason = localStorage.getItem(\"cancelReason\");");
			out.println("</script>");
			
			String cancelReason = request.getParameter("cancelReason");

			orderProductService.updateOrderStatusAndCancelDate(OrderStatus.CANCELLED, orderId, menuId, categoryId,cancelReason);

			response.sendRedirect(request.getContextPath() + "/orders");

		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
		}

	}

}
