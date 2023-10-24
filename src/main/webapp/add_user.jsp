<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link
            href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&
    family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
        >

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300;1,400;1,500;1,600;1,700&family=Kurale&display=swap"
            rel="stylesheet"
        >

        <link
            rel="stylesheet"
            href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
            
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/profile/register.css">


<title>User Registration</title>

</head>
<body>
	
	<%@ include file="/header.jsp"%>

	<!-- main starts -->
        <main>
            <!-- register form starts -->
            <section class="register">
                <form class="register_page" action="create" method="post" id="form_id">
                    <img src="https://iili.io/J93qiue.png" alt="company logo">
                    <h2 class="name_register">
                        <span>Register</span> Here
                    </h2>
                    <label for="name">Name: </label>
                    <input type="text" name="name" placeholder="Enter your name" class="input_box" id="name" pattern="^[a-zA-Z\s]+$"
                        title="Enter alphabets only" required>
                    <label for="email">Email ID: </label>
                    <input type="email" name="email" for="email" placeholder="Enter your email" class="input_box" id="email"
                        pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required>
                    <label for="phone_number">Phone Number: </label>
                    <input type="number" name="phone_number" placeholder="Enter your Mobile number" class="input_box" id="phone_number"
                        title="Enter 10 digit valid phoneNumber" required>
                    <div class="error">

                    </div>
                    <label for="password">Create Password: </label>
                    <input type="password" name="password" placeholder="Enter your password" class="input_box" id="password"
                        pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                        title="Must contain at least one number, one uppercase, lowercase and one symbol, and must 8 characters"
                        required>
                    <div id="pattern">
                        <span class="number_pass">Must contain at least one number,</span>
                        <span class="upper_pass">one uppercase,</span>
                        <span class="lower_pass">one lowercase,</span>
                        <span class="symbol_pass">one symbol,</span>
                        <span class="char_pass">and must 8 characters</span>
                    </div>
                    <label for="con_password">Confirm Password: </label>
                    <input type="password" name="cnf_password" placeholder="Re-Enter your password" class="input_box" id="con_password"
                        required>
                    <div class="forget">
                        <input type="checkbox" id="show">
                        <label>Show password</label>
                    </div>

                    <div class="for_button">
                        <button class="btn_submit" type="submit">Register</button>
                        <a href="login" class="exciting_user" type="submit">Existing User?</a>
                    </div>
                </form>
            </section>
            <!-- register form ends -->
        </main>
        <!-- main ends -->
	
	<script>
        const mobileInput = document.getElementById("phone_number");
        const errorMessage = document.querySelector(".error");

        mobileInput.addEventListener("input", () => {
          const inputValue = mobileInput.value.trim(); // remove leading/trailing whitespace
          const isValidInput =
            /^[6-9]\d{9}$/.test(inputValue) && !/^\d*(\d)\1{9}\d*$/.test(inputValue);
          if (!isValidInput || inputValue === "") {
            if (inputValue === "") {
              errorMessage.textContent = "Please enter a mobile number.";
            }
            if (/^\d+$/.test(inputValue)) {
              errorMessage.textContent = "Enter a valid 10-digit mobile number.";
            } else {
              errorMessage.textContent = "Please enter digits only.";
            }
            errorMessage.style.color = "var(--second-color)";
          } else {
            errorMessage.textContent = "";
          }
        });

     // show password
        const Password = document.querySelector("#password");
        const CnfPassword = document.querySelector("#con_password");
        const Checkbox = document.querySelector("#show");

        Checkbox.addEventListener("click", () => {
          const type =
    Password.getAttribute("type") === "password" ? "text" : "password";
          Password.setAttribute("type", type);

          const cnfType = CnfPassword.getAttribute("type") === "password" ? "text" : "password";
    CnfPassword.setAttribute("type", cnfType);
        });

        // password pattern recognization
        const password = document.getElementById("password");

        const number_pass = document.querySelector(".number_pass");
        const upper_pass = document.querySelector(".upper_pass");
        const lower_pass = document.querySelector(".lower_pass");
        const symbol_pass = document.querySelector(".symbol_pass");
        const char_pass = document.querySelector(".char_pass");

        password.addEventListener("input", () => {
          const password_value = password.value;

          // check upper case
          const has_upper = /[A-Z]/.test(password_value);
          if (has_upper === true) {
            upper_pass.style.color = "green";
          } else {
            upper_pass.style.color = "var(--second-color)";
          }

          // check lower case
          const has_lower = /[a-z]/.test(password_value);
          if (has_lower === true) {
            lower_pass.style.color = "green";
          } else {
            lower_pass.style.color = "var(--second-color)";
          }

          // check number
          const has_symbol = /[!@#$%^&*_=+-]/.test(password_value);
          if (has_symbol === true) {
            symbol_pass.style.color = "green";
          } else {
            symbol_pass.style.color = "var(--second-color)";
          }

          // check char
          const has_number = /\d/.test(password_value);
          if (has_number === true) {
            number_pass.style.color = "green";
          } else {
            number_pass.style.color = "var(--second-color)";
          }

          // check length
          const char_length = password_value.length >= 8;
          if (char_length === true) {
            char_pass.style.color = "green";
          } else {
            char_pass.style.color = "var(--second-color)";
          }
        });
        
       
        
		const formId = document.getElementById("form_id");

	 	formId.addEventListener("submit", function(event){
			
	 		console.log(formId);
			
			const name = document.getElementById("name").value;
			const email = document.getElementById("email").value;
			const number = document.getElementById("phone_number").value;
			const password = document.getElementById("password").value;
			
			if(name.trim() == ""){
				alert("Name Cannot be empty");
				event.preventDefault();
			}
			
			if(email.trim() == ""){
				alert("Email Cannot be empty");
				event.preventDefault();
			}
			
			if(password.trim() == ""){
				alert("Password Cannot be empty");
				event.preventDefault();
			}
			
			if(password.length() < 8 || password.length() > 8){
				alert("Password contains 8 characters only");
				event.preventDefault();
			}
			
			if(number < 6000000000 || number > 10000000000){
				alert("Enter a valid phone number");
				event.preventDefault();
			}
	

		});

    </script>

</body>
</html>
