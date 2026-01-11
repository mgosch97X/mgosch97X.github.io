--Cyclist Rental Analytics
-- Purpose: Compare ride volume by weekday across years.
-- Platform: BigQuery (Standard SQL)
--Author: Michael Gosch


SELECT
  year,
  day_of_week,
  CASE day_of_week
    WHEN 1 THEN 'Monday'
    WHEN 2 THEN 'Tuesday'
    WHEN 3 THEN 'Wednesday'
    WHEN 4 THEN 'Thursday'
    WHEN 5 THEN 'Friday'
    WHEN 6 THEN 'Saturday'
    WHEN 7 THEN 'Sunday'
  END AS weekday_name,
  COUNT(*) AS rides
FROM evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all_valid
GROUP BY year, day_of_week
ORDER BY year, day_of_week;

-- Purpose: Compare ride volume by hour of day across years (demand pattern).

SELECT
  year,
  start_hour,          
  COUNT(*) AS rides
FROM evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all_valid
GROUP BY year, start_hour
ORDER BY year, start_hour;
