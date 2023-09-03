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
 * Servlet implementation class UpdateUser
 */
@WebServlet("/user/update")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Long phoneNumber = Long.parseLong(request.getParameter("phone_number"));
		String password = request.getParameter("password");
		int id = Integer.parseInt(request.getParameter("userId"));
		
		User user = new User();
		
		user.setName(name);
		user.setEmail(email);
		user.setPhoneNumber(phoneNumber);
		user.setPassword(password);
		user.setId(id);
		
		try {
			userService.updateUser(id, user);
			response.sendRedirect("details?userId="+id);
		} catch (ValidationException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		} catch (ServiceException e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}
		
	}

}
