/*
+These three queries are all examples of aggregating data based on rideable type in the "alltrips21v" dataset. The first query calculates the average
+ride length for each rideable type, which could be useful for understanding the typical usage patterns of different types of bikes. The second query
+counts the number of rides for each rideable type, providing insight into which types of bikes are most popular overall. The third query breaks down
+the number of rides by both rideable type and member status (casual or member), allowing for a more detailed understanding of usage patterns among
+different groups of riders. All three of these queries rely on the GROUP BY clause to group the data by rideable type and/or member status, and then
+use aggregate functions such as COUNT() and AVG() to calculate summary statistics.
*/

SELECT rideable_type, AVG(ride_length) AS avg_ride_length
FROM alltrips21v
GROUP BY rideable_type;

+---------------------------------+		 
|			         output			        |
+---------------+-----------------+
| rideable_type | avg_ride_length |
+---------------+-----------------+
| classic_bike	| 1116.3277       |
| electric_bike	| 950.6565        |
| docked_bike	  | 4715.2442       |
+---------------+-----------------+


SELECT rideable_type, COUNT(*) AS ride_count
FROM alltrips21v
GROUP BY rideable_type;

+-----------------------------+		 
|			         output			    |
+---------------+-------------+
| rideable_type | ride_count  |
+---------------+-------------+
| classic_bike  | 3200257     |
| electric_bike	| 1018577     |
| docked_bike   | 310099      |
+---------------+-------------+


SELECT rideable_type, member_casual, COUNT(*) as num_rides
FROM alltrips21v
GROUP BY rideable_type, member_casual;

+-------------------------------------------+		 
|			                output                |
+---------------+---------------+-----------+
| rideable_type | member_casual | num_rides |
+---------------+---------------+-----------+
| classic_bike  | member        | 1951820   |
| classic_bike  | casual        | 1248437   |
| docked_bike   | casual        | 310098    |
| docked_bike   | member        | 1         |
| electric_bike | member        | 549175    |
| electric_bike | casual        | 469402    |
+---------------+---------------+-----------+
