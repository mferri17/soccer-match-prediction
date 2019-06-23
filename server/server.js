const path = require('path');
const fs = require('fs');
const { exec } = require('child_process');
const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');

const rScriptPath = path.relative(__dirname, path.join(__dirname, '..', 'R-scripts', 'ui_predict.R'));
const rInferencePath = path.relative(__dirname, path.join(__dirname, '..', 'R-scripts', 'ui_inference.R'));
const jsonPath = path.relative(__dirname, path.join(__dirname, '..', 'R-scripts', 'tempData.json'));

const dbDir = path.join(__dirname, '..', 'dataset');
const dbFile = path.join(dbDir, 'database.sqlite');
const connectDb = () => new sqlite3.Database(dbFile);

const app = express();
app.use(bodyParser.urlencoded({
  extended: false
}));
app.use(bodyParser.json());

app.use((_, res, next) => {
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
  db.all(`
    SELECT *
    FROM Player as p
    INNER JOIN Player_Attributes as pa on p.player_api_id = pa.player_api_id
    GROUP BY p.player_api_id
    HAVING pa.date = MAX(pa.date);
  `, (err, rows) => {
    if (err) {
      res.status(500).json(err);
    } else {
      res.json(rows);
    }
  });
  
  db.close();
});

app.post('/predict', (req, res) => {
  const datasetRow = req.body.reduce((acc, team, i) => {
    const teamName = i === 0 ? 'home' : 'away';

    return {
      ...acc,
      ...team.players.reduce((players, player, j) => ({
        ...players,
        [`${teamName}${j + 1}_overall_rating`]: player.overall_rating,
        [`${teamName}_player_Y${j + 1}`]: player.y
      }), {})
    };
  }, {
    id: 1,
    league_id: 1,
    home_team_goal: 2,
    away_team_goal: 0
  });

  fs.writeFileSync(jsonPath, JSON.stringify(datasetRow));

  exec(`Rscript ${rScriptPath}`, (err, stdout /* , stderr */) => {
    if (err) {
      console.log(err);
      res.status(500).json(err);
    } else {
      console.log(stdout);
      const out = stdout.split(/\r?\n/);
      const perc = Number(out[out.length - 1]);
      res.json([perc, Math.round((1 - perc) * 100) / 100]);
    }
  });
});

app.post('/inference', (req, res) => {
  const evidence = Object.keys(req.body).reduce((acc, cur) => ({
    ...acc,
    [cur]: req.body[cur] || undefined
  }), {});

  fs.writeFileSync(jsonPath, JSON.stringify(evidence));

  exec(`Rscript ${rInferencePath}`, (err, stdout) => {
    if (err) {
      res.status(500).json(err);
    } else {
      const out = stdout.split(/\r?\n/);
      const perc = Number(out[out.length - 1]);
      res.json(perc);
    }
  });
});

app.listen(1234, function () {
  console.log('Server listening on port 1234!');
});
