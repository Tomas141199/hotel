// const { json } = require("express");

// const button = document.querySelector("#agregar");
// const nombre = document.querySelector("#nombre");
// const telefono = document.querySelector("#telefono");
// const actividad = document.querySelector("#id_actividad");
// const horario = document.querySelector("#id_horario");

// button.addEventListener("click", async (e) => {
//   e.preventDefault();
//   if (
//     nombre.value.length < 1 ||
//     telefono.value.length < 1 ||
//     actividad.value == "" ||
//     horario.value == ""
//   ) {
//     Swal.fire({
//       title: "Error!",
//       text: "Llena todos los Campos para continuar",
//       icon: "error",
//       confirmButtonText: "De acuerdo",
//     });
//   }
//   {
//     const reservacion = {
//       nombre,
//       telefono,
//       id_actividad: actividad,
//       id_horario: horario,
//     };

//     await fetch("/reservaciones/add", {
//       method: "POST",
//       body: json.stringify(reservacion),
//     });
//   }
// });

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
