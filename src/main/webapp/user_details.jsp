<%@page import="in.fssa.srcatering.model.AddressBook"%>
<%@page import="in.fssa.srcatering.service.UserService"%>
<%@page import="in.fssa.srcatering.model.User"%>
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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/profile_page.css">

<title>User Details</title>
</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	UserService userService = new UserService();
	%>

	<%
	User user1 = (User) request.getAttribute("userDetails");
	AddressBook addressBook = (AddressBook) request.getAttribute("addressBook");
	%>

	<!-- main starts -->
	<main>
		<!-- profile starts -->
		<section class="profile">

			<div class="form">
				<div class="top">
					<h2 class="heading">
						<span>My</span> Profile
					</h2>
				</div>

				<div class="profile_form">
					<div>
						<label for="name">Name :</label> <input type="text" name="name"
							id="name" value="<%=user1.getName()%>" pattern="^[a-zA-Z\s]+$"
							title="Enter alphabets only" disabled>
					</div>
					<div>
						<label for="email">Email :</label> <input type="email"
							name="email" id="email" value="<%=user1.getEmail()%>" disabled>
					</div>
					<div>
						<label for="number">Phone Number :</label> <input type="number"
							name="phone no." id="phone_number"
							value="<%=user1.getPhoneNumber()%>" disabled>
					</div>
					<div>
						<label for="password">Password :</label> <input type="password"
							name="password" id="password"
							value="********"
							disabled>
					</div>
					
					<div>
						<label for="address">Address :</label>
						
						
					</div>
					
					<%if(addressBook != null){ %>
							<div id="address">
								<%=(addressBook.getDoorNo() + ", " + addressBook.getStreetName() + ", " + addressBook.getSubLocality() 
								+ ", " + addressBook.getCity()+ ", " + addressBook.getDistrict()+ ", " + addressBook.getPincode()).trim() %>
							</div>
							 
							<div id="div_AddBtn">
								<a href="address" class="btn addbtn">
									Address Book
								</a>
							</div>
							 
							 
						 <%} else { %>
						 	<div id="createAdd">
						 		<a href="address" class="btn addbtn">
									Create Address
								</a>
							</div>
						 <%} %>

				</div>

				<div class="btn_content">
					<a href="edit">
						<button type="submit" class="edit btn">
							<img src="https://iili.io/J9FzxWX.png" alt="edit button">
							<p>Edit profile</p>
						</button>
					</a>
					
					<a href="logout?userId=<%=user1.getId()%>">
						<button class="logout btn" type="submit" id="logout">Log
							out</button>
					</a>
					<!-- <a href="../../index.html">
						<button class="btn back" type="button">Back</button>
					</a> -->
				</div>
				
				<div class="logout_button">
					
				</div>
			</div>
		</section>
		<!-- profile ends -->
	</main>
	<!-- main ends -->
	
	<%@include file="/footer2.jsp" %>

	<script>

    const logoutBtn = document.getElementById("logout");
    
    logoutBtn.addEventListener("click", function(event){
    	
    	const confirmation = confirm("Are you sure you want to logout?");
    	
    	if (!confirmation) {
	        event.preventDefault();
	    }
    	
    });
    
	</script>



</body>
</html>