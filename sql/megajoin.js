

var result = [];
var allMatches = Query("SELECT Id, Date FROM Matches");


allMatches.forEach(function(element){

    var playerScores = 
        Query(`
            SELECT * 
            FROM Player_Attributes as pa
            INNER JOIN
                (SELECT id, player_api_id, MAX(date) as max_date
                FROM Player_Attributes
                WHERE date < ${element.date}
                GROUP BY player_api_id) as pa_max
            ON pa.id = pa_max.id
        `);

    var joinedRow = 
        Query(`
            SELECT *
            FROM Matches as match
            JOIN ${playerScores} as p1 on match.P1 = p1.Id
            JOIN ${playerScores} as p2 on match.P2 = p2.Id
            JOIN ${playerScores} as p3 on match.P3 = p3.Id
            ...
            WHERE match.Id = ${element.id}
        `);

    result.push(joinedRow);

});