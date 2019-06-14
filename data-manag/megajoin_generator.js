
const fs = require('fs');

var matchSelection = `
            wella.match_api_id,
            wella.date,`;

var currentSelectionTemplate = `
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

generateJoins();


function generateJoins() {
    var now = new Date();
    var dateString = `${now.getFullYear()}${now.getMonth()}${now.getDay()}${now.getHours()}${now.getMinutes()}`;
    var filename = `generated/${dateString}.sql`;


    var incrementalSelects = '';
    var tableCounter = 1;
    ['home', 'away'].forEach(function (type, index)
    {
        for (var i = 1; i <= 11; i++) {

            var current = `${type}${i}`;
            var currentSelection = currentSelectionTemplate.replace(/TT/g, type).replace(/NN/g, i);
            incrementalSelects = incrementalSelects.replace(new RegExp(`${type}\\d+\\..+? as `, 'g'), 'wella.');
            incrementalSelects = incrementalSelects + currentSelection;

            fs.appendFileSync(filename,
            `\nCREATE TABLE WELLA_${('0' + tableCounter).slice(-2)} AS
            SELECT
                ${matchSelection}
                ${incrementalSelects.substring(0, incrementalSelects.length - 2)}
                
            FROM WELLA_${('0' + (tableCounter - 1)).slice(-2)} as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.${type}_player_${i}
            INNER JOIN Player_Attributes as ${current} on ${current}.player_api_id = match.${type}_player_${i} AND ${current}.date < wella.date
            GROUP BY wella.match_api_id
            HAVING ${current}.date = MAX(${current}.date);
            \n  ------------------------------------------------\n`);
            
            tableCounter++;
        }
        
        incrementalSelects = incrementalSelects.replace(new RegExp(`${type}\\d+\\..+? as `, 'g'), 'wella.');
    });
}