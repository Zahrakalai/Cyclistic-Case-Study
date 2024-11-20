CREATE TABLE `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020` AS (

SELECT t.*,  
  FORMAT_TIMESTAMP('%B', t.started_at) AS month_name,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length,
  FORMAT_TIMESTAMP('%A', t.started_at)  AS day_name

FROM  `astute-curve-435613-t7.Data_trip.Data_trip2020` t
JOIN
  (
  SELECT
    ride_id AS ride_id,
    SAFE_CAST(ride_id AS STRING)  AS fixed_column,
    SAFE_CAST(rideable_type AS STRING)  AS fixed_column,
    SAFE_CAST(started_at AS TIMESTAMP) AS fixed_column,
    SAFE_CAST(ended_at AS STRING)  AS fixed_column,
    SAFE_CAST(start_station_name AS STRING) AS fixed_column,
    SAFE_CAST(start_station_id AS INT64)  AS fixed_column,
    SAFE_CAST(end_station_name AS STRING)  AS fixed_column,
    SAFE_CAST(end_station_id AS INT64) AS fixed_column,
    SAFE_CAST(start_lat AS FLOAT64) AS fixed_column,
    SAFE_CAST(start_lng AS FLOAT64) AS fixed_column,
    SAFE_CAST(end_lat AS FLOAT64)  AS fixed_column,
    SAFE_CAST(end_lng AS FLOAT64)  AS fixed_column,
    SAFE_CAST(member_casual AS STRING)  AS fixed_column
  FROM  `astute-curve-435613-t7.Data_trip.Data_trip2020`) AS subquery1
  ON t.ride_id=subquery1.ride_id
JOIN 
  (SELECT ride_id AS ride_id,
      TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length
   FROM `astute-curve-435613-t7.Data_trip.Data_trip2020` ) AS subquery2
ON t.ride_id=subquery2.ride_id
   WHERE  ride_length > 1 AND ride_length < 1440 AND
     t.ride_id IS NOT NULL
     AND rideable_type IS NOT NULL
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

)
