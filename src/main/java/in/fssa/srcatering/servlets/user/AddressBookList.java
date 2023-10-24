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

import in.fssa.srcatering.model.AddressBook;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.AddressBookService;
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class AddressBook
 */
@WebServlet("/user/address")
public class AddressBookList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		List<AddressBook> addressList = new ArrayList<>();
		AddressBookService addressBookService = new AddressBookService();

		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");
		
		String menuId = request.getParameter("menuId");
		String categoryId = request.getParameter("categoryId");

		if (loggedUser != null) {

			try {
				UserService userService = new UserService();
				User user = userService.findByEmail(loggedUser);

				addressList = addressBookService.getAllAddressesByUserId(user.getId());
			} catch (Exception e) {
				Logger.error(e);
				out.println("<script>alert('" + e.getMessage() + "');</script>");
				out.println("<script>window.history.back()</script>");
			}
		}

		request.setAttribute("addressList", addressList);
		
		if(menuId != null && categoryId != null) {
			request.setAttribute("menuId", menuId);
			request.setAttribute("categoryId", categoryId);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/address_book.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		String loggedUser = (String) session.getAttribute("loggedUser");

		User user = null;

		if (loggedUser != null) {

			try {

				UserService userService = new UserService();
				user = userService.findByEmail(loggedUser);

			} catch (Exception e) {
				Logger.error(e);
				out.println("<script>alert('" + e.getMessage() + "');</script>");
				out.println("<script>window.history.back()</script>");
			}
		}

		AddressBookService addressBookService = new AddressBookService();

		String formName = request.getParameter("formName");

		if ("setDefaultForm".equals(formName)) {
			
			String menuId = request.getParameter("menuId");
			String categoryId = request.getParameter("categoryId");
			String cartId = request.getParameter("cartId");
			String orderAll = request.getParameter("orderAll");
			
			int addressId = Integer.parseInt(request.getParameter("addressId"));

			AddressBook addressBook = new AddressBook();
			try {
				addressBook = addressBookService.getDefaultAddressByUserId(user.getId());
				if (addressBook != null) {
					addressBookService.setAsDefaultFalse(addressBook.getId());
				}
				addressBookService.setAsDefaultTrue(addressId);
				
				if (menuId != null && categoryId != null) {
					response.sendRedirect(request.getContextPath() + "/order/create?menuId="+menuId+"&categoryId="+categoryId);
				} else if (cartId != null) {
					response.sendRedirect(request.getContextPath() + "/order/create?cartId="+cartId);
				} else if (orderAll != null) {
					response.sendRedirect(request.getContextPath() + "/order/all");
				} else {
					response.sendRedirect(request.getContextPath() + "/user/address");
				}					

			} catch (Exception e) {
				Logger.error(e);
				out.println("<script>alert('" + e.getMessage() + "');</script>");
				out.println("<script>window.history.back()</script>");
			}

		} else if (("removeForm".equals(formName))) {

			int addressId = Integer.parseInt(request.getParameter("addressId"));

			try {
				addressBookService.setStatusFalse(addressId);

				response.sendRedirect(request.getContextPath() + "/user/address");

			} catch (Exception e) {
				Logger.error(e);
				out.println("<script>alert('" + e.getMessage() + "');</script>");
				out.println("<script>window.history.back()</script>");
			}

		}

	}

}
