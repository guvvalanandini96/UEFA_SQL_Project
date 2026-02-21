/1.*Player who scored most goals in each season */
SELECT m.season,
       g.pid AS player_id,
       COUNT(*) AS total_goals
FROM goals g
JOIN matches m
  ON g.match_id = m.match_id
GROUP BY m.season, g.pid
ORDER BY m.season, total_goals DESC;



/2.* Goals scored by each player in a given season */
SELECT m.season,
       g.pid AS player_id,
       COUNT(*) AS goals_scored
FROM goals g
JOIN matches m
  ON g.match_id = m.match_id
WHERE m.season = '2021-2022'
GROUP BY m.season, g.pid
ORDER BY goals_scored DESC;

/3.* Total goals in match ‘mt403’ */
SELECT COUNT(*) AS total_goals
FROM goals
WHERE match_id = 'mt403';

/4.* Player who assisted most goals in each season*/
SELECT m.season,
       g.assist AS player_id,
       COUNT(*) AS total_assists
FROM goals g
JOIN matches m
  ON g.match_id = m.match_id
GROUP BY m.season, g.assist
ORDER BY m.season, total_assists DESC;

/5.* Players who scored in more than 10 matches */
SELECT pid AS player_id,
       COUNT(DISTINCT match_id) AS matches_scored
FROM goals
GROUP BY pid
HAVING COUNT(DISTINCT match_id) > 10;

/6.* Average goals per match in a season */ 
SELECT m.season,
       AVG(goal_count) AS avg_goals_per_match
FROM (
    SELECT match_id,
           COUNT(*) AS goal_count
    FROM goals
    GROUP BY match_id
) g
JOIN matches m
  ON g.match_id = m.match_id
GROUP BY m.season;

/ 7.* Player with most goals in a single match */
SELECT pid AS player_id,
       match_id,
       COUNT(*) AS goals_scored
FROM goals
GROUP BY pid, match_id
ORDER BY goals_scored DESC
LIMIT 1;

/8.* Team that scored most goals in all seasons */
SELECT m.home_team AS team,
       COUNT(*) AS total_goals
FROM goals g
JOIN matches m
  ON g.match_id = m.match_id
GROUP BY m.home_team
ORDER BY total_goals DESC;

SELECT p.team,
       COUNT(*) AS total_goals
FROM goals g
JOIN players p
  ON g.pid = p.player_id
GROUP BY p.team
ORDER BY total_goals DESC;

/9.* Stadium hosting most goals in a season */
SELECT m.season,
       m.stadium,
       COUNT(*) AS total_goals
FROM goals g
JOIN matches m
  ON g.match_id = m.match_id
GROUP BY m.season, m.stadium
ORDER BY m.season, total_goals DESC;

