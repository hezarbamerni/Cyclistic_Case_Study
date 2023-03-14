/*
+The first query counts the number of rides for each day of the week, specifically for Saturdays and Sundays, by filtering the data with a WHERE clause that
+includes only those two days of the week. The COUNT(*) function is used to count the number of rows that meet the criteria for each day of the week, and the
+GROUP BY clause is used to group the results by day_of_week, which is the column that holds the day of the week information.
+
+
+The second query also counts the number of rides for each day of the week, but this time for weekdays only, which includes Monday, Tuesday, Wednesday, Thursday,
+and Friday. Similar to the first query, the WHERE clause filters the data to only include the specified weekdays, and the COUNT(*) function counts the number of
+rows that meet the criteria for each day of the week. Finally, the results are grouped by day_of_week using the GROUP BY clause.
*/

-- WEEKEND TRENDS

SELECT COUNT(*) AS num_rides, day_of_week
FROM alltrips21v
WHERE day_of_week IN ('Saturday', 'Sunday')
GROUP BY day_of_week;

+-------------------------+
|        Output           |
+-----------+-------------+
| num_rides | day_of_week |
+-----------+-------------+
| 814846    | Saturday    |
| 705442    | Sunday      |
+-----------+-------------+

SELECT COUNT(*) AS num_rides, day_of_week,  member_casual
FROM alltrips21v
WHERE day_of_week IN ('Saturday', 'Sunday')
GROUP BY day_of_week, member_casual;

+-----------------------------------------+
|                Output                   |
+-----------+-------------+---------------+
| num_rides | day_of_week | member_casual |
+-----------+-------------+---------------+
| 351156    | Saturday    | member        |
| 463690    | Saturday    | casual        |
| 305877    | Sunday      | member        |
| 399565    | Sunday      | casual        |
+-----------+-------------+---------------+

--WEEKDAYS TRENDS

SELECT COUNT(*) AS num_rides, day_of_week
FROM alltrips21v
WHERE day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
GROUP BY day_of_week;

+-------------------------+
|        Output           |
+-----------+-------------+
| num_rides | day_of_week |
+-----------+-------------+
| 647425    | Friday      |
| 567770    | Monday      |
| 595320    | Tuesday     |
| 607999    | Wednesday   |
| 590131    | Thursday    |
+-----------+-------------+

SELECT COUNT(*) AS num_rides, day_of_week, member_casual
FROM alltrips21v
WHERE day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
GROUP BY day_of_week, member_casual;

+-----------------------------------------+
|                Output                   |
+-----------+-------------+---------------+
| num_rides | day_of_week | member_casual |
+-----------+-------------+---------------+
| 360223    | Friday      | member        |
| 287202    | Friday      | casual        |
| 341154    | Monday      | member        |
| 226616    | Monday      | casual        |
| 382509    | Tuesday     | member        |
| 212811    | Tuesday     | casual        |
| 392003    | Wednesday   | member        |
| 215996    | Wednesday   | casual        |
| 222057    | Thursday    | casual        |
| 368074    | Thursday    | member        |
+-----------+-------------+---------------+
