SELECT *
FROM Match;


-- funziona ma ha bisogno del parametro element.date
SELECT *, pa1.acceleration as away_player_1_accelleration
FROM Match
JOIN
    (SELECT *
    FROM Player_Attributes as pa
    INNER JOIN
        (SELECT id, player_api_id, MAX(date) as max_date
        FROM Player_Attributes
        WHERE date < ${element.date}
        GROUP BY player_api_id) as pa_max
    ON pa.id = pa_max.id) as pa1
    ON Match.away_player_1 = pa1.player_api_id;


-- non funziona perché manca match date, bisognerebbe ciclare e passargliela
SELECT *, player.acceleration as away_player_1_accelleration
FROM Match as match
JOIN (SELECT *, MAX(date) as max_date
        FROM Player_Attributes
        WHERE date < match.date
        GROUP BY player_api_id) as player
    ON Match.away_player_1 = player.player_api_id;

