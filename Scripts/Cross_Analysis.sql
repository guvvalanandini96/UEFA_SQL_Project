/* =========================================================
   Q38: Players Scoring Most Goals at a Specific Stadium
   Example Stadium: Wembley Stadium
   ========================================================= */

SELECT p.player_id,
       p.first_name,
       p.last_name,
       COUNT(*) AS total_goals
FROM goals g
JOIN matches m
     ON g.match_id = m.match_id
JOIN players p
     ON g.pid = p.player_id
WHERE m.stadium = 'Wembley Stadium'   -- change stadium
GROUP BY p.player_id, p.first_name, p.last_name
ORDER BY total_goals DESC;

/* =========================================================
   Q39: Team with Most Home Wins (2021-2022)
   ========================================================= */

SELECT home_team AS team,
       COUNT(*) AS home_wins
FROM matches
WHERE season = '2021-2022'
  AND home_team_score > away_team_score
GROUP BY home_team
ORDER BY home_wins DESC
LIMIT 1;

-- ============================================================
-- 40. Which players played for a team that scored the most 
--    goals in the 2021-2022 season?
-- ============================================================

WITH home_goals AS (
    SELECT home_team AS team, home_team_score AS goals
    FROM matches
    WHERE season = '2021-2022'
),
away_goals AS (
    SELECT away_team AS team, away_team_score AS goals
    FROM matches
    WHERE season = '2021-2022'
),
all_goals AS (
    SELECT * FROM home_goals
    UNION ALL
    SELECT * FROM away_goals
),
team_totals AS (
    SELECT 
        team,
        SUM(goals) AS total_goals
    FROM all_goals
    GROUP BY team
    ORDER BY total_goals DESC
    LIMIT 1
)
SELECT 
    p.player_id,
    p.first_name,
    p.last_name,
    p.position,
    p.nationality,
    t.team,
    t.total_goals
FROM players p
JOIN team_totals t ON p.team = t.team
ORDER BY p.position;

/* =========================================================
   Q41: Goals by Home Teams with Attendance > 50,000
   ========================================================= */

SELECT SUM(home_team_score) AS total_goals
FROM matches
WHERE attendance > 50000;

/* =========================================================
   Q42: Players in Matches with Highest Score Difference
   ========================================================= */

SELECT DISTINCT p.player_id,
       p.first_name,
       p.last_name
FROM goals g
JOIN matches m
     ON g.match_id = m.match_id
JOIN players p
     ON g.pid = p.player_id
WHERE ABS(home_team_score - away_team_score) =
(
    SELECT MAX(ABS(home_team_score - away_team_score))
    FROM matches
);

/* =========================================================
   Q43: Goals Scored in Penalty Shootout Matches
   ========================================================= */

SELECT COUNT(*) AS total_goals
FROM goals g
JOIN matches m
     ON g.match_id = m.match_id
WHERE m.penalty_shoot_out = 1;


/* =========================================================
   Q44: Home Wins vs Away Wins by Country
   ========================================================= */

SELECT s.country,
       SUM(CASE WHEN home_team_score > away_team_score THEN 1 ELSE 0 END) AS home_wins,
       SUM(CASE WHEN home_team_score < away_team_score THEN 1 ELSE 0 END) AS away_wins
FROM matches m
JOIN stadiums s
     ON m.stadium = s.name
GROUP BY s.country
ORDER BY s.country;

/* =========================================================
   Q45: Team Scoring Most Goals in Highest Attendance Matches
   ========================================================= */

SELECT team,
       SUM(goals) AS total_goals
FROM
(
    SELECT home_team AS team,
           home_team_score AS goals,
           attendance
    FROM matches

    UNION ALL

    SELECT away_team,
           away_team_score,
           attendance
    FROM matches
) t
WHERE attendance =
(
    SELECT MAX(attendance) FROM matches
)
GROUP BY team
ORDER BY total_goals DESC;

/* =========================================================
   Q46: Top 3 Players Assisting in Losing Matches
   ========================================================= */

SELECT p.player_id,
       p.first_name,
       p.last_name,
       COUNT(*) AS assists
FROM goals g
JOIN matches m
     ON g.match_id = m.match_id
JOIN players p
     ON g.assist = p.player_id
WHERE
(
    (p.team = m.home_team AND m.home_team_score < m.away_team_score)
    OR
    (p.team = m.away_team AND m.away_team_score < m.home_team_score)
)
GROUP BY p.player_id, p.first_name, p.last_name
ORDER BY assists DESC
LIMIT 3;

/* =========================================================
   Q47: Total Goals Scored by Defenders
   ========================================================= */

SELECT COUNT(*) AS defender_goals
FROM goals g
JOIN players p
     ON g.pid = p.player_id
WHERE p.position = 'Defender';

/* =========================================================
   Q48: Players Scoring in Stadiums Capacity > 60,000
   ========================================================= */

SELECT DISTINCT p.player_id,
       p.first_name,
       p.last_name
FROM goals g
JOIN matches m
     ON g.match_id = m.match_id
JOIN stadiums s
     ON m.stadium = s.name
JOIN players p
     ON g.pid = p.player_id
WHERE s.capacity::INT > 60000;

/* =========================================================
   Q48: Players Scoring in Stadiums Capacity > 60,000
   ========================================================= */

SELECT DISTINCT p.player_id,
       p.first_name,
       p.last_name
FROM goals g
JOIN matches m
     ON g.match_id = m.match_id
JOIN stadiums s
     ON m.stadium = s.name
JOIN players p
     ON g.pid = p.player_id
WHERE s.capacity::INT > 60000;

/* =========================================================
   Q49: Goals Scored in Matches Played in Specific Cities
   Example: London
   ========================================================= */

SELECT s.city,
       COUNT(*) AS total_goals
FROM goals g
JOIN matches m
     ON g.match_id = m.match_id
JOIN stadiums s
     ON m.stadium = s.name
WHERE s.city = 'London'
GROUP BY s.city;

/* =========================================================
   Q50: Players Scoring in Matches Attendance > 100,000
   ========================================================= */

SELECT DISTINCT p.player_id,
       p.first_name,
       p.last_name
FROM goals g
JOIN matches m
     ON g.match_id = m.match_id
JOIN players p
     ON g.pid = p.player_id
WHERE m.attendance > 100000;

