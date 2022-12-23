const express = require("express");

const router = express.Router();

router.use(require("./home"));
router.use(require("./reservacion"));
router.use(require("./tour"));

module.exports = router;
