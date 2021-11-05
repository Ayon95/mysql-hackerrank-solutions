-- find the maximum total earnings (salary * months) of an employee and the number of employees with the maximum total earnings
SELECT
    salary * months AS total_earnings,
    COUNT(*)
FROM employee
GROUP BY total_earnings
ORDER BY total_earnings DESC
LIMIT 1;

-- get the sum of all latitude values and sum of all longitude values rounded to 2 decimal places
SELECT
    ROUND(SUM(lat_n), 2) AS lat,
    ROUND(SUM(long_w), 2) AS lon
FROM station;

-- Query the sum of Northern Latitudes having values greater than 38.7880 and less than 137.2345.
-- truncate your answer to 4 decimal places
SELECT TRUNCATE(SUM(lat_n), 4)
FROM station
WHERE lat_n > 38.7880 AND lat_n < 137.2345;

-- Query the greatest value of the Northern Latitudes that is less than 137.2345
-- Truncate your answer to 4 decimal places.
SELECT TRUNCATE(MAX(lat_n), 4)
FROM station
WHERE lat_n < 137.2345;