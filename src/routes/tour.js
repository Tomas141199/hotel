const express = require("express");
const router = express.Router();
const { index, add } = require("../controllers/tourController");

router.get("/tours", index);
router.post("/tours/add", add);

module.exports = router;
