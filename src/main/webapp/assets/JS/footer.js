const footer_js = `
    <footer>
        <div class="footer-box">
            <div class="footer-content">
                <img src="${root}/assets/img/main-logo.png" alt="Company Logo" />
                <p>
                    SR Catering service is a professional catering service provider located in Kumbakonam, catering both
                    personal and corporate orders.
                </p>
            </div>
            
        </div>
        <div class="footer-details">
            <p>Copyright © 2021 - 2023 SR Catering - Website Designed By <span>vicky</span></p>
            <p>(+91)6379370482</p>
            <div class="footer-links">
                <a href="https://www.instagram.com/vicky_sk_forever?r=nametag"> <img src="${root}/assets/img/instagram.jpg" alt="instagram" /> </a>
                <a href="https://www.facebook.com/profile.php?id=100011341742455"> <img src="${root}/assets/img/facebook.jpg" alt="facebook link" /> </a>
                <a href="https://twitter.com/SRVignesh06?t=zGFf0sZZJa_0oe8XfsLkOQ&s=08"> <img src="${root}/assets/img/twitter.png" alt="twitter link" /> </a>
            </div>
        </div>
    </footer>

    `;

document.body.insertAdjacentHTML("beforeend", footer_js);

// const categoryData = JSON.parse(localStorage.getItem("categoryData"))

const div_footer = document.querySelector(".footer-box");

for (let i = 0; i < 4; i++) {
  // <div class="footer-content">
  const div_content = document.createElement("div");
  div_content.setAttribute("class", "footer-content");

  // <h3><span>Breakfast</span> Menus</h3>
  const h3_name = document.createElement("h3");
  h3_name.innerText = " Menu";
  div_content.append(h3_name);

  const span = document.createElement("span");
  span.innerText = menuDataTrue[i].menuName;
  h3_name.prepend(span);

  // <ul>
  const ul_list = document.createElement("ul");
  div_content.append(ul_list);

  const findData = categoryData.filter((data) => data.menuType == i + 1);

  const categoryDataTrue = findData.filter((data) => data.status === "true");

  for (let j = 0; j < categoryDataTrue.length; j++) {
    // <li><a href="./pages/products/Dishes/morning-ordinary.html" class="footer-navigation">Ordinary Breakfast</a></li>
    const li_links = document.createElement("li");
    ul_list.append(li_links);

    const a_links = document.createElement("a");
    a_links.setAttribute(
      "href",
      `${root}/pages/products/Dishes/dish.html?menu=${menuDataTrue[i].id}&category=${categoryDataTrue[j].id}`
    );
    a_links.setAttribute("class", "footer-navigation");
    a_links.innerText = `${categoryDataTrue[j].categoryName} ${menuDataTrue[i].menuName}`;
    li_links.append(a_links);
  }

  div_footer.append(div_content);
}
