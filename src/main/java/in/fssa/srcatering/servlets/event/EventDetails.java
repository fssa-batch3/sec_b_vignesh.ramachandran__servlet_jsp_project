package in.fssa.srcatering.servlets.event;

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

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.model.Menu;
import in.fssa.srcatering.service.MenuService;

/**
 * Servlet implementation class EventDetails
 */
@WebServlet("/event/details")
public class EventDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		MenuService menuService = new MenuService();
		Set<Menu> menuList = new HashSet<>();
		try {
			menuList = menuService.getAllActiveMenus();
			
			request.setAttribute("menuList", menuList);
		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+e.getMessage()+"');</script>");
			out.println("<script>window.history.back();</script>");
		}
		
		String eventName = request.getParameter("eventName");
		
		request.setAttribute("eventName", eventName);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/event.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
