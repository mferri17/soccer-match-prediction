const path = require('path');
const { exec } = require('child_process');
const express = require('express');
const sqlite3 = require('sqlite3').verbose();

const rScriptPath = path.relative(__dirname, path.join(__dirname, '..', 'predict.R'));

const dbDir = path.join(__dirname, '..', 'dataset');
const dbFile = path.join(dbDir, 'database.sqlite');
const connectDb = () => new sqlite3.Database(dbFile);

const app = express();

app.use(function(_, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});

app.get('/teams', (_, res) => {
  const db = connectDb();
  db.all('SELECT * FROM Team;', (err, rows) => {
    if (err) {
      res.status(500).json(err);
    } else {
      res.json(rows);
    }
  });
  
  db.close();
});

app.get('/players', (_, res) => {
  const db = connectDb();
  db.all('SELECT * FROM Player;', (err, rows) => {
    if (err) {
      res.status(500).json(err);
    } else {
      res.json(rows);
    }
  });
  
  db.close();
});

app.get('/predict', (_, res) => {
  exec(`Rscript ${rScriptPath}`, (err, stdout /* , stderr */) => {
    if (err) {
      res.status(500).json(err);
    } else {
      const perc = Number(stdout);
      res.json([perc, Math.round((1 - perc) * 100) / 100]);
    }
  });
});

app.listen(1234, function () {
  console.log('Server listening on port 1234!');
});