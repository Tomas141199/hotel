const express = require("express");
const path = require("path");
const getHBS = require("./config/hbs");
const { database } = require("./config/db");
const router = require("./routes");
const flash = require("connect-flash");
const session = require("express-session");

// Init
const app = express();

// Settings
app.set("port", process.env.PORT || 3000);
app.set("views", path.join(__dirname, "views"));
app.engine(".hbs", getHBS(path.join(app.get("views"))).engine);
app.set("view engine", ".hbs");

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized:true
}));
app.use(flash());

//global variables
app.use((req,res,next) =>{
  res.locals.succes_msg = req.flash('Exito');
  res.locals.error_msg = req.flash('Fallo');
  res.locals.vacio_msg = req.flash('camposVacios');
  next();
})

// Routes
app.use(router);

// Public
app.use(express.static(path.join(__dirname, "public")));

// Start the server
app.listen(app.get("port"), () => {
  console.log("Server on port");
});
