// // creating select option depends upon the menuData
const menulist = document.querySelector(".menulist");

const newmenuData = JSON.parse(localStorage.getItem("menuData"));
const categoryData = JSON.parse(localStorage.getItem("categoryData"));

for (let i = 0; i < newmenuData.length; i++) {
  const option = document.createElement("option");
  option.value = newmenuData[i].id;
  option.innerText = newmenuData[i].menuName;

  menulist.append(option);
}

function getCatDetails() {
  const menuType = document.getElementById("menuName").value;
  const menu_option = document.querySelector("#menuName");

  if (menuType !== "") {
    const findData = categoryData.filter((data) => data.menuType === menuType);
    // function getMenu(e) {
    //   return e.menuType === menuType;
    // }
    // const findData = categoryData.filter(getMenu);
    // console.log(findData);

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

// get the local storage value to the select and option for category name
const showCatergoy = document.querySelector(".show1");
showCatergoy.addEventListener("click", getCatDetails);

let findData = "";
let findData2 = "";

function showCatDetails() {
  const saveBtn = document.querySelector(".save");
  const category_option = document.querySelector("#categoryName");

  const menuType = document.getElementById("menuName").value;
  const categoryType = document.getElementById("categoryName").value;

  if (menuType === "") {
    alert("Select Menu type");
  } else if (menuType !== "" && categoryType !== "") {
    // filtering menu
    findData = categoryData.filter((data) => data.menuType === menuType);

    console.log(findData);

    // let k = findData[0]["categoryData"]
    // console.log(k)

    // filtering category
    findData2 = findData.filter((data) => data.id === categoryType);

    console.log(findData2);

    // let yes = document.getElementById("categoryNameGet").value
    const categoryName = document.getElementById("categoryNameGet");
    const categoryStatus = document.getElementById("categoryStatusGet");
    const categoryImage = document.getElementById("categoryImageGet");
    // let categoryPrice = document.getElementById("categoryPriceGet")

    categoryName.value = findData2[0].categoryName;
    categoryStatus.value = findData2[0].status;
    categoryImage.value = findData2[0].categoryImage;
    // categoryPrice.value = categoryData[0]["categoryPrice"]

    showDetails.setAttribute("style", "display:none");
    category_option.setAttribute("disabled", "true");
  } else {
    alert("Click the Show category button (or) Select Category type");
  }

  saveBtn.removeAttribute("style");
}

// show the details of the category
const showDetails = document.querySelector(".show2");
showDetails.addEventListener("click", showCatDetails);

// after updating form function
const form_change = document.getElementById("change");

function saveData(e) {
  e.preventDefault();
  const upStatus = document.getElementById("categoryStatusGet").value;
  const upImage = document.getElementById("categoryImageGet").value;
  // let upPrice = document.getElementById("categoryPriceGet").value;

  findData2[0].status = upStatus;
  findData2[0].categoryImage = upImage;
  // findData2[0]["categoryPrice"] = upPrice;

  localStorage.setItem("categoryData", JSON.stringify(categoryData));
  alert("Category Details updated Sucessfully ✅");
  window.location.reload();
}

form_change.addEventListener("submit", saveData);

// // delete the category from the menuData
// let deleteBtn = document.querySelector(".delete");
// deleteBtn.addEventListener("click", removeCategory);

// function removeCategory() {
//     // let menuType = document.getElementById("menuName").value;
//     let categoryType = document.getElementById("categoryName").value;

//     // // filtering menu
//     // function getMenu(e) {
//     //     return e.id === menuType;
//     // }
//     // findData = newmenuData.filter(getMenu)

//     // let k = findData[0]["categoryData"]
//     // // console.log(k)

//     // filtering category
//     function getCategory(e) {
//         return e.id == categoryType;
//     }
//     findData = categoryData.filter(getCategory);
//     // console.log(findData2[0]["categoryName"]);

//     // here finding the index of findData from menuData and delete
//     for (i = 0; i < categoryData.length; i++) {

//         if (findData[0]["categoryName"] == categoryData[i]["categoryName"]) {

//             categoryData.splice(i, 1)
//             localStorage.setItem("categoryData", JSON.stringify(categoryData));
//             alert("Category Deleted Sucessfully ✅")
//             location.reload()
//         }
//     }
// }
