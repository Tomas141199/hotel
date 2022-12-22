const path = require("path");
const { create } = require("express-handlebars");

const getHBS = (dir) => {
  return (hbs = create({
    defaultLayout: "main",
    layoutsDir: path.join(dir, "layouts"),
    partialsDir: path.join(dir, "partials"),
    extname: ".hbs",
    helpers: require("./helpers"),
  }));
};
module.exports = getHBS;
