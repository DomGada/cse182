SELECT DISTINCT p.name, pl.joinDate
FROM Persons p, Players pl
WHERE pl.teamID IN (SELECT team.teamID
                FROM Teams team
                WHERE pl.teamID = team.teamID AND team.teamCity <> 'New York')
        AND pl.playerID = p.personID
        AND p.salary > 78765.43
        AND pl.isStarter = true
        AND pl.joinDate <= '20190131'
        AND p.name LIKE '%er%'