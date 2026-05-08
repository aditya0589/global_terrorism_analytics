DESC terrorism;

--> creating the table with only the essential columns
CREATE TABLE terrorism_main AS
SELECT
    eventid,
    iyear,
    imonth,
    iday,
    country_txt,
    region_txt,
    provstate,
    city,
    latitude,
    longitude,
    attacktype1_txt,
    weaptype1_txt,
    targtype1_txt,
    gname,
    success,
    suicide,
    nkill,
    nwound,
    property,
    propvalue
FROM terrorism_data;
  
--> checking if there are any NULL values 
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN country_txt IS NULL THEN 1 ELSE 0 END) AS country_nulls,
    SUM(CASE WHEN region_txt IS NULL THEN 1 ELSE 0 END) AS region_nulls,
    SUM(CASE WHEN iyear IS NULL THEN 1 ELSE 0 END) AS year_nulls,
    SUM(CASE WHEN imonth IS NULL THEN 1 ELSE 0 END) AS month_nulls,
    SUM(CASE WHEN iday IS NULL THEN 1 ELSE 0 END) AS day_nulls,
    SUM(CASE WHEN latitude IS NULL THEN 1 ELSE 0 END) AS latitude_nulls,
    SUM(CASE WHEN longitude IS NULL THEN 1 ELSE 0 END) AS longitude_nulls,
    SUM(CASE WHEN attacktype1_txt IS NULL THEN 1 ELSE 0 END) AS attacktype_nulls,
    SUM(CASE WHEN weaptype1_txt IS NULL THEN 1 ELSE 0 END) AS weaptype_nulls,
    SUM(CASE WHEN targtype1_txt IS NULL THEN 1 ELSE 0 END) AS targtype_nulls,
    SUM(CASE WHEN gname IS NULL THEN 1 ELSE 0 END) AS gname_nulls,
    SUM(CASE WHEN success IS NULL THEN 1 ELSE 0 END) AS success_nulls,
    SUM(CASE WHEN suicide IS NULL THEN 1 ELSE 0 END) AS suicide_nulls,
    SUM(CASE WHEN nkill IS NULL THEN 1 ELSE 0 END) AS nkill_nulls,
    SUM(CASE WHEN nwound IS NULL THEN 1 ELSE 0 END) AS nwound_nulls,
    SUM(CASE WHEN property IS NULL THEN 1 ELSE 0 END) AS property_nulls,
    SUM(CASE WHEN propvalue IS NULL THEN 1 ELSE 0 END) AS propvalue_nulls
FROM terrorism_main;

--> handling NULL values 
--> both kills and wounded are merged into a new casualties columns for better analytics
CREATE TABLE terrorism_final AS
SELECT country_txt AS country,
       region_txt AS region,
       iyear AS year,
       imonth AS month,
       iday AS day,
       latitude,
       longitude,
       COALESCE(attacktype1_txt, 'unknown') AS attacktype,
       COALESCE(targtype1_txt, 'unknown') AS targtype,
       COALESCE(gname, 'unknown') AS gname,
       COALESCE(success, 'unknown') AS success,
       COALESCE(suicide, 'unknown') AS suicide,
       COALESCE(TRY_CAST(nkill AS INT), 0) + COALESCE(TRY_CAST(nwound AS INT), 0) AS casualties,
       COALESCE(weaptype1_txt, 'unknown') AS weapontype,
       COALESCE(propvalue, 'unknown') AS propvalue
FROM terrorism_main;
