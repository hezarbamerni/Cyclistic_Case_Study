/*
+This query will calculate the total number of riders, the number of casual riders, the number of annual members, and the percentage of each type
+of rider out of the total number of riders from alltrips21v view.
*/


SELECT
    COUNT(*) AS total_riders,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_riders,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS annual_members,
    ROUND(SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS casual_percentage,
    ROUND(SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS member_percentage
FROM
    alltrips21v;

+---------------------------------------------------------------------------------------+
|                                     Output                                            |
+--------------+---------------+----------------+-------------------+-------------------+
| total_riders | casual_riders | annual_members | casual_percentage | member_percentage |
+--------------+---------------+----------------+-------------------+-------------------+
| 4528933      | 2027937       | 2500996        | 44.78             | 55.22             |
+--------------+---------------+----------------+-------------------+-------------------+
