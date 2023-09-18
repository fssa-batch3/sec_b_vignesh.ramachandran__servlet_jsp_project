// for getting menu id
const menuId = new URLSearchParams(window.location.search).get("menu");

const newmenuData = JSON.parse(localStorage.getItem("menuData"));

const menuDetails = newmenuData.find((data) => data.id === menuId);

// for getting category id
const categoryId = new URLSearchParams(window.location.search).get("category");

const categoryData = JSON.parse(localStorage.getItem("categoryData"));

const categoryDetails = categoryData.find((data) => data.id === categoryId);

// for getting page name, eg:ordinary dinner
const ingredientImage = document.querySelector(".ingredient-image");

const category_name = document.createElement("h2");
category_name.innerText = `${categoryDetails.categoryName} ${menuDetails.menuName}`;

ingredientImage.append(category_name);

const userData = JSON.parse(localStorage.getItem("userData"));
const transactionTable = JSON.parse(localStorage.getItem("transactionTable"));
const dishData = JSON.parse(localStorage.getItem("dishData"));
const reviewDetails = JSON.parse(localStorage.getItem("reviewDetails"));

// filtering Menu
function getMenu(e) {
  return e.menuType === menuId;
}
const findData = transactionTable.filter(getMenu);
// console.log(findData);

//  filtering Category
function getCategory(e) {
  return e.categoryType === categoryId;
}
const findData2 = findData.filter(getCategory);
// console.log(findData2)

// comparing the dish id from the findData2 to id from the dishData
const findData3 = dishData.filter((product) =>
  findData2.some((find) => find.dish === product.id)
);

// filtering get status=true from newmenuData
function getStatus(e) {
  return e.status === "true";
}
const dishDataTrue = findData3.filter(getStatus);
// console.log(dishDataTrue);

let div_content = document.querySelector(".content");

const un_ordered_list = document.createElement("ul");
un_ordered_list.setAttribute("class", "dishes");
div_content.prepend(un_ordered_list);

for (let i = 0; i < dishDataTrue.length; i++) {
  const list = document.createElement("li");
  list.innerText = `${dishDataTrue[i].name} - ${dishDataTrue[i].qty} - ₹ ${dishDataTrue[i].price}`;
  un_ordered_list.append(list);
}

const div_nxt_page = document.querySelector(".nxt_page");

let cost = 0;
for (let j = 0; j < dishDataTrue.length; j++) {
  cost += parseInt(dishDataTrue[j].price);
}

const price = document.createElement("p");
price.innerText = `₹ ${cost}`;
div_nxt_page.prepend(price);

const heading = document.createElement("h3");
heading.innerText = ` ${categoryDetails.categoryName} ${menuDetails.menuName}`;
div_content.prepend(heading);

const highlight = document.createElement("span");
highlight.innerText = "SR's";
heading.prepend(highlight);

// rating div

const div_rating = document.querySelector(".rating");

const find_revData1 = reviewDetails.filter((data) => data.menu_id === menuId);
// console.log(find_revData1);

const find_revData2 = find_revData1.filter(
  (data) => data.category_id === categoryId
);
// console.log(find_revData2);

for (let k = 0; k < find_revData2.length; k++) {
  const revUserId = find_revData2[k].user_id;
  // console.log(revUserId);

  const find_revUser = userData.filter((data) => data.email === revUserId);
  // console.log(find_revUser)

  const revUserName = find_revUser[0].name;
  // console.log(revUserName);

  // Create the outer div element with class "rev_user"
  const divRevUser = document.createElement("div");
  divRevUser.className = "rev_user";

  // Create the user profile section
  const divUserPic = document.createElement("div");
  divUserPic.className = "user_pic";

  // Create the profile picture element
  const imgProfile = document.createElement("img");
  imgProfile.src = "../../../assets/img/profile.png";
  imgProfile.alt = "profile image";

  // Create the username heading element
  const h2Username = document.createElement("h2");
  h2Username.textContent = revUserName;

  // Append the profile picture and username to the user profile section
  divUserPic.appendChild(imgProfile);
  divUserPic.appendChild(h2Username);

  // Create the star rating widget section
  const divStarWidget = document.createElement("div");
  divStarWidget.className = "star-widget";

  // Create the star rating inputs and labels
  for (let c = 1; c <= 5; c++) {
    const starInput = document.createElement("input");
    starInput.setAttribute("type", "radio");
    starInput.setAttribute("name", "rate");
    starInput.setAttribute("id", `rate-${c}`);
    starInput.setAttribute("value", c);

    const starLabel = document.createElement("label");
    starLabel.setAttribute("for", `rate-${c}`);
    starLabel.classList.add("fa", "fa-star");

    if (c <= find_revData2[k].star) {
      starInput.setAttribute("checked", true);
      starLabel.setAttribute("style", "color:#fd4;");
    }

    divStarWidget.appendChild(starInput);
    divStarWidget.appendChild(starLabel);
  }

  // Create the feedback comment paragraph
  const pRevFeedback = document.createElement("p");
  pRevFeedback.className = "revFeedback";
  pRevFeedback.textContent = find_revData2[k].feedback;

  // Append all the elements to the outer div element
  divRevUser.appendChild(divUserPic);
  divRevUser.appendChild(divStarWidget);
  divRevUser.appendChild(pRevFeedback);

  div_rating.append(divRevUser);
}

// related menu

// <h2 class="related-menu_heading">Related <span>Breakfast</span> Menus</h2>
const h2Name = document.createElement("h2");
h2Name.setAttribute("class", "related-menu_heading");
h2Name.innerText = "Related ";

const span_menu = document.createElement("span");
span_menu.innerText = `${menuDetails.menuName} Menu`;
h2Name.append(span_menu);

document.querySelector(".related-menu").append(h2Name);

// <div class="related-menu_content">
div_content = document.createElement("div");
div_content.setAttribute("class", "related-menu_content");

const find_cat = categoryData.filter((data) => data.menuType === menuId);

const related_cat = find_cat.filter((data) => data.id !== categoryId);

// console.log(related_cat);

const categoryDataTrue = related_cat.filter((data) => data.status === "true");

for (let i = 0; i < categoryDataTrue.length; i++) {
  // <div class="related-menu1">
  const div_menu = document.createElement("div");
  div_menu.setAttribute("class", "related-menu1");
  div_content.append(div_menu);

  // <img src="../../../assets/img/Dishes/special tiffin.jpg" alt="special tiffin" />
  const image = document.createElement("img");
  image.setAttribute("src", categoryDataTrue[i].categoryImage);
  div_menu.append(image);

  // <a href="./morning-special.html">
  const a_link = document.createElement("a");
  a_link.setAttribute(
    "href",
    `../../products/Dishes/dish.html?menu=${menuId}&category=${categoryDataTrue[i].id}`
  );
  div_menu.append(a_link);

  // <h2><span>Special</span> Breakfast</h2>
  const h2_category = document.createElement("h2");
  h2_category.innerText = ` ${menuDetails.menuName}`;
  a_link.append(h2_category);

  const span_category = document.createElement("span");
  span_category.innerText = categoryDataTrue[i].categoryName;
  h2_category.prepend(span_category);

  document.querySelector(".related-menu").append(div_content);
}
