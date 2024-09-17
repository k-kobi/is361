-- Question 1: Selecting all data from the planes table:

SELECT *
FROM planes;

-- Question 2: Update the planes table so that rows have no year assigned 2013:

UPDATE planes
SET year = 2013
WHERE year IS NULL;

-- Question 3: Insert a new record to the planes table:

INSERT INTO planes (tailnum, year, type, manufacturer, model, engines, seats, speed, engine)
VALUES ('N15501', 2013, 'Fixed wing single engine', 'BOEING', 'A222-101', 3, 100, NULL, 'Turbo-fan');

-- Question 4: Delete the newly inserted record on step 3:

DELETE FROM planes
WHERE tailnum = 'N15501';