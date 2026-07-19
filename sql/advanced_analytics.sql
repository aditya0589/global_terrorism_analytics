-- 1. What is the success rate of different attack types?
SELECT 
    attacktype,
    COUNT(*) AS total_attacks,
    SUM(CASE WHEN success = '1' THEN 1 ELSE 0 END) AS successful_attacks,
    ROUND((SUM(CASE WHEN success = '1' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS success_rate_percentage
FROM terrorism_final
GROUP BY attacktype
ORDER BY total_attacks DESC;

-- 2. How has the preferred weapon type for major terrorist groups evolved over the decades?
WITH DecadeGrouping AS (
    SELECT 
        gname,
        weapontype,
        FLOOR(year / 10) * 10 AS decade,
        COUNT(*) AS weapon_usage_count
    FROM terrorism_final
    WHERE gname != 'unknown' AND gname != 'Unknown'
    GROUP BY gname, weapontype, FLOOR(year / 10) * 10
),
RankedWeapons AS (
    SELECT 
        gname,
        decade,
        weapontype,
        weapon_usage_count,
        RANK() OVER(PARTITION BY gname, decade ORDER BY weapon_usage_count DESC) as weapon_rank
    FROM DecadeGrouping
)
SELECT 
    gname,
    decade,
    weapontype AS most_used_weapon,
    weapon_usage_count
FROM RankedWeapons
WHERE weapon_rank = 1
ORDER BY weapon_usage_count DESC, decade;

-- 3. Are certain regions becoming more fatal over time, even if the total number of attacks is decreasing?
WITH RegionalYearlyStats AS (
    SELECT 
        region,
        year,
        COUNT(*) AS total_attacks,
        SUM(casualties) AS total_casualties,
        ROUND(SUM(casualties) * 1.0 / NULLIF(COUNT(*), 0), 2) AS casualties_per_attack
    FROM terrorism_final
    GROUP BY region, year
)
SELECT 
    region,
    year,
    total_attacks,
    total_casualties,
    casualties_per_attack,
    LAG(casualties_per_attack) OVER(PARTITION BY region ORDER BY year) AS prev_year_casualties_per_attack,
    ROUND(casualties_per_attack - LAG(casualties_per_attack) OVER(PARTITION BY region ORDER BY year), 2) AS fatality_rate_change
FROM RegionalYearlyStats
ORDER BY region, year;

-- 4. Year-Over-Year (YoY) percentage change in casualties for the top 5 most attacked countries
WITH TopCountries AS (
    SELECT country
    FROM terrorism_final
    GROUP BY country
    ORDER BY COUNT(*) DESC
    LIMIT 5
),
YearlyCasualties AS (
    SELECT 
        t.country,
        t.year,
        SUM(t.casualties) AS total_casualties
    FROM terrorism_final t
    JOIN TopCountries tc ON t.country = tc.country
    GROUP BY t.country, t.year
)
SELECT 
    country,
    year,
    total_casualties,
    LAG(total_casualties) OVER(PARTITION BY country ORDER BY year) AS prev_year_casualties,
    ROUND(
        ((total_casualties - LAG(total_casualties) OVER(PARTITION BY country ORDER BY year)) * 100.0) 
        / NULLIF(LAG(total_casualties) OVER(PARTITION BY country ORDER BY year), 0), 
    2) AS yoy_casualty_growth_pct
FROM YearlyCasualties
ORDER BY country, year;
