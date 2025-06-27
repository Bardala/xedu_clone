const express = require("express");
const bodyParser = require("body-parser");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const cors = require("cors");

const app = express();
const corsOptions = {
  origin: ["http://192.168.1.100:3000", "http://your-phone-ip"],
  credentials: true,
};
app.use(cors(corsOptions));
app.use(bodyParser.json());

// ===== IN-MEMORY "DATABASE" (Replace with SQLite later) =====
const users = [
  {
    id: 1,
    email: "islambardala@gmail.com",
    password: "password123", // "password123" hashed
    // password: "$2a$10$N9qo8uLOickgx2ZMRZoMy.Mrq4H3dYj4R/wtqR4bU.tnQUZ7Xv7G6", // "password123" hashed
    name: "Islam Bardala",
    job: "Flutter Developer",
    phone: "+201120618782",
    address: "123 Main St, City",
    username: "bardala",
  },
];

// ===== JWT SECRET KEY =====
const JWT_SECRET = "your_jwt_secret_key_keep_it_safe";

// ===== HELPER: Generate JWT Token =====
const generateToken = (user) => {
  return jwt.sign({ id: user.id, email: user.email }, JWT_SECRET, {
    expiresIn: "1h",
  });
};

// ===== ROUTES =====

// [1] LOGIN ENDPOINT
app.post("/api/login", async (req, res) => {
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

// [2] PROTECTED PROFILE ENDPOINT (JWT Auth Required)
app.get("/api/profile", (req, res) => {
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

// Start server
const PORT = 3000;
app.listen(3000, "0.0.0.0", () => {
  // Listen on all network interfaces
  console.log(`Server running on http://192.168.1.100:3000`);
});
