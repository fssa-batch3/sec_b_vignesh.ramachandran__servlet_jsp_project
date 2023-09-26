package in.fssa.srcatering.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class EditUser
 */
@WebServlet("/user/edit")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String email = (String) request.getSession().getAttribute("loggedUser");
		
		UserService userService = new UserService();
		
		User user = null;
		
		try {
			user = userService.findByEmail(email);
			
			request.setAttribute("userDetails", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_user.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			Logger.error(e);
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
		} 
		
		
	}



}
