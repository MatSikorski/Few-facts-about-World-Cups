
-- 1st hypotesis --

SELECT YEAR, COUNT(ROUND) AS Number_of_matches, SUM(homegoals + awaygoals) AS Scored_goals, SUM(homegoals + awaygoals)/COUNT(ROUND) AS Avg_goals_on_match  
FROM worldcup
GROUP BY YEAR


-- 2nd hypotesis --


-- As host -- 


SELECT Year, country AS host, count(winner) AS Group_matches_won
FROM worldcup 
WHERE (HomeTeam = country OR AwayTeam = country)
AND (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
AND winner = country
GROUP BY YEAR

-- command --

SELECT Year, country AS host, count(winner) AS Group_matches_played
FROM worldcup 
WHERE (HomeTeam = country OR AwayTeam = country)
AND (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
GROUP BY YEAR

-- command --

SELECT Year, country AS host, ROUND, count(country) AS Play_off_matches_won
FROM worldcup 
WHERE (HomeTeam = country OR AwayTeam = country)
AND (round LIKE '%final%' OR round LIKE '%Round of 16%' OR round LIKE '%Group 6%' OR round LIKE '%Third place%')
AND winner = country
GROUP BY YEAR

-- command --

SELECT Year, country AS host, ROUND, count(country) AS Play_off_matches_plays
FROM worldcup 
WHERE (HomeTeam = country OR AwayTeam = country)
AND (round LIKE '%final%' OR round LIKE '%Round of 16%' OR round LIKE '%Group 6%' OR round LIKE '%Third place%')
GROUP BY YEAR


-- As guest -- 


SELECT winner, COUNT(winner) AS Group_matches_won
FROM worldcup
WHERE winner <> country
AND (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
GROUP BY winner

-- command --

SELECT team, SUM(list_group_matches_played_as_guest) AS Group_matches_played_as_guest
FROM (
SELECT homeTeam AS team, COUNT(winner) AS list_group_matches_played_as_guest 
FROM worldcup 
WHERE (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
AND hometeam <> country
GROUP BY team
UNION ALL
SELECT awayTeam AS team, COUNT(winner) AS list_group_matches_played_as_guest
FROM worldcup 
WHERE (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
AND awayteam <> country
GROUP BY team) AS Group_matches_played
GROUP BY team
ORDER BY Group_matches_played_as_guest DESC


-- 3rd hypotesis --


SELECT continent, COUNT(winner) AS MatchesWon
FROM worldcup
JOIN continents
ON worldcup.winner = continents.country
WHERE (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
and worldcup.year = 1930
GROUP BY continent
ORDER BY MatchesWon DESC

-- command --

SELECT continent, COUNT(winner) AS MatchesWon
FROM worldcup
JOIN continents
ON worldcup.winner = continents.country
WHERE (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
GROUP BY continent
ORDER BY MatchesWon DESC


-- 4rd hypotesis --


SELECT team, SUM(list_draws) AS draws
FROM (
SELECT homeTeam AS team, COUNT(winner) AS list_draws 
FROM worldcup 
WHERE winner = 'draw'
AND (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
GROUP BY team
UNION ALL
SELECT awayTeam AS team, COUNT(winner) AS list_draws
FROM worldcup 
WHERE winner = 'draw'
AND (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
GROUP BY team) AS dssd
GROUP BY team
ORDER BY draws DESC

-- command --

SELECT team, SUM(group_matches) AS all_group_matches
FROM (
SELECT homeTeam AS team, COUNT(winner) AS group_matches
FROM worldcup 
WHERE (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
GROUP BY team
UNION ALL
SELECT awayTeam AS team, COUNT(winner) AS group_matches
FROM worldcup 
WHERE (round LIKE '%group%' OR round LIKE '%preliminary%' OR round LIKE '%first round%')
GROUP BY team) AS group_matches_played
GROUP BY team
ORDER BY all_group_matches DESC


