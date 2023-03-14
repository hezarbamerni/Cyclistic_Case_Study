/*
+This query retrieves the number of trips taken for each rideable type in each month, using data from the "alltrips21v" dataset. The results are filtered
+to include only the rideable types "docked_bike", "classic_bike", and "electric_bike". The data is then grouped by both rideable type and month,
+and the trip count is calculated for each group. The results are then ordered by rideable type and month, with months ordered in chronological order from
+January to December.

-- SINGLE QUERY

SELECT rideable_type, month_name, COUNT(*) as trip_count
FROM alltrips21v
WHERE rideable_type IN ('docked_bike', 'classic_bike', 'electric_bike')
GROUP BY rideable_type, month_name
ORDER BY rideable_type, FIELD(month_name, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');

+--------------+------------+-----------+
|                Output                 |
+--------------+------------+-----------+
| classic_bike	| January   | 60763     |
| classic_bike	| February  | 34054     |
| classic_bike	| March	    | 150390    |
| classic_bike	| April     | 211383    |
| classic_bike	| May       | 304172    |
| classic_bike	| June      | 427723    |
| classic_bike	| July      | 498616    |
| classic_bike	| August    | 495535    |
| classic_bike	| September | 455491    |
| classic_bike	| October   | 311299    |
| classic_bike	| November  | 151763    |
| classic_bike	| December  | 99068     |
| docked_bike   | January   | 2085      |
| docked_bike 	| February	| 1259      |
| docked_bike	  | March     | 15571     |
| docked_bike   | April     | 24568     |
| docked_bike   | May       | 43053     |
| docked_bike   | June      | 51377     |
| docked_bike   | July      | 57346     |
| docked_bike   | August    | 44820     |
| docked_bike   | September | 35111     |
| docked_bike   | October   | 22552     |
| docked_bike   | November  | 7515      |
| docked_bike   | December  | 4842      |
| electric_bike | January   | 19774     |
| electric_bike | February  | 6988      |
| electric_bike | March	    | 37447     |
| electric_bike | April	    | 58672     |
| electric_bike | May	      | 97932     |
| electric_bike | June	    | 121412    |
| electric_bike | July	    | 127241    |
| electric_bike | August	  | 125729    |
| electric_bike | September	| 122763    |
| electric_bike | October	  | 137613    |
| electric_bike | November	| 92911     |
| electric_bike | December	| 70095     |
+---------------+-----------+-----------+

-- SEPARATE QUERIES

-- Count the number of trips for each rideable type in each month for docked_bike:
SELECT rideable_type, month_name, COUNT(*) as trip_count
FROM alltrips21v
WHERE rideable_type = "docked_bike"
GROUP BY rideable_type, month_name
ORDER BY FIELD(month_name, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
+--------------+------------+-----------+
|                Output                 |
+--------------+------------+-----------+
| docked_bike   | January   | 2085      |
| docked_bike 	| February	| 1259      |
| docked_bike	  | March     | 15571     |
| docked_bike   | April     | 24568     |
| docked_bike   | May       | 43053     |
| docked_bike   | June      | 51377     |
| docked_bike   | July      | 57346     |
| docked_bike   | August    | 44820     |
| docked_bike   | September | 35111     |
| docked_bike   | October   | 22552     |
| docked_bike   | November  | 7515      |
| docked_bike   | December  | 4842      |
+---------------+-----------+-----------+


-- Count the number of trips for each rideable type in each month for classic_bike:
SELECT rideable_type, month_name, COUNT(*) as trip_count
FROM alltrips21v
WHERE rideable_type = "classic_bike"
GROUP BY rideable_type, month_name
ORDER BY FIELD(month_name, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
+--------------+------------+-----------+
|                Output                 |
+--------------+------------+-----------+
| classic_bike	| January   | 60763     |
| classic_bike	| February  | 34054     |
| classic_bike	| March	    | 150390    |
| classic_bike	| April     | 211383    |
| classic_bike	| May       | 304172    |
| classic_bike	| June      | 427723    |
| classic_bike	| July      | 498616    |
| classic_bike	| August    | 495535    |
| classic_bike	| September | 455491    |
| classic_bike	| October   | 311299    |
| classic_bike	| November  | 151763    |
| classic_bike	| December  | 99068     |
+---------------+-----------+-----------+


-- Count the number of trips for each rideable type in each month for electric_bike:
SELECT rideable_type, month_name, COUNT(*) as trip_count
FROM alltrips21v
WHERE rideable_type = "electric_bike"
GROUP BY rideable_type, month_name
ORDER BY FIELD(month_name, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
+--------------+------------+-----------+
|                Output                 |
+--------------+------------+-----------+
| electric_bike | January   | 19774     |
| electric_bike | February  | 6988      |
| electric_bike | March	    | 37447     |
| electric_bike | April	    | 58672     |
| electric_bike | May	      | 97932     |
| electric_bike | June	    | 121412    |
| electric_bike | July	    | 127241    |
| electric_bike | August	  | 125729    |
| electric_bike | September	| 122763    |
| electric_bike | October	  | 137613    |
| electric_bike | November	| 92911     |
| electric_bike | December	| 70095     |
+---------------+-----------+-----------+
