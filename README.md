# UEFA_SQL_Project
# ⚽ UEFA Data Analysis using SQL (PostgreSQL)

## 📌 Project Overview

This project focuses on analyzing UEFA football data using SQL in PostgreSQL. The goal is to extract meaningful insights about players, teams, matches, goals, and stadiums by performing structured queries on relational datasets.

The analysis helps in understanding football performance trends, team statistics, player contributions, and match outcomes across different seasons.

---

## 📂 Dataset Description

The project uses 5 datasets:

* **Goals** – Information about goals scored, assist players, and goal types
* **Matches** – Match details including teams, scores, attendance, and season
* **Players** – Player information such as nationality, position, height, and team
* **Teams** – Team details including country and home stadium
* **Stadiums** – Stadium details like location and capacity

These datasets were loaded into PostgreSQL and linked using common keys such as `MATCH_ID`, `PLAYER_ID`, and `TEAM_NAME`. 

---

## 🎯 Objective

The main objectives of this project are:

* Analyze goal-scoring patterns
* Evaluate team performance across seasons
* Study player contributions (goals, assists, positions)
* Understand match outcomes and attendance trends
* Perform multi-table analysis using SQL joins

---

## ⚙️ Approach

### 1. Data Import

* Imported CSV files into PostgreSQL using pgAdmin
* Created tables and defined appropriate data types

### 2. Data Processing

* Cleaned and structured data
* Established relationships between tables

### 3. SQL Querying

Used advanced SQL concepts such as:

* JOIN (INNER, LEFT)
* GROUP BY
* Aggregate functions (SUM, COUNT, AVG)
* Subqueries
* Filtering (WHERE, HAVING)

---

## 📊 Analysis Performed

### 🔹 Goal Analysis

* Top goal scorers per season
* Total goals per player
* Match-wise goal analysis
* Players with highest assists
* Average goals per match

### 🔹 Match Analysis

* Highest scoring matches
* Draw matches per season
* Team performance (home vs away)
* Penalty shootout analysis
* Attendance trends

### 🔹 Player Analysis

* Top performing players
* Goals + assists contribution
* Position-based statistics
* Players who never scored

### 🔹 Team Analysis

* Best performing teams
* Teams with most wins
* Country-wise team distribution

### 🔹 Stadium Analysis

* Largest stadiums
* Match distribution by stadium
* Attendance and capacity analysis

### 🔹 Cross-Table Analysis

* Combined insights using multiple tables
* Player performance in specific stadiums
* Team performance in high-attendance matches
* Complex business-style queries

---

## 📈 Key Outputs

* Identified top goal scorers and assisting players
* Found high-performing teams across seasons
* Analyzed match outcomes and attendance patterns
* Discovered relationships between stadium capacity and match performance
* Generated insights using complex SQL queries

---

## 🛠 Tools Used

* PostgreSQL
* pgAdmin
* SQL

---

## 📁 Files Included

* `analysis_queries.sql` – SQL queries used for analysis
* `database_backup.sql` – Full database backup (optional)
* Dataset files (CSV)

---

## 🚀 Conclusion

This project demonstrates the power of SQL in analyzing real-world sports data. By combining multiple datasets and applying advanced queries, meaningful insights were derived that can help in decision-making and performance evaluation.

---

## ⭐ Key Skills Demonstrated

* SQL Query Writing
* Data Analysis
* Relational Database Management
* Problem Solving
* Analytical Thinking

---

👉 This project is part of my Data Analytics portfolio.
