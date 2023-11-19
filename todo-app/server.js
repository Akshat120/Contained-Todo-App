const express = require("express");
const app = express();

app.set("view engine", "ejs");

app.get("/health", (req, res) => {
  res.send({
    "Status Ok": true,
  });
});

app.get("/", (req, res) => {
  res.render(__dirname + "/index.ejs");
});

app.listen(3000, () => {
  console.log("Server Started!");
});
