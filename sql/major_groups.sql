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
