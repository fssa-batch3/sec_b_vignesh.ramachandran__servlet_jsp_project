package in.fssa.srcatering.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.UserService;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/user/create")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserService userService = new UserService();
		PrintWriter out = response.getWriter();

		User user = new User();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone_number");
		String password = request.getParameter("password");
		String cnfPassword = request.getParameter("cnf_password");

		Long phoneNumber = Long.parseLong(phone);

		if (password.equals(cnfPassword)) {

			user.setName(name);
			user.setEmail(email);
			user.setPhoneNumber(phoneNumber);
			user.setPassword(password);

			try {
				userService.createUser(user);
				response.sendRedirect(request.getContextPath()+"/user/login");

			} catch (ValidationException | ServiceException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			}
		} else {
			out.println("Check confirm password");
		}

	}

}
