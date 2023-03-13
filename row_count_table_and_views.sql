/*
+This query is retrieving row count information from multiple tables and views related to bike trips data. It selects six different
+counts using subqueries, each of which is labeled with a descriptive alias name. The first count represents the total number of
+rides in the "alltrips21" table. The second count represents the number of cleaned rides in the "alltrips21v" view. The next
+two counts represent the number of casual and member riders respectively, and the following two counts represent the number
+of rides classic bikes, docked bikes, and electric bikes. Overall, this query is providing a summary of the
+total number of bike trips, cleaned data, and the number of different types of bikes and riders in the data.
*/

SELECT
  (SELECT COUNT(*) FROM alltrips21) AS Total_rides,
  (SELECT COUNT(*) FROM alltrips21v) AS Cleaned_data,
  (SELECT COUNT(*) FROM alltrips_casual) AS Casual_riders,
  (SELECT COUNT(*) FROM alltrips_member) AS Member_riders,
  (SELECT COUNT(*) FROM alltrips_rtcb) AS Classic_bikes,
  (SELECT COUNT(*) FROM alltrips_rtdb) AS Docked_bikes,
  (SELECT COUNT(*) FROM alltrips_rteb) AS Electric_bikes;
  
+----------------------------------------------------------------------+		 
|				output				       |
+-------------+--------------+---------------+---------------+---------------+--------------+---------------+
| Total_rides | Cleaned_data | Casual_riders | Member_riders | Classic_bikes | Docked_bikes | Electric_bikes|
+-------------+--------------+---------------+---------------+---------------+--------------+---------------+
| 5595063     | 4528933      | 2027937       | 2500996	     | 3200257       | 310099       | 1018577       |
+-------------+--------------+---------------+---------------+---------------+--------------+---------------+
