const cartId = new URLSearchParams(window.location.search).get("cartId");
// const orderStatus = new URLSearchParams(window.location.search).get(
//   "orderStatus"
// );

const cartData = JSON.parse(localStorage.getItem("cartData"));
const userData = JSON.parse(localStorage.getItem("userData"));
const user_unique = JSON.parse(localStorage.getItem("user_unique"));
// let menuData = JSON.parse(localStorage.getItem("menuData"));
const categoryData = JSON.parse(localStorage.getItem("categoryData"));
// const dishData = JSON.parse(localStorage.getItem("dishData"));
const addressData = JSON.parse(localStorage.getItem("addressData")) || [];

const find_user = userData.filter((data) => data.email === user_unique);

const cartData_user = cartData.filter((data) => data.user_id === user_unique);

// back function from myorders
const cartId_url = new URLSearchParams(window.location.search).get("cartId");
const cartStatus = new URLSearchParams(window.location.search).get(
  "cartStatus"
);

function isloggedin() {
  if (user_unique) {
    return true;
  }
  return false;
}
// isloggedin();

if (cartStatus === "false" && cartData_user.length === 0) {
  window.addEventListener("popstate", (event) => {
    if (isloggedin()) {
      event.preventDefault();
      window.location.href = `${root}/index.html`;
      console.log("arajini");
    }
  });

  if (isloggedin()) {
    window.location.href = `${root}/index.html`;
  }
} else if (cartId_url) {
  // const find_user_1 = userData_1.filter(
  //   (data) => data.email == user_unique
  // );

  const cartData_user_1 = cartData.filter(
    (data) => data.user_id === user_unique
  );

  // console.log(cartData_user_1);

  const find_cartId = cartData_user_1.find(
    (data) => data.uniqueId === cartId_url
  );

  if (find_cartId === undefined) {
    window.addEventListener("popstate", (event) => {
      if (isloggedin()) {
        event.preventDefault();
        window.location.href = `${root}/index.html`;
      }
    });

    // function isloggedin() {
    //   // const user_id = JSON.parse(localStorage.getItem("user_unique"))
    //   if (user_id) {
    //     return true;
    //   }
    //   return false;
    // }

    if (isloggedin()) {
      window.location.href = `${root}/index.html`;
    }
  }
}
// back function from myorders end

// get data from userData
// document.getElementById("name").value = find_user[0].name;
// document.getElementById("email").value = find_user[0].email;
// document.getElementById("phone_number").value = find_user[0].phone_number;

// getting default address
const findUserAddress = addressData.filter(
  (data) => (data.userId = user_unique)
);

let defaultAddress = "";
let addressId = "";

if (findUserAddress) {
  defaultAddress = findUserAddress.find((data) => data.default === "true");
  // console.log(defaultAddress);

  if (defaultAddress) {
    document.getElementById("address").value = `${defaultAddress.name} ,
    ${defaultAddress.email} , 
    ${defaultAddress.phone_number} ,
    ${defaultAddress.door_no} , ${defaultAddress.street_name} , 
    ${defaultAddress.sub_locality} , ${defaultAddress.city} , 
    ${defaultAddress.district} - ${defaultAddress.pincode}`;

    // getting default address
    addressId = defaultAddress.addressId;
    // console.log(addressId);
  }
}
// console.log(defaultAddress);
// console.log(addressId);

const changeAdd = document.querySelector(".changeAdd");
changeAdd.addEventListener("click", (e) => {
  e.preventDefault();
  window.location.href = `../profile/address_book.html?userId=${user_unique}`;
});

if (cartId) {
  const cartdetails = cartData_user.filter((data) => data.uniqueId === cartId);

  const menuId = cartdetails[0].menu_id;

  // for getting menu name from url
  const menu_name = menuData.find((data) => data.id === menuId);
  // console.log(menu_name)

  const categoryId = cartdetails[0].category_id;

  // for getting category name from url
  const category_name = categoryData.find((data) => data.id === categoryId);
  // console.log(category_name);

  let totalCost = 0;

  for (let i = 0; i < cartdetails.length; i++) {
    const div_seperation = document.createElement("div");
    div_seperation.setAttribute("class", "seperation");

    const h2_heading = document.createElement("h2");
    h2_heading.innerText = `${category_name.categoryName} ${menu_name.menuName}`;
    div_seperation.append(h2_heading);

    // button = document.createElement("button");
    // button("class", "btn update")

    // div for menu & category name
    const div_1 = document.createElement("div");
    div_seperation.append(div_1);

    const label_1 = document.createElement("label");
    label_1.setAttribute("for", "");
    label_1.innerText = "No.of.guest:";
    div_1.append(label_1);

    const input_1 = document.createElement("input");
    input_1.setAttribute("type", "number");
    input_1.setAttribute("id", "no_of_guest");
    input_1.setAttribute("min", "1");
    input_1.setAttribute("readonly", "true");
    input_1.value = cartdetails[i].noOfGuest;
    div_1.append(input_1);

    // div for price
    const div_2 = document.createElement("div");
    div_seperation.append(div_2);

    const label_2 = document.createElement("label");
    label_2.setAttribute("for", "");
    label_2.innerText = "Price:";
    div_2.append(label_2);

    const input_2 = document.createElement("input");
    input_2.setAttribute("type", "number");
    input_2.setAttribute("id", "price");
    input_2.setAttribute("readonly", "true");
    input_2.value = cartdetails[i].totalCost * cartdetails[i].noOfGuest;
    div_2.append(input_2);

    // div for delivery date
    const div_3 = document.createElement("div");
    div_seperation.append(div_3);

    const label_3 = document.createElement("label");
    label_3.setAttribute("for", "");
    label_3.innerText = "Delivery Date:";
    div_3.append(label_3);

    const input_3 = document.createElement("input");
    input_3.setAttribute("type", "date");
    input_3.setAttribute("id", "delivery_date");
    input_3.setAttribute("readonly", "true");
    input_3.value = cartdetails[i].dateOfDelivery;
    div_3.append(input_3);

    const ensure = document.createElement("p");
    ensure.setAttribute("class", "ensure");
    ensure.innerText =
      "*Please check the Delivery date and No.of.guest. If you want to edit go to My cart";
    div_seperation.append(ensure);

    document.querySelector(".order_details").append(div_seperation);

    totalCost += cartdetails[i].totalCost * cartdetails[i].noOfGuest;
  }

  const div_last = document.createElement("div");
  div_last.setAttribute("class", "last");

  const label_last = document.createElement("label");
  label_last.innerText = "Total Cost";
  div_last.append(label_last);

  const input_last = document.createElement("input");
  input_last.setAttribute("type", "number");
  input_last.setAttribute("id", "totalcost");
  input_last.setAttribute("readonly", "true");
  input_last.value = totalCost;
  div_last.append(input_last);

  document.querySelector(".order_details").append(div_last);
} else {
  let totalCost = 0;
  // console.log(cartData_user);

  for (let i = 0; i < cartData_user.length; i++) {
    const div_seperation = document.createElement("div");
    div_seperation.setAttribute("class", "seperation");

    const menuId = cartData_user[i].menu_id;

    // for getting menu name from url
    const menu_name = menuData.find((data) => data.id === menuId);

    const categoryId = cartData_user[i].category_id;

    // for getting category name from url
    const category_name = categoryData.find((data) => data.id === categoryId);

    const h2_heading = document.createElement("h2");
    h2_heading.innerText = `${category_name.categoryName} ${menu_name.menuName}`;
    div_seperation.append(h2_heading);

    // button = document.createElement("button");
    // button("class", "btn update")

    // div for menu & category name
    const div_1 = document.createElement("div");
    div_seperation.append(div_1);

    const label_1 = document.createElement("label");
    label_1.setAttribute("for", "");
    label_1.innerText = "No.of.guest:";
    div_1.append(label_1);

    const input_1 = document.createElement("input");
    input_1.setAttribute("type", "number");
    input_1.setAttribute("id", "no_of_guest");
    input_1.setAttribute("min", "1");
    input_1.setAttribute("readonly", "true");
    input_1.value = cartData_user[i].noOfGuest;
    div_1.append(input_1);

    // div for price
    const div_2 = document.createElement("div");
    div_seperation.append(div_2);

    const label_2 = document.createElement("label");
    label_2.setAttribute("for", "");
    label_2.innerText = "Price:";
    div_2.append(label_2);

    const input_2 = document.createElement("input");
    input_2.setAttribute("type", "number");
    input_2.setAttribute("id", `price${i}`);
    input_2.setAttribute("readonly", "true");
    input_2.value = cartData_user[i].totalCost * cartData_user[i].noOfGuest;
    div_2.append(input_2);

    // div for delivery date
    const div_3 = document.createElement("div");
    div_seperation.append(div_3);

    const label_3 = document.createElement("label");
    label_3.setAttribute("for", "");
    label_3.innerText = "Delivery Date:";
    div_3.append(label_3);

    const input_3 = document.createElement("input");
    input_3.setAttribute("type", "date");
    input_3.setAttribute("id", "delivery_date");
    input_3.setAttribute("readonly", "true");
    input_3.value = cartData_user[i].dateOfDelivery;
    div_3.append(input_3);

    const ensure = document.createElement("p");
    ensure.setAttribute("class", "ensure");
    ensure.innerText =
      "*Please check the Delivery date and No.of.guest. If you want to edit go to My cart";
    div_seperation.append(ensure);

    document.querySelector(".order_details").append(div_seperation);

    totalCost += cartData_user[i].totalCost * cartData_user[i].noOfGuest;
  }

  const div_last = document.createElement("div");
  div_last.setAttribute("class", "last");

  const label_last = document.createElement("label");
  label_last.innerText = "Total Cost";
  div_last.append(label_last);

  const input_last = document.createElement("input");
  input_last.setAttribute("type", "number");
  input_last.setAttribute("id", "totalcost");
  input_last.setAttribute("readonly", "true");
  input_last.value = totalCost;
  div_last.append(input_last);

  document.querySelector(".order_details").append(div_last);
}

// order function
const form_id = document.getElementById("placeOrder");
function placeOrder(e) {
  e.preventDefault();
  const orderData = JSON.parse(localStorage.getItem("orderData")) || [];
  const orderProduct = JSON.parse(localStorage.getItem("orderProduct")) || [];
  // const deliveryAddressData = JSON.parse(localStorage.getItem("deliveryAddressData")) || [];

  let findData = "";

  if (cartId) {
    findData = cartData_user.filter((data) => data.uniqueId === cartId);
    // console.log(findData);
  } else {
    findData = cartData_user;
  }

  let totalCost = 0;

  const order_id = findData[0].uniqueId;

  // const name = document.getElementById("name").value;
  // const email = document.getElementById("email").value;
  // const phone_number = document.getElementById("phone_number").value;
  // let address = document
  //   .getElementById("address")
  //   .value.trim()
  //   .split(/\s+/g)
  //   .join(" ");

  // function validate() {
  //   if (/^\s*$/g.test(address)) {
  //     alert("Enter the valid address");
  //     address = reset();
  //   }
  // }
  // validate();

  let menu_id;
  let category_id;
  let no_of_guest = 0;
  let price = 0;
  let delivery_date = "";

  if (confirm("Are you sure to confirm the order")) {
    if (!findUserAddress || !defaultAddress) {
      alert("Create a address (or) set a address to default");
      // window.location.reload();
    } else {
      for (let i = 0; i < findData.length; i++) {
        // ordered_product []
        menu_id = findData[i].menu_id;
        category_id = findData[i].category_id;
        // dish = findData[i].dishData;
        no_of_guest = findData[i].noOfGuest;
        price = findData[i].totalCost * findData[i].noOfGuest;
        delivery_date = findData[i].dateOfDelivery;

        totalCost += findData[i].totalCost * findData[i].noOfGuest;

        orderProduct.push({
          order_id,
          menu_id,
          category_id,
          no_of_guest,
          price,
          delivery_date,
          order_status: "Not Delivered",
        });
      }

      defaultAddress.selected = "true";
      const order_date = moment().format("DD/MM/YYYY hh:mm:ssA");

      orderData.push({
        order_id,
        user_id: user_unique,
        addressId,
        order_date,
        totalCost,
      });

      alert("Order Placed Sucessfully");
      // console.log(orderData);

      localStorage.setItem("orderData", JSON.stringify(orderData));
      localStorage.setItem("orderProduct", JSON.stringify(orderProduct));
      localStorage.setItem("addressData", JSON.stringify(addressData));

      if (cartId) {
        for (let j = 0; j < cartData.length; j++) {
          if (findData[0].uniqueId === cartData[j].uniqueId) {
            cartData.splice(j, 1);
            localStorage.setItem("cartData", JSON.stringify(cartData));
            window.location.reload();
          }
        }
      } else {
        for (let k = cartData.length - 1; k >= 0; k--) {
          if (user_unique === cartData[k].user_id) {
            cartData.splice(k, 1);
          }
        }
        localStorage.setItem("cartData", JSON.stringify(cartData));

        window.location.reload();
      }
      window.location.href = "./my orders.html";
    }
  }
}

form_id.addEventListener("submit", placeOrder);
