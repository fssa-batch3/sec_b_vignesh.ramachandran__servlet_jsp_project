const signUp = (e) => {
  const name = document.getElementById("name").value;
  const email = document.getElementById("email").value;
  const phone_number = document.getElementById("phone_number").value;
  const password = document.getElementById("password").value;
  const con_password = document.getElementById("con_password").value;
  // let my_uuid = uuidv4();

  const userData = JSON.parse(localStorage.getItem("userData")) || [];

  const exist =
    userData.length &&
    JSON.parse(localStorage.getItem("userData")).some(
      (data) =>
        data.phone_number.toLowerCase() === phone_number.toLowerCase() ||
        data.email.toLowerCase() === email.toLowerCase()
    );

  if (!exist) {
    if (password === con_password) {
      // push into objects
      userData.push({
        name,
        email,
        phone_number,
        password,
      });

      // store data into local storage
      localStorage.setItem("userData", JSON.stringify(userData));
      // console.log(userData);

      // after store data, reset form
      document.querySelector("form").reset();
      document.getElementById("phone_number").focus();
      document.getElementById("email").focus();
      alert("Register Sucessfull ✅");
      window.location.href = "./Login.html";
    } else {
      alert("Incorrect Passowrd ❌");
    }
  } else {
    alert(
      "Sorry the User already Exist!! \n Try with different Phone number or email"
    );
    document.querySelector("form").reset();
  }
  e.preventDefault();
};

const signIn = (e) => {
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;

  const userData = JSON.parse(localStorage.getItem("userData")) || [];
  const exist =
    userData.length &&
    JSON.parse(localStorage.getItem("userData")).some(
      (data) =>
        data.email.toLowerCase() === email.toLowerCase() &&
        data.password.toLowerCase() === password.toLowerCase()
    );
  if (!exist) {
    alert("Invalid Details 😈");
  } else {
    // let email_object = { "email": email };
    localStorage.setItem("user_unique", JSON.stringify(email));
    alert("Login Sucessful ✅");
    window.location.href = "../../index.html";
  }
  e.preventDefault();
};
