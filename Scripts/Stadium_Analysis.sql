/* =========================================================
   Q31: Stadium with Highest Capacity
   ========================================================= */

SELECT name AS stadium,
       capacity
FROM stadiums
ORDER BY capacity::INT DESC
LIMIT 1;

/* =========================================================
   Q32: Number of Stadiums in Russia or London
   ========================================================= */

SELECT COUNT(*) AS total_stadiums
FROM stadiums
WHERE country = 'Russia'
   OR city = 'London';
/* =========================================================
   Q33: Stadium Hosted Most Matches in Each Season
   ========================================================= */

SELECT season,
       stadium,
       COUNT(*) AS total_matches
FROM matches
GROUP BY season, stadium
ORDER BY season, total_matches DESC;

/* =========================================================
   Q34: Average Stadium Capacity per Season
   ========================================================= */

SELECT m.season,
       AVG(s.capacity::INT) AS avg_capacity
FROM matches m
JOIN stadiums s
     ON m.stadium = s.name
GROUP BY m.season
ORDER BY m.season;

/* =========================================================
   Q35: Teams Playing in Stadiums with Capacity > 50,000
   ========================================================= */

SELECT t.team_name,
       s.name AS stadium,
       s.capacity
FROM teams t
JOIN stadiums s
     ON t.home_stadium = s.name
WHERE s.capacity::INT > 50000;

/* =========================================================
   Q36: Stadium with Highest Average Attendance
   ========================================================= */

SELECT stadium,
       AVG(attendance) AS avg_attendance
FROM matches
GROUP BY stadium
ORDER BY avg_attendance DESC
LIMIT 1;

/* =========================================================
   Q37: Distribution of Stadium Capacities by Country
   ========================================================= */

SELECT country,
       COUNT(*) AS total_stadiums,
       AVG(capacity::INT) AS avg_capacity
FROM stadiums
GROUP BY country
ORDER BY avg_capacity DESC;


