package in.fssa.srcatering.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.AddressBook;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.AddressBookService;
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class ListUserDetails
 */
@WebServlet("/user/details")
public class ListUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String loggedUser = (String) request.getSession().getAttribute("loggedUser");

		PrintWriter out = response.getWriter();
		UserService userService = new UserService();
		AddressBookService addressBookService = new AddressBookService();
		User user = null;
		AddressBook addressBook = new AddressBook();

		if (loggedUser != null) {

			try {
				user = (User) userService.findByEmail(loggedUser);
				Logger.debug(user);

				addressBook = addressBookService.getDefaultAddressByUserId(user.getId());

				request.setAttribute("userDetails", user);
				request.setAttribute("addressBook", addressBook);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/user_details.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				Logger.error(e);
				out.println(e.getMessage());
			} 

		} else {
			
			int id = Integer.parseInt(request.getParameter("userId"));

			try {
				user = userService.findByUserId(id);

				request.setAttribute("userDetails", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/user_details.jsp");
				dispatcher.forward(request, response);

			} catch (Exception e) {
				Logger.error(e);
				out.println(e.getMessage());
			}

		}

	}

}
