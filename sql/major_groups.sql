--> all terrorist groups
SELECT DISTINCT
    gname
FROM terrorism_final;

--> top 10 deadliest groups by attacks
SELECT gname, COUNT(*) AS attacks
FROM terrorism_final
GROUP BY gname
ORDER BY attacks DESC
LIMIT 10;

--> major groups in the Middle East and North AFrica
SELECT
    gname,
    COUNT(*) AS attacks
FROM terrorism_final
WHERE region = "Middle East & North Africa" AND gname != "Unknown"
GROUP BY gname
ORDER BY attacks DESC
LIMIT 10;

--> East Asia

SELECT
    gname,
    COUNT(*) AS attacks
FROM terrorism_final
WHERE region = "East Asia" AND gname != "Unknown"
GROUP BY gname
ORDER BY attacks DESC
LIMIT 10;

--> South Asia
SELECT
    gname,
    COUNT(*) AS attacks
FROM terrorism_final
WHERE region = "South Asia" AND gname != "Unknown"
GROUP BY gname
ORDER BY attacks DESC
LIMIT 10;

--> North America

SELECT
    gname,
    COUNT(*) AS attacks
FROM terrorism_final
WHERE region = "North America" AND gname != "Unknown"
GROUP BY gname
ORDER BY attacks DESC
LIMIT 10

--> subsaharan africa
SELECT
    gname,
    COUNT(*) AS attacks
FROM terrorism_final
WHERE region = "Sub-Saharan Africa" AND gname != "Unknown"
GROUP BY gname
ORDER BY attacks DESC
LIMIT 10;

--> central asia

SELECT
    gname,
    COUNT(*) AS attacks
FROM terrorism_final
WHERE region = "Central Asia" AND gname != "Unknown"
GROUP BY gname
ORDER BY attacks DESC
LIMIT 10;
-->
