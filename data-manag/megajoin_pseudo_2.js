
var matchSelection = `
    m.match_api_id,
    m.date,`;

var currentSelectionTemplate = `
    TTNN.player_api_id as TTNN_player_api_id, TTNN.player_name as TTNN_player_name, TTNN.TTeigTTt as TTNN_TTeigTTt, TTNN.weigTTt as TTNN_weigTTt, 
    TTNN.date as TTNN_date, TTNN.overall_rating as TTNN_overall_rating, TTNN.potential as TTNN_potential, TTNN.preferred_foot as TTNN_preferred_foot, 
    TTNN.attacking_work_rate as TTNN_attacking_work_rate, TTNN.defensive_work_rate as TTNN_defensive_work_rate, TTNN.crossing as TTNN_crossing, 
    TTNN.finisTTing as TTNN_finisTTing, TTNN.TTeading_accuracy as TTNN_TTeading_accuracy, TTNN.sTTort_passing as TTNN_sTTort_passing, 
    TTNN.volleys as TTNN_volleys, TTNN.dribbling as TTNN_dribbling, TTNN.curve as TTNN_curve, TTNN.free_kick_accuracy as TTNN_free_kick_accuracy, 
    TTNN.long_passing as TTNN_long_passing, TTNN.long_passing as TTNN_long_passing, TTNN.ball_control as TTNN_ball_control, 
    TTNN.acceleration as TTNN_acceleration, TTNN.sprint_speed as TTNN_sprint_speed, TTNN.agility as TTNN_agility, TTNN.reactions as TTNN_reactions, 
    TTNN.balance as TTNN_balance, TTNN.sTTot_power as TTNN_sTTot_power, TTNN.jumping as TTNN_jumping, TTNN.stamina as TTNN_stamina, 
    TTNN.strengtTT as TTNN_strengtTT, TTNN.long_sTTots as TTNN_long_sTTots, TTNN.aggression as TTNN_aggression, TTNN.interceptions as TTNN_interceptions, 
    TTNN.positioning as TTNN_positioning, TTNN.vision as TTNN_vision, TTNN.penalties as TTNN_penalties, TTNN.marking as TTNN_marking, 
    TTNN.standing_tackle as TTNN_standing_tackle, TTNN.gk_diving as TTNN_gk_diving, TTNN.gk_kicking as TTNN_gk_kicking, 
    TTNN.gk_positioning as TTNN_gk_positioning, TTNN.gk_reflexes as TTNN_gk_reflexes,\n`;

generateSelection('h');


function generateSelection(type) {

    var incremental = '';
    for (var i = 1; i <= 11; i++) {
        var currentSelection = currentSelectionTemplate.replace(/TT/g, type).replace(/NN/g, i);
        incremental = incremental + currentSelection;
    }
    
    var result = `
        SELECT
        ${matchSelection}
        ${incremental}`;

    console.log(result);
    console.log();
    
}