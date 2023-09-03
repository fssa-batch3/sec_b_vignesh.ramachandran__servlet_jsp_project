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

import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.service.UserService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserService userService = new UserService();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();

		if (email == null || "".equals(email)) {

			out.println("Invalid Email");
			response.sendRedirect("login.jsp?errorMessage=Invalid Email");

		} else if (password == null || "".equals(password) || password.length() != 8) {
			
			response.sendRedirect("login.jsp?errorMessage=Invalid Password");

		} else {
			try {
				userService.loginUser(email, password);
				
				session.setAttribute("loggedUser", email);
				response.sendRedirect(request.getContextPath()+"/index");
				
			} catch (ValidationException e) {
				e.printStackTrace();
				response.sendRedirect("login.jsp?errorMessage="+e.getMessage());
			}
		}
		
		//System.out.println(session.getAttribute("loggedEmail"));

	}

}
