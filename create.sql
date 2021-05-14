DROP SCHEMA Lab1
CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE Persons
(
    personID INTEGER,
    name VARCHAR(30),
    address VARCHAR(50),
    salary NUMERIC(7,2),
    canBePlayer BOOLEAN,
    canBeCoach BOOLEAN,
    PRIMARY KEY (personID)
);
CREATE TABLE Teams
(
    teamID INTEGER,
    name VARCHAR(30),
    coachID INTEGER,
    teamCity VARCHAR(30),
    teamColor CHAR(6),
    totalWins INTEGER,
    totalLosses INTEGER,
    PRIMARY KEY (teamID),
    FOREIGN KEY (coachID) REFERENCES Persons(personID)
);
CREATE TABLE Players
(
    playerID INTEGER,
    teamID INTEGER,
    joinDate DATE,
    rating CHAR(1),
    isStarter BOOLEAN,
    PRIMARY KEY (playerID),
    FOREIGN KEY (playerID) REFERENCES Persons(personID),
    FOREIGN KEY (teamID) REFERENCES Teams(teamID)

);
CREATE TABLE Games
(
    gameID INTEGER,
    gameDate DATE,
    homeTeam INTEGER,
    visitorTeam INTEGER,
    homePoints INTEGER,
    visitorPoints INTEGER,
    PRIMARY KEY (gameID),
    FOREIGN KEY (homeTeam) REFERENCES Teams (teamID),
    FOREIGN KEY (visitorTeam) REFERENCES Teams (teamID)
);

CREATE TABLE GamePlayers
(
    gameID INTEGER,
    playerID INTEGER,
    minutesPlayed INTEGER,
    PRIMARY KEY (gameID,playerID),
    FOREIGN KEY (gameID) REFERENCES Games (gameID),
    FOREIGN KEY (playerID) REFERENCES Players(playerID)
);
