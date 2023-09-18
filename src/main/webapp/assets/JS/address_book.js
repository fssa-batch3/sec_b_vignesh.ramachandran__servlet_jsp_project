const userId = new URLSearchParams(window.location.search).get("userId");
const addressData = JSON.parse(localStorage.getItem("addressData")) || [];

if (addressData) {
  const findUserAddress = addressData.filter((data) => data.userId === userId);

  const findTrueAddress = findUserAddress.filter(
    (data) => data.status === "true"
  );

  const div_address_cart = document.querySelector(".address_cart");

  for (let i = 0; i < findTrueAddress.length; i++) {
    // Create the parent div element
    const parentDiv = document.createElement("div");
    parentDiv.classList.add("address_details");

    const p_1 = document.createElement("p");
    p_1.innerText = `Name : ${findTrueAddress[i].name}`;

    const p_2 = document.createElement("p");
    p_2.innerText = `Phone Number ${findTrueAddress[i].phone_number}: `;

    const p_3 = document.createElement("p");
    p_3.innerText = `Email : ${findTrueAddress[i].email}`;

    const p_4 = document.createElement("p");
    p_4.innerText = `Door.no : ${findTrueAddress[i].door_no}`;

    const p_5 = document.createElement("p");
    p_5.innerText = `Street name : ${findTrueAddress[i].street_name}`;

    const p_6 = document.createElement("p");
    p_6.innerText = `Locality : ${findTrueAddress[i].sub_locality}`;

    const p_7 = document.createElement("p");
    p_7.innerText = `City : ${findTrueAddress[i].city}`;

    const p_8 = document.createElement("p");
    p_8.innerText = `District : ${findTrueAddress[i].district}`;

    const p_9 = document.createElement("p");
    p_9.innerText = `State : ${findTrueAddress[i].state}`;

    const p_10 = document.createElement("p");
    p_10.innerText = `Pincode : ${findTrueAddress[i].pincode}`;

    const div_btn = document.createElement("div");
    div_btn.setAttribute("class", "divBtn");

    if (findTrueAddress[i].default !== "true") {
      const btnDefault = document.createElement("button");
      btnDefault.setAttribute("class", "btn default");
      btnDefault.setAttribute("data-id", `${findTrueAddress[i].addressId}`);
      btnDefault.innerText = "Set as Default";

      div_btn.append(btnDefault);

      const btnRemove = document.createElement("button");
      btnRemove.setAttribute("class", "btn remove");
      btnRemove.setAttribute("data-id", `${findTrueAddress[i].addressId}`);
      btnRemove.innerText = "Remove";

      div_btn.append(btnRemove);
    } else {
      const h3_indicate = document.createElement("h3");
      h3_indicate.setAttribute("class", "indicator");
      h3_indicate.innerText = "Default";
      div_btn.append(h3_indicate);
    }

    const btnEdit = document.createElement("button");
    btnEdit.setAttribute("class", "btn edit");
    btnEdit.setAttribute("data-id", findTrueAddress[i].addressId);
    btnEdit.innerText = "Edit";

    parentDiv.append(p_1);
    parentDiv.append(p_2);
    parentDiv.append(p_3);
    parentDiv.append(p_4);
    parentDiv.append(p_5);
    parentDiv.append(p_6);
    parentDiv.append(p_7);
    parentDiv.append(p_8);
    parentDiv.append(p_9);
    parentDiv.append(p_10);
    parentDiv.append(div_btn);
    div_btn.append(btnEdit);

    div_address_cart.append(parentDiv);
  }
}

const myButton = document.querySelector("#myButton");
myButton.addEventListener("click", () => {
  window.location.href = `../profile/address_form.html`;
});

// set default address
const btnDefault = document.querySelectorAll(".default");
btnDefault.forEach((setDefault) => {
  setDefault.addEventListener("click", function set() {
    const findUserAddress = addressData.filter(
      (data) => data.userId === userId
    );
    // console.log(findUserAddress);
    const findTrueAddress = findUserAddress.filter(
      (data) => data.status === "true"
    );

    const findDefault = findTrueAddress.find((data) => data.default === "true");
    // console.log(findDefault);

    if (findDefault) {
      findDefault.default = "false";
    }

    const parent = this.closest(".address_details");
    const default_btn = parent.querySelector(".default");
    const address_id = default_btn.dataset.id;
    // console.log(address_id);

    const findData = addressData.find((data) => data.addressId === address_id);
    // console.log(findData);

    findData.default = "true";
    localStorage.setItem("addressData", JSON.stringify(addressData));
    window.location.reload();
  });
});

// remove address
const btnRemove = document.querySelectorAll(".remove");
btnRemove.forEach((remove) => {
  remove.addEventListener("click", function removeAdd() {
    if (window.confirm("Are you want to remove this address")) {
      const parent = this.closest(".address_details");
      const remove_btn = parent.querySelector(".remove");
      const address_id = remove_btn.dataset.id;

      const findData = addressData.find(
        (data) => data.addressId === address_id
      );

      findData.status = "false";
      // console.log(findData);
      localStorage.setItem("addressData", JSON.stringify(addressData));
      alert("Address removed sucessfully");
      window.location.reload();
    }
  });
});

// edit address
const editBtn = document.querySelectorAll(".edit");
editBtn.forEach((edit) => {
  edit.addEventListener("click", function editAdd() {
    const parent = this.closest(".address_details");
    const edit_btn = parent.querySelector(".edit");
    const address_id = edit_btn.dataset.id;

    // console.log(address_id);
    window.location.href = `../profile/address_form.html?addressId=${address_id}`;
  });
});
