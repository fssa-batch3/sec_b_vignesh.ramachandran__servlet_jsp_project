const dishData = JSON.parse(localStorage.getItem("dishData")) || [];
const transactionTable =
  JSON.parse(localStorage.getItem("transactionTable")) || [];

// creating select option depends upon the menuData
const menulist = document.querySelector(".menulist");

const newmenuData = JSON.parse(localStorage.getItem("menuData"));
const categoryData = JSON.parse(localStorage.getItem("categoryData"));

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

    // console.log(findData)

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
    alert("Select the Menu");
  }
}

showCatergoy.addEventListener("click", getCatDetails);

// selecting the plus button and empty div
const addBtn = document.querySelector(".bx-plus");

function addInput() {
  const container = document.getElementById("input_group");

  const menuType = document.getElementById("menuName").value;
  const categoryType = document.getElementById("categoryName").value;

  // console.log(menuType);
  // console.log(categoryType)

  function add_input() {
    const category_option = document.querySelector("#categoryName");

    if (menuType !== "" && categoryType !== "") {
      // create div_field
      const div_field = document.createElement("div");
      div_field.setAttribute("class", "field");

      const div_content = document.createElement("div");
      div_content.setAttribute("class", "content");

      // create a new input element
      const newInput = document.createElement("input");
      newInput.type = "text";
      newInput.placeholder = "Enter Dish Name";
      newInput.id = n;
      newInput.name = "dish";
      newInput.pattern = "^[A-Z\\s]+$";
      // newInput.id = "dish" + (n);
      newInput.required = "true";

      const span = document.createElement("span");
      span.innerHTML =
        "*Enter the Dish name and quantity. Eg: SAMBAR VADA, 1 (or) 200g";

      const input_qty = document.createElement("input");
      input_qty.type = "text";
      input_qty.placeholder = "Enter Quantity";
      input_qty.className = "input_qty";
      input_qty.id = `qty${n}`;
      // input_qty.pattern = "[0-9]{1,2}";
      // input_qty.min = "0";
      // input_qty.max = "5";
      input_qty.required = "true";

      const inputPrice = document.createElement("input");
      inputPrice.type = "number";
      inputPrice.placeholder = "Enter Price";
      inputPrice.id = `price${n}`;
      inputPrice.pattern = "[0-9]{1,3}";
      inputPrice.min = "0";
      inputPrice.max = "150";
      inputPrice.required = "true";

      // append html tags depends upon our wish
      container.append(div_field);
      div_field.append(div_content);
      div_content.appendChild(newInput);
      div_content.append(input_qty);
      div_content.append(inputPrice);
      div_field.append(span);

      category_option.setAttribute("disabled", "true");
    } else {
      alert("Select Menu and Category type");
    }
  }

  const inputCount = document.getElementsByName("dish").length;
  // console.log(inputCount)

  let n = "";

  if (dishData.length === 0) {
    n = inputCount + 1;
    // console.log(n)

    add_input();
  } else {
    const category_option = document.querySelector("#categoryName");

    const localDishcount = dishData.length;

    n = inputCount + localDishcount + 1;
    // console.log(n);

    if (menuType !== "" && categoryType !== "") {
      // create div_field
      const div_field = document.createElement("div");
      div_field.setAttribute("class", "field");

      const div_content = document.createElement("div");
      div_content.setAttribute("class", "content");

      // create a new input element
      const newInput = document.createElement("input");
      newInput.type = "text";
      newInput.placeholder = "Enter Dish Name";
      newInput.id = n;
      newInput.name = "dish";
      newInput.pattern = "^[A-Z\\s]+$";
      // newInput.id = "dish" + (n);
      newInput.required = "true";

      const span = document.createElement("span");
      span.innerHTML =
        "*Enter the Dish name and quantity. Eg: SAMBAR VADA, 1 (or) 200g";

      const input_qty = document.createElement("input");
      input_qty.type = "text";
      input_qty.placeholder = "Enter Quantity";
      input_qty.className = "input_qty";
      input_qty.id = `qty${n}`;
      // input_qty.pattern = "[0-9]{1,2}";
      // input_qty.min = "0";
      // input_qty.max = "5";
      input_qty.required = "true";

      const inputPrice = document.createElement("input");
      inputPrice.type = "number";
      inputPrice.placeholder = "Enter Price";
      inputPrice.id = `price${n}`;
      inputPrice.pattern = "[0-9]{1,3}";
      inputPrice.min = "0";
      inputPrice.max = "150";
      inputPrice.required = "true";

      // append html tags depends upon our wish
      container.append(div_field);
      div_field.append(div_content);
      div_content.appendChild(newInput);
      div_content.append(input_qty);
      div_content.append(inputPrice);
      div_field.append(span);

      category_option.setAttribute("disabled", "true");
    } else {
      alert("Select Menu and Category type");
    }
  }
}

addBtn.addEventListener("click", addInput);

const form_id = document.getElementById("getData");

function getData(e) {
  e.preventDefault();
  const inputCount = document.getElementsByName("dish").length;
  // console.log(inputCount);

  let localDishcount = dishData.length;
  // console.log(localDishcount)

  const n = inputCount + localDishcount;
  // console.log(n);

  const menuType = document.getElementById("menuName").value;
  const categoryType = document.getElementById("categoryName").value;

  // console.log(menuType);
  // console.log(categoryType);

  function check() {
    // let inputCount = document.getElementsByName("dish").length;

    for (let i = localDishcount + 1; i < n + 1; i++) {
      localDishcount = dishData.length;
      // console.log(localDishcount);

      // let b = "";
      let a = true;
      // console.log(i)
      const dishes = document.getElementById(i).value;
      // console.log(dishes);
      if (dishes.trim() === "") {
        alert("Please enter the Dish name");
      } else {
        const price = document.getElementById(`price${i}`).value;
        const qty = document.getElementById(`qty${i}`).value;
        // console.log(price);

        // new code
        let index = "";
        for (let j = 0; j < localDishcount; j++) {
          // console.log("rajini")

          if (
            dishes.replace(/\(\d+\)/, "").toLowerCase() ===
            dishData[j].name.replace(/\(\d+\)/, "").toLowerCase()
          ) {
            index = j + 1;
            // console.log(index);

            // filtering Menu
            const findData = transactionTable.filter(
              (data) => data.menuType === menuType
            );

            //  filtering Category
            const findData2 = findData.filter(
              (data) => data.categoryType === categoryType
            );

            for (let k = 0; k < findData2.length; k++) {
              if (index === findData2[k].dish) {
                alert(
                  `${dishes} ` +
                    `already presented in the given menu & category as dishId =${findData2[k].dish}`
                );
                a = false;
              }
              // else {
              //     console.log("no dishes")
              //     a = true;
              // }
            }
            window.location.reload();
          }
        }

        // new code
        if (a !== false) {
          if (dishes.trim() === "") {
            alert("Please Enter the Dish name");
          } else {
            dishData.push({
              name: dishes,
              id: localDishcount + 1,
              qty,
              price,
              status: "true",
            });
            transactionTable.push({
              menuType,
              categoryType,
              dish: i,
              status: "true",
            });

            // console.log(dishData);
            // console.log(transactionTable);
            // console.log(dishData[dishData.length - 1]);

            localStorage.setItem("dishData", JSON.stringify(dishData));
            localStorage.setItem(
              "transactionTable",
              JSON.stringify(transactionTable)
            );
            alert("Dish Added Sucessfully ✅");

            window.location.reload();
          }
        }
      }
    }
  }

  if (dishData.length === 0 && transactionTable.length === 0) {
    // loop for getting dishes by using id
    for (let i = 1; i <= inputCount; i++) {
      const dishes = document.getElementById(i).value;
      const price = document.getElementById(`price${i}`).value;
      const qty = document.getElementById(`qty${i}`).value;

      if (dishes.trim === "") {
        alert("Please enter the Dish name");
      } else {
        // pushing the all dishes into the dishName []
        dishData.push({ name: dishes, id: i, price, qty, status: "true" });
        transactionTable.push({
          menuType,
          categoryType,
          dish: i,
          status: "true",
        });
      }
    }
    // console.log(dishData[dishData.length - 1]);

    localStorage.setItem("dishData", JSON.stringify(dishData));
    localStorage.setItem("transactionTable", JSON.stringify(transactionTable));
    alert("Dish Added Sucessfully ✅");

    window.location.reload();
  } else {
    check();
  }

  // e.preventDefault();
}

form_id.addEventListener("submit", getData);
