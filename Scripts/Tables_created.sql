CREATE TABLE goals (
    goal_id VARCHAR PRIMARY KEY,
    match_id VARCHAR,
    pid VARCHAR,
    duration INT,
    assist VARCHAR,
    goal_desc VARCHAR
);

CREATE TABLE matches (
    match_id VARCHAR PRIMARY KEY,
    season VARCHAR,
    date DATE,
    home_team VARCHAR,
    away_team VARCHAR,
    stadium VARCHAR,
    home_team_score INT,
    away_team_score INT,
    penalty_shoot_out INT,
    attendance INT
);

CREATE TABLE players (
    player_id VARCHAR PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    nationality VARCHAR,
    dob DATE,
    team VARCHAR,
    jersey_number FLOAT,
    position VARCHAR,
    height FLOAT,
    weight FLOAT,
    foot VARCHAR
);



CREATE TABLE stadiums (
    name VARCHAR,
    city VARCHAR,
    country VARCHAR,
    capacity VARCHAR
);


CREATE TABLE teams (
    team_name VARCHAR PRIMARY KEY,
    country VARCHAR,
    home_stadium VARCHAR
);
