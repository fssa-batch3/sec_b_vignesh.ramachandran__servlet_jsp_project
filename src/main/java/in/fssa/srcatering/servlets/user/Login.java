package in.fssa.srcatering.servlets.user;

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
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class Login
 */
@WebServlet("/user/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserService userService = new UserService();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		try {
			userService.loginUser(email, password);
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('You have sucessfully logged in!')");
			out.println("</script>");

			session.setAttribute("loggedUser", email);
			response.sendRedirect(request.getContextPath() + "/index"); 
			
		} catch (Exception e) {
			Logger.error(e);
	
			request.setAttribute("errorMessage", "Invalid Login Credentials");
			
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			
		}

	}

}
