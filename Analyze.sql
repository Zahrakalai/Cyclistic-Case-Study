# the type of bike
SELECT member_casual, rideable_type, 
COUNT(*) AS total_rides
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;
 

# total rides per month
SELECT member_casual, month_name, 
COUNT(*) AS total_rides_per_month
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
GROUP BY member_casual, month_name
ORDER BY member_casual;

# total rides per day of week 
SELECT member_casual, day_name,COUNT(*) AS total_rides_per_week
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
GROUP BY member_casual,day_name
ORDER BY member_casual;

#total rides  per hour
SELECT member_casual, 
EXTRACT(HOUR FROM started_at) AS hour_of_day, 
COUNT(*) AS total_rides
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
GROUP BY member_casual,hour_of_day
ORDER BY member_casual;

# Average ride length per day of week
SELECT member_casual, day_name, 
AVG(ride_length) AS avg_ride_length, 
AVG(AVG(ride_length)) OVER(PARTITION BY member_casual) AS combined_avg_ride_length
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
GROUP BY member_casual, day_name
ORDER BY member_casual;

# Average ride length vs. total rides (per day)
SELECT member_casual, day_name,
AVG(ride_length) AS avg_ride_length,
count(*) AS total_rides
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
GROUP BY member_casual,day_name;

# Starting location for member
SELECT member_casual, start_station_name,
AVG(start_lat) AS start_lat, 
AVG(start_lng) AS start_lng,
COUNT(*) AS total_rides
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
WHERE member_casual = 'casual'
GROUP BY member_casual, start_station_name;

# Ending location for member
SELECT member_casual, end_station_name,
AVG(end_lat) AS end_lat, 
AVG(end_lng) AS end_lng,
COUNT(*) AS total_rides
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
WHERE member_casual = 'member'
GROUP BY member_casual, end_station_name;

# Starting location for casual
SELECT member_casual, start_station_name,
AVG(start_lat) AS start_lat, 
AVG(start_lng) AS start_lng,
COUNT(*) AS total_rides
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
WHERE member_casual = 'casual'
GROUP BY member_casual, start_station_name;

# Ending location for casual 
SELECT member_casual, end_station_name,
AVG(end_lat) AS end_lat, 
AVG(end_lng) AS end_lng,
COUNT(*) AS total_rides
FROM `astute-curve-435613-t7.Data_trip.Cleaned_Data_trip2020`
WHERE member_casual = 'member'
GROUP BY member_casual, end_station_name;
