package in.fssa.srcatering.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.UserService;

@WebServlet("/users")

public class ListUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		
		List<User> userList = new ArrayList<User>();
		
		try {
			userList = userService.getAllUsers();
			request.setAttribute("userList", userList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/user_list.jsp");
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			out.println(e.getMessage());
		}

	}

}
