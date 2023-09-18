<%@page import="in.fssa.srcatering.model.AddressBook"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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

<title>Address Book</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/address_book.css">
</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	List<AddressBook> addressList = new ArrayList<>();
	addressList = (List<AddressBook>) request.getAttribute("addressList");
	%>

	<main>
		<div class="heading">
			<h1>Address Book</h1>
			<a href="<%=request.getContextPath()%>/address_form/create"
				id="myButton">Add Address</a>
		</div>

		<section class="profile">
			<div class="address_cart">
				<%
				for (AddressBook address : addressList) {
				%>
				<div class="address_details">

					<p><%=address.getName()%></p>
					<p><%=address.getEmail()%></p>
					<p><%=address.getPhoneNumber()%></p>
					<p><%=address.getDoorNo()%></p>
					<p><%=address.getStreetName()%></p>
					<p><%=address.getSubLocality()%></p>
					<p><%=address.getCity()%></p>
					<p><%=address.getDistrict()%></p>
					<p><%=address.getState()%></p>
					<p><%=address.getPincode()%></p>
					<div class="divBtn">
						<%
						if (address.isSetAsDefault() == 0) {
							
							if("orderpage".equals(request.getParameter("page"))){%>
						
							<form action="address" method="post">
								<input type="hidden" name="formName" value="setDefaultForm">
								<input type="hidden" name ="addressId" value="<%=address.getId()%>">
								<button class="btn default" type="submit">Set as Default</button> 
							</form>
							
							<%} %>
							<form action="address" method="post">
								<input type="hidden" name="formName" value="setDefaultForm">
								<input type="hidden" name ="addressId" value="<%=address.getId()%>">
								<button class="btn default" type="submit">Set as Default</button> 
							</form>
						
							<form action="address" method="post">
								<input type="hidden" name="formName" value="removeForm">
								<input type="hidden" name ="addressId" value="<%=address.getId()%>">
								<button class="btn remove" data-id="<%=address.getId()%>">Remove</button>
							</form>
						
						<%
						} else {
						%>
						<h3 class="indicator">Default</h3>
						<%
						}
						%>

						<a href="<%=request.getContextPath() %>/address_form/update?addressId=<%=address.getId()%>" class="btn edit" >Edit</a>
					</div>
				</div>
				<%
				}
				%>
			</div>

		</section>
	</main>


	<script type="text/javascript">
	
		function setAsDefault(addressId) {
			// Create an XMLHttpRequest (AJAX) object
		    var xhr = new XMLHttpRequest();

		    // Specify the HTTP method (POST or GET) and the URL of your servlet
		    var method = "POST"; // Use POST if you're updating data on the server
		    var url = "address"; // Replace with the actual URL
		    
		 	// Define the data to send to the servlet (e.g., addressId)
		    var data = "addressId=" + encodeURIComponent(addressId);

		}
	
	</script>



</body>

</html>