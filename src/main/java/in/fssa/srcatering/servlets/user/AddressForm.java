package in.fssa.srcatering.servlets.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.srcatering.exception.ServiceException;
import in.fssa.srcatering.exception.ValidationException;
import in.fssa.srcatering.model.AddressBook;
import in.fssa.srcatering.model.User;
import in.fssa.srcatering.service.AddressBookService;
import in.fssa.srcatering.service.UserService;
import in.fssa.srcatering.util.Logger;

/**
 * Servlet implementation class AddressForm
 */
@WebServlet("/address_form/create")
public class AddressForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/address_form.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		
		String loggedUser = (String) session.getAttribute("loggedUser");
		
		UserService userService = new UserService();
		AddressBookService addressBookService = new AddressBookService();
		
		String menuId = request.getParameter("menuId");
		String categoryId = request.getParameter("categoryId");
		String cartId = request.getParameter("cartId");
		String orderAll = request.getParameter("orderAll");
		
		int userId = -1;
		
		try {
			User user = userService.findByEmail(loggedUser);
			userId = user.getId();
		} catch (Exception e) {
			Logger.error(e);
			out.println("<script>alert('" + e.getMessage() + "');</script>");
			out.println("<script>window.history.back()</script>");
		}
		
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phone_number");
		String streetName = request.getParameter("ship-address");
		String subLocality = request.getParameter("sub_locality");
		String doorNo = request.getParameter("address2");
		String city = request.getParameter("locality");
		String district = request.getParameter("district");
		String state = request.getParameter("state");
		int pincode = Integer.parseInt(request.getParameter("postcode"));
		
		
		AddressBook addressBook = new AddressBook();
		addressBook.setUserId(userId);
		addressBook.setName(name);
		addressBook.setEmail(email);
		addressBook.setPhoneNumber(phoneNumber);
		addressBook.setDoorNo(doorNo);
		addressBook.setStreetName(streetName);
		addressBook.setSubLocality(subLocality);
		addressBook.setCity(city);
		addressBook.setDistrict(district);
		addressBook.setState(state);
		addressBook.setPincode(pincode);
		addressBook.setSetAsdefault(0);
		
		try {
			addressBookService.createAddress(addressBook);
			
			if (menuId != null && categoryId != null) {
				response.sendRedirect(request.getContextPath() + "/user/address?menuId="+menuId+"&categoryId="+categoryId);
			} else if (cartId != null) {
				response.sendRedirect(request.getContextPath() + "/user/address?cartId="+cartId);
			} else if (orderAll != null) {
				response.sendRedirect(request.getContextPath() + "/user/address?orderAll=true");
			} else {
				response.sendRedirect(request.getContextPath() + "/user/address");
			}
			
		} catch (Exception e) {
			Logger.error(e);
			
			String errorMessage = e.getMessage();
			
			request.setAttribute("errorMessage", errorMessage);
			out.println("<script>location.href='" + request.getHeader("Referer") + "';</script>");
			
		}
		
		
	}

}
