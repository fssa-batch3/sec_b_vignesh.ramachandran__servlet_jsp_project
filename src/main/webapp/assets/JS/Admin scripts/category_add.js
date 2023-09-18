const menulist = document.querySelector(".menulist");

const newmenuData = JSON.parse(localStorage.getItem("menuData"));
const categoryData = JSON.parse(localStorage.getItem("categoryData")) || [];

for (let i = 0; i < newmenuData.length; i++) {
  const option = document.createElement("option");
  option.value = newmenuData[i].id;
  option.innerText = newmenuData[i].menuName;

  menulist.append(option);
}

// let submitBtn = document.querySelector(".btn_submit");
// submitBtn.addEventListener("click", getData);
const form_id = document.querySelector(".form_id");

function getData(e) {
  e.preventDefault();

  const menuType = document.getElementById("menuName").value;
  const categoryType = document.getElementById("categoryName").value;
  const categoryImage = document.getElementById("categoryImage").value;
  // let categoryPrice = document.getElementById("categoryPrice").value;

  // filtering menu
  const findData = categoryData.filter((data) => data.menuType === menuType);

  console.log(findData);

  if (findData.length === 0) {
    for (let i = 1; i <= 1; i++) {
      categoryData.push({
        menuType,
        categoryName: categoryType,
        id: `${i}`,
        categoryImage,
        status: "true",
      });
    }
    alert("Category added sucessfully ✅");

    localStorage.setItem("categoryData", JSON.stringify(categoryData));
  } else if (findData.length !== 0) {
    // filtering category
    const findData2 = findData.filter(
      (data) => data.categoryName.toLowerCase() === categoryType.toLowerCase()
    );

    console.log(findData2);

    if (findData2.length !== 0) {
      alert(
        `${findData2[0].categoryName} ` +
          `for this menu` +
          ` ` +
          `is already in Database`
      );
      window.location.reload();
    } else if (findData2.length === 0) {
      const m = findData.length;

      for (let i = m + 1; i <= m + 1; i++) {
        categoryData.push({
          menuType,
          categoryName: categoryType,
          id: `${i}`,
          categoryImage,
          status: "true",
        });
        // console.log(findData2)
        alert("Category added sucessfully ✅");
        localStorage.setItem("categoryData", JSON.stringify(categoryData));
      }
      window.location.reload();
    }
  }
}

form_id.addEventListener("submit", getData);
