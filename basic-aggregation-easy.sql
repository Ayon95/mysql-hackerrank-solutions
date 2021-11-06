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

-- find the number of cities whose population is greater than 100,000
SELECT COUNT(name)
FROM city
WHERE population > 100000;

-- find the total population of all cities in California district
SELECT SUM(population)
FROM city
WHERE district = 'California';

-- get the difference between the maximum and minimum populations
SELECT MAX(population) - MIN(population)
FROM city;

-- get the difference between the actual average salary and miscalculated average salary (any 0 from a salary is omitted)
-- round the difference up to the nearest integer
SELECT
    CEIL(AVG(salary) - AVG(REPLACE(salary, '0', '')))
FROM employees;

-- get the western longitude for the largest northern latitude that is less than 137.2345
-- round the result to 4 decimal places
SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
LIMIT 1;
-- alternative solution using MAX() and subquery
-- this solution is more efficient even though a subquery is being used because it does not have to order the result set and perform LIMIT
SELECT ROUND(long_w, 4)
FROM station
WHERE lat_n = (
    SELECT MAX(lat_n)
    FROM station
    WHERE lat_n < 137.2345
);