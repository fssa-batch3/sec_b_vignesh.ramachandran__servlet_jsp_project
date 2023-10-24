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
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class UpdateMenu
 */
@WebServlet("/menu/update")
public class UpdateMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MenuService menuService = new MenuService();
		PrintWriter out = response.getWriter();
		
		String menuName = request.getParameter("menu_name");
		String image = request.getParameter("menu_image");
		String description = request.getParameter("description");
		
		int id = Integer.parseInt(request.getParameter("menuId"));
		
		Menu menu = new Menu();
		
		menu.setMenuName(menuName);
		menu.setImage(image);
		menu.setDescription(description);
		menu.setId(id);
		
		try {
			menuService.updateMenu(menu);
			
			String redirectURL = request.getContextPath() + "/menu/edit";
	        String alertMessage = "Menu updated successfully!";
	        
	        // Using JavaScript to display an alert
	        out.println("<script>alert('" + alertMessage + "');window.location.href='" + redirectURL + "';</script>");

		} catch (Exception e) {
			Logger.error(e);
			out.println("<script>alert('" + e.getMessage() + "');</script>");
			out.println("<script>window.history.back()</script>");
//			String redirectURL = request.getContextPath() + "/menu/edit";
//			out.println("<script>alert('"+ e.getMessage() +"');window.location.href='" + redirectURL +"';</script>");
		} 
		
		
		
	}

}
