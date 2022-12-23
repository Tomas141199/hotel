const {
  horarios_db,
  reservaciones_db,
  actividades_db,
} = require("../services");

const index = async (req, res) => {
  const horarios = await horarios_db.getAll();
  const actividades = await actividades_db.getAll();
  const registros = await reservaciones_db.getAll();

  console.log("Actividades encontradas", actividades);

  res.render("reservaciones/index", { horarios, actividades, registros });
};

const add = async (req, res) => {
  const { nombre, telefono, id_actividad, id_horario } = req.body;
  const reservacion = { nombre, telefono, id_horario };
  await reservaciones_db.addOne(reservacion, id_actividad);

  res.redirect("/reservaciones");
};

const del = async (req, res) => {
  const { id } = req.params;

  await reservaciones_db.delOne(id);

  res.redirect("/reservaciones");
};

module.exports = {
  index,
  add,
  del,
};
