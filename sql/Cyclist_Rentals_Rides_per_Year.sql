--Cyclist Rental Analytics
-- Purpose: Get total ride volume per year for a high-level comparison.
-- Platform: BigQuery (Standard SQL)
--Author: Michael Gosch


SELECT year,
COUNT(*) AS rides
FROM `evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all_valid`
GROUP BY year
ORDER BY year;

-- Purpose: Get monthly ride volume to identify seasonality/trends.

SELECT year,
TIMESTAMP_TRUNC(start_time, MONTH) AS month,
COUNT(*) AS rides
FROM `evident-beacon-461115-u3.Divvy_Trips_Q1_2019_2020.trips_all_valid`
GROUP BY year, month
ORDER BY month, year;
