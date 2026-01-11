--Cyclist Rental Analytics
-- Purpose: Create a unified trips view by standardizing column names/types
--          across the 2019 and 2020 quarterly tables.
-- Platform: BigQuery (Standard SQL)
--
-- Why this exists:
-- - 2019 and 2020 tables use different column names
-- - This view creates one consistent schema for downstream cleaning and analysis.
--Author: Michael Gosch


CREATE OR REPLACE VIEW `evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all` AS
SELECT
  2019 AS year,
  CAST(trip_id AS STRING) AS ride_id,
  start_time, end_time,
  tripduration_min  AS duration_min,
  member_casual,
  day_of_week,
  start_hour,
  from_station_name AS start_station_name, to_station_name AS end_station_name,
FROM evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.Divvy_Trips_2019_Q1
UNION ALL
SELECT
  2020 AS year,
  ride_id,
  start_time, end_time,
  ride_length_min AS duration_min,
  member_casual,
  day_of_week,
  start_hour,
  start_station_name, end_station_name,
FROM evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.Divvy_Trips_2020_Q1
WHERE ride_id IS NOT NULL;