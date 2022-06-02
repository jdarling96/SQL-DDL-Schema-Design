DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE leagues
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

CREATE TABLE soccer 
(
    league_id INTEGER REFERENCES leagues (id),
    team TEXT PRIMARY KEY,
    wins INTEGER

);

CREATE TABLE players 
(
    id SERIAL PRIMARY KEY,
    player TEXT UNIQUE,
    team TEXT REFERENCES soccer (team)

);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE matches 
(
    match_id SERIAL PRIMARY KEY,
    team1 TEXT REFERENCES soccer (team), 
    team2 TEXT REFERENCES soccer (team),
    referee_id INTEGER REFERENCES referees (id),
    winning_team TEXT REFERENCES soccer (team) 
);

CREATE TABLE goals 
(
    match_id INTEGER REFERENCES matches (match_id),
    team TEXT REFERENCES soccer (team),
    player_ID INTEGER REFERENCES players (id),
    goals INTEGER NOT NULL  
);

INSERT INTO leagues(name,start_date,end_date) 
VALUES('Soccer','2020-01-01','2021-01-01');

INSERT INTO soccer(league_id,team) 
VALUES(1,'Firebirds'),(1,'Wildcats'),
(1,'Panthers'),(1,'Ravens');

INSERT INTO players (player,team) VALUES('Nicolas Osborne','Firebirds'),('Aaron Thornton','Firebirds'),
('Melvin Mendoza','Firebirds'),('Angelo Mitchell','Wildcats'),
('Harriet Price','Wildcats'),('Jake Watkins','Wildcats'),
('Wilbert Stevenson','Ravens'),('Debbie Lowe','Ravens'),('Jeannie Shelto','Ravens');

INSERT INTO referees (name) VALUES ('Josh'),('Mikey');



INSERT INTO matches (team1,team2,referee_id,winning_team) 
VALUES ('Wildcats','Firebirds',1,'Firebirds'),
('Ravens','Firebirds',2,'Ravens'),
('Wildcats','Ravens',1,'Wildcats');



INSERT INTO goals (match_id, team, player_id,goals) 
VALUES (3,'Wildcats', 5, 10),(3,'Firebirds',2,6);



--select * from matches;