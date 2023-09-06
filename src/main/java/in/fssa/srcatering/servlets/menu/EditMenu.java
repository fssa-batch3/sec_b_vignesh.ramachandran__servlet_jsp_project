package in.fssa.srcatering.servlets.menu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.service.MenuService;

/**
 * Servlet implementation class EditMenu
 */
@WebServlet("/menu/edit")
public class EditMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		MenuService menuService = new MenuService();

		Set<Menu> menuList = new TreeSet<>();

		String menuId = request.getParameter("menuId");

		if (menuId == null) {

			try {
				menuList = menuService.getAllMenus();
				request.setAttribute("menuList", menuList);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/update_menu.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			}
		} else {

			int id = Integer.parseInt(request.getParameter("menuId"));

			Menu menu = null;

			try {
				menu = menuService.findByMenuId(id);
				request.setAttribute("menuDetails", menu);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/update_menu.jsp");
				dispatcher.forward(request, response);

			} catch (ValidationException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			} catch (ServiceException e) {
				e.printStackTrace();
				out.println(e.getMessage());
			}
		}

	}

}
