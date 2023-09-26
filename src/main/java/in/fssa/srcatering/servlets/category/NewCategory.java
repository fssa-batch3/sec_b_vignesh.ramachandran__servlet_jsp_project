package in.fssa.srcatering.servlets.category;

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
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class NewCategory
 */
@WebServlet("/category/new")
public class NewCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		MenuService menuService = new MenuService();
		Set<Menu> menuList = new HashSet<Menu>();
		
		try {
			
			menuList = menuService.getAllMenus();
			
			request.setAttribute("menuList", menuList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/add_category.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			Logger.error(e);
			
			out.println("<script>alert('"+e.getMessage()+"');</script>");
			out.println("<script>window.history.back();</script>");

//			String errorMessage = e.getMessage();
//			request.setAttribute("errorMessage", errorMessage);
//			RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/error.jsp");
//			dispatcher.forward(request, response);
		}
	}



}
