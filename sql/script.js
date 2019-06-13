

// var strings = []
// for(var counter = 1; counter <= 11; counter++){
//     var pippo = `h${counter}.player_api_id as h${counter}_player_api_id, h${counter}.player_name as h${counter}_player_name, h${counter}.height as h${counter}_height, h${counter}.weight as h${counter}_weight, h${counter}.date as h${counter}_date, h${counter}.overall_rating as h${counter}_overall_rating, h${counter}.potential as h${counter}_potential, h${counter}.preferred_foot as h${counter}_preferred_foot, h${counter}.attacking_work_rate as h${counter}_attacking_work_rate, h${counter}.defensive_work_rate as h${counter}_defensive_work_rate, h${counter}.crossing as h${counter}_crossing, h${counter}.finishing as h${counter}_finishing, h${counter}.heading_accuracy as h${counter}_heading_accuracy, h${counter}.short_passing as h${counter}_short_passing, h${counter}.volleys as h${counter}_volleys, h${counter}.dribbling as h${counter}_dribbling, h${counter}.curve as h${counter}_curve, h${counter}.free_kick_accuracy as h${counter}_free_kick_accuracy, h${counter}.long_passing as h${counter}_long_passing, h${counter}.long_passing as h${counter}_long_passing, h${counter}.ball_control as h${counter}_ball_control, h${counter}.acceleration as h${counter}_acceleration, h${counter}.sprint_speed as h${counter}_sprint_speed, h${counter}.agility as h${counter}_agility, h${counter}.reactions as h${counter}_reactions, h${counter}.balance as h${counter}_balance, h${counter}.shot_power as h${counter}_shot_power, h${counter}.jumping as h${counter}_jumping, h${counter}.stamina as h${counter}_stamina, h${counter}.strength as h${counter}_strength, h${counter}.long_shots as h${counter}_long_shots, h${counter}.aggression as h${counter}_aggression, h${counter}. interceptions as h${counter}_ interceptions, h${counter}.positioning as h${counter}_positioning, h${counter}.vision as h${counter}_vision, h${counter}.penalties as h${counter}_penalties, h${counter}.marking as h${counter}_marking, h${counter}.standing_tackle as h${counter}_standing_tackle, h${counter}.gk_diving as h${counter}_gk_diving, h${counter}.gk_kicking as h${counter}_gk_kicking, h${counter}.gk_positioning as h${counter}_gk_positioning, h${counter}.gk_reflexes as h${counter}_gk_reflexes,\n`;
//     strings.push(pippo);
//     console.log(pippo);
// }

// var strings = []
// for(var counter = 1; counter <= 11; counter++){
//     var pluto = `JOIN Player_full as h${counter} on h${counter}.player_api_id = m.home_player_${counter} AND h${counter}.date < m.date\n`;
//     strings.push(pluto);
//     console.log(pluto);
// }

var strings = []
for(var counter = 1; counter <= 11; counter++){
    var pluto = `h${counter}.date = MAX(h${counter}.date) AND \n`;
    strings.push(pluto);
    console.log(pluto);
}