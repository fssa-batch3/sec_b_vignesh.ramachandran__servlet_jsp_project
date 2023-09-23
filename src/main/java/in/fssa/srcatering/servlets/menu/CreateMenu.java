package in.fssa.srcatering.servlets.menu;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class CreateMenu
 */
@WebServlet("/menu/create")
public class CreateMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String menuName = request.getParameter("menu_name");
		String image = request.getParameter("menu_image");
		String description = request.getParameter("description");
		
		Menu menu = new Menu();
		menu.setMenuName(menuName);
		menu.setImage(image);
		menu.setDescription(description);
		
		MenuService menuService = new MenuService();
		PrintWriter out = response.getWriter();
		try {
			menuService.createMenu(menu);
			
			String redirectURL = request.getContextPath() + "/menu/new";
	        String alertMessage = "Menu created successfully!";
	        
	        // Using JavaScript to display an alert
	        out.println("<script>alert('" + alertMessage + "');window.location.href='" + redirectURL + "';</script>");
			
//			response.sendRedirect(request.getContextPath()+"/menu/new");
		} catch (Exception e) {
			e.printStackTrace();
			
			out.println("<script>alert('"+ e.getMessage() +"');</script>");
			out.println("<script>window.history.back();</script>");
			
//			String redirectURL = request.getContextPath() + "/menu/new";
//			out.println("<script>alert('"+ e.getMessage() +"');window.location.href='" + redirectURL +"';</script>");
		} 
	}

}
