SELECT * 
FROM PersonsChange pc;

IF(
    pc.personId EXIST(
        SELECT *
        FROM Persons p;
    )
)
begin
  UPDATE Persons p
     SET p.personId = pc.personId, p.name = pc.name, p.address = pc.address, p.salary = pc.salary,p.canBePlayer= FALSE, p.canBeCoach = FALSE
     WHERE p.personId = pc.personId;
end;

ELSE
begin
  insert into Persons p (p.personId,p.name,p.address, p.salary,p.canBePlayer,p.canBeCoach)
  VALUES (pc.personId,pc.name,pc.address,pc.salary,TRUE,NULL);
end;
