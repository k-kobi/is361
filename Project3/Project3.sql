-- Kobi Kobi IS361
SET GLOBAL local_infile = 1;
DROP TABLE IF EXISTS population;

-- Create table
CREATE TABLE population (
  country VARCHAR(100) NOT NULL,
  year INT NOT NULL,
  population INT NOT NULL
);

-- Load data into the population table
LOAD DATA LOCAL INFILE '/Users/kobi/Downloads/population.csv' 
INTO TABLE population
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS 
(country, year, population);

-- Calculate infection rate
SELECT 
  tb.country,
  tb.year,
  population.population,
  COALESCE(SUM(tb.child), 0) + COALESCE(SUM(tb.adult), 0) + COALESCE(SUM(tb.elderly), 0) AS total_cases,
  (COALESCE(SUM(tb.child), 0) + COALESCE(SUM(tb.adult), 0) + COALESCE(SUM(tb.elderly), 0)) / population.population AS rate
FROM 
  tb
JOIN 
  population ON tb.country = population.country AND tb.year = population.year
GROUP BY 
  tb.country, tb.year, population.population;