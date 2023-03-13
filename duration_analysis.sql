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
		 
+----------------------------------------------------------------------+		 
|				output				       |
+--------------+-------------+-------------+-------------+-------------+
|member_casual | day_of_week | maxDuration | minDuration | avgDuration |
+--------------+-------------+-------------+-------------+-------------+
| member       | Friday      | 89034	   | 60 	 |   779.0209  |
| casual       | Friday      | 3341501	   | 60 	 |   1873.1726 |
| member       | Saturday    | 89738	   | 60 	 |   903.7597  |
| casual       | Saturday    | 3356649	   | 60 	 |   2112.9526 |
| member       | Sunday      | 89183	   | 60 	 |   927.1590  |
| casual       | Sunday      | 3235296 	   | 60 	 |   2279.5782 |
| member       | Monday      | 88461	   | 60 	 |   775.0524  |
| casual       | Monday      | 1900899 	   | 60 	 |   1977.9630 |
| member       | Tuesday     | 88345	   | 60 	 |   753.8290  |
| casual       | Tuesday     | 2335375 	   | 60 	 |   1745.1609 |
| member       | Wednesday   | 87634	   | 60 	 |   757.9740  |
| casual       | Wednesday   | 2337785 	   | 60 	 |   1712.6618 |
| casual       | Thursday    | 2946429 	   | 60 	 |   1696.6570 |
| member       | Thursday    | 88005	   | 60 	 |   751.7400  |
+--------------+-------------+-------------+-------------+-------------+

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
GROUP BY   alias.member_casual;


+---------------------------------------------------------+		 
|			   output			  |
+---------------+-------------+-------------+-------------+
| member_casual | maxDuration | minDuration | avgDuration |
+---------------+-------------+-------------+-------------+
| member        | 89738       | 60	    | 802.9446    |
| casual        | 3356649     | 60	    | 1969.9250   |
+---------------+-------------+-------------+-------------+


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
GROUP BY   alias.day_of_week;

+---------------------------------------------------------+		 
|			   output			  |
+---------------+-------------+-------------+-------------+
| day_of_week   | maxDuration | minDuration | avgDuration |
+---------------+-------------+-------------+-------------+
| Friday  	| 3341501     | 60	    | 1264.3938   |
| Saturday      | 3356649     | 60	    | 1591.8537   |
| Sunday        | 3235296     | 60	    | 1693.1743   |
| Monday        | 1900899     | 60	    | 1255.1743   |
| Tuesday       | 2335375     | 60	    | 1108.2037   |
| Wednesday     | 2337785     | 60	    | 1097.1337   |
| Thursday      | 2946429     | 60	    | 1107.2973   |
+---------------+-------------+-------------+-------------+
