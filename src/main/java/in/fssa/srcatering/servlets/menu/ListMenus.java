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
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class ListMenus
 */
@WebServlet("/menus")
public class ListMenus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		MenuService menuService = new MenuService();
		Set<Menu> menuList = new TreeSet<Menu>();

		String menu_id = request.getParameter("menuId");

		if (menu_id == null) {
			try {
				menuList = menuService.getAllMenus();
				request.setAttribute("menuList", menuList);

				RequestDispatcher dispatcher = request.getRequestDispatcher("menu_list.jsp");
				dispatcher.forward(request, response);

			} catch (Exception e) {
				Logger.error(e);
				out.println("<script>alert('" + e.getMessage() + "');</script>");
				out.println("<script>window.history.back()</script>");
			}
		} else {

			int menuId = Integer.parseInt(menu_id);

			try {
				Menu menu =  menuService.findByMenuId(menuId);
				menuList.add(menu);
				request.setAttribute("menuList", menuList);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("menu_list.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				Logger.error(e);
				
				out.println("<script>alert('"+ e.getMessage() +"');</script>");
				out.println("<script>window.history.back();</script>");
			} 

		}

	}

}
