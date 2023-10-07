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

				<input type="hidden" name="addressId"
					value="<%=addressBook.getId()%>"> <label class="full-field">
					<span class="form-lable">Name</span> <input type="text" id="name"
					name="name" pattern="^[a-zA-Z\s]+$"
					value="<%=addressBook.getName()%>" title="Enter alphabets only"
					required>
				</label> <label class="full-field"> <span class="form-label">Email</span>
					<input type="email" id="email" name="email"
					value="<%=addressBook.getEmail()%>"
					pattern="^[A-Za-z0-9+_.-]+@(.+)$"
					required>
				</label> <label class="full-field"> <span class="form-label">Phone
						Number</span> <input type="tel" name="phone_number" id="phone_number"
					value="<%=addressBook.getPhoneNumber()%>" required>
				</label>

				<div class="error"></div>

				<label class="full-field"> <span class="form-label">Street
						Name*</span> <input id="ship-address" name="ship-address"
					value="<%=addressBook.getStreetName()%>" required>
				</label> <label class="full-field"> <span class="form-lable">Locality</span>
					<input type="text" id="sub_locality" name="sub_locality"
					value="<%=addressBook.getSubLocality()%>" required>
				</label> <label class="full-field"> <span class="form-label">
						Door.no </span> <input id="address2" type="text" name="address2"
					value="<%=addressBook.getDoorNo()%>">
				</label> <label class="full-field"> <span class="form-label">City</span>
					<input id="locality" name="locality" pattern="^[a-zA-Z\s]+$"
					value="<%=addressBook.getCity()%>" title="Enter alphabets only"
					required>
				</label> <label class="full-field"> <span class="form-label">District</span>
					<input id="district" name="district" pattern="^[a-zA-Z\s]+$"
					value="<%=addressBook.getDistrict()%>" title="Enter alphabets only"
					required>
				</label> <label class="full-field"> <span class="form-label">State</span>
					<input id="state" name="state" pattern="TN"
					value="<%=addressBook.getState()%>"
					title="Sorry for the inconvenience. We are currntly available only in TamilNadu"
					required>
				</label> <label class="full-field" for="postal_code"> <span
					class="form-label">Postal code</span> <input id="postcode"
					name="postcode" pattern="6[0-9]{5,}"
					value="<%=addressBook.getPincode()%>"
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

			String menuId = request.getParameter("menuId");
			String categoryId = request.getParameter("categoryId");
			String cartId = request.getParameter("cartId");
			String orderAll = request.getParameter("orderAll");
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
					pattern="^[A-Za-z0-9+_.-]+@(.+)$" required>
				</label> <label class="full-field"> <span class="form-label">Phone
						Number</span> <input type="tel" name="phone_number" id="phone_number"
					required>
				</label>

				<div class="error"></div>

				<label class="full-field"> <span class="form-label">Street
						Name*</span> <input id="ship-address" name="ship-address" required>
				</label> <label class="full-field"> <span class="form-lable">Locality</span>
					<input type="text" id="sub_locality" name="sub_locality" required>
				</label> <label class="full-field"> <span class="form-label">
						Door.no </span> <input type="text" id="address2" name="address2">
				</label> <label class="full-field"> <span class="form-label">City</span>
					<input id="locality" name="locality" pattern="^[a-zA-Z\s]+$"
					title="Enter alphabets only" required>
				</label> <label class="full-field"> <span class="form-label">District</span>
					<input id="district" name="district" pattern="^[a-zA-Z\s]+$"
					title="Enter alphabets only" required>
				</label> <label class="full-field"> <span class="form-label">State</span>
					<input id="state" name="state" pattern="TN"
					title="Sorry for the inconvenience. We are currntly available only in TamilNadu so Enter TN"
					required>
				</label> 
				<label class="full-field" for="postal_code"> <span
					class="form-label">Postal code</span>
					<input id="postcode" type="number" name="postcode" pattern="6[0-9]{5,}" min="600001" max="643253"
					title="Please enter a valid Tamil Nadu pincode (starting with 6, minimum 6 digits)."
					required>
				</label>

				<div class="pincode_message">
					<span>Delivery is available exclusively within the state
						of Tamil Nadu</span> <span>Please provide a valid Tamil Nadu PIN
						code.</span>
				</div>

				<%
				if (menuId != null && categoryId != null) {
				%>
				<input type="hidden" name="menuId"
					value="<%=Integer.parseInt(menuId)%>"> <input type="hidden"
					name="categoryId" value="<%=Integer.parseInt(categoryId)%>">
				<%
				} else if (cartId != null) {
				%>
				<input type="hidden" name="cartId"
					value="<%=Integer.parseInt(cartId)%>">
				<%
				} else if (orderAll != null) {
				%>
				<input type="hidden" name="orderAll" value="true">
				<%
				}
				%>

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

	<script>

			const nameInput = document.getElementById("name");
	        const emailInput = document.getElementById("email");
	        const phoneNumberInput = document.getElementById("phone_number");
	        const shipAddressInput = document.getElementById("ship-address");
	        const subLocalityInput = document.getElementById("sub_locality");
	        const address2Input = document.getElementById("address2");
	        const localityInput = document.getElementById("locality");
	        const districtInput = document.getElementById("district");
	        const stateInput = document.getElementById("state");
	        const postcodeInput = document.getElementById("postcode");
	        
	        
	     // Function to create and display an error message next to an input field
	        function displayErrorMessage(inputElement, message) {
	            const errorElement = inputElement.nextElementSibling;
	            
	            if (!errorElement) {
	                // Create a new error element if it doesn't exist
	                const newErrorElement = document.createElement("span");
	                newErrorElement.className = "error-message";
	                inputElement.parentNode.appendChild(newErrorElement);
	                newErrorElement.innerHTML = message;
	            } else {
	            	errorElement.innerHTML = message;
	            }
	            
	            
	            
	        }

	        // Function to remove the error message element if it exists
	        function removeErrorMessage(inputElement) {
	            const errorElement = inputElement.nextElementSibling;
	            if (errorElement) {
	                errorElement.remove();
	            }
	        }

	        // Function to validate a single input field and display or remove error message
	        function validateInput(inputElement) {
	            if (inputElement.value.trim() === "") {
	                // Display an error message for the empty field
	                displayErrorMessage(inputElement, "This field is required.");
	            } else {
	                // Remove the error message if it exists
	                removeErrorMessage(inputElement);
	            }
	        }
	        
	     // Add event listeners to each input field
	        document.getElementById("name").addEventListener("change", function () {
	            validateInput(this);
	        });

	        document.getElementById("email").addEventListener("change", function () {
	            validateInput(this);
	        });

	        document.getElementById("phone_number").addEventListener("change", function () {
	            validateInput(this);
	        });

	        document.getElementById("ship-address").addEventListener("change", function () {
	            validateInput(this);
	        });

	        document.getElementById("sub_locality").addEventListener("change", function () {
	            validateInput(this);
	        });

	        document.getElementById("address2").addEventListener("change", function () {
	            validateInput(this);
	        });

	        document.getElementById("locality").addEventListener("change", function () {
	            validateInput(this);
	        });

	        document.getElementById("district").addEventListener("change", function () {
	            validateInput(this);
	        });

	        document.getElementById("state").addEventListener("change", function () {
	            validateInput(this);
	        });

	        document.getElementById("postcode").addEventListener("change", function () {
	            validateInput(this);
	        });
	        
	        const pincodeInput = document.getElementById("postcode");
	        
	        pincodeInput.addEventListener("change", function(){
	        	
	        	if(pincodeInput.value < 600001 || pincodeInput.value > 643253 ){
	        		alert("Enter a valid TamilNadu pincode");
	        	}
	        	
	        })
	        
	        
	        const formId = document.getElementById("address-form");

	        formId.addEventListener("submit", function(event) {	        	
	        
	            // Get references to the input fields
	            const nameInput = document.getElementById("name");
	            const emailInput = document.getElementById("email");
	            const phoneNumberInput = document.getElementById("phone_number");
	            const shipAddressInput = document.getElementById("ship-address");
	            const subLocalityInput = document.getElementById("sub_locality");
	            const address2Input = document.getElementById("address2");
	            const localityInput = document.getElementById("locality");
	            const districtInput = document.getElementById("district");
	            const stateInput = document.getElementById("state");
	            const postcodeInput = document.getElementById("postcode");

	            // Validation function to check if a field is empty
	            function validateNotEmpty(inputElement) {
	                if (inputElement.value.trim() === "") {
	                    event.preventDefault();
	                    alert(inputElement.name+" field cannot be empty");
	                }
	            }

	            // Perform validation for each input field
	            validateNotEmpty(nameInput);
	            validateNotEmpty(emailInput);
	            validateNotEmpty(phoneNumberInput);
	            validateNotEmpty(shipAddressInput);
	            validateNotEmpty(subLocalityInput);
	            validateNotEmpty(address2Input);
	            validateNotEmpty(localityInput);
	            validateNotEmpty(districtInput);
	            validateNotEmpty(stateInput);
	            validateNotEmpty(postcodeInput);
	            
	            if(postcodeInput.value < 600001 || postcodeInput.value > 643253){
	            	event.preventDefault();
	            	alert("Enter a valid TamilNadu pincode");
	            }
	           
	            <%-- var errorMessage = '<%=request.getAttribute("errorMessage")%>';
		    	    if (errorMessage != null && errorMessage.trim() !== "") {
		    	        alert(errorMessage);
		    	    } --%>
	    	    
	    	    });
	        
			
	</script>





</body>
</html>