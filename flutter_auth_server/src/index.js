// const express = require("express");
// const bodyParser = require("body-parser");
// const bcrypt = require("bcryptjs");
// const jwt = require("jsonwebtoken");
// const cors = require("cors");

// const app = express();
// const corsOptions = {
//   origin: ["http://192.168.1.100:3000", "http://your-phone-ip"],
//   credentials: true,
// };
// app.use(cors(corsOptions));
// app.use(bodyParser.json());

// const JWT_SECRET = "your_jwt_secret_key_keep_it_safe";

// const generateToken = (user) => {
//   return jwt.sign({ id: user.id, email: user.email }, JWT_SECRET, {
//     expiresIn: "1h",
//   });
// };

// // ===== ROUTES =====

// // Start server
// const PORT = 3000;
// app.listen(3000, "0.0.0.0", () => {
//   // Listen on all network interfaces
//   console.log(`Server running on http://192.168.1.100:3000`);
// });
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const authRoutes = require("./routes/auth");
const profileRoutes = require("./routes/profile");
const advisorRoutes = require("./routes/advisors");
const corsOptions = require("./config/corsOption");

const app = express();
app.use(cors(corsOptions));
app.use(bodyParser.json());

app.use("/api", authRoutes); // /api/login, /api/signup
app.use("/api", profileRoutes);
app.use("/api/advisors", advisorRoutes);

app.listen(3000, "0.0.0.0", () => {
  console.log("✅ Server running on http://192.168.1.100:3000");
});
