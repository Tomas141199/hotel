const pool = require("../config/db");

const horarios_db = {};

horarios_db.getAll = async () => {
  try {
    const result = await pool.query("SELECT * FROM horarios");
    return result;
  } catch (error) {
    console.log(error);
  }
};

module.exports = horarios_db;
