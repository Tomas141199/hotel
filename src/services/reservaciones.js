const pool = require("../config/db");
const reservaciones_db = {};

reservaciones_db.addOne = async (reservacion, id_actividad) => {
  try {
    const { insertId: id_reservacion } = await pool.query(
      "INSERT INTO reservacion SET ?",
      [reservacion]
    );

    const actividad_reservacion = { id_reservacion, id_actividad };

    await pool.query("INSERT INTO actividad_reservacion  SET ?", [
      actividad_reservacion,
    ]);

    return true;
  } catch (error) {
    console.log(error);
    return false;
  }
};

reservaciones_db.getAll = async () => {
  const result = await pool.query(
    "SELECT r.id ,r.nombre as cliente, r.telefono, h.hora, a.nombre FROM reservacion as r INNER JOIN horarios as h ON r.id_horario = h.id INNER JOIN actividad_reservacion as ar ON r.id = ar.id_reservacion INNER JOIN actividades as a ON ar.id_actividad = a.id"
  );

  return result;
};

reservaciones_db.delOne = async (id) => {
  try {
    await pool.query(
      "DELETE FROM actividad_reservacion WHERE id_reservacion=?",
      [id]
    );

    await pool.query("DELETE FROM reservacion WHERE id=?", [id]);

    return true;
  } catch (error) {
    console.log(error);
    return false;
  }
};

module.exports = reservaciones_db;
