const form_id = document.querySelector("#form_id");

function getData(e) {
  e.preventDefault();

  const menuType = document.getElementById("menuName").value;
  // console.log(menuType);
  const menuImage = document.getElementById("menuImage").value;
  const menuAbout = document.getElementById("menuAbout").value;

  const menuData = JSON.parse(localStorage.getItem("menuData")) || [];

  const findData = menuData.filter(
    (data) => data.menuName.toLowerCase() === menuType.toLowerCase()
  );

  // console.log(findData);

  const n = findData.length;

  if (menuData.length === 0 && menuAbout !== "") {
    for (let i = 1; i <= n + 1; i++) {
      menuData.push({
        menuName: menuType,
        id: `${i}`,
        image: menuImage,
        status: "true",
        description: menuAbout,
      });
    }

    // console.log(menuData);
    localStorage.setItem("menuData", JSON.stringify(menuData));

    alert("Menu Added Sucessfully ✅");
    window.location.reload();
  } else if (findData.length === 0) {
    if (menuAbout.trim() === "") {
      alert("Description should not be empty");
    } else {
      const localMenucount = menuData.length;

      // console.log(localMenucount);

      for (let i = localMenucount + 1; i <= localMenucount + 1; i++) {
        menuData.push({
          menuName: menuType,
          id: `${i}`,
          image: menuImage,
          status: "true",
          description: menuAbout,
        });
      }

      // console.log(menuData);
      localStorage.setItem("menuData", JSON.stringify(menuData));

      alert("Menu Added Sucessfully ✅");
      window.location.reload();
    }
  } else if (menuType.toLowerCase() === findData[0].menuName.toLowerCase()) {
    alert(
      `${menuType} ` +
        `Menu is already in the Database` +
        ` ` +
        `Create a new Menu`
    );
    window.location.reload();
  }
}

form_id.addEventListener("submit", getData);
