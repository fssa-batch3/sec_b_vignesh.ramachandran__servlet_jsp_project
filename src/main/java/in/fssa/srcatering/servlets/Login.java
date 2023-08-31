package in.fssa.srcatering.servlets;

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

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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

			// response.sendRedirect("login.html");
		} else if (password == null || "".equals(password) || password.length() != 8) {
			response.sendRedirect("login.jsp?errorMessage=Invalid Password");

			// response.sendRedirect("login.html");
		} else {
			try {
				userService.loginUser(email, password);
				
				session.setAttribute("LoggedEmail", email);
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			} catch (ValidationException e) {
				e.printStackTrace();
				response.sendRedirect("login.jsp?errorMessage="+e.getMessage());
			}
		}
		
		System.out.println(session.getAttribute("LoggedEmail"));

	}

}
