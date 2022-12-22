const mysql = require("mysql");
const { promisify } = require("util");
const { database } = require("./database");

const pool = mysql.createPool(database);

pool.getConnection((err, connection) => {
  if (err) {
    console.error(err);
  }

  if (connection) connection.release();
  console.info("DB is working");

  return;
});

pool.query = promisify(pool.query);

module.exports = pool;
