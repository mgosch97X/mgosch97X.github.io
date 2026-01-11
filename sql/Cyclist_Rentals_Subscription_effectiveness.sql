--Cyclist Rental Analytics
-- Purpose: Compare ride volume and average trip duration between members and casual riders by year.
-- Platform: BigQuery (Standard SQL)
--
-- Notes:
-- - Filters to the two expected rider types: 'member' and 'casual'
-- - avg_duration_min is calculated on valid trips from trips_all_valid
--Author: Michael Gosch


SELECT
  year,
  member_casual,
  AVG(duration_min) AS avg_duration_min,
  COUNT(*)          AS rides
  FROM evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all_valid
  WHERE member_casual IN ('member', 'casual')
  GROUP BY year, member_casual
  ORDER BY year, member_casual

