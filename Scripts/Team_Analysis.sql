/* =========================================================
   Q26: Team with Largest Home Stadium Capacity
   ========================================================= */

SELECT t.team_name,
       s.name AS stadium,
       s.capacity
FROM teams t
JOIN stadiums s
     ON t.home_stadium = s.name
ORDER BY s.capacity::INT DESC
LIMIT 1;

/* =========================================================
   Q27: Teams from Each Country Participated in a Season
   ========================================================= */

SELECT m.season,
       t.country,
       t.team_name
FROM matches m
JOIN teams t
     ON m.home_team = t.team_name
GROUP BY m.season, t.country, t.team_name
ORDER BY m.season, t.country;

-- ============================================================
-- 28. Which team scored the most goals across home and away matches in a given season?
-- ============================================================

WITH home_goals AS (
    SELECT season, home_team AS team, home_team_score AS goals
    FROM matches
),
away_goals AS (
    SELECT season, away_team AS team, away_team_score AS goals
    FROM matches
),
all_goals AS (
    SELECT * FROM home_goals
    UNION ALL
    SELECT * FROM away_goals
)
SELECT 
    season,
    team,
    SUM(goals) AS total_goals
FROM all_goals
GROUP BY season, team
ORDER BY season, total_goals DESC;
/* =========================================================
   Q29: Number of Teams per City / Country
   ========================================================= */

SELECT s.country,
       s.city,
       COUNT(t.team_name) AS total_teams
FROM teams t
JOIN stadiums s
     ON t.home_stadium = s.name
GROUP BY s.country, s.city
ORDER BY total_teams DESC;

/* =========================================================
   Q30: Teams with Most Home Wins (2021-2022 Season)
   ========================================================= */

SELECT home_team AS team,
       COUNT(*) AS home_wins
FROM matches
WHERE season = '2021-2022'
  AND home_team_score > away_team_score
GROUP BY home_team
ORDER BY home_wins DESC;

