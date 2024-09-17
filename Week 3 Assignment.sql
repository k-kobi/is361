-- Problem 1: Total # of flights: (336776)

SELECT COUNT(*) AS total_flights 
FROM flights;

-- Problem 2: Total # of flights by airline:

SELECT carrier, COUNT(*) AS total_flights 
FROM flights
GROUP BY carrier;

-- Problem 3: Airlines ordered by descending # of flights:

SELECT carrier, COUNT(*) AS total_flights 
FROM flights
GROUP BY carrier
ORDER BY total_flights DESC;

-- Problem 4: T5 airlines by descending # of flights:

SELECT carrier, COUNT(*) AS total_flights 
FROM flights
GROUP BY carrier
ORDER BY total_flights DESC
LIMIT 5;

-- Problem 5: T5 airlines (by # of flights with distance >= 1000 miles) by descending # of flights:

SELECT carrier, COUNT(*) AS total_flights 
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY total_flights DESC
LIMIT 5;

-- Problem 6: What is the average distance of flights per airline with arrival delays >= 45 minutes in descending order?

SELECT carrier, AVG(distance) AS avg_distance
FROM flights
WHERE arr_delay >= 45
GROUP BY carrier
ORDER BY avg_distance DESC;
