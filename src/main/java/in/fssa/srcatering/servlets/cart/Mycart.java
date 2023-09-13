package in.fssa.srcatering.servlets.cart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Mycart
 */
@WebServlet("/mycart")
public class Mycart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mycart.jsp");
		dispatcher.forward(request, response);
		
		
//		if(loggedUser == null) {
//			response.sendRedirect("/dishes?menuId=<%=menuId%>&categoryId=<%=categoryId%>");
//		}
		
		
	}



}
