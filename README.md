# Cyclistic-Case-Study

## Introduction:
This case study explores Cyclistic's bike-share data to understand how annual members and casual riders use the service differently. The goal is to develop a data-driven marketing strategy to convert casual riders into annual members, ensuring sustainable business growth.


## Business Task:
Cyclistic’s marketing team aims to increase the number of annual memberships. This project focuses on answering the following question:

How do annual members and casual riders use Cyclistic bikes differently?
By addressing this question, we provide actionable recommendations to help Cyclistic transition casual riders into annual members.



## Data Description
Data Description
Source: Cyclistic’s public bike-share trip data, Download the previous 12
months of Cyclistic trip data here:https://divvy-tripdata.s3.amazonaws.com/index.html
Key Data Points:
Trip start and end times
Trip duration
Start and end station locations
Rider type: Casual or Member
Privacy Considerations: The data excludes personal information such as names or payment details to maintain user privacy.

## Step2: Prepare(Data Exploration)
Key steps included:
Combining 12 months of data into a single dataset for comprehensive analysis.
Check the ride_id length
determine the type of bikes(rideable_type)
Calculating trip duration (ride_length) as the difference between ended_at and started_at.
type of membership(member/casual)
Check the null values for each column
Data Type Validation

## Step3: Process(Clean the Data)
The raw trip data from Cyclistic's bike-share system was cleaned and prepared for analysis using SQL. The cleaning process involved the following steps:

1. Objective
The goal was to create a clean dataset (Cleaned_Data_trip2020) by:

Adding calculated fields to derive meaningful insights (e.g., ride length and day of the week).
Ensuring data consistency by standardizing column formats.
Removing incomplete or invalid data to improve data quality.
2. Process Overview
Created a New Table:

A new table Cleaned_Data_trip2020 was created to store the cleaned and transformed data.
Added Calculated Fields:
* Ride_Length: Calculated the duration of each ride in minutes using
* Month_Name: Extracted the month of the ride from the started_at timestamp
* Day of the Week: Captured the weekday of the ride
  
3. Standardized Data Formats:

Used SAFE_CAST to cast critical columns to their correct data types:
ride_id and rideable_type as STRING
started_at as TIMESTAMP
start_station_id and end_station_id as INT64
start_lat, start_lng, end_lat, and end_lng as FLOAT64
Applied Filters to Remove Invalid Data:

4. Removed rows where:
Ride length was less than 1 minute or greater than 24 hours.
Any critical columns (e.g., ride_id, started_at, ended_at, etc.) contained NULL values.

## Step4 : Analyze
The analysis phase involved aggregating and exploring key metrics from the cleaned Cyclistic bike-share data to uncover trends and user behavior patterns. This step focused on comparing casual riders and annual members to inform marketing strategies.

1. Types of Bikes Used
Purpose: Identify which bike types (e.g., electric, docked) are most popular among casual riders and annual members.
The analysis of bike types highlights clear preferences among Cyclistic users:
Casual Riders:
Prefer electric bikes, likely for their convenience and ease of use. Docked bikes are also popular among casual riders, especially near tourist hotspots and leisure destinations.

Annual Members:
Primarily use classic (manual) bikes, reflecting their focus on utilitarian and commuting purposes.

Key Insight:
The distinction in bike type preferences suggests that marketing strategies can focus on promoting electric bike convenience to casual riders while ensuring sufficient availability of classic bikes for members near commuter hubs.

2.Rides Per Month
The analysis of monthly ride trends reveals significant seasonal patterns among Cyclistic users:

Casual Riders:
Ride activity peaks during summer months (June–August), likely driven by favorable weather and an increase in leisure travel.
Lower activity is observed during colder months, reflecting a seasonal preference for recreational trips.

Annual Members:
Show consistent ride activity throughout the year, with a slight increase during spring and fall, likely due to daily commuting needs.

Key Insight:
The seasonal nature of casual rider activity suggests opportunities for targeted marketing campaigns and promotions during the summer. For members, maintaining year-round availability of bikes at commuter hubs ensures continued engagement.

3. Rides Per Day of the Week
The analysis of ride activity by day of the week reveals distinct patterns for casual riders and annual members:

Casual Riders:
Ride activity is highest on weekends (Saturday and Sunday), reflecting a preference for leisure trips and recreational usage.

Annual Members:
Show consistent ride activity on weekdays (Monday to Friday), primarily driven by daily commuting needs.
A slight dip in activity is observed on weekends.

Key Insight:
These patterns indicate that casual riders use Cyclistic services for leisure and social outings, while members rely on the service for regular weekday commuting. This suggests opportunities for weekend promotions targeted at casual riders and weekday service enhancements for members.

4.Total Rides Per Hour of the Day
The analysis of ride activity by hour of the day highlights distinct usage patterns for casual riders and annual members:

Casual Riders:
Peak activity occurs during mid-day hours (11 AM–3 PM), suggesting leisure or recreational trips.
Activity decreases significantly during early mornings and evenings.

Annual Members:
Show clear peaks during traditional commuting hours:
Morning: 7–9 AM
Evening: 4–6 PM
This pattern reflects the use of bikes as a reliable mode of transportation for daily commutes.

Key Insight:
The difference in peak usage times emphasizes the need for tailored service strategies:
  * For casual riders: Focus on bike availability at tourist hotspots and recreational areas during mid-day hours.
  * For members: Ensure sufficient bike availability near commuter hubs during peak commuting hours.

5. Average Ride Length Per Day of the Week
The analysis of average ride durations across the days of the week highlights notable differences between casual riders and annual members:

Casual Riders:
Casual riders consistently take longer trips on average across all days, with the longest rides occurring on weekends (Saturday and Sunday). This suggests a preference for leisure and exploratory rides.

Annual Members:
Annual members maintain shorter, consistent ride durations throughout the week, reflecting their focus on commuting and utility-driven trips.

Key Insight:
The contrast in average ride durations indicates that casual riders use the service for leisure, while annual members rely on it for regular, practical purposes. This insight supports the development of tailored marketing strategies, such as promoting weekend memberships to casual riders and enhancing weekday service reliability for members.

## Step5: Share(visualization)

This project analyzes Cyclistic ride data using Tableau. Below is a summary of the key visualizations and insights gained:

1. Average Ride Length vs. Total Rides
Insights:
Casual Riders: Have significantly longer average ride lengths compared to members, particularly on weekends.
Members: Contribute to a larger number of total rides, especially on weekdays, indicating frequent, shorter trips for commuting purposes.

2. Average Ride Length per Month
Insights:
Casual Riders: Peak ride lengths occur in the summer months (April–July), possibly due to leisure activities.
Members: Maintain more consistent ride lengths throughout the year, but their average is much lower than casual riders.

4. Average Ride Length per Day
Insights:
Casual riders have longer rides on weekends compared to weekdays.
Members show less variability across days, indicating a stable pattern of usage.

4. Total Rides per Hour of Day
Insights:
Casual Riders: Prefer rides during late morning to early evening, peaking around 4 PM.
Members: Exhibit peak usage during typical commuting hours, with sharp increases in the morning (7-9 AM) and evening (5-6 PM).

6. Total Rides per Day of the Week
Insights:
Casual Riders: Peak usage on weekends, reflecting leisure rides.
Members: Show consistent usage throughout the week, with slightly reduced activity on weekends.

6. Total Rides per Month
Insights:
Casual Riders: Rides increase significantly in the summer months, reflecting seasonal trends.
Members: Maintain steady usage year-round, but slightly higher in summer.

8. Total Rides per Type of Bike
Insights:
Docked bikes are the most popular type for both casual and member riders.
Electric bikes are used less frequently but still make a significant contribution, particularly for casual riders.
Summary
This analysis highlights the distinct usage patterns between casual and member riders. Casual riders tend to use bikes for leisure activities, with longer ride times and peak activity during weekends and summer months. Member riders, on the other hand, are consistent users who rely on the service for commuting, with shorter ride lengths and peak activity during weekdays.

## Step6: Act(Recommendation)
1. Membership Conversion:
   * Offer discounts (20–30%) on annual memberships to frequent casual riders.
   * Introduce a one-month free trial or 50% off the first month for new members.
    
2. Leisure Marketing:
  * Launch weekend promotions like 10% off ride costs or free rides on Sundays.
  * Promote scenic routes and guided tours with discounts for casual riders. 

3. Operational Optimizations:
   * Ensure high bike availability (95%) at key commuter stations during peak hours.
   * Introduce a pre-booking feature for members at no extra cost.
   
4. Seasonal Strategies:
   * Offer seasonal passes with significant savings (e.g., summer pass for $50).
   * Provide winter gear discounts or free heated handle grips for winter riders.

5. Digital Engagement:
   * Send personalized ride summaries to highlight membership savings.
   * Use push notifications to offer discounts and encourage repeat usage.

6. Data-Driven Promotions:
   * Identify frequent casual riders and offer 15–25% membership discounts.
   * Provide ride-based discounts (e.g., for rides longer than 30 minutes).

7. Improved Accessibility:
   * Increase bike availability at top stations by 20%.
   * Allow casual riders to upgrade to membership with interest-free payment plans.

8. Performance Monitoring:
   Aim for a 10% increase in membership conversions and a 5–7% boost in casual rider revenue over 6 months.
