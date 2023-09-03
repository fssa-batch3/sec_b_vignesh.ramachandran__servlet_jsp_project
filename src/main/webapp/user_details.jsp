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

<title>User Details</title>
<style>
* {
    padding: 0;
    margin: 0;
    text-decoration: none;
    list-style: none;
}
:root {
    --bg-color: #ffffff;
    --second-color: #f54300;
    --thickgreen-color:#4b814b;
    --text-color:#130849;
    --other-color:#ebeef7;
    --p-font:1.2rem;
    --h2-font:1.5rem;
    --big-font:2rem;  
    --name-font:3rem;
    --heading-fontfamily:'Kurale', serif;
    --parah-fontfamily:'Josefin Sans', sans-serif;
}
span {
    color: var(--second-color);
}


.profile {
    display: flex;
    justify-content: center;
}
.form {
    padding: 1rem 2rem;
    margin:2% 0;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

.form h2 {
    text-align: center;
    font-family: var(--heading-fontfamily);
    font-size: var(--big-font);
    color: var(--text-color);
}
.top {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
    justify-items: center;
    align-items: center;
    padding: 1rem 0 1.5rem 0;
}
.delete {
    color: var(--text-color);
    background-color: var(--second-color);
    justify-content: flex-end;
}
.profile_form {
    display: grid;
    gap: 2rem;
}
.profile_form div {
    display: grid;
    grid-template-columns: auto auto;
}
.profile_form div label {
    font-family: var(--heading-fontfamily);
    font-size: var(--h2-font);
    color: var(--text-color);
    font-weight: bold;
}
.profile_form div input {
    color: var(--text-color);
    border: none;
    border-bottom: 1px solid black;
    background-color: var(--bg-color);
    padding-bottom: .2rem;
    padding-left: 1rem;
    font-size: var(--h2-font);
}
.profile_form div textarea {
    color: var(--text-color);
    padding: .2rem .2rem;
    font-family: var(--parah-fontfamily);
    font-size: var(--p-font);
}
#pattern{
    display: none;
    padding: .4rem 0;
    font-size: .9rem;
    font-weight: bold;
    font-family: var(--parah-fontfamily);
    text-align: center;
}
.show_password {
    font-family: var(--parah-fontfamily);
    font-size: var(--p-font);
    color: var(--second-color);
    text-align: center;
    padding: 1rem;
}
.btn_content {
    display: grid;
    grid-template-columns: auto auto;
    align-items: center;
    justify-items: center;
}
.btn {
    font-family: var(--parah-fontfamily);
    font-size: 1rem;
    padding: .625rem 1.25rem;
    border: transparent;
    font-weight: bold;
}
.btn:hover {
    transition: .5s;
    box-shadow: rgba(0, 0, 0, 0.35) 0px -50px 36px -28px inset;
}

.edit {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-around;
    color: var(--text-color);
    background-color: var(--other-color);
    border-radius: 1.25rem;
}
.edit img {
    width: 1.25rem;
    height: 1.25rem;
}

.save {
    color: var(--bg-color);
    background-color: var(--thickgreen-color);
    border-radius: 1.25rem;
}

.back  {
    color: var(--text-color);
    background-color: var(--other-color);
    border-radius: 1.25rem;
}
.logout_button{
    display: grid;
    justify-items: center;
    padding: 1rem;
}
.logout {
    color: var(--bg-color);
    background-color: var(--second-color);
    padding: .5rem 1rem;
    border-radius: 1.25rem;
}
#div_AddBtn {
    display: flex;
    justify-content: center;
}
.addbtn {
    color: var(--bg-color);
    background-color: var(--thickgreen-color);
    border-radius: .4rem;
}

</style>
</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	UserService userService = new UserService();
	%>

	<%
	User user1 = (User) request.getAttribute("userDetails");
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
							title="Enter alphabets only" readonly>
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
						<label for="password">Password :</label> <input type="text"
							name="password" id="password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							value="<%=user1.getPassword()%>"
							title="Must contain at least one number, one uppercase, lowercase and one symbol, and at least 8 or more characters"
							readonly>
					</div>
					

				</div>

				<div class="btn_content">
					<a href="edit?userId=<%=user1.getId()%>">
						<button type="button" class="edit btn">
							<img src="https://iili.io/J9FzxWX.png" alt="edit button">
							<p>Edit profile</p>
						</button>
					</a>
					

				</div>
				<div class="logout_button">
					<a href="logout?userId=<%=user1.getId()%>">
						<button class="logout btn" type="submit" id="logout">Log
							out</button>
					</a>
				</div>
			</div>
		</section>
		<!-- profile ends -->
	</main>
	<!-- main ends -->




</body>
</html>