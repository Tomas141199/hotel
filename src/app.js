const express = require("express");
const path = require("path");
const getHBS = require("./config/hbs");
const { database } = require("./config/db");
const router = require("./routes");

// Init
const app = express();

// Settings
app.set("port", process.env.PORT || 4000);
app.set("views", path.join(__dirname, "views"));
app.engine(".hbs", getHBS(path.join(app.get("views"))).engine);
app.set("view engine", ".hbs");

// Middleware
app.use(express.json());

// Routes
app.use(router);

// Public
app.use(express.static(path.join(__dirname, "public")));

// Start the server
app.listen(app.get("port"), () => {
  console.log("Server on port");
});