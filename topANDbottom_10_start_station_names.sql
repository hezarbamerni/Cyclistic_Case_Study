/*
+These queries retrieves the top and bottom 10 start station names from a dataset named "alltrips21v" by grouping the data by start station name and
+counting the number of trips that started from each station. The bottom 10 query sorts the results in ascending order by the number of trips and
+uses the LIMIT keyword to limit the results to the bottom 10 stations only. The top 10 query sorts the results in descending order by the number
+of trips, which means that the station with the highest number of trips will appear first and the LIMIT keyword is used to limit the results to the
+top 10 stations only.
*/

SELECT start_station_name, COUNT(*) as num_trips
FROM alltrips21v
GROUP BY start_station_name
ORDER BY num_trips ASC
LIMIT 10;

+-------------------------------------------------+		 
|                 output                          |
+-------------------------------------+-----------+
| start_station_name                  | num_trips | 
+-------------------------------------+-----------+
| 351                                 | 1         |
| Olive Harvey College                | 1         |
| Indiana Ave & 133rd St	            | 1         |
| N Shore Channel Trail & Argyle Ave	| 1         |
| N Hampden Ct & W Diversey Ave       | 1         |
| Lyft Driver Center Private Rack     | 1         |
| Sacramento Blvd & Polk St	          | 1         |
| Campbell Ave & 51st St	            | 2         |
| Washtenaw Ave & Madison St	        | 2         |
| Halsted St & 63rd St	              | 3         |
+-------------------------------------+-----------+


SELECT start_station_name, COUNT(*) AS num_trips
FROM alltrips21v
GROUP BY start_station_name
ORDER BY num_trips DESC
LIMIT 10;
 
+-------------------------------------------------+		 
|                   output                        |
+-------------------------------------+-----------+
| start_station_name                  | num_trips | 
+-------------------------------------+-----------+
| Streeter Dr & Grand Ave             | 79204     |
| Michigan Ave & Oak St               | 42196     |
| Wells St & Concord Ln               | 41180     |
| Millennium Park              	      | 39950     |
| Clark St & Elm St              	    | 39049     |
| Wells St & Elm St              	    | 35665     |
| Theater on the Lake                 | 35350     |
| Kingsbury St & Kinzie St            | 31748     |
| Clark St & Lincoln Ave              | 31636     |
| Clark St & Armitage Ave             | 31076     |
+-------------------------------------+-----------+ 
