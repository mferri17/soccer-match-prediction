
CREATE TABLE WELLA_01 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            away1.player_api_id as away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            away1.date as away1_date, away1.overall_rating as away1_overall_rating, away1.potential as away1_potential, away1.preferred_foot as away1_preferred_foot, 
            away1.attacking_work_rate as away1_attacking_work_rate, away1.defensive_work_rate as away1_defensive_work_rate, away1.crossing as away1_crossing, 
            away1.finishing as away1_finishing, away1.heading_accuracy as away1_heading_accuracy, away1.short_passing as away1_short_passing, 
            away1.volleys as away1_volleys, away1.dribbling as away1_dribbling, away1.curve as away1_curve, away1.free_kick_accuracy as away1_free_kick_accuracy, 
            away1.long_passing as away1_long_passing, away1.long_passing as away1_long_passing, away1.ball_control as away1_ball_control, 
            away1.acceleration as away1_acceleration, away1.sprint_speed as away1_sprint_speed, away1.agility as away1_agility, away1.reactions as away1_reactions, 
            away1.balance as away1_balance, away1.shot_power as away1_shot_power, away1.jumping as away1_jumping, away1.stamina as away1_stamina, 
            away1.strength as away1_strength, away1.long_shots as away1_long_shots, away1.aggression as away1_aggression, away1.interceptions as away1_interceptions, 
            away1.positioning as away1_positioning, away1.vision as away1_vision, away1.penalties as away1_penalties, away1.marking as away1_marking, 
            away1.standing_tackle as away1_standing_tackle, away1.gk_diving as away1_gk_diving, away1.gk_kicking as away1_gk_kicking, 
            away1.gk_positioning as away1_gk_positioning, away1.gk_reflexes as away1_gk_reflexes
            
            FROM WELLA_00 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_1
            INNER JOIN Player_Attributes as away1 on away1.player_api_id = match.home_player_1 AND away1.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away1.date = MAX(away1.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_02 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            away2.player_api_id as away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            away2.date as away2_date, away2.overall_rating as away2_overall_rating, away2.potential as away2_potential, away2.preferred_foot as away2_preferred_foot, 
            away2.attacking_work_rate as away2_attacking_work_rate, away2.defensive_work_rate as away2_defensive_work_rate, away2.crossing as away2_crossing, 
            away2.finishing as away2_finishing, away2.heading_accuracy as away2_heading_accuracy, away2.short_passing as away2_short_passing, 
            away2.volleys as away2_volleys, away2.dribbling as away2_dribbling, away2.curve as away2_curve, away2.free_kick_accuracy as away2_free_kick_accuracy, 
            away2.long_passing as away2_long_passing, away2.long_passing as away2_long_passing, away2.ball_control as away2_ball_control, 
            away2.acceleration as away2_acceleration, away2.sprint_speed as away2_sprint_speed, away2.agility as away2_agility, away2.reactions as away2_reactions, 
            away2.balance as away2_balance, away2.shot_power as away2_shot_power, away2.jumping as away2_jumping, away2.stamina as away2_stamina, 
            away2.strength as away2_strength, away2.long_shots as away2_long_shots, away2.aggression as away2_aggression, away2.interceptions as away2_interceptions, 
            away2.positioning as away2_positioning, away2.vision as away2_vision, away2.penalties as away2_penalties, away2.marking as away2_marking, 
            away2.standing_tackle as away2_standing_tackle, away2.gk_diving as away2_gk_diving, away2.gk_kicking as away2_gk_kicking, 
            away2.gk_positioning as away2_gk_positioning, away2.gk_reflexes as away2_gk_reflexes
            
            FROM WELLA_01 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_2
            INNER JOIN Player_Attributes as away2 on away2.player_api_id = match.home_player_2 AND away2.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away2.date = MAX(away2.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_03 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            wella.away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            wella.away2_date, wella.away2_overall_rating, wella.away2_potential, wella.away2_preferred_foot, 
            wella.away2_attacking_work_rate, wella.away2_defensive_work_rate, wella.away2_crossing, 
            wella.away2_finishing, wella.away2_heading_accuracy, wella.away2_short_passing, 
            wella.away2_volleys, wella.away2_dribbling, wella.away2_curve, wella.away2_free_kick_accuracy, 
            wella.away2_long_passing, wella.away2_long_passing, wella.away2_ball_control, 
            wella.away2_acceleration, wella.away2_sprint_speed, wella.away2_agility, wella.away2_reactions, 
            wella.away2_balance, wella.away2_shot_power, wella.away2_jumping, wella.away2_stamina, 
            wella.away2_strength, wella.away2_long_shots, wella.away2_aggression, wella.away2_interceptions, 
            wella.away2_positioning, wella.away2_vision, wella.away2_penalties, wella.away2_marking, 
            wella.away2_standing_tackle, wella.away2_gk_diving, wella.away2_gk_kicking, 
            wella.away2_gk_positioning, wella.away2_gk_reflexes,

            away3.player_api_id as away3_player_api_id, player.player_name as away3_player_name, player.height as away3_height, player.weight as away3_weight, 
            away3.date as away3_date, away3.overall_rating as away3_overall_rating, away3.potential as away3_potential, away3.preferred_foot as away3_preferred_foot, 
            away3.attacking_work_rate as away3_attacking_work_rate, away3.defensive_work_rate as away3_defensive_work_rate, away3.crossing as away3_crossing, 
            away3.finishing as away3_finishing, away3.heading_accuracy as away3_heading_accuracy, away3.short_passing as away3_short_passing, 
            away3.volleys as away3_volleys, away3.dribbling as away3_dribbling, away3.curve as away3_curve, away3.free_kick_accuracy as away3_free_kick_accuracy, 
            away3.long_passing as away3_long_passing, away3.long_passing as away3_long_passing, away3.ball_control as away3_ball_control, 
            away3.acceleration as away3_acceleration, away3.sprint_speed as away3_sprint_speed, away3.agility as away3_agility, away3.reactions as away3_reactions, 
            away3.balance as away3_balance, away3.shot_power as away3_shot_power, away3.jumping as away3_jumping, away3.stamina as away3_stamina, 
            away3.strength as away3_strength, away3.long_shots as away3_long_shots, away3.aggression as away3_aggression, away3.interceptions as away3_interceptions, 
            away3.positioning as away3_positioning, away3.vision as away3_vision, away3.penalties as away3_penalties, away3.marking as away3_marking, 
            away3.standing_tackle as away3_standing_tackle, away3.gk_diving as away3_gk_diving, away3.gk_kicking as away3_gk_kicking, 
            away3.gk_positioning as away3_gk_positioning, away3.gk_reflexes as away3_gk_reflexes
            
            FROM WELLA_02 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_3
            INNER JOIN Player_Attributes as away3 on away3.player_api_id = match.home_player_3 AND away3.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away3.date = MAX(away3.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_04 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            wella.away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            wella.away2_date, wella.away2_overall_rating, wella.away2_potential, wella.away2_preferred_foot, 
            wella.away2_attacking_work_rate, wella.away2_defensive_work_rate, wella.away2_crossing, 
            wella.away2_finishing, wella.away2_heading_accuracy, wella.away2_short_passing, 
            wella.away2_volleys, wella.away2_dribbling, wella.away2_curve, wella.away2_free_kick_accuracy, 
            wella.away2_long_passing, wella.away2_long_passing, wella.away2_ball_control, 
            wella.away2_acceleration, wella.away2_sprint_speed, wella.away2_agility, wella.away2_reactions, 
            wella.away2_balance, wella.away2_shot_power, wella.away2_jumping, wella.away2_stamina, 
            wella.away2_strength, wella.away2_long_shots, wella.away2_aggression, wella.away2_interceptions, 
            wella.away2_positioning, wella.away2_vision, wella.away2_penalties, wella.away2_marking, 
            wella.away2_standing_tackle, wella.away2_gk_diving, wella.away2_gk_kicking, 
            wella.away2_gk_positioning, wella.away2_gk_reflexes,

            wella.away3_player_api_id, player.player_name as away3_player_name, player.height as away3_height, player.weight as away3_weight, 
            wella.away3_date, wella.away3_overall_rating, wella.away3_potential, wella.away3_preferred_foot, 
            wella.away3_attacking_work_rate, wella.away3_defensive_work_rate, wella.away3_crossing, 
            wella.away3_finishing, wella.away3_heading_accuracy, wella.away3_short_passing, 
            wella.away3_volleys, wella.away3_dribbling, wella.away3_curve, wella.away3_free_kick_accuracy, 
            wella.away3_long_passing, wella.away3_long_passing, wella.away3_ball_control, 
            wella.away3_acceleration, wella.away3_sprint_speed, wella.away3_agility, wella.away3_reactions, 
            wella.away3_balance, wella.away3_shot_power, wella.away3_jumping, wella.away3_stamina, 
            wella.away3_strength, wella.away3_long_shots, wella.away3_aggression, wella.away3_interceptions, 
            wella.away3_positioning, wella.away3_vision, wella.away3_penalties, wella.away3_marking, 
            wella.away3_standing_tackle, wella.away3_gk_diving, wella.away3_gk_kicking, 
            wella.away3_gk_positioning, wella.away3_gk_reflexes,

            away4.player_api_id as away4_player_api_id, player.player_name as away4_player_name, player.height as away4_height, player.weight as away4_weight, 
            away4.date as away4_date, away4.overall_rating as away4_overall_rating, away4.potential as away4_potential, away4.preferred_foot as away4_preferred_foot, 
            away4.attacking_work_rate as away4_attacking_work_rate, away4.defensive_work_rate as away4_defensive_work_rate, away4.crossing as away4_crossing, 
            away4.finishing as away4_finishing, away4.heading_accuracy as away4_heading_accuracy, away4.short_passing as away4_short_passing, 
            away4.volleys as away4_volleys, away4.dribbling as away4_dribbling, away4.curve as away4_curve, away4.free_kick_accuracy as away4_free_kick_accuracy, 
            away4.long_passing as away4_long_passing, away4.long_passing as away4_long_passing, away4.ball_control as away4_ball_control, 
            away4.acceleration as away4_acceleration, away4.sprint_speed as away4_sprint_speed, away4.agility as away4_agility, away4.reactions as away4_reactions, 
            away4.balance as away4_balance, away4.shot_power as away4_shot_power, away4.jumping as away4_jumping, away4.stamina as away4_stamina, 
            away4.strength as away4_strength, away4.long_shots as away4_long_shots, away4.aggression as away4_aggression, away4.interceptions as away4_interceptions, 
            away4.positioning as away4_positioning, away4.vision as away4_vision, away4.penalties as away4_penalties, away4.marking as away4_marking, 
            away4.standing_tackle as away4_standing_tackle, away4.gk_diving as away4_gk_diving, away4.gk_kicking as away4_gk_kicking, 
            away4.gk_positioning as away4_gk_positioning, away4.gk_reflexes as away4_gk_reflexes
            
            FROM WELLA_03 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_4
            INNER JOIN Player_Attributes as away4 on away4.player_api_id = match.home_player_4 AND away4.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away4.date = MAX(away4.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_05 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            wella.away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            wella.away2_date, wella.away2_overall_rating, wella.away2_potential, wella.away2_preferred_foot, 
            wella.away2_attacking_work_rate, wella.away2_defensive_work_rate, wella.away2_crossing, 
            wella.away2_finishing, wella.away2_heading_accuracy, wella.away2_short_passing, 
            wella.away2_volleys, wella.away2_dribbling, wella.away2_curve, wella.away2_free_kick_accuracy, 
            wella.away2_long_passing, wella.away2_long_passing, wella.away2_ball_control, 
            wella.away2_acceleration, wella.away2_sprint_speed, wella.away2_agility, wella.away2_reactions, 
            wella.away2_balance, wella.away2_shot_power, wella.away2_jumping, wella.away2_stamina, 
            wella.away2_strength, wella.away2_long_shots, wella.away2_aggression, wella.away2_interceptions, 
            wella.away2_positioning, wella.away2_vision, wella.away2_penalties, wella.away2_marking, 
            wella.away2_standing_tackle, wella.away2_gk_diving, wella.away2_gk_kicking, 
            wella.away2_gk_positioning, wella.away2_gk_reflexes,

            wella.away3_player_api_id, player.player_name as away3_player_name, player.height as away3_height, player.weight as away3_weight, 
            wella.away3_date, wella.away3_overall_rating, wella.away3_potential, wella.away3_preferred_foot, 
            wella.away3_attacking_work_rate, wella.away3_defensive_work_rate, wella.away3_crossing, 
            wella.away3_finishing, wella.away3_heading_accuracy, wella.away3_short_passing, 
            wella.away3_volleys, wella.away3_dribbling, wella.away3_curve, wella.away3_free_kick_accuracy, 
            wella.away3_long_passing, wella.away3_long_passing, wella.away3_ball_control, 
            wella.away3_acceleration, wella.away3_sprint_speed, wella.away3_agility, wella.away3_reactions, 
            wella.away3_balance, wella.away3_shot_power, wella.away3_jumping, wella.away3_stamina, 
            wella.away3_strength, wella.away3_long_shots, wella.away3_aggression, wella.away3_interceptions, 
            wella.away3_positioning, wella.away3_vision, wella.away3_penalties, wella.away3_marking, 
            wella.away3_standing_tackle, wella.away3_gk_diving, wella.away3_gk_kicking, 
            wella.away3_gk_positioning, wella.away3_gk_reflexes,

            wella.away4_player_api_id, player.player_name as away4_player_name, player.height as away4_height, player.weight as away4_weight, 
            wella.away4_date, wella.away4_overall_rating, wella.away4_potential, wella.away4_preferred_foot, 
            wella.away4_attacking_work_rate, wella.away4_defensive_work_rate, wella.away4_crossing, 
            wella.away4_finishing, wella.away4_heading_accuracy, wella.away4_short_passing, 
            wella.away4_volleys, wella.away4_dribbling, wella.away4_curve, wella.away4_free_kick_accuracy, 
            wella.away4_long_passing, wella.away4_long_passing, wella.away4_ball_control, 
            wella.away4_acceleration, wella.away4_sprint_speed, wella.away4_agility, wella.away4_reactions, 
            wella.away4_balance, wella.away4_shot_power, wella.away4_jumping, wella.away4_stamina, 
            wella.away4_strength, wella.away4_long_shots, wella.away4_aggression, wella.away4_interceptions, 
            wella.away4_positioning, wella.away4_vision, wella.away4_penalties, wella.away4_marking, 
            wella.away4_standing_tackle, wella.away4_gk_diving, wella.away4_gk_kicking, 
            wella.away4_gk_positioning, wella.away4_gk_reflexes,

            away5.player_api_id as away5_player_api_id, player.player_name as away5_player_name, player.height as away5_height, player.weight as away5_weight, 
            away5.date as away5_date, away5.overall_rating as away5_overall_rating, away5.potential as away5_potential, away5.preferred_foot as away5_preferred_foot, 
            away5.attacking_work_rate as away5_attacking_work_rate, away5.defensive_work_rate as away5_defensive_work_rate, away5.crossing as away5_crossing, 
            away5.finishing as away5_finishing, away5.heading_accuracy as away5_heading_accuracy, away5.short_passing as away5_short_passing, 
            away5.volleys as away5_volleys, away5.dribbling as away5_dribbling, away5.curve as away5_curve, away5.free_kick_accuracy as away5_free_kick_accuracy, 
            away5.long_passing as away5_long_passing, away5.long_passing as away5_long_passing, away5.ball_control as away5_ball_control, 
            away5.acceleration as away5_acceleration, away5.sprint_speed as away5_sprint_speed, away5.agility as away5_agility, away5.reactions as away5_reactions, 
            away5.balance as away5_balance, away5.shot_power as away5_shot_power, away5.jumping as away5_jumping, away5.stamina as away5_stamina, 
            away5.strength as away5_strength, away5.long_shots as away5_long_shots, away5.aggression as away5_aggression, away5.interceptions as away5_interceptions, 
            away5.positioning as away5_positioning, away5.vision as away5_vision, away5.penalties as away5_penalties, away5.marking as away5_marking, 
            away5.standing_tackle as away5_standing_tackle, away5.gk_diving as away5_gk_diving, away5.gk_kicking as away5_gk_kicking, 
            away5.gk_positioning as away5_gk_positioning, away5.gk_reflexes as away5_gk_reflexes
            
            FROM WELLA_04 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_5
            INNER JOIN Player_Attributes as away5 on away5.player_api_id = match.home_player_5 AND away5.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away5.date = MAX(away5.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_06 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            wella.away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            wella.away2_date, wella.away2_overall_rating, wella.away2_potential, wella.away2_preferred_foot, 
            wella.away2_attacking_work_rate, wella.away2_defensive_work_rate, wella.away2_crossing, 
            wella.away2_finishing, wella.away2_heading_accuracy, wella.away2_short_passing, 
            wella.away2_volleys, wella.away2_dribbling, wella.away2_curve, wella.away2_free_kick_accuracy, 
            wella.away2_long_passing, wella.away2_long_passing, wella.away2_ball_control, 
            wella.away2_acceleration, wella.away2_sprint_speed, wella.away2_agility, wella.away2_reactions, 
            wella.away2_balance, wella.away2_shot_power, wella.away2_jumping, wella.away2_stamina, 
            wella.away2_strength, wella.away2_long_shots, wella.away2_aggression, wella.away2_interceptions, 
            wella.away2_positioning, wella.away2_vision, wella.away2_penalties, wella.away2_marking, 
            wella.away2_standing_tackle, wella.away2_gk_diving, wella.away2_gk_kicking, 
            wella.away2_gk_positioning, wella.away2_gk_reflexes,

            wella.away3_player_api_id, player.player_name as away3_player_name, player.height as away3_height, player.weight as away3_weight, 
            wella.away3_date, wella.away3_overall_rating, wella.away3_potential, wella.away3_preferred_foot, 
            wella.away3_attacking_work_rate, wella.away3_defensive_work_rate, wella.away3_crossing, 
            wella.away3_finishing, wella.away3_heading_accuracy, wella.away3_short_passing, 
            wella.away3_volleys, wella.away3_dribbling, wella.away3_curve, wella.away3_free_kick_accuracy, 
            wella.away3_long_passing, wella.away3_long_passing, wella.away3_ball_control, 
            wella.away3_acceleration, wella.away3_sprint_speed, wella.away3_agility, wella.away3_reactions, 
            wella.away3_balance, wella.away3_shot_power, wella.away3_jumping, wella.away3_stamina, 
            wella.away3_strength, wella.away3_long_shots, wella.away3_aggression, wella.away3_interceptions, 
            wella.away3_positioning, wella.away3_vision, wella.away3_penalties, wella.away3_marking, 
            wella.away3_standing_tackle, wella.away3_gk_diving, wella.away3_gk_kicking, 
            wella.away3_gk_positioning, wella.away3_gk_reflexes,

            wella.away4_player_api_id, player.player_name as away4_player_name, player.height as away4_height, player.weight as away4_weight, 
            wella.away4_date, wella.away4_overall_rating, wella.away4_potential, wella.away4_preferred_foot, 
            wella.away4_attacking_work_rate, wella.away4_defensive_work_rate, wella.away4_crossing, 
            wella.away4_finishing, wella.away4_heading_accuracy, wella.away4_short_passing, 
            wella.away4_volleys, wella.away4_dribbling, wella.away4_curve, wella.away4_free_kick_accuracy, 
            wella.away4_long_passing, wella.away4_long_passing, wella.away4_ball_control, 
            wella.away4_acceleration, wella.away4_sprint_speed, wella.away4_agility, wella.away4_reactions, 
            wella.away4_balance, wella.away4_shot_power, wella.away4_jumping, wella.away4_stamina, 
            wella.away4_strength, wella.away4_long_shots, wella.away4_aggression, wella.away4_interceptions, 
            wella.away4_positioning, wella.away4_vision, wella.away4_penalties, wella.away4_marking, 
            wella.away4_standing_tackle, wella.away4_gk_diving, wella.away4_gk_kicking, 
            wella.away4_gk_positioning, wella.away4_gk_reflexes,

            wella.away5_player_api_id, player.player_name as away5_player_name, player.height as away5_height, player.weight as away5_weight, 
            wella.away5_date, wella.away5_overall_rating, wella.away5_potential, wella.away5_preferred_foot, 
            wella.away5_attacking_work_rate, wella.away5_defensive_work_rate, wella.away5_crossing, 
            wella.away5_finishing, wella.away5_heading_accuracy, wella.away5_short_passing, 
            wella.away5_volleys, wella.away5_dribbling, wella.away5_curve, wella.away5_free_kick_accuracy, 
            wella.away5_long_passing, wella.away5_long_passing, wella.away5_ball_control, 
            wella.away5_acceleration, wella.away5_sprint_speed, wella.away5_agility, wella.away5_reactions, 
            wella.away5_balance, wella.away5_shot_power, wella.away5_jumping, wella.away5_stamina, 
            wella.away5_strength, wella.away5_long_shots, wella.away5_aggression, wella.away5_interceptions, 
            wella.away5_positioning, wella.away5_vision, wella.away5_penalties, wella.away5_marking, 
            wella.away5_standing_tackle, wella.away5_gk_diving, wella.away5_gk_kicking, 
            wella.away5_gk_positioning, wella.away5_gk_reflexes,

            away6.player_api_id as away6_player_api_id, player.player_name as away6_player_name, player.height as away6_height, player.weight as away6_weight, 
            away6.date as away6_date, away6.overall_rating as away6_overall_rating, away6.potential as away6_potential, away6.preferred_foot as away6_preferred_foot, 
            away6.attacking_work_rate as away6_attacking_work_rate, away6.defensive_work_rate as away6_defensive_work_rate, away6.crossing as away6_crossing, 
            away6.finishing as away6_finishing, away6.heading_accuracy as away6_heading_accuracy, away6.short_passing as away6_short_passing, 
            away6.volleys as away6_volleys, away6.dribbling as away6_dribbling, away6.curve as away6_curve, away6.free_kick_accuracy as away6_free_kick_accuracy, 
            away6.long_passing as away6_long_passing, away6.long_passing as away6_long_passing, away6.ball_control as away6_ball_control, 
            away6.acceleration as away6_acceleration, away6.sprint_speed as away6_sprint_speed, away6.agility as away6_agility, away6.reactions as away6_reactions, 
            away6.balance as away6_balance, away6.shot_power as away6_shot_power, away6.jumping as away6_jumping, away6.stamina as away6_stamina, 
            away6.strength as away6_strength, away6.long_shots as away6_long_shots, away6.aggression as away6_aggression, away6.interceptions as away6_interceptions, 
            away6.positioning as away6_positioning, away6.vision as away6_vision, away6.penalties as away6_penalties, away6.marking as away6_marking, 
            away6.standing_tackle as away6_standing_tackle, away6.gk_diving as away6_gk_diving, away6.gk_kicking as away6_gk_kicking, 
            away6.gk_positioning as away6_gk_positioning, away6.gk_reflexes as away6_gk_reflexes
            
            FROM WELLA_05 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_6
            INNER JOIN Player_Attributes as away6 on away6.player_api_id = match.home_player_6 AND away6.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away6.date = MAX(away6.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_07 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            wella.away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            wella.away2_date, wella.away2_overall_rating, wella.away2_potential, wella.away2_preferred_foot, 
            wella.away2_attacking_work_rate, wella.away2_defensive_work_rate, wella.away2_crossing, 
            wella.away2_finishing, wella.away2_heading_accuracy, wella.away2_short_passing, 
            wella.away2_volleys, wella.away2_dribbling, wella.away2_curve, wella.away2_free_kick_accuracy, 
            wella.away2_long_passing, wella.away2_long_passing, wella.away2_ball_control, 
            wella.away2_acceleration, wella.away2_sprint_speed, wella.away2_agility, wella.away2_reactions, 
            wella.away2_balance, wella.away2_shot_power, wella.away2_jumping, wella.away2_stamina, 
            wella.away2_strength, wella.away2_long_shots, wella.away2_aggression, wella.away2_interceptions, 
            wella.away2_positioning, wella.away2_vision, wella.away2_penalties, wella.away2_marking, 
            wella.away2_standing_tackle, wella.away2_gk_diving, wella.away2_gk_kicking, 
            wella.away2_gk_positioning, wella.away2_gk_reflexes,

            wella.away3_player_api_id, player.player_name as away3_player_name, player.height as away3_height, player.weight as away3_weight, 
            wella.away3_date, wella.away3_overall_rating, wella.away3_potential, wella.away3_preferred_foot, 
            wella.away3_attacking_work_rate, wella.away3_defensive_work_rate, wella.away3_crossing, 
            wella.away3_finishing, wella.away3_heading_accuracy, wella.away3_short_passing, 
            wella.away3_volleys, wella.away3_dribbling, wella.away3_curve, wella.away3_free_kick_accuracy, 
            wella.away3_long_passing, wella.away3_long_passing, wella.away3_ball_control, 
            wella.away3_acceleration, wella.away3_sprint_speed, wella.away3_agility, wella.away3_reactions, 
            wella.away3_balance, wella.away3_shot_power, wella.away3_jumping, wella.away3_stamina, 
            wella.away3_strength, wella.away3_long_shots, wella.away3_aggression, wella.away3_interceptions, 
            wella.away3_positioning, wella.away3_vision, wella.away3_penalties, wella.away3_marking, 
            wella.away3_standing_tackle, wella.away3_gk_diving, wella.away3_gk_kicking, 
            wella.away3_gk_positioning, wella.away3_gk_reflexes,

            wella.away4_player_api_id, player.player_name as away4_player_name, player.height as away4_height, player.weight as away4_weight, 
            wella.away4_date, wella.away4_overall_rating, wella.away4_potential, wella.away4_preferred_foot, 
            wella.away4_attacking_work_rate, wella.away4_defensive_work_rate, wella.away4_crossing, 
            wella.away4_finishing, wella.away4_heading_accuracy, wella.away4_short_passing, 
            wella.away4_volleys, wella.away4_dribbling, wella.away4_curve, wella.away4_free_kick_accuracy, 
            wella.away4_long_passing, wella.away4_long_passing, wella.away4_ball_control, 
            wella.away4_acceleration, wella.away4_sprint_speed, wella.away4_agility, wella.away4_reactions, 
            wella.away4_balance, wella.away4_shot_power, wella.away4_jumping, wella.away4_stamina, 
            wella.away4_strength, wella.away4_long_shots, wella.away4_aggression, wella.away4_interceptions, 
            wella.away4_positioning, wella.away4_vision, wella.away4_penalties, wella.away4_marking, 
            wella.away4_standing_tackle, wella.away4_gk_diving, wella.away4_gk_kicking, 
            wella.away4_gk_positioning, wella.away4_gk_reflexes,

            wella.away5_player_api_id, player.player_name as away5_player_name, player.height as away5_height, player.weight as away5_weight, 
            wella.away5_date, wella.away5_overall_rating, wella.away5_potential, wella.away5_preferred_foot, 
            wella.away5_attacking_work_rate, wella.away5_defensive_work_rate, wella.away5_crossing, 
            wella.away5_finishing, wella.away5_heading_accuracy, wella.away5_short_passing, 
            wella.away5_volleys, wella.away5_dribbling, wella.away5_curve, wella.away5_free_kick_accuracy, 
            wella.away5_long_passing, wella.away5_long_passing, wella.away5_ball_control, 
            wella.away5_acceleration, wella.away5_sprint_speed, wella.away5_agility, wella.away5_reactions, 
            wella.away5_balance, wella.away5_shot_power, wella.away5_jumping, wella.away5_stamina, 
            wella.away5_strength, wella.away5_long_shots, wella.away5_aggression, wella.away5_interceptions, 
            wella.away5_positioning, wella.away5_vision, wella.away5_penalties, wella.away5_marking, 
            wella.away5_standing_tackle, wella.away5_gk_diving, wella.away5_gk_kicking, 
            wella.away5_gk_positioning, wella.away5_gk_reflexes,

            wella.away6_player_api_id, player.player_name as away6_player_name, player.height as away6_height, player.weight as away6_weight, 
            wella.away6_date, wella.away6_overall_rating, wella.away6_potential, wella.away6_preferred_foot, 
            wella.away6_attacking_work_rate, wella.away6_defensive_work_rate, wella.away6_crossing, 
            wella.away6_finishing, wella.away6_heading_accuracy, wella.away6_short_passing, 
            wella.away6_volleys, wella.away6_dribbling, wella.away6_curve, wella.away6_free_kick_accuracy, 
            wella.away6_long_passing, wella.away6_long_passing, wella.away6_ball_control, 
            wella.away6_acceleration, wella.away6_sprint_speed, wella.away6_agility, wella.away6_reactions, 
            wella.away6_balance, wella.away6_shot_power, wella.away6_jumping, wella.away6_stamina, 
            wella.away6_strength, wella.away6_long_shots, wella.away6_aggression, wella.away6_interceptions, 
            wella.away6_positioning, wella.away6_vision, wella.away6_penalties, wella.away6_marking, 
            wella.away6_standing_tackle, wella.away6_gk_diving, wella.away6_gk_kicking, 
            wella.away6_gk_positioning, wella.away6_gk_reflexes,

            away7.player_api_id as away7_player_api_id, player.player_name as away7_player_name, player.height as away7_height, player.weight as away7_weight, 
            away7.date as away7_date, away7.overall_rating as away7_overall_rating, away7.potential as away7_potential, away7.preferred_foot as away7_preferred_foot, 
            away7.attacking_work_rate as away7_attacking_work_rate, away7.defensive_work_rate as away7_defensive_work_rate, away7.crossing as away7_crossing, 
            away7.finishing as away7_finishing, away7.heading_accuracy as away7_heading_accuracy, away7.short_passing as away7_short_passing, 
            away7.volleys as away7_volleys, away7.dribbling as away7_dribbling, away7.curve as away7_curve, away7.free_kick_accuracy as away7_free_kick_accuracy, 
            away7.long_passing as away7_long_passing, away7.long_passing as away7_long_passing, away7.ball_control as away7_ball_control, 
            away7.acceleration as away7_acceleration, away7.sprint_speed as away7_sprint_speed, away7.agility as away7_agility, away7.reactions as away7_reactions, 
            away7.balance as away7_balance, away7.shot_power as away7_shot_power, away7.jumping as away7_jumping, away7.stamina as away7_stamina, 
            away7.strength as away7_strength, away7.long_shots as away7_long_shots, away7.aggression as away7_aggression, away7.interceptions as away7_interceptions, 
            away7.positioning as away7_positioning, away7.vision as away7_vision, away7.penalties as away7_penalties, away7.marking as away7_marking, 
            away7.standing_tackle as away7_standing_tackle, away7.gk_diving as away7_gk_diving, away7.gk_kicking as away7_gk_kicking, 
            away7.gk_positioning as away7_gk_positioning, away7.gk_reflexes as away7_gk_reflexes
            
            FROM WELLA_06 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_7
            INNER JOIN Player_Attributes as away7 on away7.player_api_id = match.home_player_7 AND away7.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away7.date = MAX(away7.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_08 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            wella.away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            wella.away2_date, wella.away2_overall_rating, wella.away2_potential, wella.away2_preferred_foot, 
            wella.away2_attacking_work_rate, wella.away2_defensive_work_rate, wella.away2_crossing, 
            wella.away2_finishing, wella.away2_heading_accuracy, wella.away2_short_passing, 
            wella.away2_volleys, wella.away2_dribbling, wella.away2_curve, wella.away2_free_kick_accuracy, 
            wella.away2_long_passing, wella.away2_long_passing, wella.away2_ball_control, 
            wella.away2_acceleration, wella.away2_sprint_speed, wella.away2_agility, wella.away2_reactions, 
            wella.away2_balance, wella.away2_shot_power, wella.away2_jumping, wella.away2_stamina, 
            wella.away2_strength, wella.away2_long_shots, wella.away2_aggression, wella.away2_interceptions, 
            wella.away2_positioning, wella.away2_vision, wella.away2_penalties, wella.away2_marking, 
            wella.away2_standing_tackle, wella.away2_gk_diving, wella.away2_gk_kicking, 
            wella.away2_gk_positioning, wella.away2_gk_reflexes,

            wella.away3_player_api_id, player.player_name as away3_player_name, player.height as away3_height, player.weight as away3_weight, 
            wella.away3_date, wella.away3_overall_rating, wella.away3_potential, wella.away3_preferred_foot, 
            wella.away3_attacking_work_rate, wella.away3_defensive_work_rate, wella.away3_crossing, 
            wella.away3_finishing, wella.away3_heading_accuracy, wella.away3_short_passing, 
            wella.away3_volleys, wella.away3_dribbling, wella.away3_curve, wella.away3_free_kick_accuracy, 
            wella.away3_long_passing, wella.away3_long_passing, wella.away3_ball_control, 
            wella.away3_acceleration, wella.away3_sprint_speed, wella.away3_agility, wella.away3_reactions, 
            wella.away3_balance, wella.away3_shot_power, wella.away3_jumping, wella.away3_stamina, 
            wella.away3_strength, wella.away3_long_shots, wella.away3_aggression, wella.away3_interceptions, 
            wella.away3_positioning, wella.away3_vision, wella.away3_penalties, wella.away3_marking, 
            wella.away3_standing_tackle, wella.away3_gk_diving, wella.away3_gk_kicking, 
            wella.away3_gk_positioning, wella.away3_gk_reflexes,

            wella.away4_player_api_id, player.player_name as away4_player_name, player.height as away4_height, player.weight as away4_weight, 
            wella.away4_date, wella.away4_overall_rating, wella.away4_potential, wella.away4_preferred_foot, 
            wella.away4_attacking_work_rate, wella.away4_defensive_work_rate, wella.away4_crossing, 
            wella.away4_finishing, wella.away4_heading_accuracy, wella.away4_short_passing, 
            wella.away4_volleys, wella.away4_dribbling, wella.away4_curve, wella.away4_free_kick_accuracy, 
            wella.away4_long_passing, wella.away4_long_passing, wella.away4_ball_control, 
            wella.away4_acceleration, wella.away4_sprint_speed, wella.away4_agility, wella.away4_reactions, 
            wella.away4_balance, wella.away4_shot_power, wella.away4_jumping, wella.away4_stamina, 
            wella.away4_strength, wella.away4_long_shots, wella.away4_aggression, wella.away4_interceptions, 
            wella.away4_positioning, wella.away4_vision, wella.away4_penalties, wella.away4_marking, 
            wella.away4_standing_tackle, wella.away4_gk_diving, wella.away4_gk_kicking, 
            wella.away4_gk_positioning, wella.away4_gk_reflexes,

            wella.away5_player_api_id, player.player_name as away5_player_name, player.height as away5_height, player.weight as away5_weight, 
            wella.away5_date, wella.away5_overall_rating, wella.away5_potential, wella.away5_preferred_foot, 
            wella.away5_attacking_work_rate, wella.away5_defensive_work_rate, wella.away5_crossing, 
            wella.away5_finishing, wella.away5_heading_accuracy, wella.away5_short_passing, 
            wella.away5_volleys, wella.away5_dribbling, wella.away5_curve, wella.away5_free_kick_accuracy, 
            wella.away5_long_passing, wella.away5_long_passing, wella.away5_ball_control, 
            wella.away5_acceleration, wella.away5_sprint_speed, wella.away5_agility, wella.away5_reactions, 
            wella.away5_balance, wella.away5_shot_power, wella.away5_jumping, wella.away5_stamina, 
            wella.away5_strength, wella.away5_long_shots, wella.away5_aggression, wella.away5_interceptions, 
            wella.away5_positioning, wella.away5_vision, wella.away5_penalties, wella.away5_marking, 
            wella.away5_standing_tackle, wella.away5_gk_diving, wella.away5_gk_kicking, 
            wella.away5_gk_positioning, wella.away5_gk_reflexes,

            wella.away6_player_api_id, player.player_name as away6_player_name, player.height as away6_height, player.weight as away6_weight, 
            wella.away6_date, wella.away6_overall_rating, wella.away6_potential, wella.away6_preferred_foot, 
            wella.away6_attacking_work_rate, wella.away6_defensive_work_rate, wella.away6_crossing, 
            wella.away6_finishing, wella.away6_heading_accuracy, wella.away6_short_passing, 
            wella.away6_volleys, wella.away6_dribbling, wella.away6_curve, wella.away6_free_kick_accuracy, 
            wella.away6_long_passing, wella.away6_long_passing, wella.away6_ball_control, 
            wella.away6_acceleration, wella.away6_sprint_speed, wella.away6_agility, wella.away6_reactions, 
            wella.away6_balance, wella.away6_shot_power, wella.away6_jumping, wella.away6_stamina, 
            wella.away6_strength, wella.away6_long_shots, wella.away6_aggression, wella.away6_interceptions, 
            wella.away6_positioning, wella.away6_vision, wella.away6_penalties, wella.away6_marking, 
            wella.away6_standing_tackle, wella.away6_gk_diving, wella.away6_gk_kicking, 
            wella.away6_gk_positioning, wella.away6_gk_reflexes,

            wella.away7_player_api_id, player.player_name as away7_player_name, player.height as away7_height, player.weight as away7_weight, 
            wella.away7_date, wella.away7_overall_rating, wella.away7_potential, wella.away7_preferred_foot, 
            wella.away7_attacking_work_rate, wella.away7_defensive_work_rate, wella.away7_crossing, 
            wella.away7_finishing, wella.away7_heading_accuracy, wella.away7_short_passing, 
            wella.away7_volleys, wella.away7_dribbling, wella.away7_curve, wella.away7_free_kick_accuracy, 
            wella.away7_long_passing, wella.away7_long_passing, wella.away7_ball_control, 
            wella.away7_acceleration, wella.away7_sprint_speed, wella.away7_agility, wella.away7_reactions, 
            wella.away7_balance, wella.away7_shot_power, wella.away7_jumping, wella.away7_stamina, 
            wella.away7_strength, wella.away7_long_shots, wella.away7_aggression, wella.away7_interceptions, 
            wella.away7_positioning, wella.away7_vision, wella.away7_penalties, wella.away7_marking, 
            wella.away7_standing_tackle, wella.away7_gk_diving, wella.away7_gk_kicking, 
            wella.away7_gk_positioning, wella.away7_gk_reflexes,

            away8.player_api_id as away8_player_api_id, player.player_name as away8_player_name, player.height as away8_height, player.weight as away8_weight, 
            away8.date as away8_date, away8.overall_rating as away8_overall_rating, away8.potential as away8_potential, away8.preferred_foot as away8_preferred_foot, 
            away8.attacking_work_rate as away8_attacking_work_rate, away8.defensive_work_rate as away8_defensive_work_rate, away8.crossing as away8_crossing, 
            away8.finishing as away8_finishing, away8.heading_accuracy as away8_heading_accuracy, away8.short_passing as away8_short_passing, 
            away8.volleys as away8_volleys, away8.dribbling as away8_dribbling, away8.curve as away8_curve, away8.free_kick_accuracy as away8_free_kick_accuracy, 
            away8.long_passing as away8_long_passing, away8.long_passing as away8_long_passing, away8.ball_control as away8_ball_control, 
            away8.acceleration as away8_acceleration, away8.sprint_speed as away8_sprint_speed, away8.agility as away8_agility, away8.reactions as away8_reactions, 
            away8.balance as away8_balance, away8.shot_power as away8_shot_power, away8.jumping as away8_jumping, away8.stamina as away8_stamina, 
            away8.strength as away8_strength, away8.long_shots as away8_long_shots, away8.aggression as away8_aggression, away8.interceptions as away8_interceptions, 
            away8.positioning as away8_positioning, away8.vision as away8_vision, away8.penalties as away8_penalties, away8.marking as away8_marking, 
            away8.standing_tackle as away8_standing_tackle, away8.gk_diving as away8_gk_diving, away8.gk_kicking as away8_gk_kicking, 
            away8.gk_positioning as away8_gk_positioning, away8.gk_reflexes as away8_gk_reflexes
            
            FROM WELLA_07 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_8
            INNER JOIN Player_Attributes as away8 on away8.player_api_id = match.home_player_8 AND away8.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away8.date = MAX(away8.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_09 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            wella.away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            wella.away2_date, wella.away2_overall_rating, wella.away2_potential, wella.away2_preferred_foot, 
            wella.away2_attacking_work_rate, wella.away2_defensive_work_rate, wella.away2_crossing, 
            wella.away2_finishing, wella.away2_heading_accuracy, wella.away2_short_passing, 
            wella.away2_volleys, wella.away2_dribbling, wella.away2_curve, wella.away2_free_kick_accuracy, 
            wella.away2_long_passing, wella.away2_long_passing, wella.away2_ball_control, 
            wella.away2_acceleration, wella.away2_sprint_speed, wella.away2_agility, wella.away2_reactions, 
            wella.away2_balance, wella.away2_shot_power, wella.away2_jumping, wella.away2_stamina, 
            wella.away2_strength, wella.away2_long_shots, wella.away2_aggression, wella.away2_interceptions, 
            wella.away2_positioning, wella.away2_vision, wella.away2_penalties, wella.away2_marking, 
            wella.away2_standing_tackle, wella.away2_gk_diving, wella.away2_gk_kicking, 
            wella.away2_gk_positioning, wella.away2_gk_reflexes,

            wella.away3_player_api_id, player.player_name as away3_player_name, player.height as away3_height, player.weight as away3_weight, 
            wella.away3_date, wella.away3_overall_rating, wella.away3_potential, wella.away3_preferred_foot, 
            wella.away3_attacking_work_rate, wella.away3_defensive_work_rate, wella.away3_crossing, 
            wella.away3_finishing, wella.away3_heading_accuracy, wella.away3_short_passing, 
            wella.away3_volleys, wella.away3_dribbling, wella.away3_curve, wella.away3_free_kick_accuracy, 
            wella.away3_long_passing, wella.away3_long_passing, wella.away3_ball_control, 
            wella.away3_acceleration, wella.away3_sprint_speed, wella.away3_agility, wella.away3_reactions, 
            wella.away3_balance, wella.away3_shot_power, wella.away3_jumping, wella.away3_stamina, 
            wella.away3_strength, wella.away3_long_shots, wella.away3_aggression, wella.away3_interceptions, 
            wella.away3_positioning, wella.away3_vision, wella.away3_penalties, wella.away3_marking, 
            wella.away3_standing_tackle, wella.away3_gk_diving, wella.away3_gk_kicking, 
            wella.away3_gk_positioning, wella.away3_gk_reflexes,

            wella.away4_player_api_id, player.player_name as away4_player_name, player.height as away4_height, player.weight as away4_weight, 
            wella.away4_date, wella.away4_overall_rating, wella.away4_potential, wella.away4_preferred_foot, 
            wella.away4_attacking_work_rate, wella.away4_defensive_work_rate, wella.away4_crossing, 
            wella.away4_finishing, wella.away4_heading_accuracy, wella.away4_short_passing, 
            wella.away4_volleys, wella.away4_dribbling, wella.away4_curve, wella.away4_free_kick_accuracy, 
            wella.away4_long_passing, wella.away4_long_passing, wella.away4_ball_control, 
            wella.away4_acceleration, wella.away4_sprint_speed, wella.away4_agility, wella.away4_reactions, 
            wella.away4_balance, wella.away4_shot_power, wella.away4_jumping, wella.away4_stamina, 
            wella.away4_strength, wella.away4_long_shots, wella.away4_aggression, wella.away4_interceptions, 
            wella.away4_positioning, wella.away4_vision, wella.away4_penalties, wella.away4_marking, 
            wella.away4_standing_tackle, wella.away4_gk_diving, wella.away4_gk_kicking, 
            wella.away4_gk_positioning, wella.away4_gk_reflexes,

            wella.away5_player_api_id, player.player_name as away5_player_name, player.height as away5_height, player.weight as away5_weight, 
            wella.away5_date, wella.away5_overall_rating, wella.away5_potential, wella.away5_preferred_foot, 
            wella.away5_attacking_work_rate, wella.away5_defensive_work_rate, wella.away5_crossing, 
            wella.away5_finishing, wella.away5_heading_accuracy, wella.away5_short_passing, 
            wella.away5_volleys, wella.away5_dribbling, wella.away5_curve, wella.away5_free_kick_accuracy, 
            wella.away5_long_passing, wella.away5_long_passing, wella.away5_ball_control, 
            wella.away5_acceleration, wella.away5_sprint_speed, wella.away5_agility, wella.away5_reactions, 
            wella.away5_balance, wella.away5_shot_power, wella.away5_jumping, wella.away5_stamina, 
            wella.away5_strength, wella.away5_long_shots, wella.away5_aggression, wella.away5_interceptions, 
            wella.away5_positioning, wella.away5_vision, wella.away5_penalties, wella.away5_marking, 
            wella.away5_standing_tackle, wella.away5_gk_diving, wella.away5_gk_kicking, 
            wella.away5_gk_positioning, wella.away5_gk_reflexes,

            wella.away6_player_api_id, player.player_name as away6_player_name, player.height as away6_height, player.weight as away6_weight, 
            wella.away6_date, wella.away6_overall_rating, wella.away6_potential, wella.away6_preferred_foot, 
            wella.away6_attacking_work_rate, wella.away6_defensive_work_rate, wella.away6_crossing, 
            wella.away6_finishing, wella.away6_heading_accuracy, wella.away6_short_passing, 
            wella.away6_volleys, wella.away6_dribbling, wella.away6_curve, wella.away6_free_kick_accuracy, 
            wella.away6_long_passing, wella.away6_long_passing, wella.away6_ball_control, 
            wella.away6_acceleration, wella.away6_sprint_speed, wella.away6_agility, wella.away6_reactions, 
            wella.away6_balance, wella.away6_shot_power, wella.away6_jumping, wella.away6_stamina, 
            wella.away6_strength, wella.away6_long_shots, wella.away6_aggression, wella.away6_interceptions, 
            wella.away6_positioning, wella.away6_vision, wella.away6_penalties, wella.away6_marking, 
            wella.away6_standing_tackle, wella.away6_gk_diving, wella.away6_gk_kicking, 
            wella.away6_gk_positioning, wella.away6_gk_reflexes,

            wella.away7_player_api_id, player.player_name as away7_player_name, player.height as away7_height, player.weight as away7_weight, 
            wella.away7_date, wella.away7_overall_rating, wella.away7_potential, wella.away7_preferred_foot, 
            wella.away7_attacking_work_rate, wella.away7_defensive_work_rate, wella.away7_crossing, 
            wella.away7_finishing, wella.away7_heading_accuracy, wella.away7_short_passing, 
            wella.away7_volleys, wella.away7_dribbling, wella.away7_curve, wella.away7_free_kick_accuracy, 
            wella.away7_long_passing, wella.away7_long_passing, wella.away7_ball_control, 
            wella.away7_acceleration, wella.away7_sprint_speed, wella.away7_agility, wella.away7_reactions, 
            wella.away7_balance, wella.away7_shot_power, wella.away7_jumping, wella.away7_stamina, 
            wella.away7_strength, wella.away7_long_shots, wella.away7_aggression, wella.away7_interceptions, 
            wella.away7_positioning, wella.away7_vision, wella.away7_penalties, wella.away7_marking, 
            wella.away7_standing_tackle, wella.away7_gk_diving, wella.away7_gk_kicking, 
            wella.away7_gk_positioning, wella.away7_gk_reflexes,

            wella.away8_player_api_id, player.player_name as away8_player_name, player.height as away8_height, player.weight as away8_weight, 
            wella.away8_date, wella.away8_overall_rating, wella.away8_potential, wella.away8_preferred_foot, 
            wella.away8_attacking_work_rate, wella.away8_defensive_work_rate, wella.away8_crossing, 
            wella.away8_finishing, wella.away8_heading_accuracy, wella.away8_short_passing, 
            wella.away8_volleys, wella.away8_dribbling, wella.away8_curve, wella.away8_free_kick_accuracy, 
            wella.away8_long_passing, wella.away8_long_passing, wella.away8_ball_control, 
            wella.away8_acceleration, wella.away8_sprint_speed, wella.away8_agility, wella.away8_reactions, 
            wella.away8_balance, wella.away8_shot_power, wella.away8_jumping, wella.away8_stamina, 
            wella.away8_strength, wella.away8_long_shots, wella.away8_aggression, wella.away8_interceptions, 
            wella.away8_positioning, wella.away8_vision, wella.away8_penalties, wella.away8_marking, 
            wella.away8_standing_tackle, wella.away8_gk_diving, wella.away8_gk_kicking, 
            wella.away8_gk_positioning, wella.away8_gk_reflexes,

            away9.player_api_id as away9_player_api_id, player.player_name as away9_player_name, player.height as away9_height, player.weight as away9_weight, 
            away9.date as away9_date, away9.overall_rating as away9_overall_rating, away9.potential as away9_potential, away9.preferred_foot as away9_preferred_foot, 
            away9.attacking_work_rate as away9_attacking_work_rate, away9.defensive_work_rate as away9_defensive_work_rate, away9.crossing as away9_crossing, 
            away9.finishing as away9_finishing, away9.heading_accuracy as away9_heading_accuracy, away9.short_passing as away9_short_passing, 
            away9.volleys as away9_volleys, away9.dribbling as away9_dribbling, away9.curve as away9_curve, away9.free_kick_accuracy as away9_free_kick_accuracy, 
            away9.long_passing as away9_long_passing, away9.long_passing as away9_long_passing, away9.ball_control as away9_ball_control, 
            away9.acceleration as away9_acceleration, away9.sprint_speed as away9_sprint_speed, away9.agility as away9_agility, away9.reactions as away9_reactions, 
            away9.balance as away9_balance, away9.shot_power as away9_shot_power, away9.jumping as away9_jumping, away9.stamina as away9_stamina, 
            away9.strength as away9_strength, away9.long_shots as away9_long_shots, away9.aggression as away9_aggression, away9.interceptions as away9_interceptions, 
            away9.positioning as away9_positioning, away9.vision as away9_vision, away9.penalties as away9_penalties, away9.marking as away9_marking, 
            away9.standing_tackle as away9_standing_tackle, away9.gk_diving as away9_gk_diving, away9.gk_kicking as away9_gk_kicking, 
            away9.gk_positioning as away9_gk_positioning, away9.gk_reflexes as away9_gk_reflexes
            
            FROM WELLA_08 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_9
            INNER JOIN Player_Attributes as away9 on away9.player_api_id = match.home_player_9 AND away9.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away9.date = MAX(away9.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_10 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            wella.away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            wella.away2_date, wella.away2_overall_rating, wella.away2_potential, wella.away2_preferred_foot, 
            wella.away2_attacking_work_rate, wella.away2_defensive_work_rate, wella.away2_crossing, 
            wella.away2_finishing, wella.away2_heading_accuracy, wella.away2_short_passing, 
            wella.away2_volleys, wella.away2_dribbling, wella.away2_curve, wella.away2_free_kick_accuracy, 
            wella.away2_long_passing, wella.away2_long_passing, wella.away2_ball_control, 
            wella.away2_acceleration, wella.away2_sprint_speed, wella.away2_agility, wella.away2_reactions, 
            wella.away2_balance, wella.away2_shot_power, wella.away2_jumping, wella.away2_stamina, 
            wella.away2_strength, wella.away2_long_shots, wella.away2_aggression, wella.away2_interceptions, 
            wella.away2_positioning, wella.away2_vision, wella.away2_penalties, wella.away2_marking, 
            wella.away2_standing_tackle, wella.away2_gk_diving, wella.away2_gk_kicking, 
            wella.away2_gk_positioning, wella.away2_gk_reflexes,

            wella.away3_player_api_id, player.player_name as away3_player_name, player.height as away3_height, player.weight as away3_weight, 
            wella.away3_date, wella.away3_overall_rating, wella.away3_potential, wella.away3_preferred_foot, 
            wella.away3_attacking_work_rate, wella.away3_defensive_work_rate, wella.away3_crossing, 
            wella.away3_finishing, wella.away3_heading_accuracy, wella.away3_short_passing, 
            wella.away3_volleys, wella.away3_dribbling, wella.away3_curve, wella.away3_free_kick_accuracy, 
            wella.away3_long_passing, wella.away3_long_passing, wella.away3_ball_control, 
            wella.away3_acceleration, wella.away3_sprint_speed, wella.away3_agility, wella.away3_reactions, 
            wella.away3_balance, wella.away3_shot_power, wella.away3_jumping, wella.away3_stamina, 
            wella.away3_strength, wella.away3_long_shots, wella.away3_aggression, wella.away3_interceptions, 
            wella.away3_positioning, wella.away3_vision, wella.away3_penalties, wella.away3_marking, 
            wella.away3_standing_tackle, wella.away3_gk_diving, wella.away3_gk_kicking, 
            wella.away3_gk_positioning, wella.away3_gk_reflexes,

            wella.away4_player_api_id, player.player_name as away4_player_name, player.height as away4_height, player.weight as away4_weight, 
            wella.away4_date, wella.away4_overall_rating, wella.away4_potential, wella.away4_preferred_foot, 
            wella.away4_attacking_work_rate, wella.away4_defensive_work_rate, wella.away4_crossing, 
            wella.away4_finishing, wella.away4_heading_accuracy, wella.away4_short_passing, 
            wella.away4_volleys, wella.away4_dribbling, wella.away4_curve, wella.away4_free_kick_accuracy, 
            wella.away4_long_passing, wella.away4_long_passing, wella.away4_ball_control, 
            wella.away4_acceleration, wella.away4_sprint_speed, wella.away4_agility, wella.away4_reactions, 
            wella.away4_balance, wella.away4_shot_power, wella.away4_jumping, wella.away4_stamina, 
            wella.away4_strength, wella.away4_long_shots, wella.away4_aggression, wella.away4_interceptions, 
            wella.away4_positioning, wella.away4_vision, wella.away4_penalties, wella.away4_marking, 
            wella.away4_standing_tackle, wella.away4_gk_diving, wella.away4_gk_kicking, 
            wella.away4_gk_positioning, wella.away4_gk_reflexes,

            wella.away5_player_api_id, player.player_name as away5_player_name, player.height as away5_height, player.weight as away5_weight, 
            wella.away5_date, wella.away5_overall_rating, wella.away5_potential, wella.away5_preferred_foot, 
            wella.away5_attacking_work_rate, wella.away5_defensive_work_rate, wella.away5_crossing, 
            wella.away5_finishing, wella.away5_heading_accuracy, wella.away5_short_passing, 
            wella.away5_volleys, wella.away5_dribbling, wella.away5_curve, wella.away5_free_kick_accuracy, 
            wella.away5_long_passing, wella.away5_long_passing, wella.away5_ball_control, 
            wella.away5_acceleration, wella.away5_sprint_speed, wella.away5_agility, wella.away5_reactions, 
            wella.away5_balance, wella.away5_shot_power, wella.away5_jumping, wella.away5_stamina, 
            wella.away5_strength, wella.away5_long_shots, wella.away5_aggression, wella.away5_interceptions, 
            wella.away5_positioning, wella.away5_vision, wella.away5_penalties, wella.away5_marking, 
            wella.away5_standing_tackle, wella.away5_gk_diving, wella.away5_gk_kicking, 
            wella.away5_gk_positioning, wella.away5_gk_reflexes,

            wella.away6_player_api_id, player.player_name as away6_player_name, player.height as away6_height, player.weight as away6_weight, 
            wella.away6_date, wella.away6_overall_rating, wella.away6_potential, wella.away6_preferred_foot, 
            wella.away6_attacking_work_rate, wella.away6_defensive_work_rate, wella.away6_crossing, 
            wella.away6_finishing, wella.away6_heading_accuracy, wella.away6_short_passing, 
            wella.away6_volleys, wella.away6_dribbling, wella.away6_curve, wella.away6_free_kick_accuracy, 
            wella.away6_long_passing, wella.away6_long_passing, wella.away6_ball_control, 
            wella.away6_acceleration, wella.away6_sprint_speed, wella.away6_agility, wella.away6_reactions, 
            wella.away6_balance, wella.away6_shot_power, wella.away6_jumping, wella.away6_stamina, 
            wella.away6_strength, wella.away6_long_shots, wella.away6_aggression, wella.away6_interceptions, 
            wella.away6_positioning, wella.away6_vision, wella.away6_penalties, wella.away6_marking, 
            wella.away6_standing_tackle, wella.away6_gk_diving, wella.away6_gk_kicking, 
            wella.away6_gk_positioning, wella.away6_gk_reflexes,

            wella.away7_player_api_id, player.player_name as away7_player_name, player.height as away7_height, player.weight as away7_weight, 
            wella.away7_date, wella.away7_overall_rating, wella.away7_potential, wella.away7_preferred_foot, 
            wella.away7_attacking_work_rate, wella.away7_defensive_work_rate, wella.away7_crossing, 
            wella.away7_finishing, wella.away7_heading_accuracy, wella.away7_short_passing, 
            wella.away7_volleys, wella.away7_dribbling, wella.away7_curve, wella.away7_free_kick_accuracy, 
            wella.away7_long_passing, wella.away7_long_passing, wella.away7_ball_control, 
            wella.away7_acceleration, wella.away7_sprint_speed, wella.away7_agility, wella.away7_reactions, 
            wella.away7_balance, wella.away7_shot_power, wella.away7_jumping, wella.away7_stamina, 
            wella.away7_strength, wella.away7_long_shots, wella.away7_aggression, wella.away7_interceptions, 
            wella.away7_positioning, wella.away7_vision, wella.away7_penalties, wella.away7_marking, 
            wella.away7_standing_tackle, wella.away7_gk_diving, wella.away7_gk_kicking, 
            wella.away7_gk_positioning, wella.away7_gk_reflexes,

            wella.away8_player_api_id, player.player_name as away8_player_name, player.height as away8_height, player.weight as away8_weight, 
            wella.away8_date, wella.away8_overall_rating, wella.away8_potential, wella.away8_preferred_foot, 
            wella.away8_attacking_work_rate, wella.away8_defensive_work_rate, wella.away8_crossing, 
            wella.away8_finishing, wella.away8_heading_accuracy, wella.away8_short_passing, 
            wella.away8_volleys, wella.away8_dribbling, wella.away8_curve, wella.away8_free_kick_accuracy, 
            wella.away8_long_passing, wella.away8_long_passing, wella.away8_ball_control, 
            wella.away8_acceleration, wella.away8_sprint_speed, wella.away8_agility, wella.away8_reactions, 
            wella.away8_balance, wella.away8_shot_power, wella.away8_jumping, wella.away8_stamina, 
            wella.away8_strength, wella.away8_long_shots, wella.away8_aggression, wella.away8_interceptions, 
            wella.away8_positioning, wella.away8_vision, wella.away8_penalties, wella.away8_marking, 
            wella.away8_standing_tackle, wella.away8_gk_diving, wella.away8_gk_kicking, 
            wella.away8_gk_positioning, wella.away8_gk_reflexes,

            wella.away9_player_api_id, player.player_name as away9_player_name, player.height as away9_height, player.weight as away9_weight, 
            wella.away9_date, wella.away9_overall_rating, wella.away9_potential, wella.away9_preferred_foot, 
            wella.away9_attacking_work_rate, wella.away9_defensive_work_rate, wella.away9_crossing, 
            wella.away9_finishing, wella.away9_heading_accuracy, wella.away9_short_passing, 
            wella.away9_volleys, wella.away9_dribbling, wella.away9_curve, wella.away9_free_kick_accuracy, 
            wella.away9_long_passing, wella.away9_long_passing, wella.away9_ball_control, 
            wella.away9_acceleration, wella.away9_sprint_speed, wella.away9_agility, wella.away9_reactions, 
            wella.away9_balance, wella.away9_shot_power, wella.away9_jumping, wella.away9_stamina, 
            wella.away9_strength, wella.away9_long_shots, wella.away9_aggression, wella.away9_interceptions, 
            wella.away9_positioning, wella.away9_vision, wella.away9_penalties, wella.away9_marking, 
            wella.away9_standing_tackle, wella.away9_gk_diving, wella.away9_gk_kicking, 
            wella.away9_gk_positioning, wella.away9_gk_reflexes,

            away10.player_api_id as away10_player_api_id, player.player_name as away10_player_name, player.height as away10_height, player.weight as away10_weight, 
            away10.date as away10_date, away10.overall_rating as away10_overall_rating, away10.potential as away10_potential, away10.preferred_foot as away10_preferred_foot, 
            away10.attacking_work_rate as away10_attacking_work_rate, away10.defensive_work_rate as away10_defensive_work_rate, away10.crossing as away10_crossing, 
            away10.finishing as away10_finishing, away10.heading_accuracy as away10_heading_accuracy, away10.short_passing as away10_short_passing, 
            away10.volleys as away10_volleys, away10.dribbling as away10_dribbling, away10.curve as away10_curve, away10.free_kick_accuracy as away10_free_kick_accuracy, 
            away10.long_passing as away10_long_passing, away10.long_passing as away10_long_passing, away10.ball_control as away10_ball_control, 
            away10.acceleration as away10_acceleration, away10.sprint_speed as away10_sprint_speed, away10.agility as away10_agility, away10.reactions as away10_reactions, 
            away10.balance as away10_balance, away10.shot_power as away10_shot_power, away10.jumping as away10_jumping, away10.stamina as away10_stamina, 
            away10.strength as away10_strength, away10.long_shots as away10_long_shots, away10.aggression as away10_aggression, away10.interceptions as away10_interceptions, 
            away10.positioning as away10_positioning, away10.vision as away10_vision, away10.penalties as away10_penalties, away10.marking as away10_marking, 
            away10.standing_tackle as away10_standing_tackle, away10.gk_diving as away10_gk_diving, away10.gk_kicking as away10_gk_kicking, 
            away10.gk_positioning as away10_gk_positioning, away10.gk_reflexes as away10_gk_reflexes
            
            FROM WELLA_09 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_10
            INNER JOIN Player_Attributes as away10 on away10.player_api_id = match.home_player_10 AND away10.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away10.date = MAX(away10.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_11 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.away1_player_api_id, player.player_name as away1_player_name, player.height as away1_height, player.weight as away1_weight, 
            wella.away1_date, wella.away1_overall_rating, wella.away1_potential, wella.away1_preferred_foot, 
            wella.away1_attacking_work_rate, wella.away1_defensive_work_rate, wella.away1_crossing, 
            wella.away1_finishing, wella.away1_heading_accuracy, wella.away1_short_passing, 
            wella.away1_volleys, wella.away1_dribbling, wella.away1_curve, wella.away1_free_kick_accuracy, 
            wella.away1_long_passing, wella.away1_long_passing, wella.away1_ball_control, 
            wella.away1_acceleration, wella.away1_sprint_speed, wella.away1_agility, wella.away1_reactions, 
            wella.away1_balance, wella.away1_shot_power, wella.away1_jumping, wella.away1_stamina, 
            wella.away1_strength, wella.away1_long_shots, wella.away1_aggression, wella.away1_interceptions, 
            wella.away1_positioning, wella.away1_vision, wella.away1_penalties, wella.away1_marking, 
            wella.away1_standing_tackle, wella.away1_gk_diving, wella.away1_gk_kicking, 
            wella.away1_gk_positioning, wella.away1_gk_reflexes,

            wella.away2_player_api_id, player.player_name as away2_player_name, player.height as away2_height, player.weight as away2_weight, 
            wella.away2_date, wella.away2_overall_rating, wella.away2_potential, wella.away2_preferred_foot, 
            wella.away2_attacking_work_rate, wella.away2_defensive_work_rate, wella.away2_crossing, 
            wella.away2_finishing, wella.away2_heading_accuracy, wella.away2_short_passing, 
            wella.away2_volleys, wella.away2_dribbling, wella.away2_curve, wella.away2_free_kick_accuracy, 
            wella.away2_long_passing, wella.away2_long_passing, wella.away2_ball_control, 
            wella.away2_acceleration, wella.away2_sprint_speed, wella.away2_agility, wella.away2_reactions, 
            wella.away2_balance, wella.away2_shot_power, wella.away2_jumping, wella.away2_stamina, 
            wella.away2_strength, wella.away2_long_shots, wella.away2_aggression, wella.away2_interceptions, 
            wella.away2_positioning, wella.away2_vision, wella.away2_penalties, wella.away2_marking, 
            wella.away2_standing_tackle, wella.away2_gk_diving, wella.away2_gk_kicking, 
            wella.away2_gk_positioning, wella.away2_gk_reflexes,

            wella.away3_player_api_id, player.player_name as away3_player_name, player.height as away3_height, player.weight as away3_weight, 
            wella.away3_date, wella.away3_overall_rating, wella.away3_potential, wella.away3_preferred_foot, 
            wella.away3_attacking_work_rate, wella.away3_defensive_work_rate, wella.away3_crossing, 
            wella.away3_finishing, wella.away3_heading_accuracy, wella.away3_short_passing, 
            wella.away3_volleys, wella.away3_dribbling, wella.away3_curve, wella.away3_free_kick_accuracy, 
            wella.away3_long_passing, wella.away3_long_passing, wella.away3_ball_control, 
            wella.away3_acceleration, wella.away3_sprint_speed, wella.away3_agility, wella.away3_reactions, 
            wella.away3_balance, wella.away3_shot_power, wella.away3_jumping, wella.away3_stamina, 
            wella.away3_strength, wella.away3_long_shots, wella.away3_aggression, wella.away3_interceptions, 
            wella.away3_positioning, wella.away3_vision, wella.away3_penalties, wella.away3_marking, 
            wella.away3_standing_tackle, wella.away3_gk_diving, wella.away3_gk_kicking, 
            wella.away3_gk_positioning, wella.away3_gk_reflexes,

            wella.away4_player_api_id, player.player_name as away4_player_name, player.height as away4_height, player.weight as away4_weight, 
            wella.away4_date, wella.away4_overall_rating, wella.away4_potential, wella.away4_preferred_foot, 
            wella.away4_attacking_work_rate, wella.away4_defensive_work_rate, wella.away4_crossing, 
            wella.away4_finishing, wella.away4_heading_accuracy, wella.away4_short_passing, 
            wella.away4_volleys, wella.away4_dribbling, wella.away4_curve, wella.away4_free_kick_accuracy, 
            wella.away4_long_passing, wella.away4_long_passing, wella.away4_ball_control, 
            wella.away4_acceleration, wella.away4_sprint_speed, wella.away4_agility, wella.away4_reactions, 
            wella.away4_balance, wella.away4_shot_power, wella.away4_jumping, wella.away4_stamina, 
            wella.away4_strength, wella.away4_long_shots, wella.away4_aggression, wella.away4_interceptions, 
            wella.away4_positioning, wella.away4_vision, wella.away4_penalties, wella.away4_marking, 
            wella.away4_standing_tackle, wella.away4_gk_diving, wella.away4_gk_kicking, 
            wella.away4_gk_positioning, wella.away4_gk_reflexes,

            wella.away5_player_api_id, player.player_name as away5_player_name, player.height as away5_height, player.weight as away5_weight, 
            wella.away5_date, wella.away5_overall_rating, wella.away5_potential, wella.away5_preferred_foot, 
            wella.away5_attacking_work_rate, wella.away5_defensive_work_rate, wella.away5_crossing, 
            wella.away5_finishing, wella.away5_heading_accuracy, wella.away5_short_passing, 
            wella.away5_volleys, wella.away5_dribbling, wella.away5_curve, wella.away5_free_kick_accuracy, 
            wella.away5_long_passing, wella.away5_long_passing, wella.away5_ball_control, 
            wella.away5_acceleration, wella.away5_sprint_speed, wella.away5_agility, wella.away5_reactions, 
            wella.away5_balance, wella.away5_shot_power, wella.away5_jumping, wella.away5_stamina, 
            wella.away5_strength, wella.away5_long_shots, wella.away5_aggression, wella.away5_interceptions, 
            wella.away5_positioning, wella.away5_vision, wella.away5_penalties, wella.away5_marking, 
            wella.away5_standing_tackle, wella.away5_gk_diving, wella.away5_gk_kicking, 
            wella.away5_gk_positioning, wella.away5_gk_reflexes,

            wella.away6_player_api_id, player.player_name as away6_player_name, player.height as away6_height, player.weight as away6_weight, 
            wella.away6_date, wella.away6_overall_rating, wella.away6_potential, wella.away6_preferred_foot, 
            wella.away6_attacking_work_rate, wella.away6_defensive_work_rate, wella.away6_crossing, 
            wella.away6_finishing, wella.away6_heading_accuracy, wella.away6_short_passing, 
            wella.away6_volleys, wella.away6_dribbling, wella.away6_curve, wella.away6_free_kick_accuracy, 
            wella.away6_long_passing, wella.away6_long_passing, wella.away6_ball_control, 
            wella.away6_acceleration, wella.away6_sprint_speed, wella.away6_agility, wella.away6_reactions, 
            wella.away6_balance, wella.away6_shot_power, wella.away6_jumping, wella.away6_stamina, 
            wella.away6_strength, wella.away6_long_shots, wella.away6_aggression, wella.away6_interceptions, 
            wella.away6_positioning, wella.away6_vision, wella.away6_penalties, wella.away6_marking, 
            wella.away6_standing_tackle, wella.away6_gk_diving, wella.away6_gk_kicking, 
            wella.away6_gk_positioning, wella.away6_gk_reflexes,

            wella.away7_player_api_id, player.player_name as away7_player_name, player.height as away7_height, player.weight as away7_weight, 
            wella.away7_date, wella.away7_overall_rating, wella.away7_potential, wella.away7_preferred_foot, 
            wella.away7_attacking_work_rate, wella.away7_defensive_work_rate, wella.away7_crossing, 
            wella.away7_finishing, wella.away7_heading_accuracy, wella.away7_short_passing, 
            wella.away7_volleys, wella.away7_dribbling, wella.away7_curve, wella.away7_free_kick_accuracy, 
            wella.away7_long_passing, wella.away7_long_passing, wella.away7_ball_control, 
            wella.away7_acceleration, wella.away7_sprint_speed, wella.away7_agility, wella.away7_reactions, 
            wella.away7_balance, wella.away7_shot_power, wella.away7_jumping, wella.away7_stamina, 
            wella.away7_strength, wella.away7_long_shots, wella.away7_aggression, wella.away7_interceptions, 
            wella.away7_positioning, wella.away7_vision, wella.away7_penalties, wella.away7_marking, 
            wella.away7_standing_tackle, wella.away7_gk_diving, wella.away7_gk_kicking, 
            wella.away7_gk_positioning, wella.away7_gk_reflexes,

            wella.away8_player_api_id, player.player_name as away8_player_name, player.height as away8_height, player.weight as away8_weight, 
            wella.away8_date, wella.away8_overall_rating, wella.away8_potential, wella.away8_preferred_foot, 
            wella.away8_attacking_work_rate, wella.away8_defensive_work_rate, wella.away8_crossing, 
            wella.away8_finishing, wella.away8_heading_accuracy, wella.away8_short_passing, 
            wella.away8_volleys, wella.away8_dribbling, wella.away8_curve, wella.away8_free_kick_accuracy, 
            wella.away8_long_passing, wella.away8_long_passing, wella.away8_ball_control, 
            wella.away8_acceleration, wella.away8_sprint_speed, wella.away8_agility, wella.away8_reactions, 
            wella.away8_balance, wella.away8_shot_power, wella.away8_jumping, wella.away8_stamina, 
            wella.away8_strength, wella.away8_long_shots, wella.away8_aggression, wella.away8_interceptions, 
            wella.away8_positioning, wella.away8_vision, wella.away8_penalties, wella.away8_marking, 
            wella.away8_standing_tackle, wella.away8_gk_diving, wella.away8_gk_kicking, 
            wella.away8_gk_positioning, wella.away8_gk_reflexes,

            wella.away9_player_api_id, player.player_name as away9_player_name, player.height as away9_height, player.weight as away9_weight, 
            wella.away9_date, wella.away9_overall_rating, wella.away9_potential, wella.away9_preferred_foot, 
            wella.away9_attacking_work_rate, wella.away9_defensive_work_rate, wella.away9_crossing, 
            wella.away9_finishing, wella.away9_heading_accuracy, wella.away9_short_passing, 
            wella.away9_volleys, wella.away9_dribbling, wella.away9_curve, wella.away9_free_kick_accuracy, 
            wella.away9_long_passing, wella.away9_long_passing, wella.away9_ball_control, 
            wella.away9_acceleration, wella.away9_sprint_speed, wella.away9_agility, wella.away9_reactions, 
            wella.away9_balance, wella.away9_shot_power, wella.away9_jumping, wella.away9_stamina, 
            wella.away9_strength, wella.away9_long_shots, wella.away9_aggression, wella.away9_interceptions, 
            wella.away9_positioning, wella.away9_vision, wella.away9_penalties, wella.away9_marking, 
            wella.away9_standing_tackle, wella.away9_gk_diving, wella.away9_gk_kicking, 
            wella.away9_gk_positioning, wella.away9_gk_reflexes,

            wella.away10_player_api_id, player.player_name as away10_player_name, player.height as away10_height, player.weight as away10_weight, 
            wella.away10_date, wella.away10_overall_rating, wella.away10_potential, wella.away10_preferred_foot, 
            wella.away10_attacking_work_rate, wella.away10_defensive_work_rate, wella.away10_crossing, 
            wella.away10_finishing, wella.away10_heading_accuracy, wella.away10_short_passing, 
            wella.away10_volleys, wella.away10_dribbling, wella.away10_curve, wella.away10_free_kick_accuracy, 
            wella.away10_long_passing, wella.away10_long_passing, wella.away10_ball_control, 
            wella.away10_acceleration, wella.away10_sprint_speed, wella.away10_agility, wella.away10_reactions, 
            wella.away10_balance, wella.away10_shot_power, wella.away10_jumping, wella.away10_stamina, 
            wella.away10_strength, wella.away10_long_shots, wella.away10_aggression, wella.away10_interceptions, 
            wella.away10_positioning, wella.away10_vision, wella.away10_penalties, wella.away10_marking, 
            wella.away10_standing_tackle, wella.away10_gk_diving, wella.away10_gk_kicking, 
            wella.away10_gk_positioning, wella.away10_gk_reflexes,

            away11.player_api_id as away11_player_api_id, player.player_name as away11_player_name, player.height as away11_height, player.weight as away11_weight, 
            away11.date as away11_date, away11.overall_rating as away11_overall_rating, away11.potential as away11_potential, away11.preferred_foot as away11_preferred_foot, 
            away11.attacking_work_rate as away11_attacking_work_rate, away11.defensive_work_rate as away11_defensive_work_rate, away11.crossing as away11_crossing, 
            away11.finishing as away11_finishing, away11.heading_accuracy as away11_heading_accuracy, away11.short_passing as away11_short_passing, 
            away11.volleys as away11_volleys, away11.dribbling as away11_dribbling, away11.curve as away11_curve, away11.free_kick_accuracy as away11_free_kick_accuracy, 
            away11.long_passing as away11_long_passing, away11.long_passing as away11_long_passing, away11.ball_control as away11_ball_control, 
            away11.acceleration as away11_acceleration, away11.sprint_speed as away11_sprint_speed, away11.agility as away11_agility, away11.reactions as away11_reactions, 
            away11.balance as away11_balance, away11.shot_power as away11_shot_power, away11.jumping as away11_jumping, away11.stamina as away11_stamina, 
            away11.strength as away11_strength, away11.long_shots as away11_long_shots, away11.aggression as away11_aggression, away11.interceptions as away11_interceptions, 
            away11.positioning as away11_positioning, away11.vision as away11_vision, away11.penalties as away11_penalties, away11.marking as away11_marking, 
            away11.standing_tackle as away11_standing_tackle, away11.gk_diving as away11_gk_diving, away11.gk_kicking as away11_gk_kicking, 
            away11.gk_positioning as away11_gk_positioning, away11.gk_reflexes as away11_gk_reflexes
            
            FROM WELLA_10 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_11
            INNER JOIN Player_Attributes as away11 on away11.player_api_id = match.home_player_11 AND away11.date < wella.date
            GROUP BY wella.match_api_id
            HAVING away11.date = MAX(away11.date);
            
  ------------------------------------------------
