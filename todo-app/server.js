const express = require("express");
const app = express();

app.get("/health", (req, res) => {
  res.send({
    "Status Ok": true,
  });
});

app.listen(3000, () => {
  console.log("Server Started!");
});
