const jwt = require("jsonwebtoken");
const JWT_SECRET = "your_jwt_secret_key_keep_it_safe";

function verifyToken(req, res, next) {
  const token = req.headers.authorization?.split(" ")[1];
  if (!token) return res.status(401).json({ error: "No token provided" });

  try {
    const decoded = jwt.verify(token, JWT_SECRET);
    req.user = decoded; // Inject decoded user into request
    next();
  } catch (err) {
    res.status(401).json({ error: "Invalid token" });
  }
}

const generateToken = (user) => {
  return jwt.sign({ id: user.id, email: user.email }, JWT_SECRET, {
    expiresIn: "500h",
  });
};

module.exports = { verifyToken, JWT_SECRET, generateToken };
