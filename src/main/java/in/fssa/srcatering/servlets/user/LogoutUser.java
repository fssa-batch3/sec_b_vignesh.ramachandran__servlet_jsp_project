package in.fssa.srcatering.servlets.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutUser
 */
@WebServlet("/user/logout")
public class LogoutUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userId"));

		HttpSession session = request.getSession();
		String attributeName = "loggedUser";
		session.removeAttribute(attributeName);

		response.sendRedirect(request.getContextPath() + "/index");
	}


}
