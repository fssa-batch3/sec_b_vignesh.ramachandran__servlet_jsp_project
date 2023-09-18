const transactionTable = JSON.parse(localStorage.getItem("transactionTable"));
const newmenuData = JSON.parse(localStorage.getItem("menuData"));
const categoryData = JSON.parse(localStorage.getItem("categoryData"));
const dishData = JSON.parse(localStorage.getItem("dishData"));

const menulist = document.querySelector(".menulist");

for (let i = 0; i < newmenuData.length; i++) {
  const option = document.createElement("option");
  option.value = newmenuData[i].id;
  option.innerText = newmenuData[i].menuName;

  menulist.append(option);
}

// get the local storage value to the select and option for category name
const showCatergoy = document.querySelector(".show1");

function getCatDetails() {
  const menuType = document.getElementById("menuName").value;
  const menu_option = document.querySelector("#menuName");

  if (menuType !== "") {
    const findData = categoryData.filter((data) => data.menuType === menuType);

    // creating select option depends upon the categoryData
    const categorylist = document.querySelector(".categorylist");

    for (let i = 0; i < findData.length; i++) {
      const option = document.createElement("option");
      option.value = findData[i].id;
      option.innerText = findData[i].categoryName;

      categorylist.append(option);
    }

    showCatergoy.setAttribute("style", "display:none");
    menu_option.setAttribute("disabled", "true");
  } else {
    alert("Select Menu type");
  }
}

showCatergoy.addEventListener("click", getCatDetails);

// show dishes
const show = document.querySelector(".show2");

function showDishes() {
  const saveBtn = document.querySelector(".save");
  const category_option = document.querySelector("#categoryName");

  const container = document.querySelector("#input_group");

  const menuType = document.getElementById("menuName").value;
  const categoryType = document.getElementById("categoryName").value;

  if (menuType === "") {
    alert("Select Menu type");
  } else if (menuType !== "" && categoryType !== "") {
    // filtering Menu
    const findData = transactionTable.filter(
      (data) => data.menuType === menuType
    );

    //  filtering Category
    const findData2 = findData.filter(
      (data) => data.categoryType === categoryType
    );

    // filtering the dish from the dishData using menu id and category id from the transactionTable
    const findData3 = dishData.filter((product) =>
      findData2.some((find) => find.dish === product.id)
    );
    // console.log(findData3);

    for (let i = 0; i < findData3.length; i++) {
      const div_field = document.createElement("div");
      div_field.setAttribute("class", "field");

      const checkbox = document.createElement("input");
      checkbox.type = "checkbox";
      checkbox.class = "checkbox";
      checkbox.value = findData3[i].id;

      const newInput = document.createElement("input");
      newInput.type = "text";
      newInput.id = `dish${i}`;
      newInput.pattern = "^[A-Z\\s]+$";
      newInput.value = findData3[i].name;
      newInput.setAttribute("readonly", "true");

      const input_qty = document.createElement("input");
      input_qty.type = "text";
      input_qty.placeholder = "Enter Quantity";
      input_qty.className = "input_qty";
      input_qty.id = `qty${i}`;
      input_qty.value = findData3[i].qty;
      input_qty.required = "true";

      const priceInput = document.createElement("input");
      priceInput.type = "number";
      priceInput.pattern = "[0-9]{1,3}";
      priceInput.id = `price${i}`;
      priceInput.value = findData3[i].price;
      priceInput.min = "0";
      priceInput.max = "150";

      const select_status = document.createElement("select");
      select_status.setAttribute("id", `status${i}`);
      select_status.setAttribute("required", "true");
      div_field.append(select_status);

      if (findData3[i].status === "true") {
        const option_1_status = document.createElement("option");
        option_1_status.setAttribute("value", "true");
        option_1_status.innerText = "True";
        // option_1_status.innerText = findData3[i]["status"]x
        select_status.append(option_1_status);

        const option_2_status = document.createElement("option");
        option_2_status.setAttribute("value", "false");
        option_2_status.innerText = "False";
        select_status.append(option_2_status);
      } else {
        const option_2_status = document.createElement("option");
        option_2_status.setAttribute("value", "false");
        option_2_status.innerText = "False";
        select_status.append(option_2_status);

        const option_1_status = document.createElement("option");
        option_1_status.setAttribute("value", "true");
        option_1_status.innerText = "True";
        select_status.append(option_1_status);
      }

      container.append(div_field);
      div_field.append(checkbox);
      div_field.append(newInput);
      div_field.append(input_qty);
      div_field.append(priceInput);
    }

    show.setAttribute("style", "display:none");
    saveBtn.removeAttribute("style");
    category_option.setAttribute("disabled", "true");
  } else {
    alert("Click the show category button (or) Select the category ");
  }
}

show.addEventListener("click", showDishes);

const form_id = document.getElementById("change");
// form_id.forEach((saveDish) => {
form_id.addEventListener("submit", (e) => {
  e.preventDefault();
  const menuType = document.getElementById("menuName").value;
  const categoryType = document.getElementById("categoryName").value;

  const findData = transactionTable.filter(
    (data) => data.menuType === menuType
  );
  // console.log(findData);

  const findData2 = findData.filter(
    (data) => data.categoryType === categoryType
  );
  // console.log(findData2);

  const findData3 = dishData.filter((product) =>
    findData2.some((find) => find.dish === product.id)
  );

  const checkbox = document.querySelector("input[type=checkbox]:checked").value;
  // console.log(checkbox);

  let Dish_index = "";

  for (let i = 0; i < findData2.length; i++) {
    if (findData2[i].dish === parseInt(checkbox)) {
      Dish_index = i;
    }
  }
  // console.log(Dish_index);

  const x = `status${Dish_index}`;
  // const y = `dish${Dish_index}`;
  const y = `qty${Dish_index}`;
  const z = `price${Dish_index}`;

  // const up_name = document.getElementById(y).value;
  const up_price = document.getElementById(z).value;
  const up_qty = document.getElementById(y).value;
  const up_status = document.getElementById(x).value;

  if (up_price !== "" && up_price !== "--" && up_price <= 150) {
    // let a = true;

    // if (up_name.trim() === "") {
    //   alert("Enter the Dish name");
    // } else {
    //   for (let k = 0; k < findData3.length; k++) {
    //     const edited_dishName = up_name.replace(/\(\d+\)/, "");
    //     // console.log(edited_dishName);

    //     if (
    //       edited_dishName.toLowerCase() ===
    //       findData3[k].name.replace(/\(\d+\)/, "").toLowerCase()
    //     ) {
    //       alert(
    //         `${up_name} ` +
    //           `already presented in the given menu & category as dishId =${findData3[k].id}`
    //       );
    //       a = false;
    //     }
    //   }

    // if (a !== false) {
    // to change the status in transaction table
    findData2[Dish_index].status = up_status;

    // to change or update in dishdata
    findData3[Dish_index].status = up_status;
    findData3[Dish_index].qty = up_qty;
    // findData3[Dish_index].name = up_name;
    findData3[Dish_index].price = up_price;

    // m[Dish_index]["name"] = up_dish

    localStorage.setItem("dishData", JSON.stringify(dishData));
    localStorage.setItem("transactionTable", JSON.stringify(transactionTable));
    alert("Dish updated Sucessfully ✅");
    window.location.reload();
    // }
    // }
  } else {
    alert("Price not should be empty(or) above 150. It should be 0 to 150");
    // location.reload();
  }

  // e.preventDefault();
});
// });

// // delete dish
// let deleteBtn = document.querySelectorAll(".remove");
// // let checkbox = ""

// deleteBtn.forEach(function (deleteDish) {
//     deleteDish.addEventListener("click", function () {

//         let menuType = document.getElementById("menuName").value;
//         let categoryType = document.getElementById("categoryName").value;

//         // filtering Menu
//         function getMenu(e) {
//             return e.id === menuType;
//         }
//         findData = newmenuData.filter(getMenu)
//         // console.log(findData);

//         let k = findData[0]["categoryData"]

//         //  filtering Category
//         function getCategory(e) {
//             return e.id === categoryType;
//         }
//         findData2 = k.filter(getCategory)
//         // console.log(findData2)

//         let m = findData2[0]["dishData"]

//         checkbox = document.querySelector('input[type=checkbox]:checked').value;
//         // console.log(checkbox);

//         for (i = 0; i < m.length; i++) {

//             if (m[i].name == checkbox) {
//                 m.splice(i, 1)
//                 localStorage.setItem("menuData", JSON.stringify(menuData));
//                 alert("Dish Removed Sucessfully")
//             }
//         }
//         location.reload()

//     })
// })
