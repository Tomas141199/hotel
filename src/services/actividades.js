const pool = require("../config/db");

const actividades_db = {};

actividades_db.getAll = async () => {
  try {
    const result = await pool.query("SELECT * FROM actividades");
    return result;
  } catch (error) {
    console.log(error);
  }
};

module.exports = actividades_db;
