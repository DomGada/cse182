SELECT DISTINCT t.teamID as team1, t.teamCity as team1City, t1.teamID as team2, t1.teamCity as team2City
FROM Games g, Teams t, Teams t1
WHERE g.homeTeam = t.teamID
AND g.visitorTeam = t1.teamID
AND g.homePoints > g.visitorPoints
AND 
t.teamID NOT IN (SELECT g1.visitorTeam
FROM Games g1
WHERE g1.homeTeam = g.visitorTeam AND g1.visitorTeam = g.homeTeam
AND g1.homePoints > g1.visitorPoints
)