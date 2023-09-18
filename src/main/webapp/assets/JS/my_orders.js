const orderData = JSON.parse(localStorage.getItem("orderData"));
const orderProduct = JSON.parse(localStorage.getItem("orderProduct"));
const newMenuData = JSON.parse(localStorage.getItem("menuData"));
const categoryData = JSON.parse(localStorage.getItem("categoryData"));
// const dishData = JSON.parse(localStorage.getItem("dishData"));
const user_unique = JSON.parse(localStorage.getItem("user_unique"));

const findData = orderData.filter((data) => data.user_id === user_unique);

// console.log(findData);

const orderData_user = orderProduct.filter((product) =>
  findData.some((find) => find.order_id === product.order_id)
);
// console.log(orderData_user);

for (let i = 0; i < findData.length; i++) {
  // getting order container
  const divOrder = document.querySelector("div.orders");

  // create my orders list container
  const myOrdersListDiv = document.createElement("div");
  myOrdersListDiv.classList.add("my_orders_list");

  // create order info container
  const orderInfoDiv = document.createElement("div");
  orderInfoDiv.classList.add("order_info");

  // create order ID paragraph
  const orderIdP = document.createElement("p");
  orderIdP.classList.add("order_id");
  orderIdP.textContent = `Order ID : ${findData[i].order_id}`;
  orderInfoDiv.append(orderIdP);

  // create order date paragraph
  const orderDateP = document.createElement("p");
  orderDateP.textContent = `Order Date : ${findData[i].order_date}`;
  orderInfoDiv.append(orderDateP);

  myOrdersListDiv.append(orderInfoDiv);

  const idea = findData[i].order_id;

  const findOrderedProduct = orderData_user.filter(
    (data) => data.order_id === idea
  );

  // console.log(findOrderedProduct);

  for (let j = 0; j < findOrderedProduct.length; j++) {
    const menu_id = `${findOrderedProduct[j].menu_id}`;
    const category_id = `${findOrderedProduct[j].category_id}`;

    const menu_name = newMenuData.find((data) => data.id === menu_id);
    const category_name = categoryData.find((data) => data.id === category_id);

    // create order menu container
    const orderMenuDiv = document.createElement("div");
    orderMenuDiv.classList.add("order_menu");

    // create menu item name paragraph
    const menuItemNameP = document.createElement("p");
    menuItemNameP.innerText = `${category_name.categoryName}  ${menu_name.menuName}`;
    orderMenuDiv.append(menuItemNameP);

    const orderMenuStatus = document.createElement("span");
    orderMenuStatus.setAttribute("class", "ordMenSta");

    if (findOrderedProduct[j].order_status === "Not Delivered") {
      orderMenuStatus.innerText = `(${findOrderedProduct[j].order_status})`;
      orderMenuStatus.setAttribute("style", "color:var(--text-color)");
    }
    if (findOrderedProduct[j].order_status === "Delivered") {
      orderMenuStatus.innerText = `(${findOrderedProduct[j].order_status})`;
      orderMenuStatus.setAttribute("style", "color:var(--thickgreen-color)");
    }
    if (findOrderedProduct[j].order_status === "Cancelled") {
      orderMenuStatus.innerText = `(${findOrderedProduct[j].order_status})`;
      orderMenuStatus.setAttribute("style", "color:var(--second-color)");
    }

    orderMenuDiv.append(orderMenuStatus);

    // create menu item price paragraph
    const menuItemPriceP = document.createElement("p");
    menuItemPriceP.innerText = `${findOrderedProduct[j].price}`;
    orderMenuDiv.append(menuItemPriceP);

    myOrdersListDiv.append(orderMenuDiv);
  }

  // create order price container
  const orderPriceDiv = document.createElement("div");
  orderPriceDiv.classList.add("order_price");

  // create total price heading
  const totalPriceHeading = document.createElement("h2");
  totalPriceHeading.innerText = "Total Price:";
  orderPriceDiv.append(totalPriceHeading);

  // create total price paragraph
  const totalPriceP = document.createElement("p");
  totalPriceP.innerText = `${findData[i].totalCost}`;
  orderPriceDiv.append(totalPriceP);

  myOrdersListDiv.append(orderPriceDiv);

  // create ordered by paragraph
  const orderedByP = document.createElement("p");
  orderedByP.classList.add("order_by");
  orderedByP.innerText = `Ordered By : ${findData[i].user_id}`;
  myOrdersListDiv.append(orderedByP);

  // create view details button
  const viewDetailsButton = document.createElement("button");
  viewDetailsButton.classList.add("btnView");
  viewDetailsButton.innerText = "View Details";
  myOrdersListDiv.append(viewDetailsButton);

  divOrder.prepend(myOrdersListDiv);
}

const btnView = document.querySelectorAll(".btnView");
btnView.forEach((showProducts) => {
  showProducts.addEventListener("click", function show() {
    const parent = this.closest(".my_orders_list");
    const order_id = parent
      .querySelector(".order_id")
      .innerText.replace("Order ID : ", "");

    window.location.href = `../profile/order_details.html?orderId=${order_id}`;
  });
});

const loader = document.getElementById("preloader");

window.addEventListener("load", () => {
  loader.style.display = "none";
});
