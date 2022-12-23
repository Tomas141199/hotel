const pool = require("../config/db");
const tours_db = {};

tours_db.addOne = async (data) => {
  try {
    const { id_horario, id_actividad } = data;
    const tour = { id_horario, id_actividad };
    const { insertId: id_tour } = await pool.query("INSERT INTO tours SET ?", [
      tour,
    ]);

    const list_reservaciones = data.id_actividades.split(",");

    for (let id_reservacion of list_reservaciones) {
      await pool.query("INSERT INTO reservaciones_tour SET ?", [
        {
          id_reservacion,
          id_tour,
        },
      ]);
    }
  } catch (error) {
    console.log(error);
    return false;
  }
};

module.exports = tours_db;
