-- Problem 1 

SELECT *
FROM weather
LIMIT 5;

-- Problem 2

SELECT *
FROM flights
ORDER BY tailnum ASC
LIMIT 5;

-- Problem 3

SELECT *
FROM flights
WHERE carrier = 'UA'
AND arr_delay > 0
ORDER BY arr_delay DESC;

-- Problem 4

SELECT CONCAT(month, '/', day, '/', year) AS flight_date
FROM flights;

-- Problem 5: Avg wind gust in 2013 was 10.743374188929929

SELECT AVG(wind_gust) AS avg_wind_gust_2013
FROM weather
WHERE year = 2013;
