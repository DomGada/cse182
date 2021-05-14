SELECT p.personID, p.name, p.salary
FROM Persons p
WHERE 
p.canBePlayer = 't'
AND
(SELECT COUNT(g.playerID) FROM GamePlayers g WHERE
    p.personID = g.playerID
) = 0
ORDER BY p.name DESC, p.salary ASC;