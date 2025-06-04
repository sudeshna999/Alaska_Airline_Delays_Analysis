create database Airline_Delay_DB;

use airline_delay_db;


select * from airline_delays;



-- 1. Which airports have the highest total delay minutes across all delay reasons?

SELECT 
  `Airport Name`, 
  SUM(`Delay Due to Late Arrival (Minutes)` 
  + `Delays Due to Carriers Resons (Minutes)` 
  + `Delays Due to Weather (Minutes)` 
  + `Dealys Due to National Aviation Systems (Minutes)` 
  + `Dealys Due to Security Breach (Minutes)`
  + `Delays Due to Late Aircraft (Minutes)` ) AS total_delay_minutes
FROM airline_delays
GROUP BY `Airport Name`
ORDER BY total_delay_minutes DESC;

-- 2. What is the most frequent cause of delay for each airport?

WITH Unpivoted AS (
  SELECT `Airport Name`, 'Carrier' AS Reason, `Delays Due to Carriers Resons (Minutes)` AS Minutes FROM airline_delays
  UNION ALL
  SELECT `Airport Name`, 'Weather', `Delays Due to Weather (Minutes)` FROM airline_delays
  UNION ALL
  SELECT `Airport Name`, 'NAS', `Dealys Due to National Aviation Systems (Minutes)` FROM airline_delays
  UNION ALL
  SELECT `Airport Name`, 'Security', `Dealys Due to Security Breach (Minutes)` FROM airline_delays
  UNION ALL
  SELECT `Airport Name`, 'Late Aircraft', `Delays Due to Late Aircraft (Minutes)` FROM airline_delays
),
Ranked AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY `Airport Name` ORDER BY Minutes DESC) AS rk FROM Unpivoted
)
SELECT `Airport Name`, Reason, Minutes
FROM Ranked
WHERE rk = 1;

-- 3. Which airports have the highest percentage of delayed arrivals (>15 minutes)?

SELECT 
  `Airport Name`, 
  ROUND(SUM(`Total Arrivals  >15 Delay (Minutes)`) / SUM(`Total Flights Arrival`) * 100, 2) AS delay_percentage
FROM airline_delays
GROUP BY `Airport Name`
ORDER BY delay_percentage DESC;


-- 4. Which months show the highest increase in total delay minutes year-over-year?

WITH CTE AS (SELECT 
  Year, Month,
  SUM(`Delay Due to Late Arrival (Minutes)` 
  + `Delays Due to Carriers Resons (Minutes)` 
  + `Delays Due to Weather (Minutes)` 
  + `Dealys Due to National Aviation Systems (Minutes)` 
  + `Dealys Due to Security Breach (Minutes)`
  + `Delays Due to Late Aircraft (Minutes)`) AS total_delay 
  FROM airline_delays
  GROUP BY Year, Month)
  SELECT Year, Month, total_delay,
		LAG(SUM(total_delay)) OVER(ORDER BY Year, Month) AS previous_delay
        FROM CTE
		GROUP BY Year, Month;


-- 5. Which airports contribute the most to carrier-related delay minutes?

SELECT `Airport Name`,
		SUM(`Delays Due to Carriers Resons (Minutes)`) AS carrier_related_delay
        FROM airline_delays
        GROUP BY 1
        ORDER BY 2 DESC;



-- 6. What is the average delay time per flight for each airport?

SELECT `Airport Name`,
  ROUND (
		SUM(`Delay Due to Late Arrival (Minutes)` 
		+ `Delays Due to Carriers Resons (Minutes)` 
		+ `Delays Due to Weather (Minutes)` 
		+ `Dealys Due to National Aviation Systems (Minutes)` 
		+ `Dealys Due to Security Breach (Minutes)`
		+ `Delays Due to Late Aircraft (Minutes)`)
				/ 
                SUM(`Total Flights Arrival`), 2) AS avg_delay_per_flight
  FROM airline_delays
  GROUP BY 1
  ORDER BY avg_delay_per_flight DESC;
  


-- 7. Which airports have the most weather-related delays in total minutes?

SELECT `Airport Name`, SUM(`Delays Due to Weather (Minutes)`) AS weather_delay
FROM airline_delays
GROUP BY 1
ORDER BY 2 DESC;



-- 8. What is the trend of total delays due to late aircraft over the months?

SELECT Year, Month, 
		SUM(`Delay Due to Late Arrival (Minutes)`) AS delay,
		LAG(SUM(`Delay Due to Late Arrival (Minutes)`)) OVER(ORDER BY Year, Month) AS previous_delay
FROM airline_delays
GROUP BY 1,2;



-- 9. Which airports have the highest cancellation rates?

SELECT  `Airport Name`, 
	ROUND(
    SUM(`Total Cancelled Flights`) / SUM(`Total Flights Arrival`)*100
			, 2) AS cacelation_rate
    FROM airline_delays
    GROUP BY 1
    ORDER BY cacelation_rate DESC ;


-- 10. Which airports consistently show high delays regardless of the delay reason?

SELECT  `Airport Name`, 
ROUND(
    AVG(`Delay Due to Late Arrival (Minutes)` 
		+ `Delays Due to Carriers Resons (Minutes)` 
		+ `Delays Due to Weather (Minutes)` 
		+ `Dealys Due to National Aviation Systems (Minutes)` 
		+ `Dealys Due to Security Breach (Minutes)`
		+ `Delays Due to Late Aircraft (Minutes)`), 2) AS avg_delay
FROM airline_delays
GROUP BY 1
ORDER BY 2 DESC;



-- 11. Which airports have the best on-time performance (lowest delay-to-arrival ratio)?

SELECT `Airport Name`, 
		(SUM(`Total Arrivals  >15 Delay (Minutes)`) / SUM(`Total Flights Arrival`) * 100) as late_percentage,
  ROUND(
		100 - 
        (SUM(`Total Arrivals  >15 Delay (Minutes)`) / SUM(`Total Flights Arrival`) * 100)
			, 2) AS on_time_percentage
FROM airline_delays
GROUP BY `Airport Name`
ORDER BY on_time_percentage DESC;




-- 12. How do diverted flights correlate with total delay minutes per airport?

SELECT 
  `Airport Name`,
  SUM(`Total Diverted Flights`) AS total_diverted,
  SUM(`Delay Due to Late Arrival (Minutes)` 
		+ `Delays Due to Carriers Resons (Minutes)` 
		+ `Delays Due to Weather (Minutes)` 
		+ `Dealys Due to National Aviation Systems (Minutes)` 
		+ `Dealys Due to Security Breach (Minutes)`
		+ `Delays Due to Late Aircraft (Minutes)`) AS delay
FROM airline_delays
GROUP BY `Airport Name`
ORDER BY total_diverted DESC;




