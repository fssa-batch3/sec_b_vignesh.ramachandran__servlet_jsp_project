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
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class RemoveUser
 */
@WebServlet("/user/delete")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("userId"));

		UserService userService = new UserService();
		try {
			userService.deleteUser(id);
			response.sendRedirect(request.getContextPath()+"/users");
		} catch (Exception e) {
			Logger.error(e);
			out.println("<script>alert('" + e.getMessage() + "');</script>");
			out.println("<script>window.history.back()</script>");
		} 

	}

}
