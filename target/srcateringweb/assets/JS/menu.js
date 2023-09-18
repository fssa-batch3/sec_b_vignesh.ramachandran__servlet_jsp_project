for (let i = 0; i < menuDataTrue.length; i++) {
  const div_lists = document.createElement("div");
  div_lists.setAttribute("class", "lists");
  // console.log(div_lists);

  const img = document.createElement("img");
  img.setAttribute("src", menuDataTrue[i].image);
  // img.setAttribute("alt", menus[i]["images"]["alt"]);
  div_lists.append(img);

  const div_lists_text = document.createElement("div");
  div_lists_text.setAttribute("class", "lists-text");
  div_lists.append(div_lists_text);

  const h2 = document.createElement("h2");
  h2.innerText = " Menu";
  div_lists_text.append(h2);

  const span = document.createElement("span");
  span.innerText = menuDataTrue[i].menuName;
  h2.prepend(span);

  const p = document.createElement("p");
  p.innerText = menuDataTrue[i].description;
  div_lists_text.append(p);

  const a = document.createElement("a");
  a.setAttribute(
    "href",
    `./pages/products/Menus/category.html?menu=${menuDataTrue[i].id}`
  );
  a.innerText = "view menu...";
  div_lists_text.append(a);

  document.querySelector("div.mainmenu-list").append(div_lists);
}

// animation
let slideIndex = 0;
let timeoutID;
let isTransitioning = false;
function showSlides(n = 1) {
  let i;
  const slides = document.getElementsByClassName("slide_image");
  const dots = document.getElementsByClassName("dot");
  slideIndex += n;
  if (slideIndex > slides.length) {
    slideIndex = 1;
  }
  if (slideIndex < 1) {
    slideIndex = slides.length;
  }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " active";
  isTransitioning = false;
  timeoutID = setTimeout(showSlides, 2500); // Change slide every 2.5 seconds
}

showSlides();

function plusSlides(n) {
  if (!isTransitioning) {
    isTransitioning = true;
    clearTimeout(timeoutID); // Cancel any scheduled transitions
    showSlides(n);
  }
}

function minusSlides(n) {
  if (!isTransitioning) {
    isTransitioning = true;
    clearTimeout(timeoutID); // Cancel any scheduled transitions
    showSlides(n);
  }
}

function currentSlide(n) {
  if (!isTransitioning) {
    isTransitioning = true;
    clearTimeout(timeoutID); // Cancel any scheduled transitions
    showSlides(n - slideIndex);
  }
}
