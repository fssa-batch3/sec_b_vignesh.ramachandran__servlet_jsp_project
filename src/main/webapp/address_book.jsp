<%@page import="in.fssa.srcatering.model.AddressBook"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Book</title>
<link rel="stylesheet" href="../styles/address_book.css">
</head>
<body>

	<%
	List<AddressBook> addressList = new ArrayList<>();
	addressList = (List<AddressBook>) request.getAttribute("addressList");
	%>

	<main>

		<div class="heading">
			<h1>Address Book</h1>
			<button id="myButton">Add Address</button>
		</div>


		<section class="profile">
			<%if(addressList != null){ 
				for(AddressBook address: addressList){
			%>
					<div class="address_cart">
						<p><%=address.getName()%></p>
						<p><%=address.getPhoneNumber() %></p>
						<p></p>
						<p></p>
						<p></p>
						<p></p>
						<p></p>
						<p></p>
						<p></p>
						<p></p>
						<div class="divBtn">
							<button class="btn default"></button>
						</div>
						<!-- <div class="address_details">   
		                        <p>Name         : S.R.Vignesh</p>
		                        <p>Phone Number : 1234567890</p>	
		                        <p>Email        : vignesh@gmail.com</p>
		                        <p>Door.no      : 33/18</p>
		                        <p>Street name  : Vattikurkkal Street</p>
		                        <p>City         : Kumbakonam</p>
		                        <p>State        : TamilNadu</p>
		                        <p>Pincode      : 612001</p>
						</div> -->
					</div>
				}
				
			}

		</section>
	</main>

</body>

</html>