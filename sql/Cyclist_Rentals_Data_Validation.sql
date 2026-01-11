--Cyclist Rental Analytics
-- Purpose: Create a validated view of trips with basic quality filters applied.
-- Platform: BigQuery (Standard SQL)
--
-- Data quality rules applied:
-- - Keep only trips with a positive duration (duration_min > 0)
-- - Remove records with missing timestamps (start_time / end_time)
--Author: Michael Gosch


CREATE OR REPLACE VIEW `evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all_valid` AS
SELECT *
FROM `evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all`
WHERE duration_min > 0
  AND start_time IS NOT NULL
  AND end_time   IS NOT NULL;
