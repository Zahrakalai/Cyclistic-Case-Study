

-- 1) rider_id: the length of the rider id should be uniform 
SELECT 
  LENGTH(ride_id) as rider_id_length
FROM  `astute-curve-435613-t7.Data_trip.Data_trip2020`
GROUP BY LENGTH(ride_id);

-- the ride_id is consistent with 16 characters.


-- 2) rideable_type: determine the type of bikes 
SELECT rideable_type
FROM   `astute-curve-435613-t7.Data_trip.Data_trip2020`
GROUP BY rideable_type;
-- there are two types of bike: electric and docked 

-- 3) started_at, ended_at: ride duration
SELECT ride_id, started_at, ended_at
FROM `astute-curve-435613-t7.Data_trip.Data_trip2020`
WHERE 
TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1 OR
TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;
-- check if the ride time is less than a minute or longer than a day 
-- the end time is behind the start time
-- TIMESTAMP is in YYYY-MM-DD hh:mm:ss UTC format 

-- 4) name & id of start_station and end_station
SELECT DISTINCT start_station_name, COUNT(*) AS start_station_count,
FROM   `astute-curve-435613-t7.Data_trip.Data_trip2020`
GROUP BY start_station_name,end_station_name;
-- a total of 82958 start_station_name with null values are determined


SELECT DISTINCT end_station_name, COUNT(*) AS end_station_count
FROM   `astute-curve-435613-t7.Data_trip.Data_trip2020`
GROUP BY end_station_name;
-- a total of 97645 end_station_name with null values are found


SELECT DISTINCT start_station_id, end_station_id
FROM   `astute-curve-435613-t7.Data_trip.Data_trip2020`
WHERE start_station_id IS NOT NULL OR
end_station_id IS NOT NULL;
-- null values observed 
-- the string lengths of station id are inconsistent. however, it will be ignored as the station id is not important in our analysis


-- 5) lat & lng of start and end
SELECT count(*) 
FROM  `astute-curve-435613-t7.Data_trip.Data_trip2020`
WHERE
start_lat IS NULL OR
start_lng IS NULL OR
end_lat IS NULL OR
end_lng IS NULL;
-- 4145 null values are observed

-- 6) member_casual: type of membership 
SELECT member_casual, COUNT(*) as membership_count
FROM   `astute-curve-435613-t7.Data_trip.Data_trip2020`
GROUP BY member_casual;
-- only two types: member and causal 
-- total membership count : 2073615
-- total Casual count: 1336495

select
  COUNTIF(ride_id IS NULL) AS null_count_ride_id,
  COUNTIF(rideable_type IS NULL) AS null_count_rideable_type,
  COUNTIF(started_at IS NULL) AS null_count_started_at,
  COUNTIF(ended_at IS NULL) AS null_count_ended_at,
  COUNTIF(start_station_name IS NULL) AS null_count_start_station_name,
  COUNTIF(start_station_id IS NULL) AS null_count_start_station_id,
  COUNTIF(end_station_name IS NULL) AS null_count_end_station_name,
  COUNTIF(end_station_id IS NULL) AS null_count_end_station_id,
  COUNTIF(start_lat IS NULL) AS null_count_start_lat,
  COUNTIF(start_lng IS NULL) AS null_count_start_start_lng,
  COUNTIF(end_lat IS NULL) AS null_count_end_lat,
  COUNTIF(end_lng IS NULL) AS null_count_end_lng,
  COUNTIF(member_casual IS NULL) AS null_count_member_casual
  

FROM `astute-curve-435613-t7.Data_trip.Data_trip2020` 

--Data Type Validation
SELECT
  COUNTIF(SAFE_CAST(ride_id AS STRING) IS NULL) AS invalid_ride_id,
  COUNTIF(SAFE_CAST(rideable_type AS STRING) IS NULL) AS invalid_rideable_type,
  COUNTIF(SAFE_CAST(started_at AS TIMESTAMP) IS NULL) AS invalid_started_at,
  COUNTIF(SAFE_CAST(ended_at AS STRING) IS NULL) AS invalid_ended_at,
  COUNTIF(SAFE_CAST(start_station_name AS STRING) IS NULL) AS invalid_start_station_name,
  COUNTIF(SAFE_CAST(start_station_id AS INT64) IS NULL) AS invalid_start_station_id,
  COUNTIF(SAFE_CAST(end_station_name AS STRING) IS NULL) AS invalid_end_station_name,
  COUNTIF(SAFE_CAST(end_station_id AS INT64) IS NULL) AS invalid_end_station_id,
  COUNTIF(SAFE_CAST(start_lat AS FLOAT64) IS NULL) AS invalid_start_lat,
  COUNTIF(SAFE_CAST(start_lng AS FLOAT64) IS NULL) AS invalid_start_lng,
  COUNTIF(SAFE_CAST(end_lat AS FLOAT64) IS NULL) AS invalid_end_lat,
  COUNTIF(SAFE_CAST(end_lng AS FLOAT64) IS NULL) AS invalid_end_lng,
  COUNTIF(SAFE_CAST(member_casual AS STRING) IS NULL) AS invalid_member_casual
FROM 
`astute-curve-435613-t7.Data_trip.Data_trip2020`
