const fs = require('fs').promises;
const path = require('path');
const sqlite3 = require('sqlite3').verbose();

(async () => {
  const dbDir = path.join(__dirname, '..', 'dataset');
  const dbFile = path.join(dbDir, 'database.sqlite');

  const db = new sqlite3.Database(dbFile);

  db.serialize(() => {
    const matchSelects = `
      TEMP.match_api_id,
      TEMP.date,
    `;

    const currentSelectionTemplate = `
            TTNN.player_api_id as TTNN_player_api_id, player.player_name as TTNN_player_name, player.height as TTNN_height, player.weight as TTNN_weight, 
            TTNN.date as TTNN_date, TTNN.overall_rating as TTNN_overall_rating, TTNN.potential as TTNN_potential, TTNN.preferred_foot as TTNN_preferred_foot, 
            TTNN.attacking_work_rate as TTNN_attacking_work_rate, TTNN.defensive_work_rate as TTNN_defensive_work_rate, TTNN.crossing as TTNN_crossing, 
            TTNN.finishing as TTNN_finishing, TTNN.heading_accuracy as TTNN_heading_accuracy, TTNN.short_passing as TTNN_short_passing, 
            TTNN.volleys as TTNN_volleys, TTNN.dribbling as TTNN_dribbling, TTNN.curve as TTNN_curve, TTNN.free_kick_accuracy as TTNN_free_kick_accuracy, 
            TTNN.long_passing as TTNN_long_passing, TTNN.long_passing as TTNN_long_passing, TTNN.ball_control as TTNN_ball_control, 
            TTNN.acceleration as TTNN_acceleration, TTNN.sprint_speed as TTNN_sprint_speed, TTNN.agility as TTNN_agility, TTNN.reactions as TTNN_reactions, 
            TTNN.balance as TTNN_balance, TTNN.shot_power as TTNN_shot_power, TTNN.jumping as TTNN_jumping, TTNN.stamina as TTNN_stamina, 
            TTNN.strength as TTNN_strength, TTNN.long_shots as TTNN_long_shots, TTNN.aggression as TTNN_aggression, TTNN.interceptions as TTNN_interceptions, 
            TTNN.positioning as TTNN_positioning, TTNN.vision as TTNN_vision, TTNN.penalties as TTNN_penalties, TTNN.marking as TTNN_marking, 
            TTNN.standing_tackle as TTNN_standing_tackle, TTNN.gk_diving as TTNN_gk_diving, TTNN.gk_kicking as TTNN_gk_kicking, 
            TTNN.gk_positioning as TTNN_gk_positioning, TTNN.gk_reflexes as TTNN_gk_reflexes,\n`;

    const queries = [];
    let currentTable = 'TEMP_00';
    let incrementalSelects = '';

    db.run(`CREATE TABLE ${currentTable} AS SELECT * FROM Match`);

    ['home', 'away'].forEach((type, j) => {
      [...new Array(11).keys()]
        .map(x => x + 1)
        .forEach(i => {
          const current = `${type}${i}`;
          const currentSelection = currentSelectionTemplate
            .replace(/TT/g, type)
            .replace(/NN/g, i);

          incrementalSelects =
            incrementalSelects.replace(
              new RegExp(`(?:${type}\\d+|player)\\..+?\\s+as\\s+`, 'g'),
              'TEMP.'
            ) + currentSelection;

          const sourceTableName = currentTable;
          currentTable = `TEMP_${i + j}`;

          queries.push(`
              CREATE TABLE ${currentTable} AS
              SELECT
              ${matchSelects}
              ${incrementalSelects.substring(
                0,
                incrementalSelects.length - 2
              )}
              
              FROM ${sourceTableName} as TEMP
              INNER JOIN Match as match on match.match_api_id = TEMP.match_api_id
              INNER JOIN Player as player on player.player_api_id = match.home_player_${i}
              INNER JOIN Player_Attributes as ${current} on ${current}.player_api_id = match.home_player_${i} AND ${current}.date < TEMP.date
              GROUP BY TEMP.match_api_id
              HAVING ${current}.date = MAX(${current}.date);
          `);

          queries.push(`DROP TABLE ${sourceTableName};`);
        });
        
        // teams
        incrementalSelects =
          incrementalSelects.replace(
            new RegExp(`(?:${type}\\d+|player)\\..+?\\s+as\\s+`, 'g'),
            'TEMP.'
          ) + (`
            team.team_long_name as ${type}_tema_long_name,
            team.team_short_name as ${type}team_short_name,
            ta.date as ${type}_team_date,
            ta.buildUpPlaySpeed as ${type}_team_buildUpPlaySpeed,
            ta.buildUpPlaySpeedClass as ${type}_team_buildUpPlaySpeedClass,
            ta.buildUpPlayDribbling as ${type}_team_buildUpPlayDribbling,
            ta.buildUpPlayDribblingClass as ${type}_team_buildUpPlayDribblingClass,
            ta.buildUpPlayPassing as ${type}_team_buildUpPlayPassing,
            ta.buildUpPlayPassingClass as ${type}_team_buildUpPlayPassingClass,
            ta.buildUpPlayPositioningClass as ${type}_team_buildUpPlayPositioningClass,
            ta.chanceCreationPassing as ${type}_team_chanceCreationPassing,
            ta.chanceCreationPassingClass as ${type}_team_chanceCreationPassingClass,
            ta.chanceCreationCrossing as ${type}_team_chanceCreationCrossing,
            ta.chanceCreationCrossingClass as ${type}_team_chanceCreationCrossingClass,
            ta.chanceCreationShooting as ${type}_team_chanceCreationShooting,
            ta.chanceCreationShootingClass as ${type}_team_chanceCreationShootingClass,
            ta.chanceCreationPositioningClass as ${type}_team_chanceCreationPositioningClass,
            ta.defencePressure as ${type}_team_defencePressure,
            ta.defencePressureClass as ${type}_team_defencePressureClass,
            ta.defenceAggression as ${type}_team_defenceAggression,
            ta.defenceAggressionClass as ${type}_team_defenceAggressionClass,
            ta.defenceTeamWidth as ${type}_team_defenceTeamWidth,
            ta.defenceTeamWidthClass as ${type}_team_defenceTeamWidthClass,
            ta.defenceDefenderLineClass as ${type}_team_defenceDefenderLineClass,\n`);

        const sourceTableName = currentTable;
        currentTable = `TEMP_${type}`;

        queries.push(`
            CREATE TABLE ${currentTable} AS
            SELECT
            ${matchSelects}
            ${incrementalSelects.substring(
              0,
              incrementalSelects.length - 2
            )}
            
            FROM ${sourceTableName} as TEMP
            INNER JOIN Match as match on match.match_api_id = TEMP.match_api_id
            INNER JOIN Team as team on team.team_api_id = match.${type}_team_api_id
            INNER JOIN Team_Attributes as ta on ta.team_api_id = match.${type}_team_api_id AND ta.date < TEMP.date
            GROUP BY TEMP.match_api_id
            HAVING ta.date = MAX(ta.date);
        `);

        queries.push(`DROP TABLE ${sourceTableName};`);
              
        incrementalSelects =
          incrementalSelects.replace(
            /(?:ta|team)\..+?\s+as\s+/g,
            'TEMP.'
          );
    });

    queries.forEach((query, i) => {
      db.run(query, async (err) => {
        if (err) {
          console.log(err, query);
          await fs.writeFile('error.log', `${query}\n\n\n${err}`);
          process.exit(1);
        }

        console.log(
          i % 2 === 0
            ? `Query ${i} successfully executed`
            : `Temp table successfully deleted`
        );
      });
    });

    // TODO : use currentTable to get results
  });

  db.close();
})();
