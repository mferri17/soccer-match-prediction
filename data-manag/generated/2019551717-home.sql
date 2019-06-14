
CREATE TABLE WELLA_01 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            home1.player_api_id as home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            home1.date as home1_date, home1.overall_rating as home1_overall_rating, home1.potential as home1_potential, home1.preferred_foot as home1_preferred_foot, 
            home1.attacking_work_rate as home1_attacking_work_rate, home1.defensive_work_rate as home1_defensive_work_rate, home1.crossing as home1_crossing, 
            home1.finishing as home1_finishing, home1.heading_accuracy as home1_heading_accuracy, home1.short_passing as home1_short_passing, 
            home1.volleys as home1_volleys, home1.dribbling as home1_dribbling, home1.curve as home1_curve, home1.free_kick_accuracy as home1_free_kick_accuracy, 
            home1.long_passing as home1_long_passing, home1.long_passing as home1_long_passing, home1.ball_control as home1_ball_control, 
            home1.acceleration as home1_acceleration, home1.sprint_speed as home1_sprint_speed, home1.agility as home1_agility, home1.reactions as home1_reactions, 
            home1.balance as home1_balance, home1.shot_power as home1_shot_power, home1.jumping as home1_jumping, home1.stamina as home1_stamina, 
            home1.strength as home1_strength, home1.long_shots as home1_long_shots, home1.aggression as home1_aggression, home1.interceptions as home1_interceptions, 
            home1.positioning as home1_positioning, home1.vision as home1_vision, home1.penalties as home1_penalties, home1.marking as home1_marking, 
            home1.standing_tackle as home1_standing_tackle, home1.gk_diving as home1_gk_diving, home1.gk_kicking as home1_gk_kicking, 
            home1.gk_positioning as home1_gk_positioning, home1.gk_reflexes as home1_gk_reflexes
            
            FROM WELLA_00 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_1
            INNER JOIN Player_Attributes as home1 on home1.player_api_id = match.home_player_1 AND home1.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home1.date = MAX(home1.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_02 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            home2.player_api_id as home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            home2.date as home2_date, home2.overall_rating as home2_overall_rating, home2.potential as home2_potential, home2.preferred_foot as home2_preferred_foot, 
            home2.attacking_work_rate as home2_attacking_work_rate, home2.defensive_work_rate as home2_defensive_work_rate, home2.crossing as home2_crossing, 
            home2.finishing as home2_finishing, home2.heading_accuracy as home2_heading_accuracy, home2.short_passing as home2_short_passing, 
            home2.volleys as home2_volleys, home2.dribbling as home2_dribbling, home2.curve as home2_curve, home2.free_kick_accuracy as home2_free_kick_accuracy, 
            home2.long_passing as home2_long_passing, home2.long_passing as home2_long_passing, home2.ball_control as home2_ball_control, 
            home2.acceleration as home2_acceleration, home2.sprint_speed as home2_sprint_speed, home2.agility as home2_agility, home2.reactions as home2_reactions, 
            home2.balance as home2_balance, home2.shot_power as home2_shot_power, home2.jumping as home2_jumping, home2.stamina as home2_stamina, 
            home2.strength as home2_strength, home2.long_shots as home2_long_shots, home2.aggression as home2_aggression, home2.interceptions as home2_interceptions, 
            home2.positioning as home2_positioning, home2.vision as home2_vision, home2.penalties as home2_penalties, home2.marking as home2_marking, 
            home2.standing_tackle as home2_standing_tackle, home2.gk_diving as home2_gk_diving, home2.gk_kicking as home2_gk_kicking, 
            home2.gk_positioning as home2_gk_positioning, home2.gk_reflexes as home2_gk_reflexes
            
            FROM WELLA_01 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_2
            INNER JOIN Player_Attributes as home2 on home2.player_api_id = match.home_player_2 AND home2.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home2.date = MAX(home2.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_03 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            wella.home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            wella.home2_date, wella.home2_overall_rating, wella.home2_potential, wella.home2_preferred_foot, 
            wella.home2_attacking_work_rate, wella.home2_defensive_work_rate, wella.home2_crossing, 
            wella.home2_finishing, wella.home2_heading_accuracy, wella.home2_short_passing, 
            wella.home2_volleys, wella.home2_dribbling, wella.home2_curve, wella.home2_free_kick_accuracy, 
            wella.home2_long_passing, wella.home2_long_passing, wella.home2_ball_control, 
            wella.home2_acceleration, wella.home2_sprint_speed, wella.home2_agility, wella.home2_reactions, 
            wella.home2_balance, wella.home2_shot_power, wella.home2_jumping, wella.home2_stamina, 
            wella.home2_strength, wella.home2_long_shots, wella.home2_aggression, wella.home2_interceptions, 
            wella.home2_positioning, wella.home2_vision, wella.home2_penalties, wella.home2_marking, 
            wella.home2_standing_tackle, wella.home2_gk_diving, wella.home2_gk_kicking, 
            wella.home2_gk_positioning, wella.home2_gk_reflexes,

            home3.player_api_id as home3_player_api_id, player.player_name as home3_player_name, player.height as home3_height, player.weight as home3_weight, 
            home3.date as home3_date, home3.overall_rating as home3_overall_rating, home3.potential as home3_potential, home3.preferred_foot as home3_preferred_foot, 
            home3.attacking_work_rate as home3_attacking_work_rate, home3.defensive_work_rate as home3_defensive_work_rate, home3.crossing as home3_crossing, 
            home3.finishing as home3_finishing, home3.heading_accuracy as home3_heading_accuracy, home3.short_passing as home3_short_passing, 
            home3.volleys as home3_volleys, home3.dribbling as home3_dribbling, home3.curve as home3_curve, home3.free_kick_accuracy as home3_free_kick_accuracy, 
            home3.long_passing as home3_long_passing, home3.long_passing as home3_long_passing, home3.ball_control as home3_ball_control, 
            home3.acceleration as home3_acceleration, home3.sprint_speed as home3_sprint_speed, home3.agility as home3_agility, home3.reactions as home3_reactions, 
            home3.balance as home3_balance, home3.shot_power as home3_shot_power, home3.jumping as home3_jumping, home3.stamina as home3_stamina, 
            home3.strength as home3_strength, home3.long_shots as home3_long_shots, home3.aggression as home3_aggression, home3.interceptions as home3_interceptions, 
            home3.positioning as home3_positioning, home3.vision as home3_vision, home3.penalties as home3_penalties, home3.marking as home3_marking, 
            home3.standing_tackle as home3_standing_tackle, home3.gk_diving as home3_gk_diving, home3.gk_kicking as home3_gk_kicking, 
            home3.gk_positioning as home3_gk_positioning, home3.gk_reflexes as home3_gk_reflexes
            
            FROM WELLA_02 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_3
            INNER JOIN Player_Attributes as home3 on home3.player_api_id = match.home_player_3 AND home3.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home3.date = MAX(home3.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_04 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            wella.home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            wella.home2_date, wella.home2_overall_rating, wella.home2_potential, wella.home2_preferred_foot, 
            wella.home2_attacking_work_rate, wella.home2_defensive_work_rate, wella.home2_crossing, 
            wella.home2_finishing, wella.home2_heading_accuracy, wella.home2_short_passing, 
            wella.home2_volleys, wella.home2_dribbling, wella.home2_curve, wella.home2_free_kick_accuracy, 
            wella.home2_long_passing, wella.home2_long_passing, wella.home2_ball_control, 
            wella.home2_acceleration, wella.home2_sprint_speed, wella.home2_agility, wella.home2_reactions, 
            wella.home2_balance, wella.home2_shot_power, wella.home2_jumping, wella.home2_stamina, 
            wella.home2_strength, wella.home2_long_shots, wella.home2_aggression, wella.home2_interceptions, 
            wella.home2_positioning, wella.home2_vision, wella.home2_penalties, wella.home2_marking, 
            wella.home2_standing_tackle, wella.home2_gk_diving, wella.home2_gk_kicking, 
            wella.home2_gk_positioning, wella.home2_gk_reflexes,

            wella.home3_player_api_id, player.player_name as home3_player_name, player.height as home3_height, player.weight as home3_weight, 
            wella.home3_date, wella.home3_overall_rating, wella.home3_potential, wella.home3_preferred_foot, 
            wella.home3_attacking_work_rate, wella.home3_defensive_work_rate, wella.home3_crossing, 
            wella.home3_finishing, wella.home3_heading_accuracy, wella.home3_short_passing, 
            wella.home3_volleys, wella.home3_dribbling, wella.home3_curve, wella.home3_free_kick_accuracy, 
            wella.home3_long_passing, wella.home3_long_passing, wella.home3_ball_control, 
            wella.home3_acceleration, wella.home3_sprint_speed, wella.home3_agility, wella.home3_reactions, 
            wella.home3_balance, wella.home3_shot_power, wella.home3_jumping, wella.home3_stamina, 
            wella.home3_strength, wella.home3_long_shots, wella.home3_aggression, wella.home3_interceptions, 
            wella.home3_positioning, wella.home3_vision, wella.home3_penalties, wella.home3_marking, 
            wella.home3_standing_tackle, wella.home3_gk_diving, wella.home3_gk_kicking, 
            wella.home3_gk_positioning, wella.home3_gk_reflexes,

            home4.player_api_id as home4_player_api_id, player.player_name as home4_player_name, player.height as home4_height, player.weight as home4_weight, 
            home4.date as home4_date, home4.overall_rating as home4_overall_rating, home4.potential as home4_potential, home4.preferred_foot as home4_preferred_foot, 
            home4.attacking_work_rate as home4_attacking_work_rate, home4.defensive_work_rate as home4_defensive_work_rate, home4.crossing as home4_crossing, 
            home4.finishing as home4_finishing, home4.heading_accuracy as home4_heading_accuracy, home4.short_passing as home4_short_passing, 
            home4.volleys as home4_volleys, home4.dribbling as home4_dribbling, home4.curve as home4_curve, home4.free_kick_accuracy as home4_free_kick_accuracy, 
            home4.long_passing as home4_long_passing, home4.long_passing as home4_long_passing, home4.ball_control as home4_ball_control, 
            home4.acceleration as home4_acceleration, home4.sprint_speed as home4_sprint_speed, home4.agility as home4_agility, home4.reactions as home4_reactions, 
            home4.balance as home4_balance, home4.shot_power as home4_shot_power, home4.jumping as home4_jumping, home4.stamina as home4_stamina, 
            home4.strength as home4_strength, home4.long_shots as home4_long_shots, home4.aggression as home4_aggression, home4.interceptions as home4_interceptions, 
            home4.positioning as home4_positioning, home4.vision as home4_vision, home4.penalties as home4_penalties, home4.marking as home4_marking, 
            home4.standing_tackle as home4_standing_tackle, home4.gk_diving as home4_gk_diving, home4.gk_kicking as home4_gk_kicking, 
            home4.gk_positioning as home4_gk_positioning, home4.gk_reflexes as home4_gk_reflexes
            
            FROM WELLA_03 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_4
            INNER JOIN Player_Attributes as home4 on home4.player_api_id = match.home_player_4 AND home4.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home4.date = MAX(home4.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_05 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            wella.home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            wella.home2_date, wella.home2_overall_rating, wella.home2_potential, wella.home2_preferred_foot, 
            wella.home2_attacking_work_rate, wella.home2_defensive_work_rate, wella.home2_crossing, 
            wella.home2_finishing, wella.home2_heading_accuracy, wella.home2_short_passing, 
            wella.home2_volleys, wella.home2_dribbling, wella.home2_curve, wella.home2_free_kick_accuracy, 
            wella.home2_long_passing, wella.home2_long_passing, wella.home2_ball_control, 
            wella.home2_acceleration, wella.home2_sprint_speed, wella.home2_agility, wella.home2_reactions, 
            wella.home2_balance, wella.home2_shot_power, wella.home2_jumping, wella.home2_stamina, 
            wella.home2_strength, wella.home2_long_shots, wella.home2_aggression, wella.home2_interceptions, 
            wella.home2_positioning, wella.home2_vision, wella.home2_penalties, wella.home2_marking, 
            wella.home2_standing_tackle, wella.home2_gk_diving, wella.home2_gk_kicking, 
            wella.home2_gk_positioning, wella.home2_gk_reflexes,

            wella.home3_player_api_id, player.player_name as home3_player_name, player.height as home3_height, player.weight as home3_weight, 
            wella.home3_date, wella.home3_overall_rating, wella.home3_potential, wella.home3_preferred_foot, 
            wella.home3_attacking_work_rate, wella.home3_defensive_work_rate, wella.home3_crossing, 
            wella.home3_finishing, wella.home3_heading_accuracy, wella.home3_short_passing, 
            wella.home3_volleys, wella.home3_dribbling, wella.home3_curve, wella.home3_free_kick_accuracy, 
            wella.home3_long_passing, wella.home3_long_passing, wella.home3_ball_control, 
            wella.home3_acceleration, wella.home3_sprint_speed, wella.home3_agility, wella.home3_reactions, 
            wella.home3_balance, wella.home3_shot_power, wella.home3_jumping, wella.home3_stamina, 
            wella.home3_strength, wella.home3_long_shots, wella.home3_aggression, wella.home3_interceptions, 
            wella.home3_positioning, wella.home3_vision, wella.home3_penalties, wella.home3_marking, 
            wella.home3_standing_tackle, wella.home3_gk_diving, wella.home3_gk_kicking, 
            wella.home3_gk_positioning, wella.home3_gk_reflexes,

            wella.home4_player_api_id, player.player_name as home4_player_name, player.height as home4_height, player.weight as home4_weight, 
            wella.home4_date, wella.home4_overall_rating, wella.home4_potential, wella.home4_preferred_foot, 
            wella.home4_attacking_work_rate, wella.home4_defensive_work_rate, wella.home4_crossing, 
            wella.home4_finishing, wella.home4_heading_accuracy, wella.home4_short_passing, 
            wella.home4_volleys, wella.home4_dribbling, wella.home4_curve, wella.home4_free_kick_accuracy, 
            wella.home4_long_passing, wella.home4_long_passing, wella.home4_ball_control, 
            wella.home4_acceleration, wella.home4_sprint_speed, wella.home4_agility, wella.home4_reactions, 
            wella.home4_balance, wella.home4_shot_power, wella.home4_jumping, wella.home4_stamina, 
            wella.home4_strength, wella.home4_long_shots, wella.home4_aggression, wella.home4_interceptions, 
            wella.home4_positioning, wella.home4_vision, wella.home4_penalties, wella.home4_marking, 
            wella.home4_standing_tackle, wella.home4_gk_diving, wella.home4_gk_kicking, 
            wella.home4_gk_positioning, wella.home4_gk_reflexes,

            home5.player_api_id as home5_player_api_id, player.player_name as home5_player_name, player.height as home5_height, player.weight as home5_weight, 
            home5.date as home5_date, home5.overall_rating as home5_overall_rating, home5.potential as home5_potential, home5.preferred_foot as home5_preferred_foot, 
            home5.attacking_work_rate as home5_attacking_work_rate, home5.defensive_work_rate as home5_defensive_work_rate, home5.crossing as home5_crossing, 
            home5.finishing as home5_finishing, home5.heading_accuracy as home5_heading_accuracy, home5.short_passing as home5_short_passing, 
            home5.volleys as home5_volleys, home5.dribbling as home5_dribbling, home5.curve as home5_curve, home5.free_kick_accuracy as home5_free_kick_accuracy, 
            home5.long_passing as home5_long_passing, home5.long_passing as home5_long_passing, home5.ball_control as home5_ball_control, 
            home5.acceleration as home5_acceleration, home5.sprint_speed as home5_sprint_speed, home5.agility as home5_agility, home5.reactions as home5_reactions, 
            home5.balance as home5_balance, home5.shot_power as home5_shot_power, home5.jumping as home5_jumping, home5.stamina as home5_stamina, 
            home5.strength as home5_strength, home5.long_shots as home5_long_shots, home5.aggression as home5_aggression, home5.interceptions as home5_interceptions, 
            home5.positioning as home5_positioning, home5.vision as home5_vision, home5.penalties as home5_penalties, home5.marking as home5_marking, 
            home5.standing_tackle as home5_standing_tackle, home5.gk_diving as home5_gk_diving, home5.gk_kicking as home5_gk_kicking, 
            home5.gk_positioning as home5_gk_positioning, home5.gk_reflexes as home5_gk_reflexes
            
            FROM WELLA_04 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_5
            INNER JOIN Player_Attributes as home5 on home5.player_api_id = match.home_player_5 AND home5.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home5.date = MAX(home5.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_06 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            wella.home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            wella.home2_date, wella.home2_overall_rating, wella.home2_potential, wella.home2_preferred_foot, 
            wella.home2_attacking_work_rate, wella.home2_defensive_work_rate, wella.home2_crossing, 
            wella.home2_finishing, wella.home2_heading_accuracy, wella.home2_short_passing, 
            wella.home2_volleys, wella.home2_dribbling, wella.home2_curve, wella.home2_free_kick_accuracy, 
            wella.home2_long_passing, wella.home2_long_passing, wella.home2_ball_control, 
            wella.home2_acceleration, wella.home2_sprint_speed, wella.home2_agility, wella.home2_reactions, 
            wella.home2_balance, wella.home2_shot_power, wella.home2_jumping, wella.home2_stamina, 
            wella.home2_strength, wella.home2_long_shots, wella.home2_aggression, wella.home2_interceptions, 
            wella.home2_positioning, wella.home2_vision, wella.home2_penalties, wella.home2_marking, 
            wella.home2_standing_tackle, wella.home2_gk_diving, wella.home2_gk_kicking, 
            wella.home2_gk_positioning, wella.home2_gk_reflexes,

            wella.home3_player_api_id, player.player_name as home3_player_name, player.height as home3_height, player.weight as home3_weight, 
            wella.home3_date, wella.home3_overall_rating, wella.home3_potential, wella.home3_preferred_foot, 
            wella.home3_attacking_work_rate, wella.home3_defensive_work_rate, wella.home3_crossing, 
            wella.home3_finishing, wella.home3_heading_accuracy, wella.home3_short_passing, 
            wella.home3_volleys, wella.home3_dribbling, wella.home3_curve, wella.home3_free_kick_accuracy, 
            wella.home3_long_passing, wella.home3_long_passing, wella.home3_ball_control, 
            wella.home3_acceleration, wella.home3_sprint_speed, wella.home3_agility, wella.home3_reactions, 
            wella.home3_balance, wella.home3_shot_power, wella.home3_jumping, wella.home3_stamina, 
            wella.home3_strength, wella.home3_long_shots, wella.home3_aggression, wella.home3_interceptions, 
            wella.home3_positioning, wella.home3_vision, wella.home3_penalties, wella.home3_marking, 
            wella.home3_standing_tackle, wella.home3_gk_diving, wella.home3_gk_kicking, 
            wella.home3_gk_positioning, wella.home3_gk_reflexes,

            wella.home4_player_api_id, player.player_name as home4_player_name, player.height as home4_height, player.weight as home4_weight, 
            wella.home4_date, wella.home4_overall_rating, wella.home4_potential, wella.home4_preferred_foot, 
            wella.home4_attacking_work_rate, wella.home4_defensive_work_rate, wella.home4_crossing, 
            wella.home4_finishing, wella.home4_heading_accuracy, wella.home4_short_passing, 
            wella.home4_volleys, wella.home4_dribbling, wella.home4_curve, wella.home4_free_kick_accuracy, 
            wella.home4_long_passing, wella.home4_long_passing, wella.home4_ball_control, 
            wella.home4_acceleration, wella.home4_sprint_speed, wella.home4_agility, wella.home4_reactions, 
            wella.home4_balance, wella.home4_shot_power, wella.home4_jumping, wella.home4_stamina, 
            wella.home4_strength, wella.home4_long_shots, wella.home4_aggression, wella.home4_interceptions, 
            wella.home4_positioning, wella.home4_vision, wella.home4_penalties, wella.home4_marking, 
            wella.home4_standing_tackle, wella.home4_gk_diving, wella.home4_gk_kicking, 
            wella.home4_gk_positioning, wella.home4_gk_reflexes,

            wella.home5_player_api_id, player.player_name as home5_player_name, player.height as home5_height, player.weight as home5_weight, 
            wella.home5_date, wella.home5_overall_rating, wella.home5_potential, wella.home5_preferred_foot, 
            wella.home5_attacking_work_rate, wella.home5_defensive_work_rate, wella.home5_crossing, 
            wella.home5_finishing, wella.home5_heading_accuracy, wella.home5_short_passing, 
            wella.home5_volleys, wella.home5_dribbling, wella.home5_curve, wella.home5_free_kick_accuracy, 
            wella.home5_long_passing, wella.home5_long_passing, wella.home5_ball_control, 
            wella.home5_acceleration, wella.home5_sprint_speed, wella.home5_agility, wella.home5_reactions, 
            wella.home5_balance, wella.home5_shot_power, wella.home5_jumping, wella.home5_stamina, 
            wella.home5_strength, wella.home5_long_shots, wella.home5_aggression, wella.home5_interceptions, 
            wella.home5_positioning, wella.home5_vision, wella.home5_penalties, wella.home5_marking, 
            wella.home5_standing_tackle, wella.home5_gk_diving, wella.home5_gk_kicking, 
            wella.home5_gk_positioning, wella.home5_gk_reflexes,

            home6.player_api_id as home6_player_api_id, player.player_name as home6_player_name, player.height as home6_height, player.weight as home6_weight, 
            home6.date as home6_date, home6.overall_rating as home6_overall_rating, home6.potential as home6_potential, home6.preferred_foot as home6_preferred_foot, 
            home6.attacking_work_rate as home6_attacking_work_rate, home6.defensive_work_rate as home6_defensive_work_rate, home6.crossing as home6_crossing, 
            home6.finishing as home6_finishing, home6.heading_accuracy as home6_heading_accuracy, home6.short_passing as home6_short_passing, 
            home6.volleys as home6_volleys, home6.dribbling as home6_dribbling, home6.curve as home6_curve, home6.free_kick_accuracy as home6_free_kick_accuracy, 
            home6.long_passing as home6_long_passing, home6.long_passing as home6_long_passing, home6.ball_control as home6_ball_control, 
            home6.acceleration as home6_acceleration, home6.sprint_speed as home6_sprint_speed, home6.agility as home6_agility, home6.reactions as home6_reactions, 
            home6.balance as home6_balance, home6.shot_power as home6_shot_power, home6.jumping as home6_jumping, home6.stamina as home6_stamina, 
            home6.strength as home6_strength, home6.long_shots as home6_long_shots, home6.aggression as home6_aggression, home6.interceptions as home6_interceptions, 
            home6.positioning as home6_positioning, home6.vision as home6_vision, home6.penalties as home6_penalties, home6.marking as home6_marking, 
            home6.standing_tackle as home6_standing_tackle, home6.gk_diving as home6_gk_diving, home6.gk_kicking as home6_gk_kicking, 
            home6.gk_positioning as home6_gk_positioning, home6.gk_reflexes as home6_gk_reflexes
            
            FROM WELLA_05 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_6
            INNER JOIN Player_Attributes as home6 on home6.player_api_id = match.home_player_6 AND home6.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home6.date = MAX(home6.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_07 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            wella.home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            wella.home2_date, wella.home2_overall_rating, wella.home2_potential, wella.home2_preferred_foot, 
            wella.home2_attacking_work_rate, wella.home2_defensive_work_rate, wella.home2_crossing, 
            wella.home2_finishing, wella.home2_heading_accuracy, wella.home2_short_passing, 
            wella.home2_volleys, wella.home2_dribbling, wella.home2_curve, wella.home2_free_kick_accuracy, 
            wella.home2_long_passing, wella.home2_long_passing, wella.home2_ball_control, 
            wella.home2_acceleration, wella.home2_sprint_speed, wella.home2_agility, wella.home2_reactions, 
            wella.home2_balance, wella.home2_shot_power, wella.home2_jumping, wella.home2_stamina, 
            wella.home2_strength, wella.home2_long_shots, wella.home2_aggression, wella.home2_interceptions, 
            wella.home2_positioning, wella.home2_vision, wella.home2_penalties, wella.home2_marking, 
            wella.home2_standing_tackle, wella.home2_gk_diving, wella.home2_gk_kicking, 
            wella.home2_gk_positioning, wella.home2_gk_reflexes,

            wella.home3_player_api_id, player.player_name as home3_player_name, player.height as home3_height, player.weight as home3_weight, 
            wella.home3_date, wella.home3_overall_rating, wella.home3_potential, wella.home3_preferred_foot, 
            wella.home3_attacking_work_rate, wella.home3_defensive_work_rate, wella.home3_crossing, 
            wella.home3_finishing, wella.home3_heading_accuracy, wella.home3_short_passing, 
            wella.home3_volleys, wella.home3_dribbling, wella.home3_curve, wella.home3_free_kick_accuracy, 
            wella.home3_long_passing, wella.home3_long_passing, wella.home3_ball_control, 
            wella.home3_acceleration, wella.home3_sprint_speed, wella.home3_agility, wella.home3_reactions, 
            wella.home3_balance, wella.home3_shot_power, wella.home3_jumping, wella.home3_stamina, 
            wella.home3_strength, wella.home3_long_shots, wella.home3_aggression, wella.home3_interceptions, 
            wella.home3_positioning, wella.home3_vision, wella.home3_penalties, wella.home3_marking, 
            wella.home3_standing_tackle, wella.home3_gk_diving, wella.home3_gk_kicking, 
            wella.home3_gk_positioning, wella.home3_gk_reflexes,

            wella.home4_player_api_id, player.player_name as home4_player_name, player.height as home4_height, player.weight as home4_weight, 
            wella.home4_date, wella.home4_overall_rating, wella.home4_potential, wella.home4_preferred_foot, 
            wella.home4_attacking_work_rate, wella.home4_defensive_work_rate, wella.home4_crossing, 
            wella.home4_finishing, wella.home4_heading_accuracy, wella.home4_short_passing, 
            wella.home4_volleys, wella.home4_dribbling, wella.home4_curve, wella.home4_free_kick_accuracy, 
            wella.home4_long_passing, wella.home4_long_passing, wella.home4_ball_control, 
            wella.home4_acceleration, wella.home4_sprint_speed, wella.home4_agility, wella.home4_reactions, 
            wella.home4_balance, wella.home4_shot_power, wella.home4_jumping, wella.home4_stamina, 
            wella.home4_strength, wella.home4_long_shots, wella.home4_aggression, wella.home4_interceptions, 
            wella.home4_positioning, wella.home4_vision, wella.home4_penalties, wella.home4_marking, 
            wella.home4_standing_tackle, wella.home4_gk_diving, wella.home4_gk_kicking, 
            wella.home4_gk_positioning, wella.home4_gk_reflexes,

            wella.home5_player_api_id, player.player_name as home5_player_name, player.height as home5_height, player.weight as home5_weight, 
            wella.home5_date, wella.home5_overall_rating, wella.home5_potential, wella.home5_preferred_foot, 
            wella.home5_attacking_work_rate, wella.home5_defensive_work_rate, wella.home5_crossing, 
            wella.home5_finishing, wella.home5_heading_accuracy, wella.home5_short_passing, 
            wella.home5_volleys, wella.home5_dribbling, wella.home5_curve, wella.home5_free_kick_accuracy, 
            wella.home5_long_passing, wella.home5_long_passing, wella.home5_ball_control, 
            wella.home5_acceleration, wella.home5_sprint_speed, wella.home5_agility, wella.home5_reactions, 
            wella.home5_balance, wella.home5_shot_power, wella.home5_jumping, wella.home5_stamina, 
            wella.home5_strength, wella.home5_long_shots, wella.home5_aggression, wella.home5_interceptions, 
            wella.home5_positioning, wella.home5_vision, wella.home5_penalties, wella.home5_marking, 
            wella.home5_standing_tackle, wella.home5_gk_diving, wella.home5_gk_kicking, 
            wella.home5_gk_positioning, wella.home5_gk_reflexes,

            wella.home6_player_api_id, player.player_name as home6_player_name, player.height as home6_height, player.weight as home6_weight, 
            wella.home6_date, wella.home6_overall_rating, wella.home6_potential, wella.home6_preferred_foot, 
            wella.home6_attacking_work_rate, wella.home6_defensive_work_rate, wella.home6_crossing, 
            wella.home6_finishing, wella.home6_heading_accuracy, wella.home6_short_passing, 
            wella.home6_volleys, wella.home6_dribbling, wella.home6_curve, wella.home6_free_kick_accuracy, 
            wella.home6_long_passing, wella.home6_long_passing, wella.home6_ball_control, 
            wella.home6_acceleration, wella.home6_sprint_speed, wella.home6_agility, wella.home6_reactions, 
            wella.home6_balance, wella.home6_shot_power, wella.home6_jumping, wella.home6_stamina, 
            wella.home6_strength, wella.home6_long_shots, wella.home6_aggression, wella.home6_interceptions, 
            wella.home6_positioning, wella.home6_vision, wella.home6_penalties, wella.home6_marking, 
            wella.home6_standing_tackle, wella.home6_gk_diving, wella.home6_gk_kicking, 
            wella.home6_gk_positioning, wella.home6_gk_reflexes,

            home7.player_api_id as home7_player_api_id, player.player_name as home7_player_name, player.height as home7_height, player.weight as home7_weight, 
            home7.date as home7_date, home7.overall_rating as home7_overall_rating, home7.potential as home7_potential, home7.preferred_foot as home7_preferred_foot, 
            home7.attacking_work_rate as home7_attacking_work_rate, home7.defensive_work_rate as home7_defensive_work_rate, home7.crossing as home7_crossing, 
            home7.finishing as home7_finishing, home7.heading_accuracy as home7_heading_accuracy, home7.short_passing as home7_short_passing, 
            home7.volleys as home7_volleys, home7.dribbling as home7_dribbling, home7.curve as home7_curve, home7.free_kick_accuracy as home7_free_kick_accuracy, 
            home7.long_passing as home7_long_passing, home7.long_passing as home7_long_passing, home7.ball_control as home7_ball_control, 
            home7.acceleration as home7_acceleration, home7.sprint_speed as home7_sprint_speed, home7.agility as home7_agility, home7.reactions as home7_reactions, 
            home7.balance as home7_balance, home7.shot_power as home7_shot_power, home7.jumping as home7_jumping, home7.stamina as home7_stamina, 
            home7.strength as home7_strength, home7.long_shots as home7_long_shots, home7.aggression as home7_aggression, home7.interceptions as home7_interceptions, 
            home7.positioning as home7_positioning, home7.vision as home7_vision, home7.penalties as home7_penalties, home7.marking as home7_marking, 
            home7.standing_tackle as home7_standing_tackle, home7.gk_diving as home7_gk_diving, home7.gk_kicking as home7_gk_kicking, 
            home7.gk_positioning as home7_gk_positioning, home7.gk_reflexes as home7_gk_reflexes
            
            FROM WELLA_06 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_7
            INNER JOIN Player_Attributes as home7 on home7.player_api_id = match.home_player_7 AND home7.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home7.date = MAX(home7.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_08 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            wella.home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            wella.home2_date, wella.home2_overall_rating, wella.home2_potential, wella.home2_preferred_foot, 
            wella.home2_attacking_work_rate, wella.home2_defensive_work_rate, wella.home2_crossing, 
            wella.home2_finishing, wella.home2_heading_accuracy, wella.home2_short_passing, 
            wella.home2_volleys, wella.home2_dribbling, wella.home2_curve, wella.home2_free_kick_accuracy, 
            wella.home2_long_passing, wella.home2_long_passing, wella.home2_ball_control, 
            wella.home2_acceleration, wella.home2_sprint_speed, wella.home2_agility, wella.home2_reactions, 
            wella.home2_balance, wella.home2_shot_power, wella.home2_jumping, wella.home2_stamina, 
            wella.home2_strength, wella.home2_long_shots, wella.home2_aggression, wella.home2_interceptions, 
            wella.home2_positioning, wella.home2_vision, wella.home2_penalties, wella.home2_marking, 
            wella.home2_standing_tackle, wella.home2_gk_diving, wella.home2_gk_kicking, 
            wella.home2_gk_positioning, wella.home2_gk_reflexes,

            wella.home3_player_api_id, player.player_name as home3_player_name, player.height as home3_height, player.weight as home3_weight, 
            wella.home3_date, wella.home3_overall_rating, wella.home3_potential, wella.home3_preferred_foot, 
            wella.home3_attacking_work_rate, wella.home3_defensive_work_rate, wella.home3_crossing, 
            wella.home3_finishing, wella.home3_heading_accuracy, wella.home3_short_passing, 
            wella.home3_volleys, wella.home3_dribbling, wella.home3_curve, wella.home3_free_kick_accuracy, 
            wella.home3_long_passing, wella.home3_long_passing, wella.home3_ball_control, 
            wella.home3_acceleration, wella.home3_sprint_speed, wella.home3_agility, wella.home3_reactions, 
            wella.home3_balance, wella.home3_shot_power, wella.home3_jumping, wella.home3_stamina, 
            wella.home3_strength, wella.home3_long_shots, wella.home3_aggression, wella.home3_interceptions, 
            wella.home3_positioning, wella.home3_vision, wella.home3_penalties, wella.home3_marking, 
            wella.home3_standing_tackle, wella.home3_gk_diving, wella.home3_gk_kicking, 
            wella.home3_gk_positioning, wella.home3_gk_reflexes,

            wella.home4_player_api_id, player.player_name as home4_player_name, player.height as home4_height, player.weight as home4_weight, 
            wella.home4_date, wella.home4_overall_rating, wella.home4_potential, wella.home4_preferred_foot, 
            wella.home4_attacking_work_rate, wella.home4_defensive_work_rate, wella.home4_crossing, 
            wella.home4_finishing, wella.home4_heading_accuracy, wella.home4_short_passing, 
            wella.home4_volleys, wella.home4_dribbling, wella.home4_curve, wella.home4_free_kick_accuracy, 
            wella.home4_long_passing, wella.home4_long_passing, wella.home4_ball_control, 
            wella.home4_acceleration, wella.home4_sprint_speed, wella.home4_agility, wella.home4_reactions, 
            wella.home4_balance, wella.home4_shot_power, wella.home4_jumping, wella.home4_stamina, 
            wella.home4_strength, wella.home4_long_shots, wella.home4_aggression, wella.home4_interceptions, 
            wella.home4_positioning, wella.home4_vision, wella.home4_penalties, wella.home4_marking, 
            wella.home4_standing_tackle, wella.home4_gk_diving, wella.home4_gk_kicking, 
            wella.home4_gk_positioning, wella.home4_gk_reflexes,

            wella.home5_player_api_id, player.player_name as home5_player_name, player.height as home5_height, player.weight as home5_weight, 
            wella.home5_date, wella.home5_overall_rating, wella.home5_potential, wella.home5_preferred_foot, 
            wella.home5_attacking_work_rate, wella.home5_defensive_work_rate, wella.home5_crossing, 
            wella.home5_finishing, wella.home5_heading_accuracy, wella.home5_short_passing, 
            wella.home5_volleys, wella.home5_dribbling, wella.home5_curve, wella.home5_free_kick_accuracy, 
            wella.home5_long_passing, wella.home5_long_passing, wella.home5_ball_control, 
            wella.home5_acceleration, wella.home5_sprint_speed, wella.home5_agility, wella.home5_reactions, 
            wella.home5_balance, wella.home5_shot_power, wella.home5_jumping, wella.home5_stamina, 
            wella.home5_strength, wella.home5_long_shots, wella.home5_aggression, wella.home5_interceptions, 
            wella.home5_positioning, wella.home5_vision, wella.home5_penalties, wella.home5_marking, 
            wella.home5_standing_tackle, wella.home5_gk_diving, wella.home5_gk_kicking, 
            wella.home5_gk_positioning, wella.home5_gk_reflexes,

            wella.home6_player_api_id, player.player_name as home6_player_name, player.height as home6_height, player.weight as home6_weight, 
            wella.home6_date, wella.home6_overall_rating, wella.home6_potential, wella.home6_preferred_foot, 
            wella.home6_attacking_work_rate, wella.home6_defensive_work_rate, wella.home6_crossing, 
            wella.home6_finishing, wella.home6_heading_accuracy, wella.home6_short_passing, 
            wella.home6_volleys, wella.home6_dribbling, wella.home6_curve, wella.home6_free_kick_accuracy, 
            wella.home6_long_passing, wella.home6_long_passing, wella.home6_ball_control, 
            wella.home6_acceleration, wella.home6_sprint_speed, wella.home6_agility, wella.home6_reactions, 
            wella.home6_balance, wella.home6_shot_power, wella.home6_jumping, wella.home6_stamina, 
            wella.home6_strength, wella.home6_long_shots, wella.home6_aggression, wella.home6_interceptions, 
            wella.home6_positioning, wella.home6_vision, wella.home6_penalties, wella.home6_marking, 
            wella.home6_standing_tackle, wella.home6_gk_diving, wella.home6_gk_kicking, 
            wella.home6_gk_positioning, wella.home6_gk_reflexes,

            wella.home7_player_api_id, player.player_name as home7_player_name, player.height as home7_height, player.weight as home7_weight, 
            wella.home7_date, wella.home7_overall_rating, wella.home7_potential, wella.home7_preferred_foot, 
            wella.home7_attacking_work_rate, wella.home7_defensive_work_rate, wella.home7_crossing, 
            wella.home7_finishing, wella.home7_heading_accuracy, wella.home7_short_passing, 
            wella.home7_volleys, wella.home7_dribbling, wella.home7_curve, wella.home7_free_kick_accuracy, 
            wella.home7_long_passing, wella.home7_long_passing, wella.home7_ball_control, 
            wella.home7_acceleration, wella.home7_sprint_speed, wella.home7_agility, wella.home7_reactions, 
            wella.home7_balance, wella.home7_shot_power, wella.home7_jumping, wella.home7_stamina, 
            wella.home7_strength, wella.home7_long_shots, wella.home7_aggression, wella.home7_interceptions, 
            wella.home7_positioning, wella.home7_vision, wella.home7_penalties, wella.home7_marking, 
            wella.home7_standing_tackle, wella.home7_gk_diving, wella.home7_gk_kicking, 
            wella.home7_gk_positioning, wella.home7_gk_reflexes,

            home8.player_api_id as home8_player_api_id, player.player_name as home8_player_name, player.height as home8_height, player.weight as home8_weight, 
            home8.date as home8_date, home8.overall_rating as home8_overall_rating, home8.potential as home8_potential, home8.preferred_foot as home8_preferred_foot, 
            home8.attacking_work_rate as home8_attacking_work_rate, home8.defensive_work_rate as home8_defensive_work_rate, home8.crossing as home8_crossing, 
            home8.finishing as home8_finishing, home8.heading_accuracy as home8_heading_accuracy, home8.short_passing as home8_short_passing, 
            home8.volleys as home8_volleys, home8.dribbling as home8_dribbling, home8.curve as home8_curve, home8.free_kick_accuracy as home8_free_kick_accuracy, 
            home8.long_passing as home8_long_passing, home8.long_passing as home8_long_passing, home8.ball_control as home8_ball_control, 
            home8.acceleration as home8_acceleration, home8.sprint_speed as home8_sprint_speed, home8.agility as home8_agility, home8.reactions as home8_reactions, 
            home8.balance as home8_balance, home8.shot_power as home8_shot_power, home8.jumping as home8_jumping, home8.stamina as home8_stamina, 
            home8.strength as home8_strength, home8.long_shots as home8_long_shots, home8.aggression as home8_aggression, home8.interceptions as home8_interceptions, 
            home8.positioning as home8_positioning, home8.vision as home8_vision, home8.penalties as home8_penalties, home8.marking as home8_marking, 
            home8.standing_tackle as home8_standing_tackle, home8.gk_diving as home8_gk_diving, home8.gk_kicking as home8_gk_kicking, 
            home8.gk_positioning as home8_gk_positioning, home8.gk_reflexes as home8_gk_reflexes
            
            FROM WELLA_07 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_8
            INNER JOIN Player_Attributes as home8 on home8.player_api_id = match.home_player_8 AND home8.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home8.date = MAX(home8.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_09 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            wella.home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            wella.home2_date, wella.home2_overall_rating, wella.home2_potential, wella.home2_preferred_foot, 
            wella.home2_attacking_work_rate, wella.home2_defensive_work_rate, wella.home2_crossing, 
            wella.home2_finishing, wella.home2_heading_accuracy, wella.home2_short_passing, 
            wella.home2_volleys, wella.home2_dribbling, wella.home2_curve, wella.home2_free_kick_accuracy, 
            wella.home2_long_passing, wella.home2_long_passing, wella.home2_ball_control, 
            wella.home2_acceleration, wella.home2_sprint_speed, wella.home2_agility, wella.home2_reactions, 
            wella.home2_balance, wella.home2_shot_power, wella.home2_jumping, wella.home2_stamina, 
            wella.home2_strength, wella.home2_long_shots, wella.home2_aggression, wella.home2_interceptions, 
            wella.home2_positioning, wella.home2_vision, wella.home2_penalties, wella.home2_marking, 
            wella.home2_standing_tackle, wella.home2_gk_diving, wella.home2_gk_kicking, 
            wella.home2_gk_positioning, wella.home2_gk_reflexes,

            wella.home3_player_api_id, player.player_name as home3_player_name, player.height as home3_height, player.weight as home3_weight, 
            wella.home3_date, wella.home3_overall_rating, wella.home3_potential, wella.home3_preferred_foot, 
            wella.home3_attacking_work_rate, wella.home3_defensive_work_rate, wella.home3_crossing, 
            wella.home3_finishing, wella.home3_heading_accuracy, wella.home3_short_passing, 
            wella.home3_volleys, wella.home3_dribbling, wella.home3_curve, wella.home3_free_kick_accuracy, 
            wella.home3_long_passing, wella.home3_long_passing, wella.home3_ball_control, 
            wella.home3_acceleration, wella.home3_sprint_speed, wella.home3_agility, wella.home3_reactions, 
            wella.home3_balance, wella.home3_shot_power, wella.home3_jumping, wella.home3_stamina, 
            wella.home3_strength, wella.home3_long_shots, wella.home3_aggression, wella.home3_interceptions, 
            wella.home3_positioning, wella.home3_vision, wella.home3_penalties, wella.home3_marking, 
            wella.home3_standing_tackle, wella.home3_gk_diving, wella.home3_gk_kicking, 
            wella.home3_gk_positioning, wella.home3_gk_reflexes,

            wella.home4_player_api_id, player.player_name as home4_player_name, player.height as home4_height, player.weight as home4_weight, 
            wella.home4_date, wella.home4_overall_rating, wella.home4_potential, wella.home4_preferred_foot, 
            wella.home4_attacking_work_rate, wella.home4_defensive_work_rate, wella.home4_crossing, 
            wella.home4_finishing, wella.home4_heading_accuracy, wella.home4_short_passing, 
            wella.home4_volleys, wella.home4_dribbling, wella.home4_curve, wella.home4_free_kick_accuracy, 
            wella.home4_long_passing, wella.home4_long_passing, wella.home4_ball_control, 
            wella.home4_acceleration, wella.home4_sprint_speed, wella.home4_agility, wella.home4_reactions, 
            wella.home4_balance, wella.home4_shot_power, wella.home4_jumping, wella.home4_stamina, 
            wella.home4_strength, wella.home4_long_shots, wella.home4_aggression, wella.home4_interceptions, 
            wella.home4_positioning, wella.home4_vision, wella.home4_penalties, wella.home4_marking, 
            wella.home4_standing_tackle, wella.home4_gk_diving, wella.home4_gk_kicking, 
            wella.home4_gk_positioning, wella.home4_gk_reflexes,

            wella.home5_player_api_id, player.player_name as home5_player_name, player.height as home5_height, player.weight as home5_weight, 
            wella.home5_date, wella.home5_overall_rating, wella.home5_potential, wella.home5_preferred_foot, 
            wella.home5_attacking_work_rate, wella.home5_defensive_work_rate, wella.home5_crossing, 
            wella.home5_finishing, wella.home5_heading_accuracy, wella.home5_short_passing, 
            wella.home5_volleys, wella.home5_dribbling, wella.home5_curve, wella.home5_free_kick_accuracy, 
            wella.home5_long_passing, wella.home5_long_passing, wella.home5_ball_control, 
            wella.home5_acceleration, wella.home5_sprint_speed, wella.home5_agility, wella.home5_reactions, 
            wella.home5_balance, wella.home5_shot_power, wella.home5_jumping, wella.home5_stamina, 
            wella.home5_strength, wella.home5_long_shots, wella.home5_aggression, wella.home5_interceptions, 
            wella.home5_positioning, wella.home5_vision, wella.home5_penalties, wella.home5_marking, 
            wella.home5_standing_tackle, wella.home5_gk_diving, wella.home5_gk_kicking, 
            wella.home5_gk_positioning, wella.home5_gk_reflexes,

            wella.home6_player_api_id, player.player_name as home6_player_name, player.height as home6_height, player.weight as home6_weight, 
            wella.home6_date, wella.home6_overall_rating, wella.home6_potential, wella.home6_preferred_foot, 
            wella.home6_attacking_work_rate, wella.home6_defensive_work_rate, wella.home6_crossing, 
            wella.home6_finishing, wella.home6_heading_accuracy, wella.home6_short_passing, 
            wella.home6_volleys, wella.home6_dribbling, wella.home6_curve, wella.home6_free_kick_accuracy, 
            wella.home6_long_passing, wella.home6_long_passing, wella.home6_ball_control, 
            wella.home6_acceleration, wella.home6_sprint_speed, wella.home6_agility, wella.home6_reactions, 
            wella.home6_balance, wella.home6_shot_power, wella.home6_jumping, wella.home6_stamina, 
            wella.home6_strength, wella.home6_long_shots, wella.home6_aggression, wella.home6_interceptions, 
            wella.home6_positioning, wella.home6_vision, wella.home6_penalties, wella.home6_marking, 
            wella.home6_standing_tackle, wella.home6_gk_diving, wella.home6_gk_kicking, 
            wella.home6_gk_positioning, wella.home6_gk_reflexes,

            wella.home7_player_api_id, player.player_name as home7_player_name, player.height as home7_height, player.weight as home7_weight, 
            wella.home7_date, wella.home7_overall_rating, wella.home7_potential, wella.home7_preferred_foot, 
            wella.home7_attacking_work_rate, wella.home7_defensive_work_rate, wella.home7_crossing, 
            wella.home7_finishing, wella.home7_heading_accuracy, wella.home7_short_passing, 
            wella.home7_volleys, wella.home7_dribbling, wella.home7_curve, wella.home7_free_kick_accuracy, 
            wella.home7_long_passing, wella.home7_long_passing, wella.home7_ball_control, 
            wella.home7_acceleration, wella.home7_sprint_speed, wella.home7_agility, wella.home7_reactions, 
            wella.home7_balance, wella.home7_shot_power, wella.home7_jumping, wella.home7_stamina, 
            wella.home7_strength, wella.home7_long_shots, wella.home7_aggression, wella.home7_interceptions, 
            wella.home7_positioning, wella.home7_vision, wella.home7_penalties, wella.home7_marking, 
            wella.home7_standing_tackle, wella.home7_gk_diving, wella.home7_gk_kicking, 
            wella.home7_gk_positioning, wella.home7_gk_reflexes,

            wella.home8_player_api_id, player.player_name as home8_player_name, player.height as home8_height, player.weight as home8_weight, 
            wella.home8_date, wella.home8_overall_rating, wella.home8_potential, wella.home8_preferred_foot, 
            wella.home8_attacking_work_rate, wella.home8_defensive_work_rate, wella.home8_crossing, 
            wella.home8_finishing, wella.home8_heading_accuracy, wella.home8_short_passing, 
            wella.home8_volleys, wella.home8_dribbling, wella.home8_curve, wella.home8_free_kick_accuracy, 
            wella.home8_long_passing, wella.home8_long_passing, wella.home8_ball_control, 
            wella.home8_acceleration, wella.home8_sprint_speed, wella.home8_agility, wella.home8_reactions, 
            wella.home8_balance, wella.home8_shot_power, wella.home8_jumping, wella.home8_stamina, 
            wella.home8_strength, wella.home8_long_shots, wella.home8_aggression, wella.home8_interceptions, 
            wella.home8_positioning, wella.home8_vision, wella.home8_penalties, wella.home8_marking, 
            wella.home8_standing_tackle, wella.home8_gk_diving, wella.home8_gk_kicking, 
            wella.home8_gk_positioning, wella.home8_gk_reflexes,

            home9.player_api_id as home9_player_api_id, player.player_name as home9_player_name, player.height as home9_height, player.weight as home9_weight, 
            home9.date as home9_date, home9.overall_rating as home9_overall_rating, home9.potential as home9_potential, home9.preferred_foot as home9_preferred_foot, 
            home9.attacking_work_rate as home9_attacking_work_rate, home9.defensive_work_rate as home9_defensive_work_rate, home9.crossing as home9_crossing, 
            home9.finishing as home9_finishing, home9.heading_accuracy as home9_heading_accuracy, home9.short_passing as home9_short_passing, 
            home9.volleys as home9_volleys, home9.dribbling as home9_dribbling, home9.curve as home9_curve, home9.free_kick_accuracy as home9_free_kick_accuracy, 
            home9.long_passing as home9_long_passing, home9.long_passing as home9_long_passing, home9.ball_control as home9_ball_control, 
            home9.acceleration as home9_acceleration, home9.sprint_speed as home9_sprint_speed, home9.agility as home9_agility, home9.reactions as home9_reactions, 
            home9.balance as home9_balance, home9.shot_power as home9_shot_power, home9.jumping as home9_jumping, home9.stamina as home9_stamina, 
            home9.strength as home9_strength, home9.long_shots as home9_long_shots, home9.aggression as home9_aggression, home9.interceptions as home9_interceptions, 
            home9.positioning as home9_positioning, home9.vision as home9_vision, home9.penalties as home9_penalties, home9.marking as home9_marking, 
            home9.standing_tackle as home9_standing_tackle, home9.gk_diving as home9_gk_diving, home9.gk_kicking as home9_gk_kicking, 
            home9.gk_positioning as home9_gk_positioning, home9.gk_reflexes as home9_gk_reflexes
            
            FROM WELLA_08 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_9
            INNER JOIN Player_Attributes as home9 on home9.player_api_id = match.home_player_9 AND home9.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home9.date = MAX(home9.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_10 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            wella.home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            wella.home2_date, wella.home2_overall_rating, wella.home2_potential, wella.home2_preferred_foot, 
            wella.home2_attacking_work_rate, wella.home2_defensive_work_rate, wella.home2_crossing, 
            wella.home2_finishing, wella.home2_heading_accuracy, wella.home2_short_passing, 
            wella.home2_volleys, wella.home2_dribbling, wella.home2_curve, wella.home2_free_kick_accuracy, 
            wella.home2_long_passing, wella.home2_long_passing, wella.home2_ball_control, 
            wella.home2_acceleration, wella.home2_sprint_speed, wella.home2_agility, wella.home2_reactions, 
            wella.home2_balance, wella.home2_shot_power, wella.home2_jumping, wella.home2_stamina, 
            wella.home2_strength, wella.home2_long_shots, wella.home2_aggression, wella.home2_interceptions, 
            wella.home2_positioning, wella.home2_vision, wella.home2_penalties, wella.home2_marking, 
            wella.home2_standing_tackle, wella.home2_gk_diving, wella.home2_gk_kicking, 
            wella.home2_gk_positioning, wella.home2_gk_reflexes,

            wella.home3_player_api_id, player.player_name as home3_player_name, player.height as home3_height, player.weight as home3_weight, 
            wella.home3_date, wella.home3_overall_rating, wella.home3_potential, wella.home3_preferred_foot, 
            wella.home3_attacking_work_rate, wella.home3_defensive_work_rate, wella.home3_crossing, 
            wella.home3_finishing, wella.home3_heading_accuracy, wella.home3_short_passing, 
            wella.home3_volleys, wella.home3_dribbling, wella.home3_curve, wella.home3_free_kick_accuracy, 
            wella.home3_long_passing, wella.home3_long_passing, wella.home3_ball_control, 
            wella.home3_acceleration, wella.home3_sprint_speed, wella.home3_agility, wella.home3_reactions, 
            wella.home3_balance, wella.home3_shot_power, wella.home3_jumping, wella.home3_stamina, 
            wella.home3_strength, wella.home3_long_shots, wella.home3_aggression, wella.home3_interceptions, 
            wella.home3_positioning, wella.home3_vision, wella.home3_penalties, wella.home3_marking, 
            wella.home3_standing_tackle, wella.home3_gk_diving, wella.home3_gk_kicking, 
            wella.home3_gk_positioning, wella.home3_gk_reflexes,

            wella.home4_player_api_id, player.player_name as home4_player_name, player.height as home4_height, player.weight as home4_weight, 
            wella.home4_date, wella.home4_overall_rating, wella.home4_potential, wella.home4_preferred_foot, 
            wella.home4_attacking_work_rate, wella.home4_defensive_work_rate, wella.home4_crossing, 
            wella.home4_finishing, wella.home4_heading_accuracy, wella.home4_short_passing, 
            wella.home4_volleys, wella.home4_dribbling, wella.home4_curve, wella.home4_free_kick_accuracy, 
            wella.home4_long_passing, wella.home4_long_passing, wella.home4_ball_control, 
            wella.home4_acceleration, wella.home4_sprint_speed, wella.home4_agility, wella.home4_reactions, 
            wella.home4_balance, wella.home4_shot_power, wella.home4_jumping, wella.home4_stamina, 
            wella.home4_strength, wella.home4_long_shots, wella.home4_aggression, wella.home4_interceptions, 
            wella.home4_positioning, wella.home4_vision, wella.home4_penalties, wella.home4_marking, 
            wella.home4_standing_tackle, wella.home4_gk_diving, wella.home4_gk_kicking, 
            wella.home4_gk_positioning, wella.home4_gk_reflexes,

            wella.home5_player_api_id, player.player_name as home5_player_name, player.height as home5_height, player.weight as home5_weight, 
            wella.home5_date, wella.home5_overall_rating, wella.home5_potential, wella.home5_preferred_foot, 
            wella.home5_attacking_work_rate, wella.home5_defensive_work_rate, wella.home5_crossing, 
            wella.home5_finishing, wella.home5_heading_accuracy, wella.home5_short_passing, 
            wella.home5_volleys, wella.home5_dribbling, wella.home5_curve, wella.home5_free_kick_accuracy, 
            wella.home5_long_passing, wella.home5_long_passing, wella.home5_ball_control, 
            wella.home5_acceleration, wella.home5_sprint_speed, wella.home5_agility, wella.home5_reactions, 
            wella.home5_balance, wella.home5_shot_power, wella.home5_jumping, wella.home5_stamina, 
            wella.home5_strength, wella.home5_long_shots, wella.home5_aggression, wella.home5_interceptions, 
            wella.home5_positioning, wella.home5_vision, wella.home5_penalties, wella.home5_marking, 
            wella.home5_standing_tackle, wella.home5_gk_diving, wella.home5_gk_kicking, 
            wella.home5_gk_positioning, wella.home5_gk_reflexes,

            wella.home6_player_api_id, player.player_name as home6_player_name, player.height as home6_height, player.weight as home6_weight, 
            wella.home6_date, wella.home6_overall_rating, wella.home6_potential, wella.home6_preferred_foot, 
            wella.home6_attacking_work_rate, wella.home6_defensive_work_rate, wella.home6_crossing, 
            wella.home6_finishing, wella.home6_heading_accuracy, wella.home6_short_passing, 
            wella.home6_volleys, wella.home6_dribbling, wella.home6_curve, wella.home6_free_kick_accuracy, 
            wella.home6_long_passing, wella.home6_long_passing, wella.home6_ball_control, 
            wella.home6_acceleration, wella.home6_sprint_speed, wella.home6_agility, wella.home6_reactions, 
            wella.home6_balance, wella.home6_shot_power, wella.home6_jumping, wella.home6_stamina, 
            wella.home6_strength, wella.home6_long_shots, wella.home6_aggression, wella.home6_interceptions, 
            wella.home6_positioning, wella.home6_vision, wella.home6_penalties, wella.home6_marking, 
            wella.home6_standing_tackle, wella.home6_gk_diving, wella.home6_gk_kicking, 
            wella.home6_gk_positioning, wella.home6_gk_reflexes,

            wella.home7_player_api_id, player.player_name as home7_player_name, player.height as home7_height, player.weight as home7_weight, 
            wella.home7_date, wella.home7_overall_rating, wella.home7_potential, wella.home7_preferred_foot, 
            wella.home7_attacking_work_rate, wella.home7_defensive_work_rate, wella.home7_crossing, 
            wella.home7_finishing, wella.home7_heading_accuracy, wella.home7_short_passing, 
            wella.home7_volleys, wella.home7_dribbling, wella.home7_curve, wella.home7_free_kick_accuracy, 
            wella.home7_long_passing, wella.home7_long_passing, wella.home7_ball_control, 
            wella.home7_acceleration, wella.home7_sprint_speed, wella.home7_agility, wella.home7_reactions, 
            wella.home7_balance, wella.home7_shot_power, wella.home7_jumping, wella.home7_stamina, 
            wella.home7_strength, wella.home7_long_shots, wella.home7_aggression, wella.home7_interceptions, 
            wella.home7_positioning, wella.home7_vision, wella.home7_penalties, wella.home7_marking, 
            wella.home7_standing_tackle, wella.home7_gk_diving, wella.home7_gk_kicking, 
            wella.home7_gk_positioning, wella.home7_gk_reflexes,

            wella.home8_player_api_id, player.player_name as home8_player_name, player.height as home8_height, player.weight as home8_weight, 
            wella.home8_date, wella.home8_overall_rating, wella.home8_potential, wella.home8_preferred_foot, 
            wella.home8_attacking_work_rate, wella.home8_defensive_work_rate, wella.home8_crossing, 
            wella.home8_finishing, wella.home8_heading_accuracy, wella.home8_short_passing, 
            wella.home8_volleys, wella.home8_dribbling, wella.home8_curve, wella.home8_free_kick_accuracy, 
            wella.home8_long_passing, wella.home8_long_passing, wella.home8_ball_control, 
            wella.home8_acceleration, wella.home8_sprint_speed, wella.home8_agility, wella.home8_reactions, 
            wella.home8_balance, wella.home8_shot_power, wella.home8_jumping, wella.home8_stamina, 
            wella.home8_strength, wella.home8_long_shots, wella.home8_aggression, wella.home8_interceptions, 
            wella.home8_positioning, wella.home8_vision, wella.home8_penalties, wella.home8_marking, 
            wella.home8_standing_tackle, wella.home8_gk_diving, wella.home8_gk_kicking, 
            wella.home8_gk_positioning, wella.home8_gk_reflexes,

            wella.home9_player_api_id, player.player_name as home9_player_name, player.height as home9_height, player.weight as home9_weight, 
            wella.home9_date, wella.home9_overall_rating, wella.home9_potential, wella.home9_preferred_foot, 
            wella.home9_attacking_work_rate, wella.home9_defensive_work_rate, wella.home9_crossing, 
            wella.home9_finishing, wella.home9_heading_accuracy, wella.home9_short_passing, 
            wella.home9_volleys, wella.home9_dribbling, wella.home9_curve, wella.home9_free_kick_accuracy, 
            wella.home9_long_passing, wella.home9_long_passing, wella.home9_ball_control, 
            wella.home9_acceleration, wella.home9_sprint_speed, wella.home9_agility, wella.home9_reactions, 
            wella.home9_balance, wella.home9_shot_power, wella.home9_jumping, wella.home9_stamina, 
            wella.home9_strength, wella.home9_long_shots, wella.home9_aggression, wella.home9_interceptions, 
            wella.home9_positioning, wella.home9_vision, wella.home9_penalties, wella.home9_marking, 
            wella.home9_standing_tackle, wella.home9_gk_diving, wella.home9_gk_kicking, 
            wella.home9_gk_positioning, wella.home9_gk_reflexes,

            home10.player_api_id as home10_player_api_id, player.player_name as home10_player_name, player.height as home10_height, player.weight as home10_weight, 
            home10.date as home10_date, home10.overall_rating as home10_overall_rating, home10.potential as home10_potential, home10.preferred_foot as home10_preferred_foot, 
            home10.attacking_work_rate as home10_attacking_work_rate, home10.defensive_work_rate as home10_defensive_work_rate, home10.crossing as home10_crossing, 
            home10.finishing as home10_finishing, home10.heading_accuracy as home10_heading_accuracy, home10.short_passing as home10_short_passing, 
            home10.volleys as home10_volleys, home10.dribbling as home10_dribbling, home10.curve as home10_curve, home10.free_kick_accuracy as home10_free_kick_accuracy, 
            home10.long_passing as home10_long_passing, home10.long_passing as home10_long_passing, home10.ball_control as home10_ball_control, 
            home10.acceleration as home10_acceleration, home10.sprint_speed as home10_sprint_speed, home10.agility as home10_agility, home10.reactions as home10_reactions, 
            home10.balance as home10_balance, home10.shot_power as home10_shot_power, home10.jumping as home10_jumping, home10.stamina as home10_stamina, 
            home10.strength as home10_strength, home10.long_shots as home10_long_shots, home10.aggression as home10_aggression, home10.interceptions as home10_interceptions, 
            home10.positioning as home10_positioning, home10.vision as home10_vision, home10.penalties as home10_penalties, home10.marking as home10_marking, 
            home10.standing_tackle as home10_standing_tackle, home10.gk_diving as home10_gk_diving, home10.gk_kicking as home10_gk_kicking, 
            home10.gk_positioning as home10_gk_positioning, home10.gk_reflexes as home10_gk_reflexes
            
            FROM WELLA_09 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_10
            INNER JOIN Player_Attributes as home10 on home10.player_api_id = match.home_player_10 AND home10.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home10.date = MAX(home10.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_11 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.home1_player_api_id, player.player_name as home1_player_name, player.height as home1_height, player.weight as home1_weight, 
            wella.home1_date, wella.home1_overall_rating, wella.home1_potential, wella.home1_preferred_foot, 
            wella.home1_attacking_work_rate, wella.home1_defensive_work_rate, wella.home1_crossing, 
            wella.home1_finishing, wella.home1_heading_accuracy, wella.home1_short_passing, 
            wella.home1_volleys, wella.home1_dribbling, wella.home1_curve, wella.home1_free_kick_accuracy, 
            wella.home1_long_passing, wella.home1_long_passing, wella.home1_ball_control, 
            wella.home1_acceleration, wella.home1_sprint_speed, wella.home1_agility, wella.home1_reactions, 
            wella.home1_balance, wella.home1_shot_power, wella.home1_jumping, wella.home1_stamina, 
            wella.home1_strength, wella.home1_long_shots, wella.home1_aggression, wella.home1_interceptions, 
            wella.home1_positioning, wella.home1_vision, wella.home1_penalties, wella.home1_marking, 
            wella.home1_standing_tackle, wella.home1_gk_diving, wella.home1_gk_kicking, 
            wella.home1_gk_positioning, wella.home1_gk_reflexes,

            wella.home2_player_api_id, player.player_name as home2_player_name, player.height as home2_height, player.weight as home2_weight, 
            wella.home2_date, wella.home2_overall_rating, wella.home2_potential, wella.home2_preferred_foot, 
            wella.home2_attacking_work_rate, wella.home2_defensive_work_rate, wella.home2_crossing, 
            wella.home2_finishing, wella.home2_heading_accuracy, wella.home2_short_passing, 
            wella.home2_volleys, wella.home2_dribbling, wella.home2_curve, wella.home2_free_kick_accuracy, 
            wella.home2_long_passing, wella.home2_long_passing, wella.home2_ball_control, 
            wella.home2_acceleration, wella.home2_sprint_speed, wella.home2_agility, wella.home2_reactions, 
            wella.home2_balance, wella.home2_shot_power, wella.home2_jumping, wella.home2_stamina, 
            wella.home2_strength, wella.home2_long_shots, wella.home2_aggression, wella.home2_interceptions, 
            wella.home2_positioning, wella.home2_vision, wella.home2_penalties, wella.home2_marking, 
            wella.home2_standing_tackle, wella.home2_gk_diving, wella.home2_gk_kicking, 
            wella.home2_gk_positioning, wella.home2_gk_reflexes,

            wella.home3_player_api_id, player.player_name as home3_player_name, player.height as home3_height, player.weight as home3_weight, 
            wella.home3_date, wella.home3_overall_rating, wella.home3_potential, wella.home3_preferred_foot, 
            wella.home3_attacking_work_rate, wella.home3_defensive_work_rate, wella.home3_crossing, 
            wella.home3_finishing, wella.home3_heading_accuracy, wella.home3_short_passing, 
            wella.home3_volleys, wella.home3_dribbling, wella.home3_curve, wella.home3_free_kick_accuracy, 
            wella.home3_long_passing, wella.home3_long_passing, wella.home3_ball_control, 
            wella.home3_acceleration, wella.home3_sprint_speed, wella.home3_agility, wella.home3_reactions, 
            wella.home3_balance, wella.home3_shot_power, wella.home3_jumping, wella.home3_stamina, 
            wella.home3_strength, wella.home3_long_shots, wella.home3_aggression, wella.home3_interceptions, 
            wella.home3_positioning, wella.home3_vision, wella.home3_penalties, wella.home3_marking, 
            wella.home3_standing_tackle, wella.home3_gk_diving, wella.home3_gk_kicking, 
            wella.home3_gk_positioning, wella.home3_gk_reflexes,

            wella.home4_player_api_id, player.player_name as home4_player_name, player.height as home4_height, player.weight as home4_weight, 
            wella.home4_date, wella.home4_overall_rating, wella.home4_potential, wella.home4_preferred_foot, 
            wella.home4_attacking_work_rate, wella.home4_defensive_work_rate, wella.home4_crossing, 
            wella.home4_finishing, wella.home4_heading_accuracy, wella.home4_short_passing, 
            wella.home4_volleys, wella.home4_dribbling, wella.home4_curve, wella.home4_free_kick_accuracy, 
            wella.home4_long_passing, wella.home4_long_passing, wella.home4_ball_control, 
            wella.home4_acceleration, wella.home4_sprint_speed, wella.home4_agility, wella.home4_reactions, 
            wella.home4_balance, wella.home4_shot_power, wella.home4_jumping, wella.home4_stamina, 
            wella.home4_strength, wella.home4_long_shots, wella.home4_aggression, wella.home4_interceptions, 
            wella.home4_positioning, wella.home4_vision, wella.home4_penalties, wella.home4_marking, 
            wella.home4_standing_tackle, wella.home4_gk_diving, wella.home4_gk_kicking, 
            wella.home4_gk_positioning, wella.home4_gk_reflexes,

            wella.home5_player_api_id, player.player_name as home5_player_name, player.height as home5_height, player.weight as home5_weight, 
            wella.home5_date, wella.home5_overall_rating, wella.home5_potential, wella.home5_preferred_foot, 
            wella.home5_attacking_work_rate, wella.home5_defensive_work_rate, wella.home5_crossing, 
            wella.home5_finishing, wella.home5_heading_accuracy, wella.home5_short_passing, 
            wella.home5_volleys, wella.home5_dribbling, wella.home5_curve, wella.home5_free_kick_accuracy, 
            wella.home5_long_passing, wella.home5_long_passing, wella.home5_ball_control, 
            wella.home5_acceleration, wella.home5_sprint_speed, wella.home5_agility, wella.home5_reactions, 
            wella.home5_balance, wella.home5_shot_power, wella.home5_jumping, wella.home5_stamina, 
            wella.home5_strength, wella.home5_long_shots, wella.home5_aggression, wella.home5_interceptions, 
            wella.home5_positioning, wella.home5_vision, wella.home5_penalties, wella.home5_marking, 
            wella.home5_standing_tackle, wella.home5_gk_diving, wella.home5_gk_kicking, 
            wella.home5_gk_positioning, wella.home5_gk_reflexes,

            wella.home6_player_api_id, player.player_name as home6_player_name, player.height as home6_height, player.weight as home6_weight, 
            wella.home6_date, wella.home6_overall_rating, wella.home6_potential, wella.home6_preferred_foot, 
            wella.home6_attacking_work_rate, wella.home6_defensive_work_rate, wella.home6_crossing, 
            wella.home6_finishing, wella.home6_heading_accuracy, wella.home6_short_passing, 
            wella.home6_volleys, wella.home6_dribbling, wella.home6_curve, wella.home6_free_kick_accuracy, 
            wella.home6_long_passing, wella.home6_long_passing, wella.home6_ball_control, 
            wella.home6_acceleration, wella.home6_sprint_speed, wella.home6_agility, wella.home6_reactions, 
            wella.home6_balance, wella.home6_shot_power, wella.home6_jumping, wella.home6_stamina, 
            wella.home6_strength, wella.home6_long_shots, wella.home6_aggression, wella.home6_interceptions, 
            wella.home6_positioning, wella.home6_vision, wella.home6_penalties, wella.home6_marking, 
            wella.home6_standing_tackle, wella.home6_gk_diving, wella.home6_gk_kicking, 
            wella.home6_gk_positioning, wella.home6_gk_reflexes,

            wella.home7_player_api_id, player.player_name as home7_player_name, player.height as home7_height, player.weight as home7_weight, 
            wella.home7_date, wella.home7_overall_rating, wella.home7_potential, wella.home7_preferred_foot, 
            wella.home7_attacking_work_rate, wella.home7_defensive_work_rate, wella.home7_crossing, 
            wella.home7_finishing, wella.home7_heading_accuracy, wella.home7_short_passing, 
            wella.home7_volleys, wella.home7_dribbling, wella.home7_curve, wella.home7_free_kick_accuracy, 
            wella.home7_long_passing, wella.home7_long_passing, wella.home7_ball_control, 
            wella.home7_acceleration, wella.home7_sprint_speed, wella.home7_agility, wella.home7_reactions, 
            wella.home7_balance, wella.home7_shot_power, wella.home7_jumping, wella.home7_stamina, 
            wella.home7_strength, wella.home7_long_shots, wella.home7_aggression, wella.home7_interceptions, 
            wella.home7_positioning, wella.home7_vision, wella.home7_penalties, wella.home7_marking, 
            wella.home7_standing_tackle, wella.home7_gk_diving, wella.home7_gk_kicking, 
            wella.home7_gk_positioning, wella.home7_gk_reflexes,

            wella.home8_player_api_id, player.player_name as home8_player_name, player.height as home8_height, player.weight as home8_weight, 
            wella.home8_date, wella.home8_overall_rating, wella.home8_potential, wella.home8_preferred_foot, 
            wella.home8_attacking_work_rate, wella.home8_defensive_work_rate, wella.home8_crossing, 
            wella.home8_finishing, wella.home8_heading_accuracy, wella.home8_short_passing, 
            wella.home8_volleys, wella.home8_dribbling, wella.home8_curve, wella.home8_free_kick_accuracy, 
            wella.home8_long_passing, wella.home8_long_passing, wella.home8_ball_control, 
            wella.home8_acceleration, wella.home8_sprint_speed, wella.home8_agility, wella.home8_reactions, 
            wella.home8_balance, wella.home8_shot_power, wella.home8_jumping, wella.home8_stamina, 
            wella.home8_strength, wella.home8_long_shots, wella.home8_aggression, wella.home8_interceptions, 
            wella.home8_positioning, wella.home8_vision, wella.home8_penalties, wella.home8_marking, 
            wella.home8_standing_tackle, wella.home8_gk_diving, wella.home8_gk_kicking, 
            wella.home8_gk_positioning, wella.home8_gk_reflexes,

            wella.home9_player_api_id, player.player_name as home9_player_name, player.height as home9_height, player.weight as home9_weight, 
            wella.home9_date, wella.home9_overall_rating, wella.home9_potential, wella.home9_preferred_foot, 
            wella.home9_attacking_work_rate, wella.home9_defensive_work_rate, wella.home9_crossing, 
            wella.home9_finishing, wella.home9_heading_accuracy, wella.home9_short_passing, 
            wella.home9_volleys, wella.home9_dribbling, wella.home9_curve, wella.home9_free_kick_accuracy, 
            wella.home9_long_passing, wella.home9_long_passing, wella.home9_ball_control, 
            wella.home9_acceleration, wella.home9_sprint_speed, wella.home9_agility, wella.home9_reactions, 
            wella.home9_balance, wella.home9_shot_power, wella.home9_jumping, wella.home9_stamina, 
            wella.home9_strength, wella.home9_long_shots, wella.home9_aggression, wella.home9_interceptions, 
            wella.home9_positioning, wella.home9_vision, wella.home9_penalties, wella.home9_marking, 
            wella.home9_standing_tackle, wella.home9_gk_diving, wella.home9_gk_kicking, 
            wella.home9_gk_positioning, wella.home9_gk_reflexes,

            wella.home10_player_api_id, player.player_name as home10_player_name, player.height as home10_height, player.weight as home10_weight, 
            wella.home10_date, wella.home10_overall_rating, wella.home10_potential, wella.home10_preferred_foot, 
            wella.home10_attacking_work_rate, wella.home10_defensive_work_rate, wella.home10_crossing, 
            wella.home10_finishing, wella.home10_heading_accuracy, wella.home10_short_passing, 
            wella.home10_volleys, wella.home10_dribbling, wella.home10_curve, wella.home10_free_kick_accuracy, 
            wella.home10_long_passing, wella.home10_long_passing, wella.home10_ball_control, 
            wella.home10_acceleration, wella.home10_sprint_speed, wella.home10_agility, wella.home10_reactions, 
            wella.home10_balance, wella.home10_shot_power, wella.home10_jumping, wella.home10_stamina, 
            wella.home10_strength, wella.home10_long_shots, wella.home10_aggression, wella.home10_interceptions, 
            wella.home10_positioning, wella.home10_vision, wella.home10_penalties, wella.home10_marking, 
            wella.home10_standing_tackle, wella.home10_gk_diving, wella.home10_gk_kicking, 
            wella.home10_gk_positioning, wella.home10_gk_reflexes,

            home11.player_api_id as home11_player_api_id, player.player_name as home11_player_name, player.height as home11_height, player.weight as home11_weight, 
            home11.date as home11_date, home11.overall_rating as home11_overall_rating, home11.potential as home11_potential, home11.preferred_foot as home11_preferred_foot, 
            home11.attacking_work_rate as home11_attacking_work_rate, home11.defensive_work_rate as home11_defensive_work_rate, home11.crossing as home11_crossing, 
            home11.finishing as home11_finishing, home11.heading_accuracy as home11_heading_accuracy, home11.short_passing as home11_short_passing, 
            home11.volleys as home11_volleys, home11.dribbling as home11_dribbling, home11.curve as home11_curve, home11.free_kick_accuracy as home11_free_kick_accuracy, 
            home11.long_passing as home11_long_passing, home11.long_passing as home11_long_passing, home11.ball_control as home11_ball_control, 
            home11.acceleration as home11_acceleration, home11.sprint_speed as home11_sprint_speed, home11.agility as home11_agility, home11.reactions as home11_reactions, 
            home11.balance as home11_balance, home11.shot_power as home11_shot_power, home11.jumping as home11_jumping, home11.stamina as home11_stamina, 
            home11.strength as home11_strength, home11.long_shots as home11_long_shots, home11.aggression as home11_aggression, home11.interceptions as home11_interceptions, 
            home11.positioning as home11_positioning, home11.vision as home11_vision, home11.penalties as home11_penalties, home11.marking as home11_marking, 
            home11.standing_tackle as home11_standing_tackle, home11.gk_diving as home11_gk_diving, home11.gk_kicking as home11_gk_kicking, 
            home11.gk_positioning as home11_gk_positioning, home11.gk_reflexes as home11_gk_reflexes
            
            FROM WELLA_10 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as player on player.player_api_id = match.home_player_11
            INNER JOIN Player_Attributes as home11 on home11.player_api_id = match.home_player_11 AND home11.date < wella.date
            GROUP BY wella.match_api_id
            HAVING home11.date = MAX(home11.date);
            
  ------------------------------------------------
