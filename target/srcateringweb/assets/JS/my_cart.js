const cartData = JSON.parse(localStorage.getItem("cartData"));
// const menuData = JSON.parse(localStorage.getItem("menuData"));
const categoryData = JSON.parse(localStorage.getItem("categoryData"));
const dishData = JSON.parse(localStorage.getItem("dishData"));
const transactionTable = JSON.parse(localStorage.getItem("transactionTable"));
const user_unique = JSON.parse(localStorage.getItem("user_unique"));

const cartData_user = cartData.filter((data) => data.user_id === user_unique);

for (let i = 0; i < cartData_user.length; i++) {
  const menuId = cartData_user[i].menu_id;

  // for getting menu name from url
  const menu_name = menuData.find((data) => data.id === menuId);
  // console.log(menu_name)

  const categoryId = cartData_user[i].category_id;

  // for getting category name from url
  const category_name = categoryData.find((data) => data.id === categoryId);
  // console.log(category_name);

  // filtering the dish from the dishData using menu id and category id from the transactionTable
  const menuDetails = transactionTable.filter(
    (data) => data.menuType === menuId
  );

  const categoryDetails = menuDetails.filter(
    (data) => data.categoryType === categoryId
  );

  const findDishData = dishData.filter((product) =>
    categoryDetails.some((find) => find.dish === product.id)
  );

  // console.log(findData);
  const dishDataTrue = findDishData.filter((data) => data.status === "true");

  // console.log(dishDataTrue);

  const divCartContent = document.createElement("div");
  divCartContent.setAttribute("role", "form");
  divCartContent.setAttribute("class", "cart_content");

  const divCartText = document.createElement("div");
  divCartText.setAttribute("class", "cart_text");
  divCartContent.append(divCartText);

  const h3 = document.createElement("h3");
  h3.innerText = `${category_name.categoryName} ${menu_name.menuName}`;
  divCartText.append(h3);

  // h2_cart = document.createElement("h2");
  // h2_cart.innerText = cartData_user[i]["menuName"];
  // divCartText.append(h2_cart);

  const divChange = document.createElement("div");
  divChange.setAttribute("class", "change");
  divCartContent.append(divChange);

  const viewBtn = document.createElement("button");
  viewBtn.setAttribute("class", "btn view");
  viewBtn.innerText = "View";
  divChange.append(viewBtn);

  const divCartDishes = document.createElement("div");
  divCartDishes.setAttribute("class", "cart_dishes");
  divCartDishes.setAttribute("style", "display:none");
  divChange.append(divCartDishes);

  const icon = document.createElement("i");
  icon.setAttribute("class", "bx bx-x-circle");
  icon.setAttribute("id", "closeDish");
  divCartDishes.append(icon);

  // h3 = document.createElement("h3");
  // h3.innerText = cartData_user[i]["categoryName"] + " " + cartData_user[i]["menuName"];
  // divCartDishes.append(h3);

  const span = document.createElement("span");
  span.innerText = "SR's ";
  h3.prepend(span);

  const ulDishes = document.createElement("ul");
  ulDishes.setAttribute("class", "dishes");
  divCartDishes.append(ulDishes);

  for (let j = 0; j < dishDataTrue.length; j++) {
    const li = document.createElement("li");
    li.innerText = dishDataTrue[j].name;

    ulDishes.append(li);
  }

  const divCartEnd = document.createElement("div");
  divCartEnd.setAttribute("class", "cart_end");
  divChange.append(divCartEnd);

  const divCartEnd1 = document.createElement("div");
  divCartEnd1.setAttribute("class", "inside");
  divCartEnd.append(divCartEnd1);

  const label1 = document.createElement("label");
  label1.innerText = "Delivery Date:";
  divCartEnd1.append(label1);

  const input1 = document.createElement("input");
  input1.setAttribute("type", "date");
  input1.setAttribute("class", "date");
  input1.setAttribute("required", "true");
  input1.setAttribute("value", cartData_user[i].dateOfDelivery);
  label1.append(input1);

  const label2 = document.createElement("label");
  label2.innerText = "No.Of.Guest:";
  divCartEnd1.append(label2);

  const input2 = document.createElement("input");
  input2.setAttribute("type", "number");
  input2.setAttribute("class", "number");
  input2.setAttribute("required", "true");
  input2.setAttribute("min", "50");
  // input2.setAttribute("max", "1500")
  input2.setAttribute("value", cartData_user[i].noOfGuest);
  label2.append(input2);

  const message = document.createElement("span");
  message.innerText = "* No.of.guest should be minimum 50 and maximum 1500";
  divCartEnd1.append(message);

  // const update = document.createElement("button");
  // update.setAttribute("type", "button");
  // update.setAttribute("class", "btn update");
  // update.setAttribute("style", "display:none");
  // update.innerText = "Update";
  // divCartEnd1.append(update);

  // img = document.createElement("img");
  // img.setAttribute("src", "../../assets/img/Dishes/ordinary tiffin.jpg");
  // img.setAttribute("alt", "ordinary tiffin");
  // divCartEnd.append(img);

  const price = document.createElement("p");
  price.setAttribute("class", "price");

  // let cost = 0
  // for (let k = 0; k < a.length; k++) {
  //     cost += parseInt(a[k]["price"])
  // }
  price.innerText = `₹ ${
    cartData_user[i].totalCost * cartData_user[i].noOfGuest
  }`;
  divCartEnd.append(price);

  const divBtnCart = document.createElement("div");
  divBtnCart.setAttribute("class", "btn_cart");
  divCartEnd.append(divBtnCart);

  // const a_1 = document.createElement("a");
  // // a_1.setAttribute("href", "../profile/Order page.html?cartId=" + cartData_user[i]["uniqueId"]);
  // divBtnCart.append(a_1);

  const button1 = document.createElement("button");
  button1.setAttribute("class", "btn order");
  button1.setAttribute("type", "button");
  button1.innerText = "ORDER";
  divBtnCart.append(button1);

  // const a_2 = document.createElement("a");
  // a_2.setAttribute("href", "#");
  // divBtnCart.append(a_2);

  const button_2 = document.createElement("button");
  button_2.setAttribute("class", "btn remove");
  button_2.setAttribute("data-id", cartData_user[i].uniqueId);
  button_2.setAttribute("type", "button");
  button_2.innerText = "REMOVE";
  divBtnCart.append(button_2);

  const ensure = document.createElement("p");
  ensure.setAttribute("class", "ensure");
  ensure.innerText =
    "Please check the Delivery date and No.of.guest before order";
  divCartEnd.append(ensure);

  document.querySelector("div.cart").append(divCartContent);

  // summary table
  const div_sum_content = document.querySelector(".sum_content");

  const div_sum_details = document.createElement("div");
  div_sum_details.setAttribute("class", "sum_details");
  div_sum_content.append(div_sum_details);

  const p_name = document.createElement("p");
  p_name.innerText = `${category_name.categoryName} ${menu_name.menuName}`;
  div_sum_details.append(p_name);

  const date = document.createElement("p");
  date.innerText = cartData_user[i].dateOfDelivery;
  div_sum_details.append(date);

  const p_price = document.createElement("p");
  p_price.innerText = `₹ ${
    cartData_user[i].totalCost * cartData_user[i].noOfGuest
  }`;
  div_sum_details.append(p_price);
}

const div_sum_content = document.querySelector(".sum_content");

const div_sum_end = document.createElement("div");
div_sum_end.setAttribute("class", "sum_end");
div_sum_content.append(div_sum_end);

const p_total = document.createElement("p");
p_total.innerText = "Total Price";
div_sum_end.append(p_total);

let totalcost = 0;
for (let s = 0; s < cartData_user.length; s++) {
  totalcost += cartData_user[s].totalCost * cartData_user[s].noOfGuest;
}

const p_totalprice = document.createElement("p");
p_totalprice.innerText = `₹ ${totalcost}`;
div_sum_end.append(p_totalprice);

// orderall button
const div_orderAll = document.querySelector(".cart_orderall");

const btn_orderall = document.createElement("button");
btn_orderall.setAttribute("type", "button");
btn_orderall.setAttribute("class", "btn orderall");
btn_orderall.innerText = `ORDER ALL (${cartData_user.length})`;

div_orderAll.append(btn_orderall);

// const checkOrder = e => {
//     e.preventDefault();

//     let date = document.getElementById("")
// }

// // getting extra informatio like no.of.guest and date of delivery
// let updateBtn = document.querySelectorAll(".update")
// updateBtn.forEach(function (upDate) {
//     upDate.addEventListener("click", function () {

//         let parent = this.closest(".cart_end")
//         let getDate = parent.querySelector(".date").value;
//         let getNumber = parent.querySelector(".number").value;

//         let id = parent.querySelector(".remove").getAttribute("data-id");

//         function getId(e) {
//             return e.uniqueId == id
//         }
//         findcartId = cartData.filter(getId);
//         // console.log(findcartId)

//         // let y = parent.querySelector(".price").innerText.replace("₹", "");
//         let y = findcartId[0]["totalCost"]
//         // console.log(y);
//         let up_totalcost = y * getNumber;
//         // console.log(up_totalcost)

//         findcartId[0]["dateOfDelivery"] = getDate;
//         findcartId[0]["noOfGuest"] = getNumber;
//         // findcartId[0]["totalCost"] = up_totalcost;

//         localStorage.setItem("cartData", JSON.stringify(cartData));
//         location.reload();

//     })
// })

const view_dish = document.querySelectorAll(".view");
view_dish.forEach((getDish) => {
  getDish.addEventListener("click", function viewDish() {
    const parent = this.closest(".change");
    const div_dish = parent.querySelector(".cart_dishes");

    div_dish.removeAttribute("style");

    parent.querySelector(".view").setAttribute("style", "display:none");
  });
});

const close_dish = document.querySelectorAll(".bx-x-circle");
close_dish.forEach((closedish) => {
  closedish.addEventListener("click", function closeDish() {
    const parent = this.closest(".change");
    const div_dish = parent.querySelector(".cart_dishes");

    div_dish.setAttribute("style", "display:none");

    parent.querySelector(".view").removeAttribute("style");
  });
});

const number_of_guest = document.querySelectorAll(".number");
number_of_guest.forEach((getGuest) => {
  getGuest.addEventListener("change", function empty() {
    const parent = this.closest(".cart_end");
    const product_id = parent.querySelector(".remove").dataset.id;

    const pdts = cartData_user.find((data) => data.uniqueId === product_id);

    const quantity = parseInt(parent.querySelector(".number").value);
    // console.log(quantity);
    if (quantity >= 50 && quantity <= 1500) {
      pdts.noOfGuest = quantity;

      localStorage.setItem("cartData", JSON.stringify(cartData));
      window.location.reload();
    } else if (isNaN(quantity)) {
      alert("Please enter the no.of.guest");
      window.location.reload();
    } else if (quantity <= 50) {
      alert("no.of.guest should be between 50 and 1500");
      window.location.reload();
    } else {
      alert("You can't order food for above 1500 guest");
      window.location.reload();
    }
  });
});

const dateInput = document.querySelectorAll(".date");
dateInput.forEach((getDate) => {
  getDate.addEventListener("change", function empty() {
    const limit_date = moment().add({ days: 3 }).format("YYYY-MM-DD");
    const max_date = moment().add({ months: 2 }).format("YYYY-MM-DD");
    console.log(max_date);

    const parent = this.closest(".cart_end");
    const product_id = parent.querySelector(".remove").dataset.id;

    const pdts = cartData_user.find((data) => data.uniqueId === product_id);

    const date = parent.querySelector(".date").value;

    pdts.dateOfDelivery = date;

    if (date >= limit_date && date <= max_date) {
      localStorage.setItem("cartData", JSON.stringify(cartData));
      window.location.reload();
    } else if (date >= max_date) {
      alert("Delivery date should be within 2 months from now");
      window.location.reload();
    } else {
      alert("Delivery date should be atleast 3 days from now");
      window.location.reload();
    }
  });
});

// order button creation
const orderBtn = document.querySelectorAll(".order");
orderBtn.forEach((orderFood) => {
  orderFood.addEventListener("click", function empty() {
    // after checking the move to the order page
    const limit_date = moment().add({ days: 3 }).format("YYYY-MM-DD");
    const max_date = moment().add({ months: 2 }).format("YYYY-MM-DD");

    const parent = this.closest(".cart_end");
    // const delivery_date = parent.querySelector(".date").value;
    const unique_id = parent.querySelector(".remove").getAttribute("data-id");

    const find_cart = cartData.filter((data) => data.uniqueId === unique_id);

    if (
      find_cart[0].dateOfDelivery >= limit_date &&
      find_cart[0].dateOfDelivery <= max_date
    ) {
      window.location.href = `../profile/Order page.html?cartId=${unique_id}`;
    } else if (find_cart[0].dateOfDelivery >= max_date) {
      alert("Delivery date should be within 2 months from now");
      window.location.reload();
    } else {
      alert("Delivery date should be atleast 3 days from now");
      // window.location.reload();
    }

    // if (find_cart[0].dateOfDelivery <= limit_date) {
    //   alert("Delivery date should be atleast 3 days from now");
    // } else if (find_cart[0].dateOfDelivery) {

    // } else {
    //   window.location.href = `../profile/Order page.html?cartId=${unique_id}`;
    // }
  });
});

// orderall button get
const orderallBtn = document.querySelector(".orderall");

function orderAll() {
  let a = true;
  // const b = true;

  const limit_date = moment().add({ days: 3 }).format("YYYY-MM-DD");

  for (let i = 0; i < cartData_user.length; i++) {
    // console.log(limit_date);

    if (cartData_user[i].dateOfDelivery < limit_date) {
      alert(
        "Delivery date should not be empty (or) Delivery date should be at least 3 days from now"
      );
      a = false;
      break;
    }
  }
  if (a !== false) {
    window.location.href = `../profile/Order page.html?cartStatus=${false}`;
  }
}

orderallBtn.addEventListener("click", orderAll);

// remove from cart
const removeBtn = document.querySelectorAll(".remove");

removeBtn.forEach((removeCart) => {
  removeCart.addEventListener("click", function empty() {
    const confirmed = window.confirm(
      "Are you sure, Do you want to remove this menu from the cart?"
    );

    if (confirmed) {
      const cartid = this.dataset.id;

      const remove_menu = cartData.find((data) => data.uniqueId === cartid);

      const index = cartData.indexOf(remove_menu);

      cartData.splice(index, 1);
      localStorage.setItem("cartData", JSON.stringify(cartData));
      alert("Menu is removed from the Cart");
      window.location.reload();
    }
  });
});
