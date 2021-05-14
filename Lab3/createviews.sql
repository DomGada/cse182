CREATE VIEW WinsDisagree AS
    SELECT t.teamID, t.teamName, t.totalWins, count(*) as computedWins
    FROM Teams t
    WHERE
    t.totalWins != count( 
        SELECT *
        FROM Games g
        WHERE
        (t.teamID = g.homeTeam
        AND 
        g.homePoints > g.visitorPoints
        )
        OR
        (t.teamID = g.visitorTeam
        AND
        g.visitorPoints > g.homePoints
        )
    )
    GROUP BY t.teamID;   


CREATE VIEW LosesDisagree AS
    SELECT t1.teamID, t1.teamName, t1.totalWins, count(*) as computedLosses
    FROM Teams t1
    WHERE
    t1.totalWins != count(
        SELECT *
        FROM Games g1
        WHERE
        (t1.teamID = g1.homeTeam
        AND 
        g1.homePoints > g1.visitorPoints
        )
        OR
        (t1.teamID = g1.visitorTeam
        AND
        g1.visitorPoints < g1.homePoints
        )
    )
    GROUP BY t1.teamID

    