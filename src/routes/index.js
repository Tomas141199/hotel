const express = require("express");

const router = express.Router();

router.use(require("./home"));
router.use(require("./reservacion"));

module.exports = router;
