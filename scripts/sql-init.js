const fs = require('fs').promises;
const path = require('path');
const sqlite3 = require('sqlite3').verbose();

(async () => {
  const dbDir = path.join(__dirname, '..', 'dataset');
  const dbFile = path.join(dbDir, 'database.sqlite');
  const dbITAFile = path.join(dbDir, 'database_ITA.sqlite');

  await fs.copyFile(dbFile, dbITAFile);

  const db = new sqlite3.Database(dbITAFile);

  db.serialize(function() {
    db.run(`
      CREATE TABLE Match_ITA AS
          SELECT * FROM Match
          WHERE league_id = 10257;
    `);

    db.run(`
      CREATE TABLE Player_ITA AS
      SELECT p.*
      FROM Player as p
      WHERE p.player_api_id IN (
        SELECT DISTINCT home_player_1 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_2 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_3 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_4 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_5 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_6 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_7 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_8 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_9 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_10 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT home_player_11 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_1 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_2 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_3 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_4 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_5 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_6 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_7 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_8 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_9 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_10 as player FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_player_11 as player FROM Match_ITA
      );
    `);

    db.run(`
      CREATE TABLE Player_Attributes_ITA AS
      SELECT pa.*
      FROM Player_Attributes as pa
      WHERE pa.player_api_id IN (
        SELECT DISTINCT player_api_id
        FROM Player_ITA
      );
    `);

    db.run(`
      CREATE TABLE Team_ITA AS
      SELECT t.*
      FROM Team as t
      WHERE t.team_api_id IN (
        SELECT DISTINCT home_team_api_id as team_id FROM Match_ITA
        UNION ALL
        SELECT DISTINCT away_team_api_id as team_id FROM Match_ITA
      );
    `);

    db.run(`
      CREATE TABLE Team_Attributes_ITA AS
      SELECT ta.*
      FROM Team_Attributes as ta
      WHERE ta.team_api_id IN (
        SELECT DISTINCT team_api_id
        FROM Team_ITA
      );
    `);

    // cannot insert primary keys after creation in sqlite

    /* db.run("ALTER TABLE Match_ITA ADD PRIMARY KEY (match_api_id);");
    db.run("ALTER TABLE Player_ITA ADD PRIMARY KEY (player_api_id);");
    db.run("ALTER TABLE Player_Attributes_ITA ADD PRIMARY KEY (id);");
    db.run("ALTER TABLE Team_ITA ADD PRIMARY KEY (team_api_id);");
    db.run("ALTER TABLE Team_Attributes_ITA ADD PRIMARY KEY (id);");

    db.run(`
      ALTER TABLE Team_Attributes_ITA ADD CONSTRAINT fk_team_attr_team
                    FOREIGN KEY (team_api_id) 
                    REFERENCES Team_ITA(team_api_id);
    `);
    db.run(`
      ALTER TABLE Player_Attributes_ITA ADD CONSTRAINT fk_player_attr_player
                    FOREIGN KEY (player_api_id) 
                    REFERENCES Player_ITA(player_api_id);
    `);
    db.run(`
      ALTER TABLE Match_ITA ADD CONSTRAINT fk_match_home_team
                    FOREIGN KEY (home_player_api_id) 
                    REFERENCES Team_ITA(player_api_id);
    `);
    db.run(`
      ALTER TABLE Match_ITA ADD CONSTRAINT fk_match_away_team
                    FOREIGN KEY (away_player_api_id) 
                    REFERENCES Team_ITA(player_api_id);
    `);
    ['home', 'away'].forEach(team => {
      [...new Array(11).keys()].map(x => x + 1).forEach(playerNumber => {
        db.run(`
          ALTER TABLE Match_ITA ADD CONSTRAINT fk_match_${team}_team_${playerNumber}
                        FOREIGN KEY (${team}_player_${playerNumber}) 
                        REFERENCES Team_ITA(player_api_id);
        `);
      });
    }); */

    // delete old tables and rename the new ones
    [
      "Player_Attributes",
      "Team_Attributes",
      "Team",
      "Player",
      "Match"
    ].forEach(tableName => {
      db.run(`DROP TABLE ${tableName};`);
      db.run(`ALTER TABLE ${tableName}_ITA RENAME TO ${tableName};`);
    });
    
    db.run(`DROP TABLE League;`);
    db.run(`DROP TABLE Country;`);
  });

  db.close();
})();
