const express = require("express");
const router = express.Router();
const { index, add, del } = require("../controllers/reservacionController");

router.get("/reservaciones", index);
router.post("/reservaciones/add", add);
router.get("/reservaciones/delete/:id", del);

module.exports = router;
