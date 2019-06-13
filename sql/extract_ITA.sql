
-- get only Italian Serie A
CREATE TABLE IF NOT EXISTS Match_ITA AS
    SELECT * FROM Match
    WHERE league_id = 10257;

-- get only Serie A players
CREATE TABLE IF NOT EXISTS Player_ITA AS
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

CREATE TABLE IF NOT EXISTS Player_Attributes_ITA AS
SELECT pa.*
FROM Player_Attributes as pa
WHERE pa.player_api_id IN (
	SELECT DISTINCT player_api_id
	FROM Player_ITA
);

CREATE TABLE IF NOT EXISTS Team_ITA AS
SELECT t.*
FROM Team as t
WHERE t.team_api_id IN (
	SELECT DISTINCT home_team_api_id as team_id FROM Match_ITA
	UNION ALL
	SELECT DISTINCT away_team_api_id as team_id FROM Match_ITA
);

CREATE TABLE IF NOT EXISTS Team_Attributes_ITA AS
SELECT ta.*
FROM Team_Attributes as ta
WHERE ta.team_api_id IN (
	SELECT DISTINCT team_api_id
	FROM Team_ITA
);