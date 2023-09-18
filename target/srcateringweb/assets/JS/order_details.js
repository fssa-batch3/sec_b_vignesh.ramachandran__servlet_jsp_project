const orderData = JSON.parse(localStorage.getItem("orderData"));
const orderProduct = JSON.parse(localStorage.getItem("orderProduct"));
const newMenuData = JSON.parse(localStorage.getItem("menuData"));
const categoryData = JSON.parse(localStorage.getItem("categoryData"));
const transactionTable = JSON.parse(localStorage.getItem("transactionTable"));
const dishData = JSON.parse(localStorage.getItem("dishData"));
const addressData = JSON.parse(localStorage.getItem("addressData"));
// const user_unique = JSON.parse(localStorage.getItem("user_unique"));

const m = moment().format("YYYY-MM-DD");

const order_id_get = new URLSearchParams(window.location.search).get("orderId");
// console.log(order_id);

const orderDetails = orderProduct.filter(
  (data) => data.order_id === order_id_get
);

const findOrderData = orderData.find((data) => data.order_id === order_id_get);

const findAddress = addressData.find(
  (data) => data.addressId === findOrderData.addressId
);
// console.log(findAddress);

const div_address = document.createElement("div");
div_address.setAttribute("class", "address_div");

const h2_heading = document.createElement("h2");
h2_heading.innerText = "Delivery Address";
div_address.append(h2_heading);

const p_address = document.createElement("p");
p_address.innerText = `${findAddress.name}, ${findAddress.email}, ${findAddress.phone_number},
  ${findAddress.door_no},
  ${findAddress.street_name}, 
  ${findAddress.sub_locality}, 
  ${findAddress.city}, 
  ${findAddress.district}- ${findAddress.pincode}. `;
div_address.append(p_address);

document.querySelector("section.my-orders").prepend(div_address);

for (let i = 0; i < orderDetails.length; i++) {
  const menu_id = `${orderDetails[i].menu_id}`;
  const category_id = `${orderDetails[i].category_id}`;

  const menu_name = newMenuData.find((data) => data.id === menu_id);
  const category_name = categoryData.find((data) => data.id === category_id);

  const cat_menudata = categoryData.filter((data) => data.menuType === menu_id);
  // console.log(cat_menudata);

  const cat_catdata = cat_menudata.find((data) => data.id === category_id);
  // console.log(cat_catdata);

  // <div class="my-orders_list">
  const div_my_orders_list = document.createElement("div");
  div_my_orders_list.setAttribute("class", "my-orders_list");

  const div_head_order = document.createElement("div");
  div_head_order.setAttribute("class", "head_order");
  div_my_orders_list.append(div_head_order);

  const p_orderId = document.createElement("p");
  p_orderId.setAttribute("class", "order_id");
  p_orderId.innerText = `Order Id : ${orderDetails[i].order_id}`;
  div_head_order.append(p_orderId);

  const p_order_status = document.createElement("p");
  p_order_status.setAttribute("id", "order_status");

  if (orderDetails[i].order_status === "Not Delivered") {
    p_order_status.innerText = orderDetails[i].order_status;
    p_order_status.setAttribute("style", "color:var(--text-color)");
  }
  if (orderDetails[i].order_status === "Cancelled") {
    p_order_status.innerText = orderDetails[i].order_status;
    p_order_status.setAttribute("style", "color:var(--second-color)");
  }
  if (orderDetails[i].order_status === "Delivered") {
    p_order_status.innerText = orderDetails[i].order_status;
    p_order_status.setAttribute("style", "color:var(--thickgreen-color)");
  }

  div_head_order.append(p_order_status);

  // <div class="my_order_text">
  const div_my_order_text = document.createElement("div");
  div_my_order_text.setAttribute("class", "my_order_text");
  div_my_orders_list.append(div_my_order_text);

  const div_menuImage = document.createElement("div");
  div_menuImage.setAttribute("class", "menuImage");
  div_my_order_text.append(div_menuImage);

  const img_menu = document.createElement("img");
  img_menu.setAttribute("src", cat_catdata.categoryImage);
  div_menuImage.append(img_menu);

  const div_subject = document.createElement("div");
  div_subject.setAttribute("class", "subject");
  div_my_order_text.append(div_subject);

  // <h2>Hightea</h2>
  const h2_name = document.createElement("h2");
  h2_name.innerText = `${category_name.categoryName} ${menu_name.menuName}`;
  div_subject.append(h2_name);

  const button = document.createElement("button");
  button.setAttribute("class", "btn view");
  button.setAttribute("type", "button");
  // button.setAttribute(
  //   "value",
  //   orderDetails[i].ordered_product[j].dishData
  // );
  button.innerText = "View Dishes";
  div_subject.append(button);

  // button_cancel = document.createElement("button");
  // button_cancel.setAttribute("class", "btn cancel");
  // button_cancel.innerText = "Cancel Order";
  // button_cancel.setAttribute("value", orderDetails[i]["order_id"])
  // div_subject.append(button_cancel);

  const reviewDetails = JSON.parse(localStorage.getItem("reviewDetails")) || [];
  // console.log(reviewDetails);
  const thisReviewData = reviewDetails.filter(
    (data) => data.order_id === order_id_get
  );
  // console.log(orderDetails);
  // console.log(thisReviewData);

  if (orderDetails[i].order_status === "Delivered") {
    let a = true;
    for (let d = 0; d < thisReviewData.length; d++) {
      if (orderDetails[i].order_id === thisReviewData[d].order_id) {
        if (
          orderDetails[i].menu_id === thisReviewData[d].menu_id &&
          orderDetails[i].category_id === thisReviewData[d].category_id
        ) {
          const starWidget = document.createElement("div");
          starWidget.classList.add("star-widget");

          for (let c = 1; c <= 5; c++) {
            const starInput = document.createElement("input");
            starInput.setAttribute("type", "radio");
            starInput.setAttribute("name", "rate");
            starInput.setAttribute("id", `rate-${c}`);
            starInput.setAttribute("value", c);

            const starLabel = document.createElement("label");
            starLabel.setAttribute("for", `rate-${c}`);
            starLabel.classList.add("fa", "fa-star");

            if (c <= thisReviewData[d].star) {
              starInput.setAttribute("checked", true);
              starLabel.setAttribute("style", "color:#fd4;");
            }

            starWidget.appendChild(starInput);
            starWidget.appendChild(starLabel);
          }

          const p_feedback = document.createElement("p");
          p_feedback.setAttribute("class", "revFeedback");
          p_feedback.innerText = thisReviewData[d].feedback;

          div_subject.append(starWidget);
          div_subject.append(p_feedback);
          a = false;
          // const rev_thanks = document.createElement("p");
          // rev_thanks.setAttribute("class", "rev_thanks");
          // rev_thanks.innerText = "Thanks for Rating..";
          // div_subject.append(rev_thanks);
          // a = false;
        }
      }
    }

    if (a === true) {
      const button_review = document.createElement("button");
      button_review.setAttribute("type", "button");
      button_review.setAttribute("class", "btnReview");
      button_review.innerText = "Give Review";
      div_subject.append(button_review);
    }
  }
  if (orderDetails[i].order_status === "Not Delivered") {
    const button_cancel = document.createElement("button");
    button_cancel.setAttribute("class", "btn cancel");
    button_cancel.innerText = "Cancel Order";
    button_cancel.setAttribute("value", orderDetails[i].order_id);
    div_subject.append(button_cancel);

    // one day before delivery cancel button will be disappeard
    const getDate = orderDetails[i].delivery_date;
    // console.log(getDate);

    const date = moment(getDate);
    // console.log(date);
    date.subtract(1, "days");
    const one_day_before = date.format("YYYY-MM-DD");
    // console.log(one_day_before);

    const one_week_before = date.subtract(6, "days").format("YYYY-MM-DD");
    // console.log(one_week_before);

    if (one_week_before <= m) {
      button_cancel.setAttribute("style", "display:none");
    }

    if (one_day_before === m) {
      // button_cancel.setAttribute("style", "display:none");

      const arriving = document.createElement("p");
      arriving.setAttribute("class", "arr_status");
      arriving.innerText = "Arriving Tomorrow";
      div_subject.append(arriving);
    }
  }

  if (orderDetails[i].order_status === "Cancelled") {
    const p_reason = document.createElement("p");
    p_reason.setAttribute("class", "reason");
    p_reason.innerText = orderDetails[i].cancel_reason;
    p_reason.setAttribute("style", "display:block");

    const span_reason = document.createElement("span");
    span_reason.innerText = "Cancel Reason :  ";
    p_reason.prepend(span_reason);

    div_subject.append(p_reason);
  }

  const div_field = document.createElement("div");
  div_field.setAttribute("class", "field");
  div_my_order_text.append(div_field);

  const div_1 = document.createElement("div");
  div_field.append(div_1);

  // <label>Date:<p>25.12.2022</p></label>
  const label_1 = document.createElement("label");
  label_1.innerText = "Delivery Date:";
  div_1.append(label_1);

  const input_1 = document.createElement("input");
  input_1.setAttribute("type", "date");
  input_1.setAttribute("value", orderDetails[i].delivery_date);
  input_1.setAttribute("readOnly", "true");
  div_1.append(input_1);

  const div_2 = document.createElement("div");
  div_field.append(div_2);

  // <label>No.Of.Guest: 39</label>
  const label_2 = document.createElement("label");
  label_2.innerText = "No.of.Guest:";
  div_2.append(label_2);

  const input_2 = document.createElement("input");
  input_2.setAttribute("type", "number");
  input_2.setAttribute("value", orderDetails[i].no_of_guest);
  input_2.setAttribute("readOnly", "true");
  div_2.append(input_2);

  const div_3 = document.createElement("div");
  div_field.append(div_3);

  // <label>Status: <p>Delivered</p> </label>
  const label_3 = document.createElement("label");
  label_3.innerText = "Price:";
  div_3.append(label_3);

  const input_3 = document.createElement("input");
  input_3.setAttribute("type", "number");
  input_3.setAttribute("value", orderDetails[i].price);
  input_3.setAttribute("readOnly", "true");
  div_3.append(input_3);

  const div_dropdown = document.createElement("div");
  div_dropdown.setAttribute("class", "dropdown_menu-type-content animate");
  div_dropdown.setAttribute("id", "show");
  div_my_order_text.append(div_dropdown);

  // <i class='bx bx-x-circle'></i>

  const icon = document.createElement("i");
  icon.setAttribute("class", "bx bx-x-circle");
  icon.setAttribute("id", "closeDish");
  div_dropdown.append(icon);

  const ul_dishes = document.createElement("ul");
  ul_dishes.setAttribute("class", "dishes");
  div_dropdown.append(ul_dishes);

  const findData1 = transactionTable.filter(
    (data) => data.menuType === menu_id
  );
  // console.log(findData1);

  const findData2 = findData1.filter(
    (data) => data.categoryType === category_id
  );
  // console.log(findData2);

  const find_dish_data = dishData.filter((product) =>
    findData2.some((find) => find.dish === product.id)
  );

  const dishTrueData = find_dish_data.filter((data) => data.status === "true");
  // console.log(dishTrueData);

  // console.log(finddish);
  for (let k = 0; k < dishTrueData.length; k++) {
    const li = document.createElement("li");
    li.innerText = dishTrueData[k].name;
    ul_dishes.append(li);
  }

  document.querySelector("div.orders").prepend(div_my_orders_list);
}

// view dish
const viewBtn = document.querySelectorAll(".view");
viewBtn.forEach((showDishes) => {
  showDishes.addEventListener("click", function empty() {
    // console.log("rajini")
    const parent = this.closest(".my-orders_list");

    const div_dish = parent.querySelector("#show");
    div_dish.setAttribute("style", "display:block");

    const div_back_1 = parent.querySelector(".head_order");
    div_back_1.style.opacity = "0.5";

    const div_back = parent.querySelector(".field");
    div_back.style.opacity = "0.2";
  });
});

// close dish
const closeBtn = document.querySelectorAll("#closeDish");
closeBtn.forEach((close_dish) => {
  close_dish.addEventListener("click", function empty() {
    const parent = this.closest(".my-orders_list");
    const div_dish = parent.querySelector(".dropdown_menu-type-content");
    div_dish.removeAttribute("style");

    const div_back_1 = parent.querySelector(".head_order");
    div_back_1.removeAttribute("style");

    const div_back = parent.querySelector(".field");
    div_back.removeAttribute("style");
  });
});

// cancel order
const cancelBtn = document.querySelectorAll(".cancel");
cancelBtn.forEach((cancelOrder) => {
  cancelOrder.addEventListener("click", function empty() {
    const reason = prompt("Enter the reason", "");
    if (reason == null || reason === "") {
      window.location.reload();
    } else {
      // console.log(reason);
      const parent = this.closest(".my_order_text");
      const btn_order_id = parent.querySelector(".cancel");

      const findData = orderDetails.filter(
        (data) => data.order_id === btn_order_id.value
      );

      findData[0].order_status = "Cancelled";
      findData[0].cancel_reason = reason;

      localStorage.setItem("orderProduct", JSON.stringify(orderProduct));
      alert("Order cancelled Sucessfully");
      // user_id.setAttribute("style", "display:none")
      window.location.reload();

      // const indicate_status = parent.querySelector("#order_status");
      // indicate_status.setAttribute("style", "color:red");
    }
  });
});

const find_notDelivered_data = orderDetails.filter(
  (data) => data.order_status === "Not Delivered"
);

for (let i = 0; i < find_notDelivered_data.length; i++) {
  if (find_notDelivered_data[i].delivery_date <= m) {
    find_notDelivered_data[i].order_status = "Delivered";
    localStorage.setItem("orderProduct", JSON.stringify(orderProduct));
  }
}

// review button
const reviewBtn = document.querySelectorAll(".btnReview");
reviewBtn.forEach((reviewPage) => {
  reviewPage.addEventListener("click", function nextpage() {
    const parent = this.closest(".my-orders_list");
    // console.log(parent);
    const nxt_order_id = parent
      .querySelector(".order_id")
      .innerText.replace("Order Id :", "")
      .trim();

    const menuCategory = `${parent.querySelector("h2").innerText}`;

    const namesMenuCate = menuCategory.split(" ");

    const find_menuId = newMenuData.filter(
      (data) => data.menuName === namesMenuCate[1]
    );
    // console.log(find_menuId[0].id);

    const find_categoryId = categoryData.filter(
      (data) => data.categoryName === namesMenuCate[0]
    );
    // console.log(find_categoryId[0].id);

    window.location.href = `./review.html?orderId=${nxt_order_id}&menuId=${find_menuId[0].id}&categoryId=${find_categoryId[0].id}`;
  });
});
