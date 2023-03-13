/*
+I have created a MySQL table called "Alltrips21" which includes 13 columns that define the different attributes of each bike ride taken in 2021
+by Cyclistic's customers. After importing data from tables named jan21 through dec21, I wanted to create a view that makes it easier to analyze
+this data, so I created a new view called "alltrips21v". This view includes all the columns from the original table, as well as three additional
+columns that calculate the length of each ride, extract the day of the week and month name from the start time using the DATE_FORMAT function.
+I also included several conditions in the WHERE clause to filter out any rows with missing or invalid data. Creating this view has allowed me
+to analyze the data in a more convenient format, and I can now use SQL queries that refer to this view instead of the original table to gain
+insights into Cyclistic's bike-share service usage throughout 2021.
+Tables jan21 through dec21 were created prior to this step.
*/

-- Create a table called alltrips21
CREATE TABLE cyclistic_study.Alltrips21 (
  ride_id VARCHAR(500),
  rideable_type VARCHAR(255),
  started_at VARCHAR(255),
  ended_at VARCHAR(255),
  start_station_name VARCHAR(255),
  start_station_id VARCHAR(255),
  end_station_name VARCHAR(255),
  end_station_id VARCHAR(255),
  start_lat VARCHAR(255),
  start_lng VARCHAR(255),
  end_lat VARCHAR(255),
  end_lng VARCHAR(255),
  member_casual VARCHAR(255)
);

-- Insert all tables from JAN21 through DEC21 into alltrips21 table
INSERT INTO alltrips21 (id, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual)
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM jan21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM feb21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM mar21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM apr21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM may21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM jun21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM jul21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM aug21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM sep21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM oct21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM nov21
UNION ALL
SELECT null, ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
FROM dec21
ORDER BY started_at;
	
-- Create a view of the clean data to run queries for analysis. 
CREATE OR REPLACE VIEW alltrips21v AS
SELECT 
  id,
  ride_id, 
  rideable_type, 
  started_at, 
  ended_at, 
  start_station_name, 
  start_station_id, 
  end_station_name, 
  end_station_id, 
  start_lat, 
  start_lng, 
  end_lat, 
  end_lng, 
  member_casual, 
  TIMESTAMPDIFF(SECOND, STR_TO_DATE(started_at, '%Y-%m-%d %H:%i:%s'), STR_TO_DATE(ended_at, '%Y-%m-%d %H:%i:%s')) AS ride_length,
  DATE_FORMAT(STR_TO_DATE(started_at, '%Y-%m-%d %H:%i:%s'), '%W') AS day_of_week,
  DATE_FORMAT(STR_TO_DATE(started_at, '%Y-%m-%d %H:%i:%s'), '%M') AS month_name 
FROM alltrips21
WHERE id IS NOT NULL
  AND ride_id IS NOT NULL 
  AND CHAR_LENGTH(ride_id) = 16 
  AND started_at < ended_at
  AND started_at IS NOT NULL 
  AND ended_at IS NOT NULL 
  AND start_station_name IS NOT NULL 
  AND start_station_id IS NOT NULL 
  AND end_station_name IS NOT NULL 
  AND end_station_id IS NOT NULL 
  AND start_lat IS NOT NULL 
  AND start_lng IS NOT NULL 
  AND end_lat IS NOT NULL 
  AND end_lng IS NOT NULL
  AND member_casual IS NOT NULL
  AND TIMESTAMPDIFF(SECOND, started_at, ended_at) >= 60;
