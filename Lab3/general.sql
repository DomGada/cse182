ALTER TABLE GamePlayers
ADD CONSTRAINT reasonable_time CHECK (minutesPlayed >= 0);

ALTER TABLE Players
ADD CONSTRAINT legal_rating CHECK (rating = 'L' OR rating = 'M' OR rating = 'H' OR rating IS NULL);

ALTER TABLE Games
ADD CONSTRAINT null_twice CHECK ((homePoints IS NULL AND visitorPoints IS NULL) OR (homePoints IS NOT NULL AND visitorPoints IS NOT NULL));
