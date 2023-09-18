const categoryData = JSON.parse(localStorage.getItem("categoryData"));

function event_menu() {
  const div_content = document.querySelector(".bdy_menu-content");

  for (let i = 0; i < menuDataTrue.length; i++) {
    const dropdownMenu = document.createElement("div");
    dropdownMenu.className = "dropdown_menu";

    const image = document.createElement("img");
    image.src = menuDataTrue[i].image;
    image.alt = `${menuDataTrue[i].menuName} menu`;
    dropdownMenu.appendChild(image);

    const heading = document.createElement("h2");
    heading.innerHTML = `<span>${menuDataTrue[i].menuName}</span> Menu`;
    dropdownMenu.appendChild(heading);

    const dropdownMenu1 = document.createElement("div");
    dropdownMenu1.className = "dropdown_menu-1";
    dropdownMenu.appendChild(dropdownMenu1);

    const innerDiv = document.createElement("div");
    dropdownMenu1.appendChild(innerDiv);

    const getCategory = categoryData.filter(
      (data) => data.menuType === `${i + 1}`
    );

    // filtering get status=true from menuData
    const categoryDataTrue = getCategory.filter(
      (data) => data.status === "true"
    );

    for (let j = 0; j < categoryDataTrue.length; j++) {
      const link = document.createElement("a");
      link.href = `${root}/pages/products/Dishes/dish.html?menu=${menuDataTrue[i].id}&category=${categoryDataTrue[j].id}`;
      link.innerText = `${categoryDataTrue[j].categoryName} ${menuDataTrue[i].menuName}`;
      innerDiv.append(link);
    }

    // Add the dropdown menu to the page
    div_content.appendChild(dropdownMenu);
  }
}
event_menu();
