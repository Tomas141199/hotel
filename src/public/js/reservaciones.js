function reservacionesChange() {
  let multiselect = document.getElementById("reservaciones-label");
  let multiselectOption = multiselect.getElementsByTagName("option")[0];
  let idActividades = document.querySelector("#id_actividades");

  let values = [];
  let checkboxes = document.getElementById("reservaciones-option");
  let checkedCheckboxes = checkboxes.querySelectorAll(
    "input[type=checkbox]:checked"
  );

  for (const item of checkedCheckboxes) {
    let checkboxValue = item.getAttribute("value");
    values.push(checkboxValue);
  }

  let dropdownValue = "Nada ha sido seleccionado";
  if (values.length > 0) {
    dropdownValue = values.join(", ");
  }

  multiselectOption.innerText = dropdownValue;
  idActividades.value = dropdownValue;
}

function toggleReservaciones(onlyHide = false) {
  let checkboxes = document.getElementById("reservaciones-option");
  let displayValue = checkboxes.style.display;

  if (displayValue != "block") {
    if (onlyHide == false) {
      checkboxes.style.display = "block";
    }
  } else {
    checkboxes.style.display = "none";
  }
}

function trabajadoresChange() {
  let multiselect = document.getElementById("trabajadores-label");
  let multiselectOption = multiselect.getElementsByTagName("option")[0];
  let idActividades = document.querySelector("#id_trabajadores");

  let values = [];
  let checkboxes = document.getElementById("trabajadores-option");
  let checkedCheckboxes = checkboxes.querySelectorAll(
    "input[type=checkbox]:checked"
  );

  for (const item of checkedCheckboxes) {
    let checkboxValue = item.getAttribute("value");
    values.push(checkboxValue);
  }

  let dropdownValue = "Nada ha sido seleccionado";
  if (values.length > 0) {
    dropdownValue = values.join(", ");
  }

  multiselectOption.innerText = dropdownValue;
  idActividades.value = dropdownValue;
}

function toggleTrabajadores(onlyHide = false) {
  let checkboxes = document.getElementById("trabajadores-option");
  let displayValue = checkboxes.style.display;

  if (displayValue != "block") {
    if (onlyHide == false) {
      checkboxes.style.display = "block";
    }
  } else {
    checkboxes.style.display = "none";
  }
}
