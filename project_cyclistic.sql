-- Project Cyclistic --



/*
 ##Loading the data from csv files stored in local disc using BULK INSERT command

BULK INSERT project_cyclistic.dbo.trip_data
   FROM 'E:\Google Data Analytics Certificate\Capstone Project Data\Raw Data\12_month_data_cleaned\12_Jul24.csv'
   WITH
      (
         FIRSTROW = 2,
		 FIELDTERMINATOR = ','
         , ROWTERMINATOR = '\n'
      );
*/

-- gasping the data by viewing top 100 rows

SELECT TOP(100) * FROM trip_data

SELECT COUNT(*) FROM trip_data

-- counting individual types of rider with ride duration more than 4 minutes
SELECT member_casual, COUNT(*) counts
FROM trip_data
WHERE ride_duration > '00:04:00'
GROUP BY member_casual
ORDER BY 2 

-- No. of riders on each weekday

SELECT member_casual, [weekday], COUNT(*) counts
FROM trip_data
WHERE ride_duration > '00:04:00'
GROUP BY member_casual, [weekday]
ORDER BY 1, 3 DESC

-- No. of riders on each month
SELECT member_casual, MONTH(started_at) ride_month, COUNT(*) counts
FROM trip_data
WHERE ride_duration > '00:04:00'
GROUP BY member_casual, MONTH(started_at)
ORDER BY 1, 3 DESC