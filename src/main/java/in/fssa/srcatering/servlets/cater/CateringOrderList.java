package in.fssa.srcatering.servlets.cater;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.CaterApproval;
import in.fssa.srcatering.model.Order;
import in.fssa.srcatering.model.OrderProduct;
import in.fssa.srcatering.model.OrderStatus;
import in.fssa.srcatering.model.Review;
import in.fssa.srcatering.service.OrderProductService;
import in.fssa.srcatering.service.OrderService;
import in.fssa.srcatering.service.ReviewService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class CateringOrderList
 */
@WebServlet("/cateringorders")
public class CateringOrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		OrderProductService orderProductService = new OrderProductService();
		List<OrderProduct> allOrderProducts = new ArrayList<>();
		List<Order> orderList = new ArrayList<>();
		List<Review> reviewList = new ArrayList<>();
		
		try {
			orderList = new OrderService().getAllOrders();
			allOrderProducts = orderProductService.getAllOrderProducts();
			
			Review review = null;
			
			for(OrderProduct orderProduct: allOrderProducts) {

				review = new ReviewService().getReviewByOrderIdAndMenuIdAndCategoryId(orderProduct.getOrderId(), orderProduct.getMenuId(),
						orderProduct.getCategoryId());
				if (review != null) {
					reviewList.add(review);
				}
			}
			
		} catch (Exception e) {
			Logger.error(e);
			
			out.println("<script>alert('"+e.getMessage()+"');</script>");
			out.println("<script>window.history.back();</script>");
		}
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("allOrderProducts", allOrderProducts);
		request.setAttribute("reviewList", reviewList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("catering_orderlist.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		String formName = request.getParameter("formName");

		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));

		OrderProductService orderProductService = new OrderProductService();
		
		if("approve".equals(formName)) {
			
			String rejectReason = request.getParameter("rejectReason");
			
			try {
				orderProductService.updateCaterApprovalByOrderIdAndMenuIdAndCategoryId(CaterApproval.APPROVED, rejectReason, orderId, menuId, categoryId);
				
				response.sendRedirect(request.getContextPath() + "/cateringorders");
				
			} catch (Exception e) {
				Logger.error(e);
				
				out.println("<script>alert('"+e.getMessage()+"');</script>");
				out.println("<script>window.history.back();</script>");
			}
			
		} else if ("reject".equals(formName)){
			
			try {
				
				String rejectReason = request.getParameter("rejectReason");
				
				orderProductService.updateCaterApprovalByOrderIdAndMenuIdAndCategoryId(CaterApproval.REJECTED, rejectReason, orderId, menuId, categoryId);
				
				response.sendRedirect(request.getContextPath() + "/cateringorders");
			} catch (Exception e) {
				Logger.error(e);
				
				out.println("<script>alert('"+e.getMessage()+"');</script>");
				out.println("<script>window.history.back();</script>");
			}
			
		} else if ("cancel".equals(formName)) {
			
			out.println("<script type=\"text/javascript\">");
			out.println("var cancelReason = localStorage.getItem(\"cancelReason\");");
			out.println("</script>");
			
			String cancelReason = request.getParameter("cancelReason");

			try {
				orderProductService.updateOrderStatusAndCancelDate(OrderStatus.CANCELLED, orderId, menuId, categoryId,cancelReason);
				
				response.sendRedirect(request.getContextPath() + "/cateringorders");
				
			} catch (Exception e) {
				Logger.error(e);
				
				out.println("<script>alert('"+e.getMessage()+"');</script>");
				out.println("<script>window.history.back();</script>");
			}

		} else if ("deliver".equals(formName)) {
			
			String cancelReason = request.getParameter("cancelReason");
			
			try {
				
				orderProductService.updateOrderStatusAndCancelDate(OrderStatus.DELIVERED, orderId, menuId, categoryId, cancelReason);
				
				response.sendRedirect(request.getContextPath() + "/cateringorders");
				
			} catch (Exception e) {
				Logger.error(e);
				
				out.println("<script>alert('"+e.getMessage()+"');</script>");
				out.println("<script>window.history.back();</script>");
			}
			
		}
		
	}

}
