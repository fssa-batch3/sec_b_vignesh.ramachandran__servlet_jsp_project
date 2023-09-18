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


<title>Update</title>
</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	User user1 = null;
	user1 = (User) request.getAttribute("userDetails");
	%>


	<!-- main starts -->
	<main>
		<!-- profile starts -->
		<section class="profile">

			<div class="form">
				<div class="top">
					<h2 class="heading">
						<span>Edit</span> Profile
					</h2>

				</div>

				<form action="update?userId=<%=user1.getId()%>" method="post"
					class="profile_form">

					<div>
						<label for="name">Name :</label> <input type="text" name="name"
							id="name" value="<%=user1.getName()%>" pattern="^[a-zA-Z\s]+$"
							title="Enter alphabets only" required>
					</div>
					<div>
						<label for="email">Email :</label> <input type="email"
							name="email" id="email" value="<%=user1.getEmail()%>" readonly>
					</div>
					<div>
						<label for="number">Phone Number :</label> <input type="number"
							name="phone_number" id="phone_number"
							value="<%=user1.getPhoneNumber()%>" readonly>
					</div>
					<div>
						<label for="password">Password :</label> <input type="text"
							name="password" id="password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							value="<%=user1.getPassword()%>"
							title="Must contain at least one number, one uppercase, lowercase and one symbol, and at least 8 or more characters"
							required>
					</div>

					<div>
						<label for="address">Address :</label>
						<textarea type="text" name="address" id="address" rows="3"
							cols="27" required="true" readonly></textarea>
					</div>

					<div id="pattern" style="display: flex">
						<span class="number_pass">Must contain at least one number,</span>
						<span class="upper_pass">one uppercase,</span> <span
							class="lower_pass">one lowercase,</span> <span
							class="symbol_pass">one symbol,</span> <span class="char_pass">and
							at least 8 or more characters</span>
					</div>

					<div id="div_AddBtn">
						<button type="submit" class="edit btn">Save</button>
						<button class="btn addbtn">Address Book</button>
					</div>



				</form>
			</div>
		</section>
		<!-- profile ends -->
	</main>
	<!-- main ends -->


</body>
</html>