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
import in.fssa.srcatering.service.AddressBookService;

/**
 * Servlet implementation class AddressUpdate
 */
@WebServlet("/address_form/update")
public class AddressUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String addressId = (String) request.getParameter("addressId");
		
		AddressBookService addressBookService = new AddressBookService();
		
		if(addressId != null) {
			AddressBook addressBook = new AddressBook();
			
			try {
				addressBook = addressBookService.getAddressByAddressId(Integer.parseInt(addressId));
				
				request.setAttribute("address", addressBook);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/address_form.jsp");
				dispatcher.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		int addressId = Integer.parseInt(request.getParameter("addressId"));
		AddressBookService addressBookService = new AddressBookService();
		AddressBook addressBook1 = new AddressBook();
		
		try {
			addressBook1 = addressBookService.getAddressByAddressId(addressId);
		} catch (Exception e) {
			e.printStackTrace();
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
		
		addressBook.setId(addressBook1.getId());
		addressBook.setUserId(addressBook1.getUserId());
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
		addressBook.setSetAsdefault(addressBook1.isSetAsDefault());
		
		try {
			addressBookService.updateAddress(addressBook);
			
			response.sendRedirect(request.getContextPath()+"/user/address");
			
			System.out.println("Address Updated sucessfully");
			
		} catch (Exception e) {
			e.printStackTrace();
			
			String errorMessage = e.getMessage();
			out.println("<script>alert('" + errorMessage + "');</script>");
			response.sendRedirect(errorMessage);

		}
		
	}

}
