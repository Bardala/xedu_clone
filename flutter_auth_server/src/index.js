const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const authRoutes = require("./routes/auth");
const profileRoutes = require("./routes/profile");
const advisorRoutes = require("./routes/advisors");
const corsOptions = require("./config/corsOption");
const path = require("path");

const app = express();
app.use(cors(corsOptions));
app.use(bodyParser.json());

app.use("/api", authRoutes);
app.use("/api", profileRoutes);
app.use("/api/advisors", advisorRoutes);

app.use("/images", express.static(path.join(__dirname, "images")));

// Enable CORS for images
app.use("/images", (_, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept",
  );
  next();
});

app.listen(3000, "0.0.0.0", () => {
  console.log("✅ Server running on http://192.168.1.100:3000");
});
