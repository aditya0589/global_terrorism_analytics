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

--> Middle East and North Africa
--> top 10 countries with highest attacks and casualties
SELECT
    country,
    COUNT(*) AS attacks,
    SUM(COALESCE(casualties, 0)) AS total_killed
FROM terrorism_final
WHERE region = 'Middle East & North Africa'
GROUP BY country
ORDER BY attacks DESC
LIMIT 10;

--> Average casualty rates
SELECT
    country,
    COUNT(*) AS attacks,
    SUM(COALESCE(casualties, 0)) AS total_killed,
    ROUND((total_killed / attacks), 2) as avg_killed
FROM terrorism_final
WHERE region = 'Middle East & North Africa'
GROUP BY country
ORDER BY attacks DESC
LIMIT 10;

 --> South Asia
--> countries with the highest number of attacks
SELECT
    country,
    COUNT(*) AS attacks
FROM terrorism_final
WHERE region = "South Asia"
GROUP BY country
ORDER BY attacks DESC
LIMIT 10;

--> average casualty rates of countries
SELECT
    country,
    COUNT(*) AS attacks, 
    SUM(COALESCE(casualties, 0)) AS total_killed,
    ROUND((total_killed / attacks), 2) as avg_killed
FROM terrorism_final
WHERE region = 'South Asia'
GROUP BY country
ORDER BY attacks DESC
LIMIT 10;


