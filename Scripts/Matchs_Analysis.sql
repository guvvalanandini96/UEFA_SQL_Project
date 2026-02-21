/* =========================================================
   Q10: Highest-Scoring Match in a Particular Season
   ========================================================= */

SELECT season,
       match_id,
       home_team,
       away_team,
       (home_team_score + away_team_score) AS total_goals
FROM matches
WHERE season = '2021-2022'   -- change season if needed
ORDER BY total_goals DESC
LIMIT 1;

/* =========================================================
   Q11: Number of Matches Ended in a Draw in a Given Season
   ========================================================= */

SELECT season,
       COUNT(*) AS draw_matches
FROM matches
WHERE season = '2021-2022'
  AND home_team_score = away_team_score
GROUP BY season;

WITH home_scores AS (
    SELECT home_team AS team, home_team_score AS score
    FROM matches
    WHERE season = '2021-2022'
),
away_scores AS (
    SELECT away_team AS team, away_team_score AS score
    FROM matches
    WHERE season = '2021-2022'
),
all_scores AS (
    SELECT * FROM home_scores
    UNION ALL
    SELECT * FROM away_scores
)
SELECT team, AVG(score) AS avg_score
FROM all_scores
GROUP BY team
ORDER BY avg_score DESC
LIMIT 1;

/* =========================================================
   Q13: Number of Penalty Shootouts in Each Season
   ========================================================= */

SELECT season,
       COUNT(*) AS penalty_shootouts
FROM matches
WHERE penalty_shoot_out = 1
GROUP BY season
ORDER BY season;

/* =========================================================
   Q14: Average Attendance for Home Teams (2021-2022)
   ========================================================= */

SELECT season,
       AVG(attendance) AS avg_home_attendance
FROM matches
WHERE season = '2021-2022'
GROUP BY season;

/* =========================================================
   Q15: Stadium Hosting Most Matches in Each Season
   ========================================================= */

SELECT season,
       stadium,
       COUNT(*) AS total_matches
FROM matches
GROUP BY season, stadium
ORDER BY season, total_matches DESC;

/* =========================================================
   Q16: Distribution of Matches Played in Different Countries
   ========================================================= */

SELECT m.season,
       s.country,
       COUNT(*) AS total_matches
FROM matches m
JOIN stadiums s
  ON m.stadium = s.name
GROUP BY m.season, s.country
ORDER BY m.season, total_matches DESC;

/* =========================================================
   Q17: Most Common Match Result (Home Win / Away Win / Draw)
   ========================================================= */

SELECT result,
       COUNT(*) AS total_matches
FROM (
    SELECT
        CASE
            WHEN home_team_score > away_team_score THEN 'Home Win'
            WHEN home_team_score < away_team_score THEN 'Away Win'
            ELSE 'Draw'
        END AS result
    FROM matches
) t
GROUP BY result
ORDER BY total_matches DESC;




