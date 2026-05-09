SELECT COUNT(*) FROM terrorism_final;


--> Top 10 years with most attacks
SELECT year, COUNT(*) as count_attacks FROM terrorism_final
GROUP BY year
ORDER BY count_attacks DESC
LIMIT 20;

--> Top countries with the worst hit by number of people killed or wounded
SELECT year, SUM(casualties) AS total_casualties
FROM terrorism_final
GROUP BY year
ORDER BY total_casualties DESC
LIMIT 20;

--> monthly distribution of terrorist attacks
SELECT month,
       COUNT(*) AS total_attacks,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM terrorism_final), 2) AS pct
FROM terrorism_final
WHERE month != 0
GROUP BY month
ORDER BY month;

--> terrorist attacks over the decades
SELECT
    CASE
        WHEN year BETWEEN 1970 AND 1979 THEN '1970s'
        WHEN year BETWEEN 1980 AND 1989 THEN '1980s'
        WHEN year BETWEEN 1990 AND 1999 THEN '1990s'
        WHEN year BETWEEN 2000 AND 2009 THEN '2000s'
        ELSE '2010s'
    END AS decade,
    COUNT(*) AS total_attacks,
    SUM(COALESCE(casualties, 0)) AS total_killed,
    ROUND(AVG(COALESCE(casualties, 0)), 2) AS avg_killed_per_attack
FROM terrorism_final
GROUP BY decade
ORDER BY decade;


