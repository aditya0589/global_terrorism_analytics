--> Total number of attacks by each region
SELECT 
    region, 
    COUNT(*) AS attacks
FROM terrorism_final
GROUP BY region;

--> Top 10 regions with the highest attacks
SELECT 
    region,
    COUNT(*) as attacks
FROM terrorism_final
GROUP BY region
ORDER BY attacks DESC
LIMIT 10;

-->  Top 10 countries with the highest terrorist attacks
SELECT
    country,
    COUNT(*) AS attacks
FROM terrorism_final
GROUP BY country
ORDER BY attacks DESC
LIMit 10;

--> top 10 countries with the least terrorist attacks
SELECT
    country,
    COUNT(*) AS attacks
FROM terrorism_final
GROUP BY country
ORDER BY attacks
LIMit 10;

--> total killed or wounded per each region top 10
SELECT 
    region, 
    SUM(COALESCE(casualties, 0)) AS total_killed
FROM terrorism_final
GROUP BY region
ORDER BY total_killed DESC
LIMIT 10;

--> total 10 countries with the highest casualties due to terror attacks
SELECT 
    country, 
    SUM(COALESCE(casualties, 0)) AS total_killed
FROM terrorism_final
GROUP BY country
ORDER BY total_killed DESC
LIMIT 10;

