

// address API
let autocomplete;
let address1Field;
// let address2Field;
let postalField;

function initAutocomplete() {
  address1Field = document.querySelector("#ship-address");
  //   address2Field = document.querySelector("#address2");
  postalField = document.querySelector("#postcode");
  // Create the autocomplete object, restricting the search predictions to
  // addresses in the US and Canada.
  autocomplete = new google.maps.places.Autocomplete(address1Field, {
    types: ["address"],
    componentRestrictions: {
      country: "in",
    },
    fields: ["address_components", "geometry"],
  });
  address1Field.focus();
  // When the user selects an address from the drop-down, populate the
  // address fields in the form.
  autocomplete.addListener("place_changed", fillInAddress);
}

function fillInAddress() {
  // Get the place details from the autocomplete object.
  const place = autocomplete.getPlace();
  let address1 = "";
  let postcode = "";

  // console.log(place);

  // Get each component of the address from the place details,
  // and then fill-in the corresponding field on the form.
  // place.address_components are google.maps.GeocoderAddressComponent objects
  // which are documented at http://goo.gle/3l5i5Mr
  for (const component of place.address_components) {
    // @ts-ignore remove once typings fixed
    const componentType = component.types[0];

    switch (componentType) {
      case "street_number": {
        address1 = `${component.long_name} ${address1}`;
        break;
      }

      case "route": {
        address1 += component.long_name;
        break;
      }

      case "postal_code": {
        postcode = `${component.long_name}${postcode}`;
        break;
      }

      case "postal_code_suffix": {
        postcode = `${postcode}-${component.long_name}`;
        break;
      }
      case "locality":
        document.querySelector("#locality").value = component.long_name;
        break;

      case "administrative_area_level_1": {
        document.querySelector("#state").value = component.short_name;
        break;
      }

      case "administrative_area_level_3":
        document.querySelector("#district").value = component.long_name;
        break;

      case "sublocality_level_1":
        document.querySelector("#sub_locality").value = component.long_name;
    }
  }

  address1Field.value = address1;
  postalField.value = postcode;
  // After filling the form with address components from the Autocomplete
  // prediction, set cursor focus on the second address line to encourage
  // entry of subpremise information such as apartment, unit, or floor number.
  //   address2Field.focus();
}

window.initAutocomplete = initAutocomplete;

const mobileInput = document.getElementById("phone_number");
const errorMessage = document.querySelector(".error");

mobileInput.addEventListener("input", () => {
  const inputValue = mobileInput.value.trim(); // remove leading/trailing whitespace
  const isValidInput =
    /^[6-9]\d{9}$/.test(inputValue) && !/^\d*(\d)\1{9}\d*$/.test(inputValue);
  if (!isValidInput || inputValue === "") {
    if (inputValue === "") {
      errorMessage.textContent = "Please enter a mobile number.";
    }
    if (/^\d+$/.test(inputValue)) {
      errorMessage.textContent = "Enter a valid 10-digit mobile number.";
    } else {
      errorMessage.textContent = "Please enter digits only.";
    }
    errorMessage.style.color = "var(--text-color)";
  } else {
    errorMessage.textContent = "";
  }
});


