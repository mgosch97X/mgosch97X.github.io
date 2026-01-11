--Cyclist Rental Analytics
-- Purpose: Identify the top 10 stations where rides most frequently start.
-- Platform: BigQuery (Standard SQL)
--Author: Michael Gosch


Select 
  start_station_name,
  COUNT(*) AS rides_started
  FROM evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all_valid
  GROUP BY start_station_name
  ORDER BY rides_started DESC
  LIMIT 10;

-- Purpose: Identify the top 10 stations where rides most frequently end.

SELECT
  end_station_name,
  COUNT(*) AS rides_ended
  FROM evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all_valid
  GROUP BY end_station_name
  ORDER BY rides_ended DESC
  LIMIT 10;