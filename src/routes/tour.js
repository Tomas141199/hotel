const express = require("express");
const router = express.Router();
const { index, add, del } = require("../controllers/tourController");

router.get("/tours", index);
router.post("/tours/add", add);
router.get("/tours/delete/:id", del);

module.exports = router;
