/*
+This query finds the maximum, minimum, and average ride duration for each combination of member type (member_casual)
+and day of the week (day_of_week). It does this by first selecting the member_casual, day_of_week, and ride_length
+columns from the alltrips21v view, and then grouping the results by member_casual and day_of_week.
+The maximum, minimum, and average ride durations are calculated using the MAX(), MIN(), and AVG() aggregate functions, respectively.
*/

SELECT 
  alias.member_casual, 
  alias.day_of_week,
  MAX(alias.ride_length) AS maxDuration,
  MIN(alias.ride_length) AS minDuration,
  AVG(alias.ride_length) AS avgDuration
FROM (
  SELECT 
    member_casual, 
    day_of_week, 
    ride_length
  FROM alltrips21v
) AS alias
GROUP BY alias.member_casual,
		 alias.day_of_week;

/*
+This query finds the maximum, minimum, and average ride duration for each member type (member_casual).
+It does this by selecting the member_casual and ride_length columns from the alltrips21v view, and
+then grouping the results by member_casual. The maximum, minimum, and average ride durations are again
+calculated using the MAX(), MIN(), and AVG() aggregate functions.
*/

SELECT alias.member_casual,
       MAX(alias.`ride_length`) AS `maxDuration`,
       MIN(alias.`ride_length`) AS `minDuration`,
       AVG(alias.`ride_length`) AS `avgDuration`
FROM (SELECT member_casual,
			 ride_length
      FROM alltrips21v) alias
GROUP BY alias.member_casual;

/*
+This query finds the maximum, minimum, and average ride duration for each day of the week (day_of_week).
+It does this by selecting the day_of_week and ride_length columns from the alltrips21v view, and
+then grouping the results by day_of_week. The maximum, minimum, and average ride durations are again
+calculated using the MAX(), MIN(), and AVG() aggregate functions.
*/

SELECT alias.day_of_week,
       MAX(alias.`ride_length`) AS `maxDuration`,
       MIN(alias.`ride_length`) AS `minDuration`,
       AVG(alias.`ride_length`) AS `avgDuration`
FROM (SELECT day_of_week,
			 ride_length
      FROM alltrips21v)alias
GROUP BY alias.day_of_week;
