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

tours_db.getTimesActivities = async () => {
  const result = await pool.query(
    "SELECT h.hora as horario, a.nombre as actividad, t.id as tour_id from tours as t inner join horarios as h on t.id_horario = h.id inner join actividades as a on t.id_actividad = a.id"
  );

  return result;
};

tours_db.getReservations = async () => {
  const result = await pool.query(
    "SELECT r.id as id_reservacion, r.nombre as nombre_cliente, rt.id_tour as tour, ar.id_actividad as id_actividad, r.id_horario as id_horario  from reservaciones_tour as rt inner join reservacion as r on r.id = rt.id_reservacion inner join actividad_reservacion as ar on ar.id_reservacion=r.id order by rt.id_tour"
  );

  return result;
};

tours_db.existsById = async (id) => {
  const result = await pool.query(
    "SELECT * FROM reservaciones_tour WHERE id_reservacion=?",
    [id]
  );
  return Object.entries(result).length === 0;
};

tours_db.delOne = async (id) => {
  try {
    await pool.query("DELETE FROM reservaciones_tour WHERE id_tour=?", [id]);
    await pool.query("DELETE FROM tours WHERE id=?", [id]);
    return true;
  } catch (error) {
    return false;
  }
};

module.exports = tours_db;
