
CREATE TABLE WELLA_01 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            h1.player_api_id as h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            h1.date as h1_date, h1.overall_rating as h1_overall_rating, h1.potential as h1_potential, h1.preferred_foot as h1_preferred_foot, 
            h1.attacking_work_rate as h1_attacking_work_rate, h1.defensive_work_rate as h1_defensive_work_rate, h1.crossing as h1_crossing, 
            h1.finishing as h1_finishing, h1.heading_accuracy as h1_heading_accuracy, h1.short_passing as h1_short_passing, 
            h1.volleys as h1_volleys, h1.dribbling as h1_dribbling, h1.curve as h1_curve, h1.free_kick_accuracy as h1_free_kick_accuracy, 
            h1.long_passing as h1_long_passing, h1.long_passing as h1_long_passing, h1.ball_control as h1_ball_control, 
            h1.acceleration as h1_acceleration, h1.sprint_speed as h1_sprint_speed, h1.agility as h1_agility, h1.reactions as h1_reactions, 
            h1.balance as h1_balance, h1.shot_power as h1_shot_power, h1.jumping as h1_jumping, h1.stamina as h1_stamina, 
            h1.strength as h1_strength, h1.long_shots as h1_long_shots, h1.aggression as h1_aggression, h1.interceptions as h1_interceptions, 
            h1.positioning as h1_positioning, h1.vision as h1_vision, h1.penalties as h1_penalties, h1.marking as h1_marking, 
            h1.standing_tackle as h1_standing_tackle, h1.gk_diving as h1_gk_diving, h1.gk_kicking as h1_gk_kicking, 
            h1.gk_positioning as h1_gk_positioning, h1.gk_reflexes as h1_gk_reflexes
            
            FROM WELLA_00 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_1
            INNER JOIN Player_Attributes as h1 on h1.player_api_id = match.home_player_1 AND h1.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h1.date = MAX(h1.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_02 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            h2.player_api_id as h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            h2.date as h2_date, h2.overall_rating as h2_overall_rating, h2.potential as h2_potential, h2.preferred_foot as h2_preferred_foot, 
            h2.attacking_work_rate as h2_attacking_work_rate, h2.defensive_work_rate as h2_defensive_work_rate, h2.crossing as h2_crossing, 
            h2.finishing as h2_finishing, h2.heading_accuracy as h2_heading_accuracy, h2.short_passing as h2_short_passing, 
            h2.volleys as h2_volleys, h2.dribbling as h2_dribbling, h2.curve as h2_curve, h2.free_kick_accuracy as h2_free_kick_accuracy, 
            h2.long_passing as h2_long_passing, h2.long_passing as h2_long_passing, h2.ball_control as h2_ball_control, 
            h2.acceleration as h2_acceleration, h2.sprint_speed as h2_sprint_speed, h2.agility as h2_agility, h2.reactions as h2_reactions, 
            h2.balance as h2_balance, h2.shot_power as h2_shot_power, h2.jumping as h2_jumping, h2.stamina as h2_stamina, 
            h2.strength as h2_strength, h2.long_shots as h2_long_shots, h2.aggression as h2_aggression, h2.interceptions as h2_interceptions, 
            h2.positioning as h2_positioning, h2.vision as h2_vision, h2.penalties as h2_penalties, h2.marking as h2_marking, 
            h2.standing_tackle as h2_standing_tackle, h2.gk_diving as h2_gk_diving, h2.gk_kicking as h2_gk_kicking, 
            h2.gk_positioning as h2_gk_positioning, h2.gk_reflexes as h2_gk_reflexes
            
            FROM WELLA_01 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_2
            INNER JOIN Player_Attributes as h2 on h2.player_api_id = match.home_player_2 AND h2.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h2.date = MAX(h2.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_03 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            wella.h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            wella.h2_date, wella.h2_overall_rating, wella.h2_potential, wella.h2_preferred_foot, 
            wella.h2_attacking_work_rate, wella.h2_defensive_work_rate, wella.h2_crossing, 
            wella.h2_finishing, wella.h2_heading_accuracy, wella.h2_short_passing, 
            wella.h2_volleys, wella.h2_dribbling, wella.h2_curve, wella.h2_free_kick_accuracy, 
            wella.h2_long_passing, wella.h2_long_passing, wella.h2_ball_control, 
            wella.h2_acceleration, wella.h2_sprint_speed, wella.h2_agility, wella.h2_reactions, 
            wella.h2_balance, wella.h2_shot_power, wella.h2_jumping, wella.h2_stamina, 
            wella.h2_strength, wella.h2_long_shots, wella.h2_aggression, wella.h2_interceptions, 
            wella.h2_positioning, wella.h2_vision, wella.h2_penalties, wella.h2_marking, 
            wella.h2_standing_tackle, wella.h2_gk_diving, wella.h2_gk_kicking, 
            wella.h2_gk_positioning, wella.h2_gk_reflexes,

            h3.player_api_id as h3_player_api_id, pa.player_name as h3_player_name, pa.height as h3_height, pa.weight as h3_weight, 
            h3.date as h3_date, h3.overall_rating as h3_overall_rating, h3.potential as h3_potential, h3.preferred_foot as h3_preferred_foot, 
            h3.attacking_work_rate as h3_attacking_work_rate, h3.defensive_work_rate as h3_defensive_work_rate, h3.crossing as h3_crossing, 
            h3.finishing as h3_finishing, h3.heading_accuracy as h3_heading_accuracy, h3.short_passing as h3_short_passing, 
            h3.volleys as h3_volleys, h3.dribbling as h3_dribbling, h3.curve as h3_curve, h3.free_kick_accuracy as h3_free_kick_accuracy, 
            h3.long_passing as h3_long_passing, h3.long_passing as h3_long_passing, h3.ball_control as h3_ball_control, 
            h3.acceleration as h3_acceleration, h3.sprint_speed as h3_sprint_speed, h3.agility as h3_agility, h3.reactions as h3_reactions, 
            h3.balance as h3_balance, h3.shot_power as h3_shot_power, h3.jumping as h3_jumping, h3.stamina as h3_stamina, 
            h3.strength as h3_strength, h3.long_shots as h3_long_shots, h3.aggression as h3_aggression, h3.interceptions as h3_interceptions, 
            h3.positioning as h3_positioning, h3.vision as h3_vision, h3.penalties as h3_penalties, h3.marking as h3_marking, 
            h3.standing_tackle as h3_standing_tackle, h3.gk_diving as h3_gk_diving, h3.gk_kicking as h3_gk_kicking, 
            h3.gk_positioning as h3_gk_positioning, h3.gk_reflexes as h3_gk_reflexes
            
            FROM WELLA_02 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_3
            INNER JOIN Player_Attributes as h3 on h3.player_api_id = match.home_player_3 AND h3.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h3.date = MAX(h3.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_04 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            wella.h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            wella.h2_date, wella.h2_overall_rating, wella.h2_potential, wella.h2_preferred_foot, 
            wella.h2_attacking_work_rate, wella.h2_defensive_work_rate, wella.h2_crossing, 
            wella.h2_finishing, wella.h2_heading_accuracy, wella.h2_short_passing, 
            wella.h2_volleys, wella.h2_dribbling, wella.h2_curve, wella.h2_free_kick_accuracy, 
            wella.h2_long_passing, wella.h2_long_passing, wella.h2_ball_control, 
            wella.h2_acceleration, wella.h2_sprint_speed, wella.h2_agility, wella.h2_reactions, 
            wella.h2_balance, wella.h2_shot_power, wella.h2_jumping, wella.h2_stamina, 
            wella.h2_strength, wella.h2_long_shots, wella.h2_aggression, wella.h2_interceptions, 
            wella.h2_positioning, wella.h2_vision, wella.h2_penalties, wella.h2_marking, 
            wella.h2_standing_tackle, wella.h2_gk_diving, wella.h2_gk_kicking, 
            wella.h2_gk_positioning, wella.h2_gk_reflexes,

            wella.h3_player_api_id, pa.player_name as h3_player_name, pa.height as h3_height, pa.weight as h3_weight, 
            wella.h3_date, wella.h3_overall_rating, wella.h3_potential, wella.h3_preferred_foot, 
            wella.h3_attacking_work_rate, wella.h3_defensive_work_rate, wella.h3_crossing, 
            wella.h3_finishing, wella.h3_heading_accuracy, wella.h3_short_passing, 
            wella.h3_volleys, wella.h3_dribbling, wella.h3_curve, wella.h3_free_kick_accuracy, 
            wella.h3_long_passing, wella.h3_long_passing, wella.h3_ball_control, 
            wella.h3_acceleration, wella.h3_sprint_speed, wella.h3_agility, wella.h3_reactions, 
            wella.h3_balance, wella.h3_shot_power, wella.h3_jumping, wella.h3_stamina, 
            wella.h3_strength, wella.h3_long_shots, wella.h3_aggression, wella.h3_interceptions, 
            wella.h3_positioning, wella.h3_vision, wella.h3_penalties, wella.h3_marking, 
            wella.h3_standing_tackle, wella.h3_gk_diving, wella.h3_gk_kicking, 
            wella.h3_gk_positioning, wella.h3_gk_reflexes,

            h4.player_api_id as h4_player_api_id, pa.player_name as h4_player_name, pa.height as h4_height, pa.weight as h4_weight, 
            h4.date as h4_date, h4.overall_rating as h4_overall_rating, h4.potential as h4_potential, h4.preferred_foot as h4_preferred_foot, 
            h4.attacking_work_rate as h4_attacking_work_rate, h4.defensive_work_rate as h4_defensive_work_rate, h4.crossing as h4_crossing, 
            h4.finishing as h4_finishing, h4.heading_accuracy as h4_heading_accuracy, h4.short_passing as h4_short_passing, 
            h4.volleys as h4_volleys, h4.dribbling as h4_dribbling, h4.curve as h4_curve, h4.free_kick_accuracy as h4_free_kick_accuracy, 
            h4.long_passing as h4_long_passing, h4.long_passing as h4_long_passing, h4.ball_control as h4_ball_control, 
            h4.acceleration as h4_acceleration, h4.sprint_speed as h4_sprint_speed, h4.agility as h4_agility, h4.reactions as h4_reactions, 
            h4.balance as h4_balance, h4.shot_power as h4_shot_power, h4.jumping as h4_jumping, h4.stamina as h4_stamina, 
            h4.strength as h4_strength, h4.long_shots as h4_long_shots, h4.aggression as h4_aggression, h4.interceptions as h4_interceptions, 
            h4.positioning as h4_positioning, h4.vision as h4_vision, h4.penalties as h4_penalties, h4.marking as h4_marking, 
            h4.standing_tackle as h4_standing_tackle, h4.gk_diving as h4_gk_diving, h4.gk_kicking as h4_gk_kicking, 
            h4.gk_positioning as h4_gk_positioning, h4.gk_reflexes as h4_gk_reflexes
            
            FROM WELLA_03 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_4
            INNER JOIN Player_Attributes as h4 on h4.player_api_id = match.home_player_4 AND h4.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h4.date = MAX(h4.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_05 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            wella.h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            wella.h2_date, wella.h2_overall_rating, wella.h2_potential, wella.h2_preferred_foot, 
            wella.h2_attacking_work_rate, wella.h2_defensive_work_rate, wella.h2_crossing, 
            wella.h2_finishing, wella.h2_heading_accuracy, wella.h2_short_passing, 
            wella.h2_volleys, wella.h2_dribbling, wella.h2_curve, wella.h2_free_kick_accuracy, 
            wella.h2_long_passing, wella.h2_long_passing, wella.h2_ball_control, 
            wella.h2_acceleration, wella.h2_sprint_speed, wella.h2_agility, wella.h2_reactions, 
            wella.h2_balance, wella.h2_shot_power, wella.h2_jumping, wella.h2_stamina, 
            wella.h2_strength, wella.h2_long_shots, wella.h2_aggression, wella.h2_interceptions, 
            wella.h2_positioning, wella.h2_vision, wella.h2_penalties, wella.h2_marking, 
            wella.h2_standing_tackle, wella.h2_gk_diving, wella.h2_gk_kicking, 
            wella.h2_gk_positioning, wella.h2_gk_reflexes,

            wella.h3_player_api_id, pa.player_name as h3_player_name, pa.height as h3_height, pa.weight as h3_weight, 
            wella.h3_date, wella.h3_overall_rating, wella.h3_potential, wella.h3_preferred_foot, 
            wella.h3_attacking_work_rate, wella.h3_defensive_work_rate, wella.h3_crossing, 
            wella.h3_finishing, wella.h3_heading_accuracy, wella.h3_short_passing, 
            wella.h3_volleys, wella.h3_dribbling, wella.h3_curve, wella.h3_free_kick_accuracy, 
            wella.h3_long_passing, wella.h3_long_passing, wella.h3_ball_control, 
            wella.h3_acceleration, wella.h3_sprint_speed, wella.h3_agility, wella.h3_reactions, 
            wella.h3_balance, wella.h3_shot_power, wella.h3_jumping, wella.h3_stamina, 
            wella.h3_strength, wella.h3_long_shots, wella.h3_aggression, wella.h3_interceptions, 
            wella.h3_positioning, wella.h3_vision, wella.h3_penalties, wella.h3_marking, 
            wella.h3_standing_tackle, wella.h3_gk_diving, wella.h3_gk_kicking, 
            wella.h3_gk_positioning, wella.h3_gk_reflexes,

            wella.h4_player_api_id, pa.player_name as h4_player_name, pa.height as h4_height, pa.weight as h4_weight, 
            wella.h4_date, wella.h4_overall_rating, wella.h4_potential, wella.h4_preferred_foot, 
            wella.h4_attacking_work_rate, wella.h4_defensive_work_rate, wella.h4_crossing, 
            wella.h4_finishing, wella.h4_heading_accuracy, wella.h4_short_passing, 
            wella.h4_volleys, wella.h4_dribbling, wella.h4_curve, wella.h4_free_kick_accuracy, 
            wella.h4_long_passing, wella.h4_long_passing, wella.h4_ball_control, 
            wella.h4_acceleration, wella.h4_sprint_speed, wella.h4_agility, wella.h4_reactions, 
            wella.h4_balance, wella.h4_shot_power, wella.h4_jumping, wella.h4_stamina, 
            wella.h4_strength, wella.h4_long_shots, wella.h4_aggression, wella.h4_interceptions, 
            wella.h4_positioning, wella.h4_vision, wella.h4_penalties, wella.h4_marking, 
            wella.h4_standing_tackle, wella.h4_gk_diving, wella.h4_gk_kicking, 
            wella.h4_gk_positioning, wella.h4_gk_reflexes,

            h5.player_api_id as h5_player_api_id, pa.player_name as h5_player_name, pa.height as h5_height, pa.weight as h5_weight, 
            h5.date as h5_date, h5.overall_rating as h5_overall_rating, h5.potential as h5_potential, h5.preferred_foot as h5_preferred_foot, 
            h5.attacking_work_rate as h5_attacking_work_rate, h5.defensive_work_rate as h5_defensive_work_rate, h5.crossing as h5_crossing, 
            h5.finishing as h5_finishing, h5.heading_accuracy as h5_heading_accuracy, h5.short_passing as h5_short_passing, 
            h5.volleys as h5_volleys, h5.dribbling as h5_dribbling, h5.curve as h5_curve, h5.free_kick_accuracy as h5_free_kick_accuracy, 
            h5.long_passing as h5_long_passing, h5.long_passing as h5_long_passing, h5.ball_control as h5_ball_control, 
            h5.acceleration as h5_acceleration, h5.sprint_speed as h5_sprint_speed, h5.agility as h5_agility, h5.reactions as h5_reactions, 
            h5.balance as h5_balance, h5.shot_power as h5_shot_power, h5.jumping as h5_jumping, h5.stamina as h5_stamina, 
            h5.strength as h5_strength, h5.long_shots as h5_long_shots, h5.aggression as h5_aggression, h5.interceptions as h5_interceptions, 
            h5.positioning as h5_positioning, h5.vision as h5_vision, h5.penalties as h5_penalties, h5.marking as h5_marking, 
            h5.standing_tackle as h5_standing_tackle, h5.gk_diving as h5_gk_diving, h5.gk_kicking as h5_gk_kicking, 
            h5.gk_positioning as h5_gk_positioning, h5.gk_reflexes as h5_gk_reflexes
            
            FROM WELLA_04 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_5
            INNER JOIN Player_Attributes as h5 on h5.player_api_id = match.home_player_5 AND h5.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h5.date = MAX(h5.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_06 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            wella.h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            wella.h2_date, wella.h2_overall_rating, wella.h2_potential, wella.h2_preferred_foot, 
            wella.h2_attacking_work_rate, wella.h2_defensive_work_rate, wella.h2_crossing, 
            wella.h2_finishing, wella.h2_heading_accuracy, wella.h2_short_passing, 
            wella.h2_volleys, wella.h2_dribbling, wella.h2_curve, wella.h2_free_kick_accuracy, 
            wella.h2_long_passing, wella.h2_long_passing, wella.h2_ball_control, 
            wella.h2_acceleration, wella.h2_sprint_speed, wella.h2_agility, wella.h2_reactions, 
            wella.h2_balance, wella.h2_shot_power, wella.h2_jumping, wella.h2_stamina, 
            wella.h2_strength, wella.h2_long_shots, wella.h2_aggression, wella.h2_interceptions, 
            wella.h2_positioning, wella.h2_vision, wella.h2_penalties, wella.h2_marking, 
            wella.h2_standing_tackle, wella.h2_gk_diving, wella.h2_gk_kicking, 
            wella.h2_gk_positioning, wella.h2_gk_reflexes,

            wella.h3_player_api_id, pa.player_name as h3_player_name, pa.height as h3_height, pa.weight as h3_weight, 
            wella.h3_date, wella.h3_overall_rating, wella.h3_potential, wella.h3_preferred_foot, 
            wella.h3_attacking_work_rate, wella.h3_defensive_work_rate, wella.h3_crossing, 
            wella.h3_finishing, wella.h3_heading_accuracy, wella.h3_short_passing, 
            wella.h3_volleys, wella.h3_dribbling, wella.h3_curve, wella.h3_free_kick_accuracy, 
            wella.h3_long_passing, wella.h3_long_passing, wella.h3_ball_control, 
            wella.h3_acceleration, wella.h3_sprint_speed, wella.h3_agility, wella.h3_reactions, 
            wella.h3_balance, wella.h3_shot_power, wella.h3_jumping, wella.h3_stamina, 
            wella.h3_strength, wella.h3_long_shots, wella.h3_aggression, wella.h3_interceptions, 
            wella.h3_positioning, wella.h3_vision, wella.h3_penalties, wella.h3_marking, 
            wella.h3_standing_tackle, wella.h3_gk_diving, wella.h3_gk_kicking, 
            wella.h3_gk_positioning, wella.h3_gk_reflexes,

            wella.h4_player_api_id, pa.player_name as h4_player_name, pa.height as h4_height, pa.weight as h4_weight, 
            wella.h4_date, wella.h4_overall_rating, wella.h4_potential, wella.h4_preferred_foot, 
            wella.h4_attacking_work_rate, wella.h4_defensive_work_rate, wella.h4_crossing, 
            wella.h4_finishing, wella.h4_heading_accuracy, wella.h4_short_passing, 
            wella.h4_volleys, wella.h4_dribbling, wella.h4_curve, wella.h4_free_kick_accuracy, 
            wella.h4_long_passing, wella.h4_long_passing, wella.h4_ball_control, 
            wella.h4_acceleration, wella.h4_sprint_speed, wella.h4_agility, wella.h4_reactions, 
            wella.h4_balance, wella.h4_shot_power, wella.h4_jumping, wella.h4_stamina, 
            wella.h4_strength, wella.h4_long_shots, wella.h4_aggression, wella.h4_interceptions, 
            wella.h4_positioning, wella.h4_vision, wella.h4_penalties, wella.h4_marking, 
            wella.h4_standing_tackle, wella.h4_gk_diving, wella.h4_gk_kicking, 
            wella.h4_gk_positioning, wella.h4_gk_reflexes,

            wella.h5_player_api_id, pa.player_name as h5_player_name, pa.height as h5_height, pa.weight as h5_weight, 
            wella.h5_date, wella.h5_overall_rating, wella.h5_potential, wella.h5_preferred_foot, 
            wella.h5_attacking_work_rate, wella.h5_defensive_work_rate, wella.h5_crossing, 
            wella.h5_finishing, wella.h5_heading_accuracy, wella.h5_short_passing, 
            wella.h5_volleys, wella.h5_dribbling, wella.h5_curve, wella.h5_free_kick_accuracy, 
            wella.h5_long_passing, wella.h5_long_passing, wella.h5_ball_control, 
            wella.h5_acceleration, wella.h5_sprint_speed, wella.h5_agility, wella.h5_reactions, 
            wella.h5_balance, wella.h5_shot_power, wella.h5_jumping, wella.h5_stamina, 
            wella.h5_strength, wella.h5_long_shots, wella.h5_aggression, wella.h5_interceptions, 
            wella.h5_positioning, wella.h5_vision, wella.h5_penalties, wella.h5_marking, 
            wella.h5_standing_tackle, wella.h5_gk_diving, wella.h5_gk_kicking, 
            wella.h5_gk_positioning, wella.h5_gk_reflexes,

            h6.player_api_id as h6_player_api_id, pa.player_name as h6_player_name, pa.height as h6_height, pa.weight as h6_weight, 
            h6.date as h6_date, h6.overall_rating as h6_overall_rating, h6.potential as h6_potential, h6.preferred_foot as h6_preferred_foot, 
            h6.attacking_work_rate as h6_attacking_work_rate, h6.defensive_work_rate as h6_defensive_work_rate, h6.crossing as h6_crossing, 
            h6.finishing as h6_finishing, h6.heading_accuracy as h6_heading_accuracy, h6.short_passing as h6_short_passing, 
            h6.volleys as h6_volleys, h6.dribbling as h6_dribbling, h6.curve as h6_curve, h6.free_kick_accuracy as h6_free_kick_accuracy, 
            h6.long_passing as h6_long_passing, h6.long_passing as h6_long_passing, h6.ball_control as h6_ball_control, 
            h6.acceleration as h6_acceleration, h6.sprint_speed as h6_sprint_speed, h6.agility as h6_agility, h6.reactions as h6_reactions, 
            h6.balance as h6_balance, h6.shot_power as h6_shot_power, h6.jumping as h6_jumping, h6.stamina as h6_stamina, 
            h6.strength as h6_strength, h6.long_shots as h6_long_shots, h6.aggression as h6_aggression, h6.interceptions as h6_interceptions, 
            h6.positioning as h6_positioning, h6.vision as h6_vision, h6.penalties as h6_penalties, h6.marking as h6_marking, 
            h6.standing_tackle as h6_standing_tackle, h6.gk_diving as h6_gk_diving, h6.gk_kicking as h6_gk_kicking, 
            h6.gk_positioning as h6_gk_positioning, h6.gk_reflexes as h6_gk_reflexes
            
            FROM WELLA_05 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_6
            INNER JOIN Player_Attributes as h6 on h6.player_api_id = match.home_player_6 AND h6.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h6.date = MAX(h6.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_07 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            wella.h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            wella.h2_date, wella.h2_overall_rating, wella.h2_potential, wella.h2_preferred_foot, 
            wella.h2_attacking_work_rate, wella.h2_defensive_work_rate, wella.h2_crossing, 
            wella.h2_finishing, wella.h2_heading_accuracy, wella.h2_short_passing, 
            wella.h2_volleys, wella.h2_dribbling, wella.h2_curve, wella.h2_free_kick_accuracy, 
            wella.h2_long_passing, wella.h2_long_passing, wella.h2_ball_control, 
            wella.h2_acceleration, wella.h2_sprint_speed, wella.h2_agility, wella.h2_reactions, 
            wella.h2_balance, wella.h2_shot_power, wella.h2_jumping, wella.h2_stamina, 
            wella.h2_strength, wella.h2_long_shots, wella.h2_aggression, wella.h2_interceptions, 
            wella.h2_positioning, wella.h2_vision, wella.h2_penalties, wella.h2_marking, 
            wella.h2_standing_tackle, wella.h2_gk_diving, wella.h2_gk_kicking, 
            wella.h2_gk_positioning, wella.h2_gk_reflexes,

            wella.h3_player_api_id, pa.player_name as h3_player_name, pa.height as h3_height, pa.weight as h3_weight, 
            wella.h3_date, wella.h3_overall_rating, wella.h3_potential, wella.h3_preferred_foot, 
            wella.h3_attacking_work_rate, wella.h3_defensive_work_rate, wella.h3_crossing, 
            wella.h3_finishing, wella.h3_heading_accuracy, wella.h3_short_passing, 
            wella.h3_volleys, wella.h3_dribbling, wella.h3_curve, wella.h3_free_kick_accuracy, 
            wella.h3_long_passing, wella.h3_long_passing, wella.h3_ball_control, 
            wella.h3_acceleration, wella.h3_sprint_speed, wella.h3_agility, wella.h3_reactions, 
            wella.h3_balance, wella.h3_shot_power, wella.h3_jumping, wella.h3_stamina, 
            wella.h3_strength, wella.h3_long_shots, wella.h3_aggression, wella.h3_interceptions, 
            wella.h3_positioning, wella.h3_vision, wella.h3_penalties, wella.h3_marking, 
            wella.h3_standing_tackle, wella.h3_gk_diving, wella.h3_gk_kicking, 
            wella.h3_gk_positioning, wella.h3_gk_reflexes,

            wella.h4_player_api_id, pa.player_name as h4_player_name, pa.height as h4_height, pa.weight as h4_weight, 
            wella.h4_date, wella.h4_overall_rating, wella.h4_potential, wella.h4_preferred_foot, 
            wella.h4_attacking_work_rate, wella.h4_defensive_work_rate, wella.h4_crossing, 
            wella.h4_finishing, wella.h4_heading_accuracy, wella.h4_short_passing, 
            wella.h4_volleys, wella.h4_dribbling, wella.h4_curve, wella.h4_free_kick_accuracy, 
            wella.h4_long_passing, wella.h4_long_passing, wella.h4_ball_control, 
            wella.h4_acceleration, wella.h4_sprint_speed, wella.h4_agility, wella.h4_reactions, 
            wella.h4_balance, wella.h4_shot_power, wella.h4_jumping, wella.h4_stamina, 
            wella.h4_strength, wella.h4_long_shots, wella.h4_aggression, wella.h4_interceptions, 
            wella.h4_positioning, wella.h4_vision, wella.h4_penalties, wella.h4_marking, 
            wella.h4_standing_tackle, wella.h4_gk_diving, wella.h4_gk_kicking, 
            wella.h4_gk_positioning, wella.h4_gk_reflexes,

            wella.h5_player_api_id, pa.player_name as h5_player_name, pa.height as h5_height, pa.weight as h5_weight, 
            wella.h5_date, wella.h5_overall_rating, wella.h5_potential, wella.h5_preferred_foot, 
            wella.h5_attacking_work_rate, wella.h5_defensive_work_rate, wella.h5_crossing, 
            wella.h5_finishing, wella.h5_heading_accuracy, wella.h5_short_passing, 
            wella.h5_volleys, wella.h5_dribbling, wella.h5_curve, wella.h5_free_kick_accuracy, 
            wella.h5_long_passing, wella.h5_long_passing, wella.h5_ball_control, 
            wella.h5_acceleration, wella.h5_sprint_speed, wella.h5_agility, wella.h5_reactions, 
            wella.h5_balance, wella.h5_shot_power, wella.h5_jumping, wella.h5_stamina, 
            wella.h5_strength, wella.h5_long_shots, wella.h5_aggression, wella.h5_interceptions, 
            wella.h5_positioning, wella.h5_vision, wella.h5_penalties, wella.h5_marking, 
            wella.h5_standing_tackle, wella.h5_gk_diving, wella.h5_gk_kicking, 
            wella.h5_gk_positioning, wella.h5_gk_reflexes,

            wella.h6_player_api_id, pa.player_name as h6_player_name, pa.height as h6_height, pa.weight as h6_weight, 
            wella.h6_date, wella.h6_overall_rating, wella.h6_potential, wella.h6_preferred_foot, 
            wella.h6_attacking_work_rate, wella.h6_defensive_work_rate, wella.h6_crossing, 
            wella.h6_finishing, wella.h6_heading_accuracy, wella.h6_short_passing, 
            wella.h6_volleys, wella.h6_dribbling, wella.h6_curve, wella.h6_free_kick_accuracy, 
            wella.h6_long_passing, wella.h6_long_passing, wella.h6_ball_control, 
            wella.h6_acceleration, wella.h6_sprint_speed, wella.h6_agility, wella.h6_reactions, 
            wella.h6_balance, wella.h6_shot_power, wella.h6_jumping, wella.h6_stamina, 
            wella.h6_strength, wella.h6_long_shots, wella.h6_aggression, wella.h6_interceptions, 
            wella.h6_positioning, wella.h6_vision, wella.h6_penalties, wella.h6_marking, 
            wella.h6_standing_tackle, wella.h6_gk_diving, wella.h6_gk_kicking, 
            wella.h6_gk_positioning, wella.h6_gk_reflexes,

            h7.player_api_id as h7_player_api_id, pa.player_name as h7_player_name, pa.height as h7_height, pa.weight as h7_weight, 
            h7.date as h7_date, h7.overall_rating as h7_overall_rating, h7.potential as h7_potential, h7.preferred_foot as h7_preferred_foot, 
            h7.attacking_work_rate as h7_attacking_work_rate, h7.defensive_work_rate as h7_defensive_work_rate, h7.crossing as h7_crossing, 
            h7.finishing as h7_finishing, h7.heading_accuracy as h7_heading_accuracy, h7.short_passing as h7_short_passing, 
            h7.volleys as h7_volleys, h7.dribbling as h7_dribbling, h7.curve as h7_curve, h7.free_kick_accuracy as h7_free_kick_accuracy, 
            h7.long_passing as h7_long_passing, h7.long_passing as h7_long_passing, h7.ball_control as h7_ball_control, 
            h7.acceleration as h7_acceleration, h7.sprint_speed as h7_sprint_speed, h7.agility as h7_agility, h7.reactions as h7_reactions, 
            h7.balance as h7_balance, h7.shot_power as h7_shot_power, h7.jumping as h7_jumping, h7.stamina as h7_stamina, 
            h7.strength as h7_strength, h7.long_shots as h7_long_shots, h7.aggression as h7_aggression, h7.interceptions as h7_interceptions, 
            h7.positioning as h7_positioning, h7.vision as h7_vision, h7.penalties as h7_penalties, h7.marking as h7_marking, 
            h7.standing_tackle as h7_standing_tackle, h7.gk_diving as h7_gk_diving, h7.gk_kicking as h7_gk_kicking, 
            h7.gk_positioning as h7_gk_positioning, h7.gk_reflexes as h7_gk_reflexes
            
            FROM WELLA_06 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_7
            INNER JOIN Player_Attributes as h7 on h7.player_api_id = match.home_player_7 AND h7.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h7.date = MAX(h7.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_08 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            wella.h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            wella.h2_date, wella.h2_overall_rating, wella.h2_potential, wella.h2_preferred_foot, 
            wella.h2_attacking_work_rate, wella.h2_defensive_work_rate, wella.h2_crossing, 
            wella.h2_finishing, wella.h2_heading_accuracy, wella.h2_short_passing, 
            wella.h2_volleys, wella.h2_dribbling, wella.h2_curve, wella.h2_free_kick_accuracy, 
            wella.h2_long_passing, wella.h2_long_passing, wella.h2_ball_control, 
            wella.h2_acceleration, wella.h2_sprint_speed, wella.h2_agility, wella.h2_reactions, 
            wella.h2_balance, wella.h2_shot_power, wella.h2_jumping, wella.h2_stamina, 
            wella.h2_strength, wella.h2_long_shots, wella.h2_aggression, wella.h2_interceptions, 
            wella.h2_positioning, wella.h2_vision, wella.h2_penalties, wella.h2_marking, 
            wella.h2_standing_tackle, wella.h2_gk_diving, wella.h2_gk_kicking, 
            wella.h2_gk_positioning, wella.h2_gk_reflexes,

            wella.h3_player_api_id, pa.player_name as h3_player_name, pa.height as h3_height, pa.weight as h3_weight, 
            wella.h3_date, wella.h3_overall_rating, wella.h3_potential, wella.h3_preferred_foot, 
            wella.h3_attacking_work_rate, wella.h3_defensive_work_rate, wella.h3_crossing, 
            wella.h3_finishing, wella.h3_heading_accuracy, wella.h3_short_passing, 
            wella.h3_volleys, wella.h3_dribbling, wella.h3_curve, wella.h3_free_kick_accuracy, 
            wella.h3_long_passing, wella.h3_long_passing, wella.h3_ball_control, 
            wella.h3_acceleration, wella.h3_sprint_speed, wella.h3_agility, wella.h3_reactions, 
            wella.h3_balance, wella.h3_shot_power, wella.h3_jumping, wella.h3_stamina, 
            wella.h3_strength, wella.h3_long_shots, wella.h3_aggression, wella.h3_interceptions, 
            wella.h3_positioning, wella.h3_vision, wella.h3_penalties, wella.h3_marking, 
            wella.h3_standing_tackle, wella.h3_gk_diving, wella.h3_gk_kicking, 
            wella.h3_gk_positioning, wella.h3_gk_reflexes,

            wella.h4_player_api_id, pa.player_name as h4_player_name, pa.height as h4_height, pa.weight as h4_weight, 
            wella.h4_date, wella.h4_overall_rating, wella.h4_potential, wella.h4_preferred_foot, 
            wella.h4_attacking_work_rate, wella.h4_defensive_work_rate, wella.h4_crossing, 
            wella.h4_finishing, wella.h4_heading_accuracy, wella.h4_short_passing, 
            wella.h4_volleys, wella.h4_dribbling, wella.h4_curve, wella.h4_free_kick_accuracy, 
            wella.h4_long_passing, wella.h4_long_passing, wella.h4_ball_control, 
            wella.h4_acceleration, wella.h4_sprint_speed, wella.h4_agility, wella.h4_reactions, 
            wella.h4_balance, wella.h4_shot_power, wella.h4_jumping, wella.h4_stamina, 
            wella.h4_strength, wella.h4_long_shots, wella.h4_aggression, wella.h4_interceptions, 
            wella.h4_positioning, wella.h4_vision, wella.h4_penalties, wella.h4_marking, 
            wella.h4_standing_tackle, wella.h4_gk_diving, wella.h4_gk_kicking, 
            wella.h4_gk_positioning, wella.h4_gk_reflexes,

            wella.h5_player_api_id, pa.player_name as h5_player_name, pa.height as h5_height, pa.weight as h5_weight, 
            wella.h5_date, wella.h5_overall_rating, wella.h5_potential, wella.h5_preferred_foot, 
            wella.h5_attacking_work_rate, wella.h5_defensive_work_rate, wella.h5_crossing, 
            wella.h5_finishing, wella.h5_heading_accuracy, wella.h5_short_passing, 
            wella.h5_volleys, wella.h5_dribbling, wella.h5_curve, wella.h5_free_kick_accuracy, 
            wella.h5_long_passing, wella.h5_long_passing, wella.h5_ball_control, 
            wella.h5_acceleration, wella.h5_sprint_speed, wella.h5_agility, wella.h5_reactions, 
            wella.h5_balance, wella.h5_shot_power, wella.h5_jumping, wella.h5_stamina, 
            wella.h5_strength, wella.h5_long_shots, wella.h5_aggression, wella.h5_interceptions, 
            wella.h5_positioning, wella.h5_vision, wella.h5_penalties, wella.h5_marking, 
            wella.h5_standing_tackle, wella.h5_gk_diving, wella.h5_gk_kicking, 
            wella.h5_gk_positioning, wella.h5_gk_reflexes,

            wella.h6_player_api_id, pa.player_name as h6_player_name, pa.height as h6_height, pa.weight as h6_weight, 
            wella.h6_date, wella.h6_overall_rating, wella.h6_potential, wella.h6_preferred_foot, 
            wella.h6_attacking_work_rate, wella.h6_defensive_work_rate, wella.h6_crossing, 
            wella.h6_finishing, wella.h6_heading_accuracy, wella.h6_short_passing, 
            wella.h6_volleys, wella.h6_dribbling, wella.h6_curve, wella.h6_free_kick_accuracy, 
            wella.h6_long_passing, wella.h6_long_passing, wella.h6_ball_control, 
            wella.h6_acceleration, wella.h6_sprint_speed, wella.h6_agility, wella.h6_reactions, 
            wella.h6_balance, wella.h6_shot_power, wella.h6_jumping, wella.h6_stamina, 
            wella.h6_strength, wella.h6_long_shots, wella.h6_aggression, wella.h6_interceptions, 
            wella.h6_positioning, wella.h6_vision, wella.h6_penalties, wella.h6_marking, 
            wella.h6_standing_tackle, wella.h6_gk_diving, wella.h6_gk_kicking, 
            wella.h6_gk_positioning, wella.h6_gk_reflexes,

            wella.h7_player_api_id, pa.player_name as h7_player_name, pa.height as h7_height, pa.weight as h7_weight, 
            wella.h7_date, wella.h7_overall_rating, wella.h7_potential, wella.h7_preferred_foot, 
            wella.h7_attacking_work_rate, wella.h7_defensive_work_rate, wella.h7_crossing, 
            wella.h7_finishing, wella.h7_heading_accuracy, wella.h7_short_passing, 
            wella.h7_volleys, wella.h7_dribbling, wella.h7_curve, wella.h7_free_kick_accuracy, 
            wella.h7_long_passing, wella.h7_long_passing, wella.h7_ball_control, 
            wella.h7_acceleration, wella.h7_sprint_speed, wella.h7_agility, wella.h7_reactions, 
            wella.h7_balance, wella.h7_shot_power, wella.h7_jumping, wella.h7_stamina, 
            wella.h7_strength, wella.h7_long_shots, wella.h7_aggression, wella.h7_interceptions, 
            wella.h7_positioning, wella.h7_vision, wella.h7_penalties, wella.h7_marking, 
            wella.h7_standing_tackle, wella.h7_gk_diving, wella.h7_gk_kicking, 
            wella.h7_gk_positioning, wella.h7_gk_reflexes,

            h8.player_api_id as h8_player_api_id, pa.player_name as h8_player_name, pa.height as h8_height, pa.weight as h8_weight, 
            h8.date as h8_date, h8.overall_rating as h8_overall_rating, h8.potential as h8_potential, h8.preferred_foot as h8_preferred_foot, 
            h8.attacking_work_rate as h8_attacking_work_rate, h8.defensive_work_rate as h8_defensive_work_rate, h8.crossing as h8_crossing, 
            h8.finishing as h8_finishing, h8.heading_accuracy as h8_heading_accuracy, h8.short_passing as h8_short_passing, 
            h8.volleys as h8_volleys, h8.dribbling as h8_dribbling, h8.curve as h8_curve, h8.free_kick_accuracy as h8_free_kick_accuracy, 
            h8.long_passing as h8_long_passing, h8.long_passing as h8_long_passing, h8.ball_control as h8_ball_control, 
            h8.acceleration as h8_acceleration, h8.sprint_speed as h8_sprint_speed, h8.agility as h8_agility, h8.reactions as h8_reactions, 
            h8.balance as h8_balance, h8.shot_power as h8_shot_power, h8.jumping as h8_jumping, h8.stamina as h8_stamina, 
            h8.strength as h8_strength, h8.long_shots as h8_long_shots, h8.aggression as h8_aggression, h8.interceptions as h8_interceptions, 
            h8.positioning as h8_positioning, h8.vision as h8_vision, h8.penalties as h8_penalties, h8.marking as h8_marking, 
            h8.standing_tackle as h8_standing_tackle, h8.gk_diving as h8_gk_diving, h8.gk_kicking as h8_gk_kicking, 
            h8.gk_positioning as h8_gk_positioning, h8.gk_reflexes as h8_gk_reflexes
            
            FROM WELLA_07 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_8
            INNER JOIN Player_Attributes as h8 on h8.player_api_id = match.home_player_8 AND h8.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h8.date = MAX(h8.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_09 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            wella.h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            wella.h2_date, wella.h2_overall_rating, wella.h2_potential, wella.h2_preferred_foot, 
            wella.h2_attacking_work_rate, wella.h2_defensive_work_rate, wella.h2_crossing, 
            wella.h2_finishing, wella.h2_heading_accuracy, wella.h2_short_passing, 
            wella.h2_volleys, wella.h2_dribbling, wella.h2_curve, wella.h2_free_kick_accuracy, 
            wella.h2_long_passing, wella.h2_long_passing, wella.h2_ball_control, 
            wella.h2_acceleration, wella.h2_sprint_speed, wella.h2_agility, wella.h2_reactions, 
            wella.h2_balance, wella.h2_shot_power, wella.h2_jumping, wella.h2_stamina, 
            wella.h2_strength, wella.h2_long_shots, wella.h2_aggression, wella.h2_interceptions, 
            wella.h2_positioning, wella.h2_vision, wella.h2_penalties, wella.h2_marking, 
            wella.h2_standing_tackle, wella.h2_gk_diving, wella.h2_gk_kicking, 
            wella.h2_gk_positioning, wella.h2_gk_reflexes,

            wella.h3_player_api_id, pa.player_name as h3_player_name, pa.height as h3_height, pa.weight as h3_weight, 
            wella.h3_date, wella.h3_overall_rating, wella.h3_potential, wella.h3_preferred_foot, 
            wella.h3_attacking_work_rate, wella.h3_defensive_work_rate, wella.h3_crossing, 
            wella.h3_finishing, wella.h3_heading_accuracy, wella.h3_short_passing, 
            wella.h3_volleys, wella.h3_dribbling, wella.h3_curve, wella.h3_free_kick_accuracy, 
            wella.h3_long_passing, wella.h3_long_passing, wella.h3_ball_control, 
            wella.h3_acceleration, wella.h3_sprint_speed, wella.h3_agility, wella.h3_reactions, 
            wella.h3_balance, wella.h3_shot_power, wella.h3_jumping, wella.h3_stamina, 
            wella.h3_strength, wella.h3_long_shots, wella.h3_aggression, wella.h3_interceptions, 
            wella.h3_positioning, wella.h3_vision, wella.h3_penalties, wella.h3_marking, 
            wella.h3_standing_tackle, wella.h3_gk_diving, wella.h3_gk_kicking, 
            wella.h3_gk_positioning, wella.h3_gk_reflexes,

            wella.h4_player_api_id, pa.player_name as h4_player_name, pa.height as h4_height, pa.weight as h4_weight, 
            wella.h4_date, wella.h4_overall_rating, wella.h4_potential, wella.h4_preferred_foot, 
            wella.h4_attacking_work_rate, wella.h4_defensive_work_rate, wella.h4_crossing, 
            wella.h4_finishing, wella.h4_heading_accuracy, wella.h4_short_passing, 
            wella.h4_volleys, wella.h4_dribbling, wella.h4_curve, wella.h4_free_kick_accuracy, 
            wella.h4_long_passing, wella.h4_long_passing, wella.h4_ball_control, 
            wella.h4_acceleration, wella.h4_sprint_speed, wella.h4_agility, wella.h4_reactions, 
            wella.h4_balance, wella.h4_shot_power, wella.h4_jumping, wella.h4_stamina, 
            wella.h4_strength, wella.h4_long_shots, wella.h4_aggression, wella.h4_interceptions, 
            wella.h4_positioning, wella.h4_vision, wella.h4_penalties, wella.h4_marking, 
            wella.h4_standing_tackle, wella.h4_gk_diving, wella.h4_gk_kicking, 
            wella.h4_gk_positioning, wella.h4_gk_reflexes,

            wella.h5_player_api_id, pa.player_name as h5_player_name, pa.height as h5_height, pa.weight as h5_weight, 
            wella.h5_date, wella.h5_overall_rating, wella.h5_potential, wella.h5_preferred_foot, 
            wella.h5_attacking_work_rate, wella.h5_defensive_work_rate, wella.h5_crossing, 
            wella.h5_finishing, wella.h5_heading_accuracy, wella.h5_short_passing, 
            wella.h5_volleys, wella.h5_dribbling, wella.h5_curve, wella.h5_free_kick_accuracy, 
            wella.h5_long_passing, wella.h5_long_passing, wella.h5_ball_control, 
            wella.h5_acceleration, wella.h5_sprint_speed, wella.h5_agility, wella.h5_reactions, 
            wella.h5_balance, wella.h5_shot_power, wella.h5_jumping, wella.h5_stamina, 
            wella.h5_strength, wella.h5_long_shots, wella.h5_aggression, wella.h5_interceptions, 
            wella.h5_positioning, wella.h5_vision, wella.h5_penalties, wella.h5_marking, 
            wella.h5_standing_tackle, wella.h5_gk_diving, wella.h5_gk_kicking, 
            wella.h5_gk_positioning, wella.h5_gk_reflexes,

            wella.h6_player_api_id, pa.player_name as h6_player_name, pa.height as h6_height, pa.weight as h6_weight, 
            wella.h6_date, wella.h6_overall_rating, wella.h6_potential, wella.h6_preferred_foot, 
            wella.h6_attacking_work_rate, wella.h6_defensive_work_rate, wella.h6_crossing, 
            wella.h6_finishing, wella.h6_heading_accuracy, wella.h6_short_passing, 
            wella.h6_volleys, wella.h6_dribbling, wella.h6_curve, wella.h6_free_kick_accuracy, 
            wella.h6_long_passing, wella.h6_long_passing, wella.h6_ball_control, 
            wella.h6_acceleration, wella.h6_sprint_speed, wella.h6_agility, wella.h6_reactions, 
            wella.h6_balance, wella.h6_shot_power, wella.h6_jumping, wella.h6_stamina, 
            wella.h6_strength, wella.h6_long_shots, wella.h6_aggression, wella.h6_interceptions, 
            wella.h6_positioning, wella.h6_vision, wella.h6_penalties, wella.h6_marking, 
            wella.h6_standing_tackle, wella.h6_gk_diving, wella.h6_gk_kicking, 
            wella.h6_gk_positioning, wella.h6_gk_reflexes,

            wella.h7_player_api_id, pa.player_name as h7_player_name, pa.height as h7_height, pa.weight as h7_weight, 
            wella.h7_date, wella.h7_overall_rating, wella.h7_potential, wella.h7_preferred_foot, 
            wella.h7_attacking_work_rate, wella.h7_defensive_work_rate, wella.h7_crossing, 
            wella.h7_finishing, wella.h7_heading_accuracy, wella.h7_short_passing, 
            wella.h7_volleys, wella.h7_dribbling, wella.h7_curve, wella.h7_free_kick_accuracy, 
            wella.h7_long_passing, wella.h7_long_passing, wella.h7_ball_control, 
            wella.h7_acceleration, wella.h7_sprint_speed, wella.h7_agility, wella.h7_reactions, 
            wella.h7_balance, wella.h7_shot_power, wella.h7_jumping, wella.h7_stamina, 
            wella.h7_strength, wella.h7_long_shots, wella.h7_aggression, wella.h7_interceptions, 
            wella.h7_positioning, wella.h7_vision, wella.h7_penalties, wella.h7_marking, 
            wella.h7_standing_tackle, wella.h7_gk_diving, wella.h7_gk_kicking, 
            wella.h7_gk_positioning, wella.h7_gk_reflexes,

            wella.h8_player_api_id, pa.player_name as h8_player_name, pa.height as h8_height, pa.weight as h8_weight, 
            wella.h8_date, wella.h8_overall_rating, wella.h8_potential, wella.h8_preferred_foot, 
            wella.h8_attacking_work_rate, wella.h8_defensive_work_rate, wella.h8_crossing, 
            wella.h8_finishing, wella.h8_heading_accuracy, wella.h8_short_passing, 
            wella.h8_volleys, wella.h8_dribbling, wella.h8_curve, wella.h8_free_kick_accuracy, 
            wella.h8_long_passing, wella.h8_long_passing, wella.h8_ball_control, 
            wella.h8_acceleration, wella.h8_sprint_speed, wella.h8_agility, wella.h8_reactions, 
            wella.h8_balance, wella.h8_shot_power, wella.h8_jumping, wella.h8_stamina, 
            wella.h8_strength, wella.h8_long_shots, wella.h8_aggression, wella.h8_interceptions, 
            wella.h8_positioning, wella.h8_vision, wella.h8_penalties, wella.h8_marking, 
            wella.h8_standing_tackle, wella.h8_gk_diving, wella.h8_gk_kicking, 
            wella.h8_gk_positioning, wella.h8_gk_reflexes,

            h9.player_api_id as h9_player_api_id, pa.player_name as h9_player_name, pa.height as h9_height, pa.weight as h9_weight, 
            h9.date as h9_date, h9.overall_rating as h9_overall_rating, h9.potential as h9_potential, h9.preferred_foot as h9_preferred_foot, 
            h9.attacking_work_rate as h9_attacking_work_rate, h9.defensive_work_rate as h9_defensive_work_rate, h9.crossing as h9_crossing, 
            h9.finishing as h9_finishing, h9.heading_accuracy as h9_heading_accuracy, h9.short_passing as h9_short_passing, 
            h9.volleys as h9_volleys, h9.dribbling as h9_dribbling, h9.curve as h9_curve, h9.free_kick_accuracy as h9_free_kick_accuracy, 
            h9.long_passing as h9_long_passing, h9.long_passing as h9_long_passing, h9.ball_control as h9_ball_control, 
            h9.acceleration as h9_acceleration, h9.sprint_speed as h9_sprint_speed, h9.agility as h9_agility, h9.reactions as h9_reactions, 
            h9.balance as h9_balance, h9.shot_power as h9_shot_power, h9.jumping as h9_jumping, h9.stamina as h9_stamina, 
            h9.strength as h9_strength, h9.long_shots as h9_long_shots, h9.aggression as h9_aggression, h9.interceptions as h9_interceptions, 
            h9.positioning as h9_positioning, h9.vision as h9_vision, h9.penalties as h9_penalties, h9.marking as h9_marking, 
            h9.standing_tackle as h9_standing_tackle, h9.gk_diving as h9_gk_diving, h9.gk_kicking as h9_gk_kicking, 
            h9.gk_positioning as h9_gk_positioning, h9.gk_reflexes as h9_gk_reflexes
            
            FROM WELLA_08 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_9
            INNER JOIN Player_Attributes as h9 on h9.player_api_id = match.home_player_9 AND h9.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h9.date = MAX(h9.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_10 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            wella.h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            wella.h2_date, wella.h2_overall_rating, wella.h2_potential, wella.h2_preferred_foot, 
            wella.h2_attacking_work_rate, wella.h2_defensive_work_rate, wella.h2_crossing, 
            wella.h2_finishing, wella.h2_heading_accuracy, wella.h2_short_passing, 
            wella.h2_volleys, wella.h2_dribbling, wella.h2_curve, wella.h2_free_kick_accuracy, 
            wella.h2_long_passing, wella.h2_long_passing, wella.h2_ball_control, 
            wella.h2_acceleration, wella.h2_sprint_speed, wella.h2_agility, wella.h2_reactions, 
            wella.h2_balance, wella.h2_shot_power, wella.h2_jumping, wella.h2_stamina, 
            wella.h2_strength, wella.h2_long_shots, wella.h2_aggression, wella.h2_interceptions, 
            wella.h2_positioning, wella.h2_vision, wella.h2_penalties, wella.h2_marking, 
            wella.h2_standing_tackle, wella.h2_gk_diving, wella.h2_gk_kicking, 
            wella.h2_gk_positioning, wella.h2_gk_reflexes,

            wella.h3_player_api_id, pa.player_name as h3_player_name, pa.height as h3_height, pa.weight as h3_weight, 
            wella.h3_date, wella.h3_overall_rating, wella.h3_potential, wella.h3_preferred_foot, 
            wella.h3_attacking_work_rate, wella.h3_defensive_work_rate, wella.h3_crossing, 
            wella.h3_finishing, wella.h3_heading_accuracy, wella.h3_short_passing, 
            wella.h3_volleys, wella.h3_dribbling, wella.h3_curve, wella.h3_free_kick_accuracy, 
            wella.h3_long_passing, wella.h3_long_passing, wella.h3_ball_control, 
            wella.h3_acceleration, wella.h3_sprint_speed, wella.h3_agility, wella.h3_reactions, 
            wella.h3_balance, wella.h3_shot_power, wella.h3_jumping, wella.h3_stamina, 
            wella.h3_strength, wella.h3_long_shots, wella.h3_aggression, wella.h3_interceptions, 
            wella.h3_positioning, wella.h3_vision, wella.h3_penalties, wella.h3_marking, 
            wella.h3_standing_tackle, wella.h3_gk_diving, wella.h3_gk_kicking, 
            wella.h3_gk_positioning, wella.h3_gk_reflexes,

            wella.h4_player_api_id, pa.player_name as h4_player_name, pa.height as h4_height, pa.weight as h4_weight, 
            wella.h4_date, wella.h4_overall_rating, wella.h4_potential, wella.h4_preferred_foot, 
            wella.h4_attacking_work_rate, wella.h4_defensive_work_rate, wella.h4_crossing, 
            wella.h4_finishing, wella.h4_heading_accuracy, wella.h4_short_passing, 
            wella.h4_volleys, wella.h4_dribbling, wella.h4_curve, wella.h4_free_kick_accuracy, 
            wella.h4_long_passing, wella.h4_long_passing, wella.h4_ball_control, 
            wella.h4_acceleration, wella.h4_sprint_speed, wella.h4_agility, wella.h4_reactions, 
            wella.h4_balance, wella.h4_shot_power, wella.h4_jumping, wella.h4_stamina, 
            wella.h4_strength, wella.h4_long_shots, wella.h4_aggression, wella.h4_interceptions, 
            wella.h4_positioning, wella.h4_vision, wella.h4_penalties, wella.h4_marking, 
            wella.h4_standing_tackle, wella.h4_gk_diving, wella.h4_gk_kicking, 
            wella.h4_gk_positioning, wella.h4_gk_reflexes,

            wella.h5_player_api_id, pa.player_name as h5_player_name, pa.height as h5_height, pa.weight as h5_weight, 
            wella.h5_date, wella.h5_overall_rating, wella.h5_potential, wella.h5_preferred_foot, 
            wella.h5_attacking_work_rate, wella.h5_defensive_work_rate, wella.h5_crossing, 
            wella.h5_finishing, wella.h5_heading_accuracy, wella.h5_short_passing, 
            wella.h5_volleys, wella.h5_dribbling, wella.h5_curve, wella.h5_free_kick_accuracy, 
            wella.h5_long_passing, wella.h5_long_passing, wella.h5_ball_control, 
            wella.h5_acceleration, wella.h5_sprint_speed, wella.h5_agility, wella.h5_reactions, 
            wella.h5_balance, wella.h5_shot_power, wella.h5_jumping, wella.h5_stamina, 
            wella.h5_strength, wella.h5_long_shots, wella.h5_aggression, wella.h5_interceptions, 
            wella.h5_positioning, wella.h5_vision, wella.h5_penalties, wella.h5_marking, 
            wella.h5_standing_tackle, wella.h5_gk_diving, wella.h5_gk_kicking, 
            wella.h5_gk_positioning, wella.h5_gk_reflexes,

            wella.h6_player_api_id, pa.player_name as h6_player_name, pa.height as h6_height, pa.weight as h6_weight, 
            wella.h6_date, wella.h6_overall_rating, wella.h6_potential, wella.h6_preferred_foot, 
            wella.h6_attacking_work_rate, wella.h6_defensive_work_rate, wella.h6_crossing, 
            wella.h6_finishing, wella.h6_heading_accuracy, wella.h6_short_passing, 
            wella.h6_volleys, wella.h6_dribbling, wella.h6_curve, wella.h6_free_kick_accuracy, 
            wella.h6_long_passing, wella.h6_long_passing, wella.h6_ball_control, 
            wella.h6_acceleration, wella.h6_sprint_speed, wella.h6_agility, wella.h6_reactions, 
            wella.h6_balance, wella.h6_shot_power, wella.h6_jumping, wella.h6_stamina, 
            wella.h6_strength, wella.h6_long_shots, wella.h6_aggression, wella.h6_interceptions, 
            wella.h6_positioning, wella.h6_vision, wella.h6_penalties, wella.h6_marking, 
            wella.h6_standing_tackle, wella.h6_gk_diving, wella.h6_gk_kicking, 
            wella.h6_gk_positioning, wella.h6_gk_reflexes,

            wella.h7_player_api_id, pa.player_name as h7_player_name, pa.height as h7_height, pa.weight as h7_weight, 
            wella.h7_date, wella.h7_overall_rating, wella.h7_potential, wella.h7_preferred_foot, 
            wella.h7_attacking_work_rate, wella.h7_defensive_work_rate, wella.h7_crossing, 
            wella.h7_finishing, wella.h7_heading_accuracy, wella.h7_short_passing, 
            wella.h7_volleys, wella.h7_dribbling, wella.h7_curve, wella.h7_free_kick_accuracy, 
            wella.h7_long_passing, wella.h7_long_passing, wella.h7_ball_control, 
            wella.h7_acceleration, wella.h7_sprint_speed, wella.h7_agility, wella.h7_reactions, 
            wella.h7_balance, wella.h7_shot_power, wella.h7_jumping, wella.h7_stamina, 
            wella.h7_strength, wella.h7_long_shots, wella.h7_aggression, wella.h7_interceptions, 
            wella.h7_positioning, wella.h7_vision, wella.h7_penalties, wella.h7_marking, 
            wella.h7_standing_tackle, wella.h7_gk_diving, wella.h7_gk_kicking, 
            wella.h7_gk_positioning, wella.h7_gk_reflexes,

            wella.h8_player_api_id, pa.player_name as h8_player_name, pa.height as h8_height, pa.weight as h8_weight, 
            wella.h8_date, wella.h8_overall_rating, wella.h8_potential, wella.h8_preferred_foot, 
            wella.h8_attacking_work_rate, wella.h8_defensive_work_rate, wella.h8_crossing, 
            wella.h8_finishing, wella.h8_heading_accuracy, wella.h8_short_passing, 
            wella.h8_volleys, wella.h8_dribbling, wella.h8_curve, wella.h8_free_kick_accuracy, 
            wella.h8_long_passing, wella.h8_long_passing, wella.h8_ball_control, 
            wella.h8_acceleration, wella.h8_sprint_speed, wella.h8_agility, wella.h8_reactions, 
            wella.h8_balance, wella.h8_shot_power, wella.h8_jumping, wella.h8_stamina, 
            wella.h8_strength, wella.h8_long_shots, wella.h8_aggression, wella.h8_interceptions, 
            wella.h8_positioning, wella.h8_vision, wella.h8_penalties, wella.h8_marking, 
            wella.h8_standing_tackle, wella.h8_gk_diving, wella.h8_gk_kicking, 
            wella.h8_gk_positioning, wella.h8_gk_reflexes,

            wella.h9_player_api_id, pa.player_name as h9_player_name, pa.height as h9_height, pa.weight as h9_weight, 
            wella.h9_date, wella.h9_overall_rating, wella.h9_potential, wella.h9_preferred_foot, 
            wella.h9_attacking_work_rate, wella.h9_defensive_work_rate, wella.h9_crossing, 
            wella.h9_finishing, wella.h9_heading_accuracy, wella.h9_short_passing, 
            wella.h9_volleys, wella.h9_dribbling, wella.h9_curve, wella.h9_free_kick_accuracy, 
            wella.h9_long_passing, wella.h9_long_passing, wella.h9_ball_control, 
            wella.h9_acceleration, wella.h9_sprint_speed, wella.h9_agility, wella.h9_reactions, 
            wella.h9_balance, wella.h9_shot_power, wella.h9_jumping, wella.h9_stamina, 
            wella.h9_strength, wella.h9_long_shots, wella.h9_aggression, wella.h9_interceptions, 
            wella.h9_positioning, wella.h9_vision, wella.h9_penalties, wella.h9_marking, 
            wella.h9_standing_tackle, wella.h9_gk_diving, wella.h9_gk_kicking, 
            wella.h9_gk_positioning, wella.h9_gk_reflexes,

            h10.player_api_id as h10_player_api_id, pa.player_name as h10_player_name, pa.height as h10_height, pa.weight as h10_weight, 
            h10.date as h10_date, h10.overall_rating as h10_overall_rating, h10.potential as h10_potential, h10.preferred_foot as h10_preferred_foot, 
            h10.attacking_work_rate as h10_attacking_work_rate, h10.defensive_work_rate as h10_defensive_work_rate, h10.crossing as h10_crossing, 
            h10.finishing as h10_finishing, h10.heading_accuracy as h10_heading_accuracy, h10.short_passing as h10_short_passing, 
            h10.volleys as h10_volleys, h10.dribbling as h10_dribbling, h10.curve as h10_curve, h10.free_kick_accuracy as h10_free_kick_accuracy, 
            h10.long_passing as h10_long_passing, h10.long_passing as h10_long_passing, h10.ball_control as h10_ball_control, 
            h10.acceleration as h10_acceleration, h10.sprint_speed as h10_sprint_speed, h10.agility as h10_agility, h10.reactions as h10_reactions, 
            h10.balance as h10_balance, h10.shot_power as h10_shot_power, h10.jumping as h10_jumping, h10.stamina as h10_stamina, 
            h10.strength as h10_strength, h10.long_shots as h10_long_shots, h10.aggression as h10_aggression, h10.interceptions as h10_interceptions, 
            h10.positioning as h10_positioning, h10.vision as h10_vision, h10.penalties as h10_penalties, h10.marking as h10_marking, 
            h10.standing_tackle as h10_standing_tackle, h10.gk_diving as h10_gk_diving, h10.gk_kicking as h10_gk_kicking, 
            h10.gk_positioning as h10_gk_positioning, h10.gk_reflexes as h10_gk_reflexes
            
            FROM WELLA_09 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_10
            INNER JOIN Player_Attributes as h10 on h10.player_api_id = match.home_player_10 AND h10.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h10.date = MAX(h10.date);
            
  ------------------------------------------------

CREATE TABLE WELLA_11 AS
            SELECT
            
            wella.match_api_id,
            wella.date,
            
            wella.h1_player_api_id, pa.player_name as h1_player_name, pa.height as h1_height, pa.weight as h1_weight, 
            wella.h1_date, wella.h1_overall_rating, wella.h1_potential, wella.h1_preferred_foot, 
            wella.h1_attacking_work_rate, wella.h1_defensive_work_rate, wella.h1_crossing, 
            wella.h1_finishing, wella.h1_heading_accuracy, wella.h1_short_passing, 
            wella.h1_volleys, wella.h1_dribbling, wella.h1_curve, wella.h1_free_kick_accuracy, 
            wella.h1_long_passing, wella.h1_long_passing, wella.h1_ball_control, 
            wella.h1_acceleration, wella.h1_sprint_speed, wella.h1_agility, wella.h1_reactions, 
            wella.h1_balance, wella.h1_shot_power, wella.h1_jumping, wella.h1_stamina, 
            wella.h1_strength, wella.h1_long_shots, wella.h1_aggression, wella.h1_interceptions, 
            wella.h1_positioning, wella.h1_vision, wella.h1_penalties, wella.h1_marking, 
            wella.h1_standing_tackle, wella.h1_gk_diving, wella.h1_gk_kicking, 
            wella.h1_gk_positioning, wella.h1_gk_reflexes,

            wella.h2_player_api_id, pa.player_name as h2_player_name, pa.height as h2_height, pa.weight as h2_weight, 
            wella.h2_date, wella.h2_overall_rating, wella.h2_potential, wella.h2_preferred_foot, 
            wella.h2_attacking_work_rate, wella.h2_defensive_work_rate, wella.h2_crossing, 
            wella.h2_finishing, wella.h2_heading_accuracy, wella.h2_short_passing, 
            wella.h2_volleys, wella.h2_dribbling, wella.h2_curve, wella.h2_free_kick_accuracy, 
            wella.h2_long_passing, wella.h2_long_passing, wella.h2_ball_control, 
            wella.h2_acceleration, wella.h2_sprint_speed, wella.h2_agility, wella.h2_reactions, 
            wella.h2_balance, wella.h2_shot_power, wella.h2_jumping, wella.h2_stamina, 
            wella.h2_strength, wella.h2_long_shots, wella.h2_aggression, wella.h2_interceptions, 
            wella.h2_positioning, wella.h2_vision, wella.h2_penalties, wella.h2_marking, 
            wella.h2_standing_tackle, wella.h2_gk_diving, wella.h2_gk_kicking, 
            wella.h2_gk_positioning, wella.h2_gk_reflexes,

            wella.h3_player_api_id, pa.player_name as h3_player_name, pa.height as h3_height, pa.weight as h3_weight, 
            wella.h3_date, wella.h3_overall_rating, wella.h3_potential, wella.h3_preferred_foot, 
            wella.h3_attacking_work_rate, wella.h3_defensive_work_rate, wella.h3_crossing, 
            wella.h3_finishing, wella.h3_heading_accuracy, wella.h3_short_passing, 
            wella.h3_volleys, wella.h3_dribbling, wella.h3_curve, wella.h3_free_kick_accuracy, 
            wella.h3_long_passing, wella.h3_long_passing, wella.h3_ball_control, 
            wella.h3_acceleration, wella.h3_sprint_speed, wella.h3_agility, wella.h3_reactions, 
            wella.h3_balance, wella.h3_shot_power, wella.h3_jumping, wella.h3_stamina, 
            wella.h3_strength, wella.h3_long_shots, wella.h3_aggression, wella.h3_interceptions, 
            wella.h3_positioning, wella.h3_vision, wella.h3_penalties, wella.h3_marking, 
            wella.h3_standing_tackle, wella.h3_gk_diving, wella.h3_gk_kicking, 
            wella.h3_gk_positioning, wella.h3_gk_reflexes,

            wella.h4_player_api_id, pa.player_name as h4_player_name, pa.height as h4_height, pa.weight as h4_weight, 
            wella.h4_date, wella.h4_overall_rating, wella.h4_potential, wella.h4_preferred_foot, 
            wella.h4_attacking_work_rate, wella.h4_defensive_work_rate, wella.h4_crossing, 
            wella.h4_finishing, wella.h4_heading_accuracy, wella.h4_short_passing, 
            wella.h4_volleys, wella.h4_dribbling, wella.h4_curve, wella.h4_free_kick_accuracy, 
            wella.h4_long_passing, wella.h4_long_passing, wella.h4_ball_control, 
            wella.h4_acceleration, wella.h4_sprint_speed, wella.h4_agility, wella.h4_reactions, 
            wella.h4_balance, wella.h4_shot_power, wella.h4_jumping, wella.h4_stamina, 
            wella.h4_strength, wella.h4_long_shots, wella.h4_aggression, wella.h4_interceptions, 
            wella.h4_positioning, wella.h4_vision, wella.h4_penalties, wella.h4_marking, 
            wella.h4_standing_tackle, wella.h4_gk_diving, wella.h4_gk_kicking, 
            wella.h4_gk_positioning, wella.h4_gk_reflexes,

            wella.h5_player_api_id, pa.player_name as h5_player_name, pa.height as h5_height, pa.weight as h5_weight, 
            wella.h5_date, wella.h5_overall_rating, wella.h5_potential, wella.h5_preferred_foot, 
            wella.h5_attacking_work_rate, wella.h5_defensive_work_rate, wella.h5_crossing, 
            wella.h5_finishing, wella.h5_heading_accuracy, wella.h5_short_passing, 
            wella.h5_volleys, wella.h5_dribbling, wella.h5_curve, wella.h5_free_kick_accuracy, 
            wella.h5_long_passing, wella.h5_long_passing, wella.h5_ball_control, 
            wella.h5_acceleration, wella.h5_sprint_speed, wella.h5_agility, wella.h5_reactions, 
            wella.h5_balance, wella.h5_shot_power, wella.h5_jumping, wella.h5_stamina, 
            wella.h5_strength, wella.h5_long_shots, wella.h5_aggression, wella.h5_interceptions, 
            wella.h5_positioning, wella.h5_vision, wella.h5_penalties, wella.h5_marking, 
            wella.h5_standing_tackle, wella.h5_gk_diving, wella.h5_gk_kicking, 
            wella.h5_gk_positioning, wella.h5_gk_reflexes,

            wella.h6_player_api_id, pa.player_name as h6_player_name, pa.height as h6_height, pa.weight as h6_weight, 
            wella.h6_date, wella.h6_overall_rating, wella.h6_potential, wella.h6_preferred_foot, 
            wella.h6_attacking_work_rate, wella.h6_defensive_work_rate, wella.h6_crossing, 
            wella.h6_finishing, wella.h6_heading_accuracy, wella.h6_short_passing, 
            wella.h6_volleys, wella.h6_dribbling, wella.h6_curve, wella.h6_free_kick_accuracy, 
            wella.h6_long_passing, wella.h6_long_passing, wella.h6_ball_control, 
            wella.h6_acceleration, wella.h6_sprint_speed, wella.h6_agility, wella.h6_reactions, 
            wella.h6_balance, wella.h6_shot_power, wella.h6_jumping, wella.h6_stamina, 
            wella.h6_strength, wella.h6_long_shots, wella.h6_aggression, wella.h6_interceptions, 
            wella.h6_positioning, wella.h6_vision, wella.h6_penalties, wella.h6_marking, 
            wella.h6_standing_tackle, wella.h6_gk_diving, wella.h6_gk_kicking, 
            wella.h6_gk_positioning, wella.h6_gk_reflexes,

            wella.h7_player_api_id, pa.player_name as h7_player_name, pa.height as h7_height, pa.weight as h7_weight, 
            wella.h7_date, wella.h7_overall_rating, wella.h7_potential, wella.h7_preferred_foot, 
            wella.h7_attacking_work_rate, wella.h7_defensive_work_rate, wella.h7_crossing, 
            wella.h7_finishing, wella.h7_heading_accuracy, wella.h7_short_passing, 
            wella.h7_volleys, wella.h7_dribbling, wella.h7_curve, wella.h7_free_kick_accuracy, 
            wella.h7_long_passing, wella.h7_long_passing, wella.h7_ball_control, 
            wella.h7_acceleration, wella.h7_sprint_speed, wella.h7_agility, wella.h7_reactions, 
            wella.h7_balance, wella.h7_shot_power, wella.h7_jumping, wella.h7_stamina, 
            wella.h7_strength, wella.h7_long_shots, wella.h7_aggression, wella.h7_interceptions, 
            wella.h7_positioning, wella.h7_vision, wella.h7_penalties, wella.h7_marking, 
            wella.h7_standing_tackle, wella.h7_gk_diving, wella.h7_gk_kicking, 
            wella.h7_gk_positioning, wella.h7_gk_reflexes,

            wella.h8_player_api_id, pa.player_name as h8_player_name, pa.height as h8_height, pa.weight as h8_weight, 
            wella.h8_date, wella.h8_overall_rating, wella.h8_potential, wella.h8_preferred_foot, 
            wella.h8_attacking_work_rate, wella.h8_defensive_work_rate, wella.h8_crossing, 
            wella.h8_finishing, wella.h8_heading_accuracy, wella.h8_short_passing, 
            wella.h8_volleys, wella.h8_dribbling, wella.h8_curve, wella.h8_free_kick_accuracy, 
            wella.h8_long_passing, wella.h8_long_passing, wella.h8_ball_control, 
            wella.h8_acceleration, wella.h8_sprint_speed, wella.h8_agility, wella.h8_reactions, 
            wella.h8_balance, wella.h8_shot_power, wella.h8_jumping, wella.h8_stamina, 
            wella.h8_strength, wella.h8_long_shots, wella.h8_aggression, wella.h8_interceptions, 
            wella.h8_positioning, wella.h8_vision, wella.h8_penalties, wella.h8_marking, 
            wella.h8_standing_tackle, wella.h8_gk_diving, wella.h8_gk_kicking, 
            wella.h8_gk_positioning, wella.h8_gk_reflexes,

            wella.h9_player_api_id, pa.player_name as h9_player_name, pa.height as h9_height, pa.weight as h9_weight, 
            wella.h9_date, wella.h9_overall_rating, wella.h9_potential, wella.h9_preferred_foot, 
            wella.h9_attacking_work_rate, wella.h9_defensive_work_rate, wella.h9_crossing, 
            wella.h9_finishing, wella.h9_heading_accuracy, wella.h9_short_passing, 
            wella.h9_volleys, wella.h9_dribbling, wella.h9_curve, wella.h9_free_kick_accuracy, 
            wella.h9_long_passing, wella.h9_long_passing, wella.h9_ball_control, 
            wella.h9_acceleration, wella.h9_sprint_speed, wella.h9_agility, wella.h9_reactions, 
            wella.h9_balance, wella.h9_shot_power, wella.h9_jumping, wella.h9_stamina, 
            wella.h9_strength, wella.h9_long_shots, wella.h9_aggression, wella.h9_interceptions, 
            wella.h9_positioning, wella.h9_vision, wella.h9_penalties, wella.h9_marking, 
            wella.h9_standing_tackle, wella.h9_gk_diving, wella.h9_gk_kicking, 
            wella.h9_gk_positioning, wella.h9_gk_reflexes,

            wella.h10_player_api_id, pa.player_name as h10_player_name, pa.height as h10_height, pa.weight as h10_weight, 
            wella.h10_date, wella.h10_overall_rating, wella.h10_potential, wella.h10_preferred_foot, 
            wella.h10_attacking_work_rate, wella.h10_defensive_work_rate, wella.h10_crossing, 
            wella.h10_finishing, wella.h10_heading_accuracy, wella.h10_short_passing, 
            wella.h10_volleys, wella.h10_dribbling, wella.h10_curve, wella.h10_free_kick_accuracy, 
            wella.h10_long_passing, wella.h10_long_passing, wella.h10_ball_control, 
            wella.h10_acceleration, wella.h10_sprint_speed, wella.h10_agility, wella.h10_reactions, 
            wella.h10_balance, wella.h10_shot_power, wella.h10_jumping, wella.h10_stamina, 
            wella.h10_strength, wella.h10_long_shots, wella.h10_aggression, wella.h10_interceptions, 
            wella.h10_positioning, wella.h10_vision, wella.h10_penalties, wella.h10_marking, 
            wella.h10_standing_tackle, wella.h10_gk_diving, wella.h10_gk_kicking, 
            wella.h10_gk_positioning, wella.h10_gk_reflexes,

            h11.player_api_id as h11_player_api_id, pa.player_name as h11_player_name, pa.height as h11_height, pa.weight as h11_weight, 
            h11.date as h11_date, h11.overall_rating as h11_overall_rating, h11.potential as h11_potential, h11.preferred_foot as h11_preferred_foot, 
            h11.attacking_work_rate as h11_attacking_work_rate, h11.defensive_work_rate as h11_defensive_work_rate, h11.crossing as h11_crossing, 
            h11.finishing as h11_finishing, h11.heading_accuracy as h11_heading_accuracy, h11.short_passing as h11_short_passing, 
            h11.volleys as h11_volleys, h11.dribbling as h11_dribbling, h11.curve as h11_curve, h11.free_kick_accuracy as h11_free_kick_accuracy, 
            h11.long_passing as h11_long_passing, h11.long_passing as h11_long_passing, h11.ball_control as h11_ball_control, 
            h11.acceleration as h11_acceleration, h11.sprint_speed as h11_sprint_speed, h11.agility as h11_agility, h11.reactions as h11_reactions, 
            h11.balance as h11_balance, h11.shot_power as h11_shot_power, h11.jumping as h11_jumping, h11.stamina as h11_stamina, 
            h11.strength as h11_strength, h11.long_shots as h11_long_shots, h11.aggression as h11_aggression, h11.interceptions as h11_interceptions, 
            h11.positioning as h11_positioning, h11.vision as h11_vision, h11.penalties as h11_penalties, h11.marking as h11_marking, 
            h11.standing_tackle as h11_standing_tackle, h11.gk_diving as h11_gk_diving, h11.gk_kicking as h11_gk_kicking, 
            h11.gk_positioning as h11_gk_positioning, h11.gk_reflexes as h11_gk_reflexes
            
            FROM WELLA_10 as wella
            INNER JOIN Match as match on match.match_api_id = wella.match_api_id
            INNER JOIN Player as pa on pa.player_api_id = match.home_player_11
            INNER JOIN Player_Attributes as h11 on h11.player_api_id = match.home_player_11 AND h11.date < wella.date
            GROUP BY wella.match_api_id
            HAVING h11.date = MAX(h11.date);
            
  ------------------------------------------------
