<%@page import="in.fssa.srcatering.model.AddressBook"%>
<%@page import="in.fssa.srcatering.service.AddressBookService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<head>
<meta charset="ISO-8859-1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&
    family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&family=Kurale&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/address_form.css">

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGhGk3DTCkjF1EUxpMm5ypFoQ-ecrS2gY&callback=initAutocomplete&libraries=places&v=weekly"
	defer></script>

<title>Address Form</title>
</head>
<body>

	<%@ include file="/header.jsp"%>

	<main>

		<section>

			<%
			AddressBook addressBook = (AddressBook) request.getAttribute("address");
			if (addressBook != null) {
			%>

			<form action="update" method="post" id="address-form">

				<img src="<%=request.getContextPath()%>/assets/img/main-logo.png"
					alt="logo" class="logo">
				<h2>Address Form</h2>
				
				<input type="hidden" name="addressId" value="<%=addressBook.getId()%>">

				<label class="full-field"> <span class="form-lable">Name</span>
					<input type="text" id="name" name="name" pattern="^[a-zA-Z\s]+$" value="<%=addressBook.getName() %>"
					title="Enter alphabets only" required>
				</label> 
				<label class="full-field"> <span class="form-label">Email</span>
					<input type="email" id="email" name="email" value="<%=addressBook.getEmail() %>"
					pattern="^([a-z]+[a-z0-9_+\-\. ]*[a-z0-9]+)@(gmail|fssa|yahoo|hotmail|outlook)\.(freshworks.com|com|net|org|edu|in)$"
					required>
				</label> 
				<label class="full-field"> <span class="form-label">Phone
						Number</span> <input type="tel" name="phone_number" id="phone_number" value="<%=addressBook.getPhoneNumber() %>"
					required>
				</label>

				<div class="error"></div>

				<label class="full-field"> <span class="form-label">Street
						Name*</span> <input id="ship-address" name="ship-address" value="<%=addressBook.getStreetName() %>" required>
				</label> 
				<label class="full-field"> <span class="form-lable">Locality</span>
					<input type="text" id="sub_locality" name="sub_locality" value="<%=addressBook.getSubLocality()%>" required>
				</label> 
				<label class="full-field"> <span class="form-label">Mahal
						Name (or) Door.no </span> <input id="address2" name="address2" value="<%=addressBook.getDoorNo()%>" >
				</label> 
				
				<label class="full-field"> <span class="form-label">City</span>
					<input id="locality" name="locality" pattern="^[a-zA-Z\s]+$" value="<%=addressBook.getCity()%>" 
					title="Enter alphabets only" required>
				</label> 
				<label class="full-field"> <span class="form-label">District</span>
					<input id="district" name="district" pattern="^[a-zA-Z\s]+$" value="<%=addressBook.getDistrict()%>" 
					title="Enter alphabets only" required>
				</label> 
				<label class="full-field"> <span class="form-label">State</span>
					<input id="state" name="state" pattern="TN" value="<%=addressBook.getState()%>" 
					title="Sorry for the inconvenience. We are currntly available only in TamilNadu"
					required>
				</label> 
				<label class="full-field" for="postal_code"> <span
					class="form-label">Postal code</span> <input id="postcode"
					name="postcode" pattern="6[0-9]{5,}" value="<%=addressBook.getPincode()%>" 
					title="Please enter a valid Tamil Nadu pincode (starting with 6, minimum 6 digits)."
					required>
				</label>

				<div class="divBtn">
					<button type="submit" class="btn save" id="saveaddress">Save
						address</button>
				</div>

			</form>

			<%
			} else {
			%>

			<form action="create" method="post" id="address-form">

				<img src="<%=request.getContextPath()%>/assets/img/main-logo.png"
					alt="logo" class="logo">
				<h2>Address Form</h2>

				<label class="full-field"> <span class="form-lable">Name</span>
					<input type="text" id="name" name="name" pattern="^[a-zA-Z\s]+$"
					title="Enter alphabets only" required>
				</label> <label class="full-field"> <span class="form-label">Email</span>
					<input type="email" id="email" name="email"
					pattern="^([a-z]+[a-z0-9_+\-\. ]*[a-z0-9]+)@(gmail|fssa|yahoo|hotmail|outlook)\.(freshworks.com|com|net|org|edu|in)$"
					required>
				</label> <label class="full-field"> <span class="form-label">Phone
						Number</span> <input type="tel" name="phone_number" id="phone_number"
					required>
				</label>

				<div class="error"></div>

				<label class="full-field"> <span class="form-label">Street
						Name*</span> <input id="ship-address" name="ship-address" required>
				</label> <label class="full-field"> <span class="form-lable">Locality</span>
					<input type="text" id="sub_locality" name="sub_locality" required>
				</label> <label class="full-field"> <span class="form-label">Mahal
						Name (or) Door.no </span> <input id="address2" name="address2">
				</label> <label class="full-field"> <span class="form-label">City</span>
					<input id="locality" name="locality" pattern="^[a-zA-Z\s]+$"
					title="Enter alphabets only" required>
				</label> <label class="full-field"> <span class="form-label">District</span>
					<input id="district" name="district" pattern="^[a-zA-Z\s]+$"
					title="Enter alphabets only" required>
				</label> <label class="full-field"> <span class="form-label">State</span>
					<input id="state" name="state" pattern="TN"
					title="Sorry for the inconvenience. We are currntly available only in TamilNadu"
					required>
				</label> <label class="full-field" for="postal_code"> <span
					class="form-label">Postal code</span> <input id="postcode"
					name="postcode" pattern="6[0-9]{5,}"
					title="Please enter a valid Tamil Nadu pincode (starting with 6, minimum 6 digits)."
					required>
				</label>

				<div class="divBtn">
					<button type="submit" class="btn save" id="saveaddress">Save
						address</button>
				</div>

			</form>
			<%
			}
			%>
		</section>

	</main>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/JS/address_form.js"></script>
</body>
</html>