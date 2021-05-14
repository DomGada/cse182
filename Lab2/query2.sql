
SELECT DISTINCT p.name
FROM Persons p
WHERE
p.personID IN
(SELECT t1.coachID
FROM Teams t1,Teams t2
WHERE
t1.teamID IN(
    SELECT g.homeTeam
    FROM Games g 
    WHERE
    g.homeTeam = t1.teamID
    AND
    g.visitorTeam = t2.teamID
    AND
    g.homePoints > g.visitorPoints
    AND 
    t2.teamColor = 'red'
)
OR
t1.teamID IN(
    SELECT g1.visitorTeam
    FROM Games g1 
    WHERE
    g1.visitorTeam = t1.teamID
    AND
    g1.homeTeam = t2.teamID
    AND
    g1.homePoints < g1.visitorPoints
    AND 
    t2.teamColor = 'red'
))