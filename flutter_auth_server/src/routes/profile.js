const express = require("express");
const users = require("../data/users");
const jwt = require("jsonwebtoken");

const router = express.Router();

// [2] PROTECTED PROFILE ENDPOINT (JWT Auth Required)
router.get("/profile", (req, res) => {
  const token = req.headers.authorization?.split(" ")[1];
  if (!token) {
    return res.status(401).json({ error: "No token provided" });
  }

  try {
    const decoded = jwt.verify(token, JWT_SECRET);
    const user = users.find((u) => u.id === decoded.id);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    const { password: _, ...userData } = user;
    res.json(userData);
  } catch (err) {
    res.status(401).json({ error: "Invalid token" });
  }
});

module.exports = router;
