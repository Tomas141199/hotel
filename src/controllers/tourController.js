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
  res.render("tour/index", {
    reservaciones,
    trabajadores,
    actividades,
    horarios,
  });
};

const add = async (req, res) => {
  console.log(req.body);
  const data = req.body;
  await tours_db.addOne(data);
  res.redirect("/tours");
};

module.exports = {
  index,
  add,
};
