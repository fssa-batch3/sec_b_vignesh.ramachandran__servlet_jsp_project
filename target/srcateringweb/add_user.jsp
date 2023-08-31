<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.register-form {
	background-color: #ffffff;
	border-radius: 8px;
	padding: 20px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	width: 320px;
	text-align: center;
}

.name_register {
	color: #3498db;
}

label {
	display: inline-block;
	margin-top: 10px;
	text-align: left;
	width: 100%;
	font-weight: bold;
}

input[type="text"], input[type="email"], input[type="password"] {
	width: 100%;
	padding: 8px;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button[type="submit"] {
	background-color: #3498db;
	color: white;
	border: none;
	border-radius: 4px;
	padding: 10px 15px;
	cursor: pointer;
	width: 100%;
}

button[type="submit"]:hover {
	background-color: #2980b9;
}

a {
	color: #3498db;
	text-decoration: none;
	display: inline-block;
	margin-top: 10px;
}

a:hover {
	color: #2980b9;
}
</style>
</head>
<body>

	<div class="register-form">
		<h2 class="name_register">
			<span>Register</span> Here
		</h2>
		<form action="add_user" method="post">
			<label for="name">Name:</label> 
			<input type="text" name="name" required> 
			
			<label for="email">Email ID:</label> 
			<input type="email" name="email" required> 
			
			<label for="phone_number">Phone Number:</label> 
			<input type="text"
				name="phone_number" required> 
			<label>Create
				Password:</label> <input type="password" name="password" required>
			<label>Confirm Password:</label> <input type="password"
				name="cnf_password" required>
			<button type="submit">Register</button>
		</form>
		
		<a href="login">Existing User?</a>
	</div>

</body>
</html>
