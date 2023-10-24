package in.fssa.srcatering.servlets.review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.Review;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.ReviewService;
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class CreateReview
 */
@WebServlet("/review/create")
public class CreateReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		
		request.setAttribute("orderId", orderId);
		request.setAttribute("menuId", menuId);
		request.setAttribute("categoryId", categoryId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/review_form.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");
		
		User user = null;
		
		try {
			user = new UserService().findByEmail(loggedUser);
		} catch (Exception e) {
			Logger.error(e);
			out.println("<script>alert('" + e.getMessage() + "');</script>");
			out.println("<script>window.history.back()</script>");
		}
		
		int userId = user.getId();
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		int star = Integer.parseInt(request.getParameter("star"));
		String feedback = (String) request.getParameter("feedback");
		
		ReviewService reviewService = new ReviewService();
		Review review = new Review();
		
		review.setUserId(userId);
		review.setOrderId(orderId);
		review.setMenuId(menuId);
		review.setCategoryId(categoryId);
		review.setStar(star);
		review.setFeedback(feedback);
		
		try {
			reviewService.createReview(review);
			
			response.sendRedirect(request.getContextPath()+"/orders");
		} catch (Exception e) {
			Logger.error(e);
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
		}
	}

}
