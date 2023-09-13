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
import javax.servlet.http.HttpSession;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.AddressBookService;
import in.fssa.srcatering.service.UserService;

/**
 * Servlet implementation class AddressBook
 */
@WebServlet("/user/addresses")
public class AddressBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		List<in.fssa.srcatering.model.AddressBook> addressList = new ArrayList<>();
		AddressBookService addressBookService = new AddressBookService();
		
		
		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");
		
		
		
		if(loggedUser != null) {

			try {
				UserService userService = new UserService();
				User user = userService.findByEmail(loggedUser);
				
				addressList = addressBookService.getAllAddressesByUserId(user.getId());
			} catch (ValidationException | ServiceException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("addressList", addressList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/address_book.jsp");
		dispatcher.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
