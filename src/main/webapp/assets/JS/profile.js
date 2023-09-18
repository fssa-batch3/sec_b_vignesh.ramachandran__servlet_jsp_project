const userData = JSON.parse(localStorage.getItem("userData"));
const user_unique = JSON.parse(localStorage.getItem("user_unique"));
const addressData = JSON.parse(localStorage.getItem("addressData"));

window.addEventListener("popstate", (event) => {
  if (!isloggedin()) {
    event.preventDefault();
    window.location.href = `${root}/pages/profile/Login.html`;
  }
});

function isloggedin() {
  // const user_id = JSON.parse(localStorage.getItem("user_unique"))
  if (user_id) {
    return true;
  }

  return false;
}

if (!isloggedin()) {
  window.location.href = `${root}/pages/profile/Login.html`;
}

const Password = document.querySelector("#password");
const Checkbox = document.querySelector("#show");

Checkbox.addEventListener("click", () => {
  const type =
    Password.getAttribute("type") === "password" ? "text" : "password";
  Password.setAttribute("type", type);
});

const findUser = userData.find((data) => data.email === user_unique);
// console.log(findUser);

// function profile_data(e) {
//   return e.email == user_unique;
// }

// // finding the userData which unique_id correctly matches
// const findUser = userData.find(profile_data);

// inserting the data (values) to the correct place in the profile
document.getElementById("name").value = findUser.name;
document.getElementById("email").value = findUser.email;
document.getElementById("phone_number").value = findUser.phone_number;
document.getElementById("password").value = findUser.password;

if (addressData) {
  const findUserAddress = addressData.filter(
    (data) => data.userId === user_unique
  );
  // console.log(findUserAddress);

  const findDefault = findUserAddress.find((data) => data.default === "true");
  // console.log(findDefault);

  if (findDefault) {
    const address = document.getElementById("address");
    address.value = `${findDefault.door_no} , ${findDefault.street_name} , ${findDefault.sub_locality} , ${findDefault.city} , ${findDefault.district} , ${findDefault.pincode}.`;
  }
}

// delete account function

// function deleteAcc() {
//     if (confirm("Are you sure to delete this account ?")) {

//         //get value from local storage
//         let user_unique = JSON.parse(localStorage.getItem("user_unique"));
//         // let unique_id = unique_id_1["email"]
//         let userData = JSON.parse(localStorage.getItem("userData"));

//         function profile_data(e) {
//             return e.email == user_unique;
//         }

//         // finding the userData which user_unique correctly matches
//         let findUser = userData.find(profile_data);

//         // find the index of findUser from userData
//         let result = userData.indexOf(findUser);

//         // deleting the indexof person data
//         userData.splice(result, 1);

//         alert("Your Account was deleted")
//         localStorage.setItem("userData", JSON.stringify(userData));

//         window.location.href = "../../index.html";
//     }
// }

// logout function
// function logOut() {
//     if (confirm("Are you going to Logout ?")) {

//         // deleting the unique_id of person data
//         localStorage.setItem("user_id", "");
//         window.location.href = "../../index.html";
//     }
// }

function update(e) {
  // getting the updated data from the input field
  const up_name = document.getElementById("name").value;
  const up_password = document.getElementById("password").value;
  // paste the updated data to the correct object
  findUser.name = up_name;
  findUser.password = up_password;
  // again paste it to the
  localStorage.setItem("userData", JSON.stringify(userData));
  window.location.reload();
}

// edit button
const edit = document.querySelector(".edit");
edit.addEventListener("click", findReadonly);

// save button
// const save = document.querySelector(".save");

// save.addEventListener("click", update)
// save.addEventListener("click", findReadonly1)
const save = (e) => {
  update();
  findReadonly1();

  e.preventDefault();
};

function findReadonly(e) {
  document.getElementById("name").removeAttribute("readonly");
  document.getElementById("password").removeAttribute("readonly");
  document.querySelector(".save").removeAttribute("style");
  document.querySelector(".edit").setAttribute("style", "display:none");
  const head = document.querySelector(".heading");
  head.innerHTML = "<span>My</span> Profile-Edit";
  document
    .querySelector("#pattern")
    .setAttribute("style", "display:inline-block");
}

function findReadonly1(e) {
  document.getElementById("name").setAttribute("readonly", "true");
  document.getElementById("password").setAttribute("readonly", "true");
  document.querySelector(".save").setAttribute("style", "display:none");
  document.querySelector(".edit").setAttribute("style", "display:flex");
  document.querySelector("#pattern").removeAttribute("style");
}

// address book button function
const addressBtn = document.querySelector(".addbtn");
addressBtn.addEventListener("click", (e) => {
  e.preventDefault();
  window.location.href = `${root}/pages/profile/address_book.html?userId=${user_unique}`;
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
