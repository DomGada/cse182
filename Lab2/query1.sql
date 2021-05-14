SELECT p1.name, p1.address, p1.salary
FROM Persons p1
WHERE p1.personID IN (SELECT coachID
FROM Teams) AND p1.personID IN (SELECT playerID FROM Players);