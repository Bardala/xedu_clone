const express = require("express");
const bcrypt = require("bcryptjs");
const users = require("../data/users");
const { generateToken } = require("../utils/auth");
const router = express.Router();

// [1] LOGIN ENDPOINT
router.post("/login", async (req, res) => {
  const { email, password } = req.body;

  console.log(email, "\n", password);

  // Find user
  const user = users.find((u) => u.email === email);
  if (!user) {
    return res.status(401).json({ error: "Invalid email or password" });
  }

  // Check password
  const isPasswordValid = password === user.password;

  // await bcrypt.compare(password, user.password);
  if (!isPasswordValid) {
    return res.status(401).json({ error: "Invalid email or password" });
  }

  // Generate JWT token
  const token = generateToken(user);

  // Return user data (excluding password)
  const { password: _, ...userData } = user;
  res.json({ token, user: userData });
});

// [3] SIGNUP ENDPOINT
router.post("/signup", async (req, res) => {
  const { email, password, name, username, job, phone, address } = req.body;

  // Validate required fields
  if (!email || !password || !name || !username) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  // Check if user already exists
  const existingUser = users.find(
    (u) => u.email === email || u.username === username,
  );
  if (existingUser) {
    return res.status(409).json({
      error: "User already exists",
      details: {
        emailExists: existingUser.email === email,
        usernameExists: existingUser.username === username,
      },
    });
  }

  try {
    // Hash password
    // const hashedPassword = await bcrypt.hash(password, 10);

    // Create new user
    const newUser = {
      id: users.length + 1,
      email,
      password, //don't hash
      name,
      username,
      job: job || "",
      phone: phone || "",
      address: address || "",
    };

    // Add to "database"
    users.push(newUser);

    // Generate JWT token
    const token = generateToken(newUser);

    // Return user data (excluding password)
    const { password: _, ...userData } = newUser;
    res.status(201).json({ token, user: userData });
  } catch (error) {
    console.error("Signup error:", error);
    res.status(500).json({ error: "Internal server error during signup" });
  }
});

module.exports = router;
