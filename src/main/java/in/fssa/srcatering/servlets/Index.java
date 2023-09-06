package in.fssa.srcatering.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.MenuService;
import in.fssa.srcatering.service.UserService;

/**
 * Servlet implementation class Index
 */
@WebServlet("/index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		MenuService menuService = new MenuService();
		Set<Menu> menuList = new HashSet<>();

		UserService userService = new UserService();

		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");

		if (loggedUser != null) {
			try {
				User user = (User) userService.findByEmail(loggedUser);
				
				menuList = menuService.getAllActiveMenus();

				request.setAttribute("user", user);
				request.setAttribute("menuList", menuList);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);

			} catch (ValidationException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			} catch (ServiceException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			}
		} else {
			try {
				
				menuList = menuService.getAllActiveMenus();
				
				request.setAttribute("menuList", menuList);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);

			} catch (ServiceException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			}
		}

	}

}
