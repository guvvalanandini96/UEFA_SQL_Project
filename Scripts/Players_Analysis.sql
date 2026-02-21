/* =========================================================
   Q18: Players with Highest Total Goals (Including Assists)
   ========================================================= */

SELECT p.player_id,
       p.first_name,
       p.last_name,
       COUNT(g.goal_id) +
       COUNT(g.assist) AS total_contributions
FROM players p
LEFT JOIN goals g
       ON p.player_id = g.pid
       OR p.player_id = g.assist
GROUP BY p.player_id, p.first_name, p.last_name
ORDER BY total_contributions DESC;
/* =========================================================
   Q19: Average Height and Weight of Players per Position
   ========================================================= */

SELECT position,
       AVG(height) AS avg_height,
       AVG(weight) AS avg_weight
FROM players
GROUP BY position
ORDER BY position;

/* =========================================================
   Q20: Player with Most Goals Scored Using Left Foot
   ========================================================= */

SELECT p.player_id,
       p.first_name,
       p.last_name,
       COUNT(*) AS total_goals
FROM goals g
JOIN players p
     ON g.pid = p.player_id
WHERE p.foot = 'L'
GROUP BY p.player_id, p.first_name, p.last_name
ORDER BY total_goals DESC
LIMIT 1;

/* =========================================================
   Q21: Average Age of Players per Team
   ========================================================= */

SELECT team,
       AVG(EXTRACT(YEAR FROM CURRENT_DATE) -
           EXTRACT(YEAR FROM dob)) AS avg_age
FROM players
GROUP BY team
ORDER BY avg_age DESC;

/* =========================================================
   Q22: Number of Players Listed per Team
   ========================================================= */

SELECT team,
       COUNT(*) AS total_players
FROM players
GROUP BY team
ORDER BY total_players DESC;

/* =========================================================
   Q23: Player Played Most Matches in Each Season
   ========================================================= */

SELECT m.season,
       g.pid AS player_id,
       COUNT(DISTINCT g.match_id) AS matches_played
FROM goals g
JOIN matches m
     ON g.match_id = m.match_id
GROUP BY m.season, g.pid
ORDER BY m.season, matches_played DESC;

/* =========================================================
   Q24: Most Common Position Across All Teams
   ========================================================= */

SELECT position,
       COUNT(*) AS total_players
FROM players
GROUP BY position
ORDER BY total_players DESC
LIMIT 1;

/* =========================================================
   Q25: Players Who Have Never Scored a Goal
   ========================================================= */

SELECT p.player_id,
       p.first_name,
       p.last_name
FROM players p
LEFT JOIN goals g
       ON p.player_id = g.pid
WHERE g.goal_id IS NULL;

