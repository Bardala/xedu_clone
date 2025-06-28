const express = require("express");
const advisors = require("../data/advisors");

const router = express.Router();

// [GET] /api/advisors
router.get("/", (req, res) => {
  res.json(advisors);
});

// [GET] /api/advisors/:id
router.get("/:id", (req, res) => {
  const advisor = advisors.find((a) => a.id === parseInt(req.params.id));
  if (!advisor) {
    return res.status(404).json({ error: "Advisor not found" });
  }
  res.json(advisor);
});

module.exports = router;
