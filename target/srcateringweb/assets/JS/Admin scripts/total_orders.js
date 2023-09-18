let orderProduct = JSON.parse(localStorage.getItem("orderProduct"));
const orderData = JSON.parse(localStorage.getItem("orderData"));
const newMenuData = JSON.parse(localStorage.getItem("menuData"));
const categoryData = JSON.parse(localStorage.getItem("categoryData"));
const transactionTable = JSON.parse(localStorage.getItem("transactionTable"));
const dishData = JSON.parse(localStorage.getItem("dishData"));
const reviewDetails = JSON.parse(localStorage.getItem("reviewDetails")) || [];

// const user_unique = JSON.parse(localStorage.getItem("user_unique"));

const m = moment().format("YYYY-MM-DD");

function view_orders() {
  for (let i = 0; i < orderProduct.length; i++) {
    const menu_id = `${orderProduct[i].menu_id}`;
    const category_id = `${orderProduct[i].category_id}`;

    const menu_name = newMenuData.find((data) => data.id === menu_id);
    const category_name = categoryData.find((data) => data.id === category_id);

    const cat_menudata = categoryData.filter(
      (data) => data.menuType === menu_id
    );
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
    p_orderId.innerText = `Order Id : ${orderProduct[i].order_id}`;
    div_head_order.append(p_orderId);

    const user_id_ref = orderData.find(
      (data) => data.order_id === orderProduct[i].order_id
    );
    // console.log(user_id_ref);

    const p_userId = document.createElement("p");
    p_userId.setAttribute("class", "userId");
    p_userId.innerText = `user Id : ${user_id_ref.user_id}`;
    div_head_order.append(p_userId);

    const p_order_status = document.createElement("p");
    p_order_status.setAttribute("id", "order_status");

    if (orderProduct[i].order_status === "Not Delivered") {
      p_order_status.innerText = orderProduct[i].order_status;
      p_order_status.setAttribute("style", "color:var(--text-color)");
    }
    if (orderProduct[i].order_status === "Cancelled") {
      p_order_status.innerText = orderProduct[i].order_status;
      p_order_status.setAttribute("style", "color:var(--second-color)");
    }
    if (orderProduct[i].order_status === "Delivered") {
      p_order_status.innerText = orderProduct[i].order_status;
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
    button.innerText = "View Dishes";
    div_subject.append(button);

    // button_cancel = document.createElement("button");
    // button_cancel.setAttribute("class", "btn cancel");
    // button_cancel.innerText = "Cancel Order";
    // button_cancel.setAttribute("value", orderProduct[i]["order_id"])
    // div_subject.append(button_cancel);

    // console.log(reviewDetails);
    // const thisReviewData = reviewDetails.filter(
    //   (data) => data.order_id === order_id_get
    // );
    // console.log(thisReviewData);

    if (orderProduct[i].order_status === "Delivered") {
      let a = true;
      for (let d = 0; d < reviewDetails.length; d++) {
        if (orderProduct[i].order_id === reviewDetails[d].order_id) {
          // console.log(orderProduct_user[i].ordered_product[j].menu_id)
          // console.log(reviewDetails[d].menu_id)
          if (
            orderProduct[i].menu_id === reviewDetails[d].menu_id &&
            orderProduct[i].category_id === reviewDetails[d].category_id
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

              if (c <= reviewDetails[d].star) {
                starInput.setAttribute("checked", true);
                starLabel.setAttribute("style", "color:#fd4;");
              }

              starWidget.appendChild(starInput);
              starWidget.appendChild(starLabel);
            }

            const p_feedback = document.createElement("p");
            p_feedback.setAttribute("class", "revFeedback");
            p_feedback.innerText = reviewDetails[d].feedback;

            div_subject.append(starWidget);
            div_subject.append(p_feedback);
            a = false;
          }
        }
      }

      if (a === true) {
        const p_review = document.createElement("p");
        p_review.innerText = "Review Pending";
        div_subject.append(p_review);
      }
    }

    if (orderProduct[i].order_status === "Not Delivered") {
      const button_cancel = document.createElement("button");
      button_cancel.setAttribute("class", "btn cancel");
      button_cancel.innerText = "Cancel Order";
      button_cancel.setAttribute("value", orderProduct[i].order_id);
      div_subject.append(button_cancel);

      // one day before delivery cancel button will be disappeard
      const getDate = orderProduct[i].dateOfDelivery;

      const date = moment(getDate);
      date.subtract(1, "days");
      const one_day_before = date.format("YYYY-MM-DD");
      // console.log(one_day_before)

      if (one_day_before === m) {
        button_cancel.setAttribute("style", "display:none");

        const arriving = document.createElement("p");
        arriving.setAttribute("class", "arr_status");
        arriving.innerText = "Arriving Tomorrow";
        div_subject.append(arriving);
      }
    }

    if (orderProduct[i].order_status === "Cancelled") {
      const p_reason = document.createElement("p");
      p_reason.setAttribute("class", "reason");
      p_reason.innerText = orderProduct[i].cancel_reason;
      p_reason.setAttribute("style", "display:block");
      div_subject.append(p_reason);

      const span_reason = document.createElement("span");
      span_reason.innerText = "Cancel Reason : ";
      p_reason.prepend(span_reason);
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
    input_1.setAttribute("value", orderProduct[i].delivery_date);
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
    input_2.setAttribute("value", orderProduct[i].no_of_guest);
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
    input_3.setAttribute("value", orderProduct[i].price);
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
    // console.log(find_dish_data);

    const dishTrueData = find_dish_data.filter(
      (data) => data.status === "true"
    );

    // const find_dish_data = orderProduct[i].ordered_product[j].dishData;
    // // console.log(find_dish_data);

    // const finddish = dishData.filter((product) =>
    //   find_dish_data.some((find) => find.id === product.id)
    // );

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

        const findData = orderProduct.filter(
          (data) => data.order_id === btn_order_id.value
        );
        // console.log(findData)

        findData[0].order_status = "Cancelled";
        findData[0].cancel_reason = reason;
        // console.log(findData[0]);

        localStorage.setItem("orderProduct", JSON.stringify(orderProduct));
        alert("Order cancelled Sucessfully");
        // user_id.setAttribute("style", "display:none")
        window.location.reload();

        // const indicate_status = parent.querySelector("#order_status");
        // indicate_status.setAttribute("style", "color:red");
      }
    });
  });
}

const find_notDelivered_data = orderProduct.filter(
  (data) => data.order_status === "Not Delivered"
);
// console.log(find_notDelivered_data);

for (let i = 0; i < find_notDelivered_data.length; i++) {
  if (find_notDelivered_data[i].delivery_date <= m) {
    find_notDelivered_data[i].order_status = "Delivered";
    localStorage.setItem("orderProduct", JSON.stringify(orderProduct));
  }
}

view_orders();

const statusBtn = document.querySelectorAll(".btn_toggle");
statusBtn.forEach((showOrders) => {
  showOrders.addEventListener("click", function empty() {
    const div_for_append = document.querySelector("div.orders");

    div_for_append.innerText = "";

    orderProduct = JSON.parse(localStorage.getItem("orderProduct"));

    const parent = this.innerText;
    // console.log(parent);

    orderProduct = orderProduct.filter(
      (data) => data.order_status === `${parent}`
    );

    if (parent === "Not Delivered") {
      orderProduct.sort(
        (a, b) => new Date(b.delivery_date) - new Date(a.delivery_date)
      );
    }
    if (parent === "Delivered") {
      orderProduct.sort(
        (a, b) => new Date(a.delivery_date) - new Date(b.delivery_date)
      );
    }

    view_orders();
  });
});

// function view_orders() {
//   for (let i = 0; i < orderProduct.length; i++) {
//     const count = orderProduct[i].ordered_product.length;
//     // console.log(count)

//     for (let j = 0; j < count; j++) {
//       const { menu_id } = orderProduct[i].ordered_product[j];
//       // console.log(menu_id)

//       // for getting menu name from url
//       const menu_name = menuData.find((data) => data.id === menu_id);
//       // console.log(menu_name)

//       const { category_id } = orderProduct[i].ordered_product[j];

//       // for getting category name from url
//       const category_name = categoryData.find(
//         (data) => data.id === category_id
//       );
//       // console.log(category_name)

//       // <div class="my-orders_list">
//       const div_my_orders_list = document.createElement("div");
//       div_my_orders_list.setAttribute("class", "my-orders_list");

//       const div_header = document.createElement("div");
//       div_header.setAttribute("class", "head_order");
//       div_my_orders_list.append(div_header);

//       const p_orderId = document.createElement("p");
//       p_orderId.setAttribute("class", "order_id");
//       p_orderId.innerText = `Order Id : ${orderProduct[i].order_id}`;
//       div_header.append(p_orderId);

//       const p_userId = document.createElement("p");
//       p_userId.setAttribute("class", "userId");
//       p_userId.innerText = `user Id : ${orderProduct[i].user_id}`;
//       div_header.append(p_userId);

//       const p_order_status = document.createElement("p");
//       p_order_status.setAttribute("id", "order_status");

//       if (orderProduct[i].orderStatus === "Not Delivered") {
//         p_order_status.innerText = orderProduct[i].orderStatus;
//         p_order_status.setAttribute("style", "color:var(--text-color)");
//       }
//       if (orderProduct[i].orderStatus === "Cancelled") {
//         p_order_status.innerText = orderProduct[i].orderStatus;
//         p_order_status.setAttribute("style", "color:var(--second-color)");
//       }
//       if (orderProduct[i].orderStatus === "Delivered") {
//         p_order_status.innerText = orderProduct[i].orderStatus;
//         p_order_status.setAttribute("style", "color:var(--thickgreen-color)");
//       }

//       div_header.append(p_order_status);

//       // <div class="my_order_text">
//       const div_my_order_text = document.createElement("div");
//       div_my_order_text.setAttribute("class", "my_order_text");
//       div_my_orders_list.append(div_my_order_text);

//       const div_subject = document.createElement("div");
//       div_subject.setAttribute("class", "subject");
//       div_my_order_text.append(div_subject);

//       // <h2>Hightea</h2>
//       const h2_name = document.createElement("h2");
//       h2_name.innerText = `${category_name.categoryName} ${menu_name.menuName}`;
//       div_subject.append(h2_name);

//       const button = document.createElement("button");
//       button.setAttribute("class", "btn view");
//       button.setAttribute("type", "button");
//       button.setAttribute("value", orderProduct[i].ordered_product[j].dishData);
//       button.innerText = "View Dishes";
//       div_subject.append(button);

//       if (orderProduct[i].orderStatus === "Not Delivered") {
//         const button_cancel = document.createElement("button");
//         button_cancel.setAttribute("class", "btn cancel");
//         button_cancel.innerText = "Cancel Order";
//         button_cancel.setAttribute("value", orderProduct[i].order_id);
//         div_subject.append(button_cancel);
//       }

//       const reviewDetails = JSON.parse(localStorage.getItem("reviewDetails"));

//       if (orderProduct[i].orderStatus === "Delivered") {
//         let a = true;
//         for (let d = 0; d < reviewDetails.length; d++) {
//           if (orderProduct[i].order_id === reviewDetails[d].order_id) {
//             // console.log(orderProduct_user[i].ordered_product[j].menu_id)
//             // console.log(reviewDetails[d].menu_id)
//             if (
//               orderProduct[i].ordered_product[j].menu_id ===
//                 reviewDetails[d].menu_id &&
//               orderProduct[i].ordered_product[j].category_id ===
//                 reviewDetails[d].category_id
//             ) {
//               const starWidget = document.createElement("div");
//               starWidget.classList.add("star-widget");

//               for (let c = 1; c <= 5; c++) {
//                 const starInput = document.createElement("input");
//                 starInput.setAttribute("type", "radio");
//                 starInput.setAttribute("name", "rate");
//                 starInput.setAttribute("id", `rate-${c}`);
//                 starInput.setAttribute("value", c);

//                 const starLabel = document.createElement("label");
//                 starLabel.setAttribute("for", `rate-${c}`);
//                 starLabel.classList.add("fa", "fa-star");

//                 if (c <= reviewDetails[d].star) {
//                   starInput.setAttribute("checked", true);
//                   starLabel.setAttribute("style", "color:#fd4;");
//                 }

//                 starWidget.appendChild(starInput);
//                 starWidget.appendChild(starLabel);
//               }

//               const p_feedback = document.createElement("p");
//               p_feedback.setAttribute("class", "revFeedback");
//               p_feedback.innerText = reviewDetails[d].feedback;

//               div_subject.append(starWidget);
//               div_subject.append(p_feedback);
//               a = false;
//             }
//           }
//         }

//         if (a === true) {
//           const button_review = document.createElement("button");
//           button_review.setAttribute("type", "button");
//           button_review.setAttribute("class", "btnReview");
//           button_review.innerText = "Give Review";
//           div_subject.append(button_review);
//         }
//       }

//       if (orderProduct[i].orderStatus === "Cancelled") {
//         const p_reason = document.createElement("p");
//         p_reason.setAttribute("class", "reason");
//         p_reason.innerText = orderProduct[i].cancel_reason;
//         p_reason.setAttribute("style", "display:block");
//         div_subject.append(p_reason);

//         const span_reason = document.createElement("span");
//         span_reason.innerText = "Cancel Reason : ";
//         p_reason.prepend(span_reason);
//       }

//       const div_field = document.createElement("div");
//       div_field.setAttribute("class", "field");
//       div_my_order_text.append(div_field);

//       const div_1 = document.createElement("div");
//       div_field.append(div_1);

//       // <label>Date:<p>25.12.2022</p></label>
//       const label_1 = document.createElement("label");
//       label_1.innerText = "Delivery Date:";
//       div_1.append(label_1);

//       const input_1 = document.createElement("input");
//       input_1.setAttribute("type", "date");
//       input_1.setAttribute("value", orderProduct[i].dateOfDelivery);
//       input_1.setAttribute("readOnly", "true");
//       div_1.append(input_1);

//       const div_2 = document.createElement("div");
//       div_field.append(div_2);

//       // <label>No.Of.Guest: 39</label>
//       const label_2 = document.createElement("label");
//       label_2.innerText = "No.of.Guest:";
//       div_2.append(label_2);

//       const input_2 = document.createElement("input");
//       input_2.setAttribute("type", "number");
//       input_2.setAttribute(
//         "value",
//         orderProduct[i].ordered_product[j].no_of_guest
//       );
//       input_2.setAttribute("readOnly", "true");
//       div_2.append(input_2);

//       const div_3 = document.createElement("div");
//       div_field.append(div_3);

//       // <label>Status: <p>Delivered</p> </label>
//       const label_3 = document.createElement("label");
//       label_3.innerText = "Price:";
//       div_3.append(label_3);

//       const input_3 = document.createElement("input");
//       input_3.setAttribute("type", "number");
//       input_3.setAttribute("value", orderProduct[i].ordered_product[j].price);
//       input_3.setAttribute("readOnly", "true");
//       div_3.append(input_3);

//       const div_dropdown = document.createElement("div");
//       div_dropdown.setAttribute("class", "dropdown_menu-type-content animate");
//       div_dropdown.setAttribute("id", "show");
//       div_my_order_text.append(div_dropdown);

//       // <i class='bx bx-x-circle'></i>

//       const icon = document.createElement("i");
//       icon.setAttribute("class", "bx bx-x-circle");
//       icon.setAttribute("id", "closeDish");
//       div_dropdown.append(icon);

//       const ul_dishes = document.createElement("ul");
//       ul_dishes.setAttribute("class", "dishes");
//       div_dropdown.append(ul_dishes);

//       const find_dish_data = orderProduct[i].ordered_product[j].dishData;
//       // console.log(find_dish_data);

//       const finddish = dishData.filter((product) =>
//         find_dish_data.some((find) => find.id === product.id)
//       );

//       // console.log(finddish);
//       for (let k = 0; k < finddish.length; k++) {
//         const li = document.createElement("li");
//         li.innerText = finddish[k].name;
//         ul_dishes.append(li);
//       }

//       document.querySelector("div.orders").prepend(div_my_orders_list);
//     }
//   }

//   // view dish
//   const viewBtn = document.querySelectorAll(".view");
//   viewBtn.forEach((showDishes) => {
//     showDishes.addEventListener("click", function empty() {
//       const parent = this.closest(".my-orders_list");

//       const div_dish = parent.querySelector("#show");
//       div_dish.setAttribute("style", "display:block");

//       const div_back_1 = parent.querySelector(".my_order_text div");
//       div_back_1.style.opacity = "0.5";

//       const div_back = parent.querySelector(".field");
//       div_back.style.opacity = "0.2";
//     });
//   });

//   // close dish
//   const closeBtn = document.querySelectorAll("#closeDish");
//   closeBtn.forEach((close_dish) => {
//     close_dish.addEventListener("click", function empty() {
//       const parent = this.closest(".my-orders_list");
//       const div_dish = parent.querySelector(".dropdown_menu-type-content");
//       div_dish.removeAttribute("style");

//       const div_back_1 = parent.querySelector(".my_order_text div");
//       div_back_1.removeAttribute("style");

//       const div_back = parent.querySelector(".field");
//       div_back.removeAttribute("style");
//     });
//   });

//   // cancel order
//   const cancelBtn = document.querySelectorAll(".cancel");
//   cancelBtn.forEach((cancelOrder) => {
//     cancelOrder.addEventListener("click", function empty() {
//       const reason = prompt("Enter the reason", "");
//       if (reason == null || reason === "") {
//         alert("Enter the reason");
//       } else {
//         // console.log(reason);
//         const parent = this.closest(".my_order_text");
//         const user_id = parent.querySelector(".cancel");

//         const findData = orderProduct.filter(
//           (data) => data.order_id === user_id.value
//         );
//         // console.log(findData)

//         findData[0].orderStatus = "Cancelled";
//         findData[0].cancel_reason = reason;
//         // console.log(findData[0]);

//         localStorage.setItem("orderProduct", JSON.stringify(orderProduct));
//         alert("Order cancelled Sucessfully");
//         // user_id.setAttribute("style", "display:none")
//         window.location.reload();

//         const indicate_status = parent.querySelector("#order_status");
//         indicate_status.setAttribute("style", "color:red");
//       }
//     });
//   });

//   const m = moment().format("YYYY-MM-DD");
//   // console.log(m)

//   const find_notDelivered_data = orderProduct.filter(
//     (data) => data.orderStatus === "Not Delivered"
//   );
//   // console.log(find_notDelivered_data);

//   for (let i = 0; i < find_notDelivered_data.length; i++) {
//     if (find_notDelivered_data[i].dateOfDelivery <= m) {
//       find_notDelivered_data[i].orderStatus = "Delivered";
//       localStorage.setItem("orderProduct", JSON.stringify(orderProduct));
//     }
//   }
// }

// view_orders();

// const statusBtn = document.querySelectorAll(".btn_toggle");
// statusBtn.forEach((showOrders) => {
//   showOrders.addEventListener("click", function empty() {
//     const div_for_append = document.querySelector("div.orders");

//     div_for_append.innerText = "";

//     orderProduct = JSON.parse(localStorage.getItem("orderProduct"));

//     const parent = this.innerText;
//     // console.log(parent);

//     orderProduct = orderProduct.filter((data) => data.orderStatus === `${parent}`);

//     view_orders();
//   });
// });
