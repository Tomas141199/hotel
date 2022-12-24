const {
  reservaciones_db,
  trabajadores_db,
  actividades_db,
  horarios_db,
  tours_db,
} = require("../services");

const index = async (req, res) => {
  const actividades = await actividades_db.getAll();
  const horarios = await horarios_db.getAll();
  const reservaciones = await reservaciones_db.getAll();
  const trabajadores = await trabajadores_db.getAll();
  const registros_tours = await tours_db.getTimesActivities();
  const registros_reservaciones = await tours_db.getReservations();
  res.render("tour/index", {
    reservaciones,
    trabajadores,
    actividades,
    horarios,
    registros_tours,
    registros_reservaciones,
  });
};

const add = async (req, res) => {
  if (req.body.id_actividades == "" || req.body.id_trabajadores == "") {
    req.flash("camposVacios", "Rellena todos los campos para continuar");
  } else {
    const data = req.body;
    await tours_db.addOne(data);
    req.flash("Exito", "Se ha creado el tour correctamente");
  }

  res.redirect("/tours");
};

const del = async (req, res) => {
  const { id } = req.params;

  const result = await tours_db.delOne(id);

  if (result) {
    req.flash("Exito", "Se ha eliminado el tour correctamente");
  } else {
    req.flash("Fallo", "No se ha eliminado el tour");
  }

  res.redirect("/tours");
};

module.exports = {
  index,
  add,
  del,
};
