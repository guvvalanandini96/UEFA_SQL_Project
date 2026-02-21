/* =========================================================
   Q51: Average Goals by Each Team in First 30 Minutes
   ========================================================= */

SELECT team,
       AVG(goals_scored) AS avg_goals_first_30
FROM
(
    SELECT m.home_team AS team,
           COUNT(*) AS goals_scored
    FROM goals g
    JOIN matches m
         ON g.match_id = m.match_id
    WHERE g.duration <= 30
    GROUP BY m.home_team, g.match_id

    UNION ALL

    SELECT m.away_team AS team,
           COUNT(*) AS goals_scored
    FROM goals g
    JOIN matches m
         ON g.match_id = m.match_id
    WHERE g.duration <= 30
    GROUP BY m.away_team, g.match_id
) t
GROUP BY team
ORDER BY avg_goals_first_30 DESC;


/* =========================================================
   Q52: Stadium with Highest Average Score Difference
   ========================================================= */

SELECT stadium,
       AVG(ABS(home_team_score - away_team_score)) AS avg_score_diff
FROM matches
GROUP BY stadium
ORDER BY avg_score_diff DESC
LIMIT 1;
/* =========================================================
   Q53: Players Who Scored in Every Match They Played
   ========================================================= */

SELECT g.pid AS player_id
FROM goals g
GROUP BY g.pid
HAVING COUNT(DISTINCT g.match_id) =
(
    SELECT COUNT(DISTINCT match_id)
    FROM goals g2
    WHERE g2.pid = g.pid
);

-- ============================================================
-- 54. Which teams won the most matches with a goal difference 
--    of 3 or more in the 2021-2022 season?
-- ============================================================

WITH match_results AS (
    SELECT 
        home_team AS team,
        home_team_score AS goals_scored,
        away_team_score AS goals_conceded,
        (home_team_score - away_team_score) AS goal_diff
    FROM matches
    WHERE season = '2021-2022'

    UNION ALL

    SELECT 
        away_team AS team,
        away_team_score AS goals_scored,
        home_team_score AS goals_conceded,
        (away_team_score - home_team_score) AS goal_diff
    FROM matches
    WHERE season = '2021-2022'
),
big_wins AS (
    SELECT 
        team,
        COUNT(*) AS wins_by_3_or_more
    FROM match_results
    WHERE goal_diff >= 3
    GROUP BY team
)
SELECT 
    team,
    wins_by_3_or_more
FROM big_wins
ORDER BY wins_by_3_or_more DESC;


/* =========================================================
   Q55: Player with Highest Goals per Match Ratio
   Country: Brazil
   ========================================================= */

SELECT p.player_id,
       p.first_name,
       p.last_name,
       COUNT(g.goal_id)::FLOAT /
       COUNT(DISTINCT g.match_id) AS goals_per_match
FROM players p
JOIN goals g
     ON p.player_id = g.pid
WHERE p.nationality = 'Brazil'
GROUP BY p.player_id, p.first_name, p.last_name
ORDER BY goals_per_match DESC
LIMIT 1;
