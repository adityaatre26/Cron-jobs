const express = require("express");
const fs = require("fs");
const app = express();
const PORT = 3000;

app.get("/btc", (req, res) => {
  fs.readFile("../data/btc_price.json", "utf8", (err, data) => {
    if (err) return res.status(500).json({ error: "Data not available" });
    res.setHeader("Content-Type", "application/json");
    res.send(data);
  });
});

// Only start the server if this file is run directly (not when imported for testing)
if (require.main === module) {
  app.listen(PORT, () =>
    console.log(`Server running on http://localhost:${PORT}`)
  );
}

module.exports = app;
